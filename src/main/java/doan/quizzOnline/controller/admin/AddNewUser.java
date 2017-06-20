package doan.quizzOnline.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import doan.quizzOnline.model.QuyenDAO;
import doan.quizzOnline.model.User;
import doan.quizzOnline.service.UserService;

@Controller
public class AddNewUser {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/addnewuser", method = RequestMethod.POST)
	public void addNewUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		PrintWriter out = response.getWriter();
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			//get information of add new user Form
			String pre, id, pa, name, dob, sex, address, phone, lop = "";
			pre = request.getParameter("pre");
			id = request.getParameter("id");
			pa = request.getParameter("pa");
			name = request.getParameter("name");
			dob = request.getParameter("dob");
			sex = request.getParameter("sex");
			address = request.getParameter("address");
			phone = request.getParameter("phone");
			lop = request.getParameter("classStudent");
			String paEncode = passwordEncoder.encode(pa);
			//check user, if user existed in database, we don't add new
			User userCheck =  userService.getUserById(id);
			if(userCheck!=null){
				logger.info("user has existed in database - can't add new");
				throw new Exception();
			}
			User userToAdd = new User(id, name, Date.valueOf(dob), sex, address, phone, paEncode,
					quyenDAO.findById(Integer.valueOf(pre)));
			//add user
			if(Integer.valueOf(pre)==2){
				if(lop.equals(null)){
					logger.info("Student with lop = null");
					throw new Exception();
				}
				userToAdd = new User(id, name, Date.valueOf(dob), sex, address, phone, paEncode,
						quyenDAO.findById(Integer.valueOf(pre)),lop);
			}
			if(userService.saveNewUser(userToAdd)==null) {
				throw new Exception("add failed");
			}
			logger.info("add new user successfully");
			out.println("<script> alert('Success!!') </script>");

		} catch (Exception e) {
			logger.error(e.toString());
			out.println("<script> alert('Wrong information, check it again!!')</script>");
		}

		RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
		rd.include(request, response);
		return;
	}

	@Autowired
	QuyenDAO quyenDAO;

	@Autowired
	UserService userService;

}
