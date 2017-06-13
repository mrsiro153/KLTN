package doan.quizzOnline.controller.bankManager;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import doan.quizzOnline.model.CauHoi;
import doan.quizzOnline.model.CauHoiDAO;
import doan.quizzOnline.model.ChiTietCauHoi;
import doan.quizzOnline.model.ChiTietCauHoiDAO;

@Controller
public class EditQuizzBankManager {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/EditQuizzByBankManager", method = RequestMethod.POST)
	public void editQuizz(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");

			String[] idQuizz = request.getParameterValues("idQuizz");
			String[] content = request.getParameterValues("content");
			String[] trueAnswer = request.getParameterValues("trueAnswer");
			String[] selectA = request.getParameterValues("selectA");
			String[] selectB = request.getParameterValues("selectB");
			String[] selectC = request.getParameterValues("selectC");
			String[] selectD = request.getParameterValues("selectD");
			for (int i = 0; i < idQuizz.length; i++) {				
				if (trueAnswer[i].equals("A") || trueAnswer[i].equals("B") || trueAnswer[i].equals("C")
						|| trueAnswer[i].equals("D")) {
					
				} else {
					out.print("<script>alert('True answer is A, B, C,D at IdQuizz=" + idQuizz[i] + "')</script>");
					rd.include(request, response);
					return;
				}
				CauHoi c = cauHoiDAO.findByIdCauHoi(Integer.parseInt(idQuizz[i]));
				c.setDapAnDung(trueAnswer[i]);
				c.setNoiDungCauHoi(content[i]);
				if (cauHoiDAO.save(c) == null) {
					out.println("<script>alert('failed!!!')</script>");
					rd.include(request, response);
					return;
				}
				ChiTietCauHoi ctch = chiTietCauHoiDAO.findByMaCauHoi(Integer.parseInt(idQuizz[i]));
				ctch.setDapAnA(selectA[i]);
				ctch.setDapAnB(selectB[i]);
				ctch.setDapAnC(selectC[i]);
				ctch.setDapAnD(selectD[i]);
				chiTietCauHoiDAO.save(ctch);
			}
			out.print("<script>alert('Success!!')</script>");
			rd.include(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.sendError(400);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			return;
		}
	}

	@Autowired
	CauHoiDAO cauHoiDAO;

	@Autowired
	ChiTietCauHoiDAO chiTietCauHoiDAO;
}
