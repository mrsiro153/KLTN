package doan.quizzOnline.controller.student;

import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import doan.quizzOnline.model.MonHocDAO;
import doan.quizzOnline.model.User;
import doan.quizzOnline.model.UserDAO;
import doan.quizzOnline.model.User_DeThi;
import doan.quizzOnline.model.User_DeThiDAO;

@Controller
public class PrintResult {
	final Logger logger = Logger.getLogger(this.getClass());
	//
	private static Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
	private static Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 22, Font.BOLD, BaseColor.RED);
	private static Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16, Font.BOLD);
	private static Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
	private static Font myF;

	@RequestMapping(value = "/student/printTheResult", method = RequestMethod.GET)
	public void printResult(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			String idUser = request.getParameter("idUser");
			String filePath = request.getServletContext().getRealPath("/student/");
			filePath = filePath + "/yourExam"+idUser+".pdf";
			//
			try {
				BaseFont times = BaseFont.createFont("C://Windows//Fonts//Arial.ttf", BaseFont.IDENTITY_H,
						BaseFont.EMBEDDED);
				Font myfont = new Font(times, 14, Font.BOLD);
				Font myfont1 = new Font(times, 12, Font.NORMAL);
				myF = myfont1;
				// open the file/ create new pdf file
				Document document = new Document();
				PdfWriter.getInstance(document, new FileOutputStream(filePath));
				document.open();
				// add metadata
				document.addTitle("Exams Result");
				// add tittle page
				Paragraph preface = new Paragraph();
				// add empty line
				addEmptyLine(preface, 1);
				preface.add(new Paragraph("Exams Result", redFont));// title
																	// sentence
				addEmptyLine(preface, 1);
				preface.add(new Paragraph("Generate at: " + new Date(), smallBold));
				addEmptyLine(preface, 2);
				document.add(preface);// add all title
				addEmptyLine(preface, 2);
				// add content page
				addContent(document, idUser, myfont);
				document.close();
			} catch (DocumentException e) {
				e.printStackTrace();
			}
			response.setCharacterEncoding("utf-8");
			// response.setContentType("text/jsp");
			PrintWriter out = response.getWriter();
			RequestDispatcher rd = request.getRequestDispatcher("showScore.jsp");
			out.print("<script>window.open('yourExam"+idUser+".pdf');</script>");
			rd.include(request, response);
			return;
		} catch (Exception e) {
			logger.info("error: "+e.getMessage() );
			e.printStackTrace();
			return;
		}
	}

	private void addContent(Document document, String idUser, Font myfont) {
		try {
			Paragraph preface = new Paragraph();
			String UserInfor = "";
			User currentUser = userDAO.findById(idUser);
			if (currentUser == null) {
				// khong co du lieu
				return;
			} else {
				logger.info("existed user");
				UserInfor = currentUser.getHoTen();
				preface.add(new Paragraph("Student Name: " + UserInfor, myfont));
				addEmptyLine(preface, 1);
			}
			List<User_DeThi> uds = user_DeThiDAO.findBymaSinhVien(userDAO.findById(idUser));
			if (uds.isEmpty()) {
				preface.add(new Paragraph("No Result", catFont));
				document.add(preface);
				return;
			} else {
				PdfPTable table = new PdfPTable(6);
				//
				PdfPCell c1 = new PdfPCell(new Phrase("Mã Sinh Viên", myF));
				c1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(c1);
				//
				c1 = new PdfPCell(new Phrase("Mã đề thi", myF));
				c1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(c1);
				//
				c1 = new PdfPCell(new Phrase("Ngày mở đề thi", myF));
				c1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(c1);
				//
				c1 = new PdfPCell(new Phrase("Giờ Mở đề thi", myF));
				c1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(c1);
				//
				c1 = new PdfPCell(new Phrase("Tên môn học", myF));
				c1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(c1);
				//
				c1 = new PdfPCell(new Phrase("Điểm", myF));
				c1.setHorizontalAlignment(Element.ALIGN_LEFT);
				table.addCell(c1);
				//
				table.setHeaderRows(1);
				//
				for (User_DeThi ud : uds) {
					c1 = new PdfPCell(new Phrase(ud.getMaSinhVien().getId(), myF));
					table.addCell(c1);
					c1 = new PdfPCell(new Phrase(ud.getMaDeThi().getIdDeThi().toString(), myF));
					table.addCell(c1);
					c1 = new PdfPCell(new Phrase(ud.getMaDeThi().getNgayMoDeThi() + "", myF));
					table.addCell(c1);
					c1 = new PdfPCell(new Phrase(ud.getMaDeThi().getGioMoDeThi() + "", myF));
					table.addCell(c1);
					c1 = new PdfPCell(
							new Phrase(monHocDAO.findByidMonHoc(ud.getMaDeThi().getMaMonHoc()).getTenMonHoc(), myF));
					table.addCell(c1);
					c1 = new PdfPCell(new Phrase(ud.getDiem() + "", myF));
					table.addCell(c1);
				}
				;
				preface.add(table);
				document.add(preface);
				// document.add(table);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void addEmptyLine(Paragraph paragraph, int number) {
		for (int i = 0; i < number; i++) {
			paragraph.add(new Paragraph(" "));
		}
	}

	@Autowired
	UserDAO userDAO;

	@Autowired
	User_DeThiDAO user_DeThiDAO;

	@Autowired
	MonHocDAO monHocDAO;

}
