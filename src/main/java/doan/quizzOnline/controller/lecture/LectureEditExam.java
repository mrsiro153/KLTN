package doan.quizzOnline.controller.lecture;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import doan.quizzOnline.model.DeThi;
import doan.quizzOnline.model.DeThiDAO;


@Controller
public class LectureEditExam {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/editExamLecture", method = RequestMethod.POST)
	public void editExam(HttpServletRequest request, HttpServletResponse response){
		try {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
			String[] idDeThi=request.getParameterValues("idDeThi");
			String[] TimeOut=request.getParameterValues("TimeOut");
			for (int i = 0; i < idDeThi.length; i++){
				int timeOut=Integer.parseInt(TimeOut[i]);
				if(timeOut<0){
					continue;
				}
				DeThi d = deThiDAO.findByidDeThi(Integer.parseInt(idDeThi[i]));
				d.setThoiLuong(timeOut*60+"");
				deThiDAO.save(d);
			}
			response.sendRedirect("MainPage.jsp");
			return;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.sendRedirect("MainPage.jsp");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}	
	}
	
	@Autowired
	DeThiDAO deThiDAO;

}
