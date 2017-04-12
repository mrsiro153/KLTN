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

import doan.quizzOnline.model.Quyen;
import doan.quizzOnline.model.QuyenDAO;
import doan.quizzOnline.model.User;
import doan.quizzOnline.service.UserService;

@Controller
public class EditUser {

	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/editUser", method = RequestMethod.POST)
	public void editUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String role, id, pa, name, dob, sex, address, phone = "";
			role = request.getParameter("role");
			id = request.getParameter("id");
			pa = request.getParameter("pa");
			name = request.getParameter("name");
			dob = request.getParameter("dob");
			sex = request.getParameter("sex");
			address = request.getParameter("address");
			phone = request.getParameter("phone");
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String paEncode = passwordEncoder.encode(pa);
			//check role, id role exist in database
			logger.info(role);
			User user = new User(id,name,Date.valueOf(dob),sex,address,phone,paEncode,null);
			try{
				userService.saveNewUser(user);
			}catch(Exception e){
				
			}
			out.println("<script> alert('Success') </script>");
		} catch (Exception e) {
			out.println("<script> alert('Wrong information, check again') </script>");
			logger.error(e.getMessage());
		}
		RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
		rd.include(request, response);
	}
	
	String mappingQuyen(String nameRole){
		switch (nameRole) {
		case "":
			break;
			
		default:
			break;
		}
		return "";
	}
	
	@Autowired
	UserService userService;
	
	@Autowired
	QuyenDAO quyenDAO;

}
