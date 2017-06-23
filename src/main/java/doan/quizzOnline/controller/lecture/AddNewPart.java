package doan.quizzOnline.controller.lecture;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import doan.quizzOnline.model.MonHocDAO;
import doan.quizzOnline.model.NoiDung;
import doan.quizzOnline.model.NoiDungDAO;

@Controller
public class AddNewPart {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/lecture/addNewPart", method = RequestMethod.POST)
	public void addNewExam(HttpServletRequest request, HttpServletResponse response) {
		try {
			logger.info("add new part service!");
			String responseText = "";
			try {
				request.setCharacterEncoding("utf-8");
				//
				String idPart = request.getParameter("idPart");
				String namePart = request.getParameter("namePart");
				String idSubject = request.getParameter("idSubject");
				Integer idPartInt;
				Integer idSubjectInt = Integer.parseInt(idSubject);
				try {
					idPartInt = Integer.parseInt(idPart);
					if(idPartInt<0) throw new Exception();
				} catch (Exception e) {
					logger.info("idPart must be nature number (not negative)");
					responseText = "<span style='color:red'>idPart must be nature number<span>";
					throw new RuntimeException();
				}
				//
				NoiDung nd = noiDungDAO.findByIdNoiDung(idPartInt);
				if (nd != null) {
					logger.info("this part is Exist in database");
					responseText = "<span style='color:red'>idPart is duplicate, use another number<span>";
					throw new RuntimeException();
				}
				nd = new NoiDung(idPartInt, monHocDAO.findByidMonHoc(idSubjectInt), namePart);
				noiDungDAO.save(nd);
				responseText = "<span style='color:green'>add new Part Success!<span>";
			} catch (Exception e) {
				e.printStackTrace();
				logger.error(e.toString());
			}
			response.setCharacterEncoding("utf-8");
			response.setStatus(HttpServletResponse.SC_OK);
			response.getWriter().write(responseText);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (Exception ex) {
			logger.error(ex.toString());
		}
		return;
	}

	@Autowired
	NoiDungDAO noiDungDAO;

	@Autowired
	MonHocDAO monHocDAO;

}
