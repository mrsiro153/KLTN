package doan.quizzOnline.controller.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import doan.quizzOnline.model.DeThiDAO;
import doan.quizzOnline.model.Temporary;
import doan.quizzOnline.model.TemporaryDAO;
import doan.quizzOnline.model.UserDAO;
import doan.quizzOnline.model.User_DeThi;
import doan.quizzOnline.model.User_DeThiDAO;

@Controller
public class SetMark {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/setdiembaithi", method = RequestMethod.POST)
	public void setMark(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String idUser = request.getParameter("idUser");
			String idDeThi = request.getParameter("idDeThi");
			String diem = request.getParameter("Diem");
			User_DeThi us_dt = new User_DeThi(userDAO.findById(idUser),
					deThiDAO.findByidDeThi(Integer.parseInt(idDeThi)), Float.parseFloat(diem));
			logger.info(us_dt.getDiem() + " " + us_dt.getMaSinhVien().getId() + " " + us_dt.getMaDeThi().getIdDeThi());
			logger.info(user_DeThiDAO.save(us_dt)); //
			List<Temporary> temps = temporaryDAO.findByIduserAndIdexam(idUser, Integer.parseInt(idDeThi));
			for (Temporary temp : temps) {
				temporaryDAO.delete(temp);
			}
			RequestDispatcher rd  =request.getRequestDispatcher("MainPage.jsp");
			out.print("<div style='position:fixed; left:30%; top:50%; background:rgba(144, 167, 182, 0.5); border-radius:10px' id='divDiemBaiThi'>");
			out.print("<h2>Result of the Exam</h2><hr>");
			out.print("<h4>Id Exam: "+idDeThi+"</h4>");
			out.print("<h4>Score: <span style='color:red'>"+diem+"</span></h4><hr>");
			out.print("<center><button onclick='closeDiemBaiThi(this)' class='btn btn-primary'>Close</button></center>");
			out.print("</div>");
			rd.include(request, response);
			return;
			//response.sendRedirect("MainPage.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			logger.fatal(e.getMessage() + " " + e.getStackTrace());
			out.println("<script>alert('some error!!')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
			rd.include(request, response);
		}
		return;
	}

	@Autowired
	User_DeThiDAO user_DeThiDAO;

	@Autowired
	TemporaryDAO temporaryDAO;

	@Autowired
	UserDAO userDAO;

	@Autowired
	DeThiDAO deThiDAO;
}
