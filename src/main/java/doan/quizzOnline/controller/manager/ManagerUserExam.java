package doan.quizzOnline.controller.manager;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import doan.quizzOnline.model.DeThiDAO;
import doan.quizzOnline.model.QuyenDAO;
import doan.quizzOnline.model.User;
import doan.quizzOnline.model.UserDAO;
import doan.quizzOnline.model.User_DeThi;
import doan.quizzOnline.model.User_DeThiDAO;

@Controller
public class ManagerUserExam {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/ManagerSetUserExam", method = RequestMethod.POST)
	public void setUserExam(HttpServletRequest request, HttpServletResponse response) {
		logger.info("Manager: set Exam to User");
		try {
			request.setCharacterEncoding("utf-8");
			String classStudent = request.getParameter("userExam").toString();
			String Exam = request.getParameter("idExam").toString();
			logger.info(classStudent + " " + Exam);
			String idExam = "";
			for (char s : Exam.toCharArray()) {
				if (s == ' ') {
					break;
				} else {
					idExam += s;
				}
			}
			List<User> uss = userDAO.findByLopAndQuyen(classStudent, quyenDAO.findById(2));
			if (uss.isEmpty()) {
				return;
			}
			Integer countFailure =0;
			for (User u : uss) {
				try {
					if(user_DeThiDAO.findBymaSinhVienAndMaDeThi(u, deThiDAO.findByidDeThi(Integer.valueOf(idExam)))!=null){
						throw new Exception("user: "+u.getId()+" with exam: "+idExam+" has set in database");
					}
					User_DeThi us_dt = new User_DeThi(u, deThiDAO.findByidDeThi(Integer.valueOf(idExam)));
					user_DeThiDAO.save(us_dt);
				} catch (Exception e) {
					countFailure+=1;
					logger.error(e.toString());
				}
			}
			String responseToFront="";
			String color="red";
			if(countFailure==uss.size()){
				responseToFront="Students has already set in database!";
			}else{
				responseToFront="Success!";
				color="green";
			}
			response.setCharacterEncoding("utf-8");
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write("<center><h5  style='color:"+color+";'>"+responseToFront+" time: "+new Date()+"</h5></center>");
			response.getWriter().flush();
			response.getWriter().close();	
		} catch (Exception e) {
			logger.info(e.toString());
		}
		return;
	}

	@Autowired
	UserDAO userDAO;

	@Autowired
	User_DeThiDAO user_DeThiDAO;

	@Autowired
	DeThiDAO deThiDAO;

	@Autowired
	QuyenDAO quyenDAO;
}
