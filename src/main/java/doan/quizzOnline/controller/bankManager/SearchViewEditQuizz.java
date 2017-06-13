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
public class SearchViewEditQuizz {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/quizzmanager/editQuizzSearchView", method = RequestMethod.POST)
	public void searchViewEditQuizz(HttpServletRequest request, HttpServletResponse response) {
		try {
		logger.info("start edit Quizz in Search View");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		RequestDispatcher rd = request.getRequestDispatcher("quizzmanagerFilter.jsp");
			//
			String idQuizz, contentQuizz, trueAnswer, selectA, selectB, selectC, selectD;
			idQuizz = request.getParameter("idQuizz").trim();
			contentQuizz = request.getParameter("contentQuizz");
			trueAnswer = request.getParameter("trueAnswerQuizz").trim();
			selectA = request.getParameter("selectA");
			selectB = request.getParameter("selectB");
			selectC = request.getParameter("selectC");
			selectD = request.getParameter("selectD");
			if (trueAnswer.equals("A") || trueAnswer.equals("B") || trueAnswer.equals("C") || trueAnswer.equals("D")) {
				//
				CauHoi c = cauHoiDAO.findByIdCauHoi(Integer.parseInt(idQuizz));
				if (c == null) {
					logger.info("id cau hoi: " + idQuizz + " not Exist");
					throw new Exception();
				}
				c.setDapAnDung(trueAnswer);
				c.setNoiDungCauHoi(contentQuizz);
				if (cauHoiDAO.save(c) == null) {
					logger.info("can not save");
					throw new Exception();
				}
				ChiTietCauHoi ctch = chiTietCauHoiDAO.findByMaCauHoi(Integer.parseInt(idQuizz));
				if (ctch == null) {
					return;
				}
				ctch.setDapAnA(selectA);
				ctch.setDapAnB(selectB);
				ctch.setDapAnC(selectC);
				ctch.setDapAnD(selectD);
				chiTietCauHoiDAO.save(ctch);

			} else {
				out.print("<script>alert('true Answer have to be A,B,C,D')</script>");
				rd.include(request, response);
				return;
			}

			out.print("<script>alert('Success!!')</script>");
			rd.include(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.sendRedirect("quizzmanagerFilter.jsp");
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
