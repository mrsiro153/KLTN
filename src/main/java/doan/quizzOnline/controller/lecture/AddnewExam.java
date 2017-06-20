package doan.quizzOnline.controller.lecture;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import doan.quizzOnline.DTO.Quizz;
import doan.quizzOnline.model.CauHoi;
import doan.quizzOnline.model.CauHoiDAO;
import doan.quizzOnline.model.DeThi;
import doan.quizzOnline.model.DeThiDAO;
import doan.quizzOnline.model.DeThi_CauHoi;
import doan.quizzOnline.model.DeThi_CauHoiDAO;
import doan.quizzOnline.model.MonHocDAO;
import doan.quizzOnline.model.NoiDungDAO;

@Controller
public class AddnewExam {
	final Logger logger = Logger.getLogger(this.getClass());
	private final Integer DEFAULT_STT_EXAM = 0; 

	@RequestMapping(value = "/lecture/createNewExam", method = RequestMethod.GET)
	public void addNewExam(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			RequestDispatcher rdi = request.getRequestDispatcher("NewExam.jsp?idMonHoc=1");
			String idMonHoc = request.getParameter("maMonHoc");
			String idDeThi = request.getParameter("idExam");
			String[] nameParts = request.getParameterValues("idPart");
			String[] numberQuizzsOfParts = request.getParameterValues("numbersQuizz");
			String timeOut = request.getParameter("TimeRe");// is minute time
			//
			if (Integer.parseInt(idDeThi) < 0) {
				out.print("<script>alert('idExam must be > 0')</script>");
				rdi.include(request, response);
				return;
			}
			int timeOutConvertToInt = Integer.parseInt(timeOut);
			if (timeOutConvertToInt <= 0) {
				out.print("<script>alert('time can not <= 0')</script>");
				rdi.include(request, response);
				return;
			}
			timeOutConvertToInt = timeOutConvertToInt * 60;// set to seconds
			// totalQuizz to add
			Integer totalQuizzs = 0;
			for (String s : numberQuizzsOfParts) {
				totalQuizzs += Integer.parseInt(s);
			}
			// add to dethi_cauhoi

			// update dethi table
			DeThi d = new DeThi(Integer.parseInt(idDeThi), timeOutConvertToInt + "", totalQuizzs,
					Integer.parseInt(idMonHoc),DEFAULT_STT_EXAM);
			if(deThiDAO.findByidDeThi(Integer.parseInt(idDeThi))!=null){
				out.print("<script>alert('idExam exist!! try again')</script>");
				rdi.include(request, response);
				return;
			}
			deThiDAO.save(d);
			//
			for (int i = 0; i < nameParts.length; i++) {
				int numberOfPart = Integer.parseInt(numberQuizzsOfParts[i]);// number
																			// Quizz
																			// of
																			// each
																			// part
				// numberOfPart have to be smaller than rowcount below
				List<CauHoi> rs = cauHoiDAO.findByMaNoiDung(noiDungDAO.findByIdNoiDung(Integer.parseInt(nameParts[i])));
				ArrayList<Quizz> arQuizz = new ArrayList<Quizz>();
				// rowcount here is total quizzs we have (about the part) in
				// database
				if (rs.isEmpty()) {
					// no data
					throw new Exception("NoiDung :" + nameParts[i] + " not exist!");
				} else {
					for (CauHoi c : rs) {
						arQuizz.add(new Quizz(c.getIdCauHoi() + ""));
					}
				}
				if (numberOfPart > rs.size()||numberOfPart<=0) {// read below
					// bank quizz has too littel quizzs
					List<DeThi_CauHoi> dethi_cauhois = deThi_CauHoiDAO
							.findByMaDeThi(deThiDAO.findByidDeThi(Integer.parseInt(idDeThi)));
					if (!dethi_cauhois.isEmpty()) {
						for (DeThi_CauHoi dc : dethi_cauhois) {
							deThi_CauHoiDAO.delete(dc);
						}
					}
					if (deThiDAO.findByidDeThi(Integer.parseInt(idDeThi)) != null) {
						deThiDAO.delete(deThiDAO.findByidDeThi(Integer.parseInt(idDeThi)));
					}
					out.print("<script>alert('your number quizzs too much or too small')</script>");
					rdi.include(request, response);
					return;
				}

				for (int j = 0; j < numberOfPart; j++) {
					//
					int thaydoi = 0;// this var is used in the case: random the
									// exist value
					int rd = 0 + (int) (Math.random() * ((rs.size() - 1 - 0) + 1));// min=
																					// 0,
																					// max
																					// =
																					// rowcount,
																					// we
																					// random
																					// 0->2
					String sql1 = "INSERT INTO `quizz`.`dethi_cauhoi` (`MaDeThi`, `MaCauHoi`) VALUES ('" + idDeThi
							+ "', '" + arQuizz.get(rd).getMaCauHoi() + "')";
					DeThi_CauHoi dc = new DeThi_CauHoi(deThiDAO.findByidDeThi(Integer.parseInt(idDeThi)),
							cauHoiDAO.findByIdCauHoi(Integer.parseInt(arQuizz.get(rd).getMaCauHoi())));
					while (deThi_CauHoiDAO.save(dc) == null) {// mean update
																// failed
						dc = new DeThi_CauHoi(deThiDAO.findByidDeThi(Integer.parseInt(idDeThi)),
								cauHoiDAO.findByIdCauHoi(Integer.parseInt(arQuizz.get(thaydoi).getMaCauHoi())));
						thaydoi += 1;
					}
				}
			}
			out.print("<script>alert('Success!!')</script>");
			rdi.include(request, response);
			return;

		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.sendError(500);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			return;
		}
	}

	@Autowired
	DeThiDAO deThiDAO;

	@Autowired
	MonHocDAO monHocDAO;

	@Autowired
	CauHoiDAO cauHoiDAO;

	@Autowired
	NoiDungDAO noiDungDAO;

	@Autowired
	DeThi_CauHoiDAO deThi_CauHoiDAO;
}