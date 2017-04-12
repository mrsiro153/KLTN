package doan.quizzOnline.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import doan.quizzOnline.model.Quyen;
import doan.quizzOnline.model.QuyenDAO;
import doan.quizzOnline.model.User;
import doan.quizzOnline.model.UserDAO;

@Controller
@SessionAttributes("personalinfor")
public class Login_Logout {
	//
	final Logger logger = Logger.getLogger(this.getClass());
	//
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void loginHandler(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		int stt=0;
		try {
			//
			out = response.getWriter();
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String pre = request.getParameter("kind");
			String user = request.getParameter("user");
			String pa = request.getParameter("pass");
			Quyen quyen = quyenDAO.findById(Integer.parseInt(pre));
			User userForChecking = userDAO.findByIdAndQuyen(user, quyen);
			if (userForChecking == null) {
				logger.info("user not found!");
				throw new Exception();
			}
			if (passwordEncoder.matches(pa, userForChecking.getPassWord())) {
				HttpSession session = request.getSession();
				session.setAttribute("pre", pre);
				session.setAttribute("user", user);
				session.setAttribute("pa", pa);
				session.setAttribute("name", userForChecking.getHoTen());
				session.setAttribute("dob", userForChecking.getNgaySinh());
				session.setAttribute("sex", userForChecking.getGioiTinh());
				session.setAttribute("phone", userForChecking.getsDT());
				session.setAttribute("tenquyen", userForChecking.getQuyen().getTenQuyen());
				session.setMaxInactiveInterval(60 * 60);
				stt=1;
			}
			if (stt == 1) {
				response.sendRedirect("MainPage.jsp");
				return;
			}else{
				throw new Exception();
			}
			//
		} catch (Exception e) {
			logger.error(e.toString());
			out.print("<script> alert('Wrong username or password!') </script>");
			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
			rd.include(request, response);
		}
	}

	@RequestMapping(value = "/logoutnow", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			logger.info("you loged out successfully");
			HttpSession session = request.getSession();
			session.invalidate();
			response.setCharacterEncoding("utf-8");
			response.sendRedirect("Login.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return;
	}

	//
	@Autowired
	UserDAO userDAO;

	@Autowired
	QuyenDAO quyenDAO;
}
