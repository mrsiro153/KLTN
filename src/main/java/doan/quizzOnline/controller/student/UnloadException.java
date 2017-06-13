package doan.quizzOnline.controller.student;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import doan.quizzOnline.model.Temporary;
import doan.quizzOnline.model.TemporaryDAO;

@Controller
public class UnloadException {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/breakPage", method = RequestMethod.GET)
	public void addNewUser(HttpServletRequest request, HttpServletResponse response) {
		try {
			logger.info("start close page suddenly service");
			request.setCharacterEncoding("utf-8");
			JSONObject json;

			String s = request.getParameter("currentExam");
			logger.info(s);
			json = new JSONObject(s);
			String idSV = json.getString("idSV");
			String idExam = json.getString("idExam");
			String timeRe = json.getString("timeRe");
			JSONArray idQuizzs = json.getJSONArray("idQuizz");
			JSONArray contentQuizzs = json.getJSONArray("contentQuizz");
			JSONArray YourAnswer = json.getJSONArray("yourAnswer");
			JSONArray trueAnswer = json.getJSONArray("trueAnswer");
			// need solve the timere
			String hour = timeRe.substring(0, 2);
			String minute = timeRe.substring(3, 5);
			String seconds = timeRe.substring(6, 8);
			int hour1 = Integer.parseInt(hour);
			int minute1 = Integer.parseInt(minute);
			int seconds1 = Integer.parseInt(seconds);
			int totalTimeRemaning = hour1 * 3600 + minute1 * 60 + seconds1;
			// System.out.print(hour + " " + minute + " " + seconds);
			List<Temporary> oldTemp = temporaryDAO.findByIduserAndIdexam(idSV, Integer.parseInt(idExam));
			if (!oldTemp.isEmpty()) {
				for (Temporary t : oldTemp) {
					temporaryDAO.delete(t);
				}
			}
			// delete all
			for (int i = 0; i < idQuizzs.length(); i++) {
				Temporary t = new Temporary(idSV, Integer.parseInt(idExam), totalTimeRemaning + "",
						Integer.parseInt(idQuizzs.getString(i)), YourAnswer.getString(i));
				temporaryDAO.save(t);
			}
			logger.info("da luu phan con lai vao database");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}

	@Autowired
	TemporaryDAO temporaryDAO;
}
