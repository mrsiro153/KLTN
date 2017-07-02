package doan.quizzOnline.controller.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;

import javax.servlet.RequestDispatcher;
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
public class ManagerEditExam {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/ManagerEdit", method = RequestMethod.POST)
	public void editExam(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			String[] IdExam = request.getParameterValues("idDeThi");
			String[] OpeningDate = request.getParameterValues("OpeningDate");
			String[] OpeningTime = request.getParameterValues("OpeningTime");
			String[] staus = request.getParameterValues("status");

			for (int i = 0; i < IdExam.length; i++) {
				DeThi d = deThiDAO.findByidDeThi(Integer.parseInt(IdExam[i]));
				if (d != null) {
					try {
						d.setNgayMoDeThi(Date.valueOf(OpeningDate[i]));
						if (OpeningTime[i].length() == 5) {
							OpeningTime[i] = OpeningTime[i] + ":00";
						}
						d.setGioMoDeThi(Time.valueOf(OpeningTime[i]));
					} catch (Exception e) {
						logger.error(e.toString());
					}
					d.setStatus(Integer.parseInt(staus[i]));
				} else {
					logger.info("can not find Exam with ID= " + IdExam[i]);
				}
				deThiDAO.save(d);
			}
			out.println("<script>alert('Success!!')</script>");
			RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
			rd.include(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.sendRedirect("MainPage.jsp");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return;
	}

	@Autowired
	DeThiDAO deThiDAO;
}
