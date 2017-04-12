package doan.quizzOnline.controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import doan.quizzOnline.model.User;
import doan.quizzOnline.model.UserDAO;
import doan.quizzOnline.service.UserService;

@Controller
public class DeleteUser {
	
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/deleteuser", method = RequestMethod.POST)
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String role, id = "";
			role = request.getParameter("role");
			id = request.getParameter("id");
			//check user existed or not
			User userDelete = userService.getUserById(id);
			if (userDelete == null) {
				logger.info("user is not existed");
				throw new Exception();
			}
			logger.info(userDelete.toString());
			//delete user	
			userService.deleteUser(userDelete);
			logger.info("delete success");
			out.println("<script> alert('Delete user success') </script>");
		} catch (Exception e) {
			logger.error(e.toString());
			out.println("<script> alert('User is not exist- can not delete') </script>");
		}
		RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
		rd.include(request, response);
	}

	@Autowired
	UserService userService;
	
	@Autowired
	UserDAO userDAO;
}
