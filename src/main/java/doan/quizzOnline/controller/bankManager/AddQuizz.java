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
import doan.quizzOnline.model.NoiDungDAO;

@Controller
public class AddQuizz {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/quizzmanager/addNewQuizz", method = RequestMethod.POST)
	public void addQuizz(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			String idNoiDung = request.getParameter("idPart");
			String idQuizz = request.getParameter("idQuizz");
			String contentQuizz = request.getParameter("contentQuizz");
			String trueAnswer = request.getParameter("trueAnswer");
			String selectA = request.getParameter("selectA");
			String selectB = request.getParameter("selectB");
			String selectC = request.getParameter("selectC");
			String selectD = request.getParameter("selectD");
			RequestDispatcher rd = request.getRequestDispatcher("newQuizz.jsp");
			if (Integer.parseInt(idQuizz) < 0) {
				out.print("<script>alert('idQuizz must be > 0')</script>");
				rd.include(request, response);
				return;
			}
			if (trueAnswer.equals("A") || trueAnswer.equals("B") || trueAnswer.equals("C") || trueAnswer.equals("D")) {
			} else {
				out.print("<script>alert('True Answer only accept value: A B C or D')</script>");
				rd.include(request, response);
				return;
			}
			// data ok
			String sql = "INSERT INTO `quizz`.`cauhoi` " + "(`idCauHoi`, `NoiDungCauHoi`, `DapAnDung`, `MaNoiDung`)"
					+ " VALUES ('" + idQuizz + "', '" + contentQuizz + "', '" + trueAnswer + "', '" + idNoiDung + "')";
			CauHoi c = new CauHoi(Integer.parseInt(idQuizz),contentQuizz,trueAnswer,noiDungDAO.findByIdNoiDung(Integer.parseInt(idNoiDung)));
			if(cauHoiDAO.findByIdCauHoi(Integer.parseInt(idQuizz))!=null){
				out.print("<script>alert('idQuizz exist')</script>");
				rd.include(request, response);
				return;
			}
			cauHoiDAO.save(c);
			ChiTietCauHoi ctch = new ChiTietCauHoi(Integer.parseInt(idQuizz),selectA,selectB,selectC,selectD);
			chiTietCauHoiDAO.save(ctch);
			out.print("<script>alert('Success')</script>");
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

	@Autowired
	NoiDungDAO noiDungDAO;

}
