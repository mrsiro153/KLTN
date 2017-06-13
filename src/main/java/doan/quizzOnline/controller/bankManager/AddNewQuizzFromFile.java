package doan.quizzOnline.controller.bankManager;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import doan.quizzOnline.model.CauHoi;
import doan.quizzOnline.model.CauHoiDAO;
import doan.quizzOnline.model.ChiTietCauHoi;
import doan.quizzOnline.model.ChiTietCauHoiDAO;
import doan.quizzOnline.model.NoiDungDAO;
import doan.quizzOnline.model.User;

@Controller
public class AddNewQuizzFromFile {
	final Logger logger = Logger.getLogger(this.getClass());

	@RequestMapping(value = "/addNewQuizzByFile", method = RequestMethod.POST)
	public void addNewQuizzs(HttpServletRequest request, HttpServletResponse response) {
		logger.info("start add new quizz from file");
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			RequestDispatcher rd = request.getRequestDispatcher("MainPage.jsp");
			String outPutNotify = "";
			Part filePart = request.getPart("file");
			if (filePart != null) {
				String filename = filePart.getSubmittedFileName();
				String onlyFilename = "";// get filename only
				if (!filename.contains(".xlsx")) {
					outPutNotify += "only support xlsx file";
					out.print("<script>alert('" + outPutNotify + "')</script>");
					rd.include(request, response);
					return;
				} else {
					for (char c : filename.toCharArray()) {
						if (c == '.') {
							break;
						} else {
							onlyFilename += c;
						}
					}
				}
				// onlyfile is IDpart of quizz
				InputStream fileContent = filePart.getInputStream();
				Workbook workbook = new XSSFWorkbook(fileContent);
				Sheet firstSheet = workbook.getSheetAt(0);
				Iterator<Row> iterator = firstSheet.iterator();

				String quizzs[] = new String[7];
				// 0:idCauhoi
				// 1:noiDungCauhoi
				// 2:Dap an dung
				// 3:Dap An a
				// 4:Dap An b, 5 C, 6 D
				int i = 0; //bien dem cua cau hoi
				int theFirstRow = 0;
				while (iterator.hasNext()) {
					Row nextRow = iterator.next();
					Iterator<Cell> cellIterator = nextRow.cellIterator();
					if (theFirstRow != 0) {
						while (cellIterator.hasNext()) {
							Cell cell = cellIterator.next();
							switch (cell.getCellType()) {
							case Cell.CELL_TYPE_STRING:
								quizzs[i] = cell.getStringCellValue();
								break;
							case Cell.CELL_TYPE_BOOLEAN:
								quizzs[i] = cell.getBooleanCellValue() + "";
								break;
							case Cell.CELL_TYPE_NUMERIC:
								if (HSSFDateUtil.isCellDateFormatted(cell)) {
									SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
									Date date = cell.getDateCellValue();
									quizzs[i] = formatter.format(date);
									logger.info(formatter.format(date));
								} else {
									quizzs[i] = String.valueOf(cell.getNumericCellValue()).replaceFirst("\\.0+$", "");
									logger.info(String.valueOf(cell.getNumericCellValue()).replaceFirst("\\.0+$", ""));
								}
								break;
							}
							i += 1;
							if (i == 7) {
								//
								try {
									if (quizzs[2].equals("A") || quizzs[2].equals("B") || quizzs[2].equals("C")
											|| quizzs[2].equals("C")) {// check
																		// the
																		// true
																		// //
																		// answer
										CauHoi newCauHoi = new CauHoi(Integer.valueOf(quizzs[0]), quizzs[1], quizzs[2],
												noiDungDAO.findByIdNoiDung(Integer.valueOf(onlyFilename)));

										if (cauHoiDAO.save(newCauHoi) == null) {
											outPutNotify += "id quizz is exist at idQuizz= " + quizzs[0];
											logger.info("insert failed");
										} else {
											ChiTietCauHoi newChiTietCauHoi = new ChiTietCauHoi(
													Integer.valueOf(quizzs[0]), quizzs[3], quizzs[4], quizzs[5],
													quizzs[6]);
											chiTietCauHoiDAO.save(newChiTietCauHoi);
										}
									} else {
										outPutNotify += "True answer is A B C or D at idquizz= " + quizzs[0] + "<br>";
									}

								} catch (Exception e) {
									outPutNotify += "Something wrong at: " + quizzs[0] + "<br>";
									e.printStackTrace();
								}
								i = 0;
							}
						}
					}
					theFirstRow += 1;
				}
				if (outPutNotify.equals("")) {
					outPutNotify += "Success!!";
				}
				out.println("<p style='color:white'>" + outPutNotify + "</p>");
				rd.include(request, response);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Autowired
	CauHoiDAO cauHoiDAO;

	@Autowired
	ChiTietCauHoiDAO chiTietCauHoiDAO;

	@Autowired
	NoiDungDAO noiDungDAO;
}
