package doan.quizzOnline.controller.lecture;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import doan.quizzOnline.model.DeThi_CauHoi;
import doan.quizzOnline.model.DeThi_CauHoiDAO;
import doan.quizzOnline.model.User_DeThi;
import doan.quizzOnline.model.User_DeThiDAO;

@Controller
public class DeleteExamLecture {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/deleteExamByLecture", method = RequestMethod.POST)
	public void deleteExamByLecture(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
			String idExam = request.getParameter("idExam");
			if (idExam == null) {
				out.print("<script>alert('reload page!!')</script>");
				rd.include(request, response);
				return;
			}
			List<User_DeThi> rs = user_DeThiDAO.findByMaDeThi(deThiDAO.findByidDeThi(Integer.parseInt(idExam)));
			if (rs.isEmpty()) {
				// nodata
				// khong co sinh vien nao lam de thi nay
				List<DeThi_CauHoi> dcs = deThi_CauHoiDAO
						.findByMaDeThi(deThiDAO.findByidDeThi(Integer.parseInt(idExam)));
				if (!dcs.isEmpty()) {
					for (DeThi_CauHoi dc : dcs) {
						deThi_CauHoiDAO.delete(dc);
					}
				}
				DeThi d = deThiDAO.findByidDeThi(Integer.parseInt(idExam));
				if (d != null) {
					deThiDAO.delete(d);
				}
				out.print("<script>alert('Success!')</script>");
				rd.include(request, response);
				return;

			} else {
				out.print("<script>alert('Can not delete this exam! It is used!')</script>");
				rd.include(request, response);
				return;
			}
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
	User_DeThiDAO user_DeThiDAO;

	@Autowired
	DeThiDAO deThiDAO;

	@Autowired
	DeThi_CauHoiDAO deThi_CauHoiDAO;
}
