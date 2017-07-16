package doan.quizzOnline.controller.admin;

import java.io.InputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import doan.quizzOnline.model.QuyenDAO;
import doan.quizzOnline.model.User;
import doan.quizzOnline.model.UserDAO;

@Controller
public class AddNewUserFromFile {
	final Logger logger = Logger.getLogger(this.getClass());

	@Autowired
	UserDAO userDAO;

	@Autowired
	QuyenDAO quyenDAO;

	//
	@RequestMapping(value = "/addNewUserByFile", method = RequestMethod.POST)
	public void Exelfile(HttpServletRequest request, HttpServletResponse response) {
		logger.info("add user from excel file");
		String outputNotification = "";
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			Part filePart = request.getPart("file");
			if (filePart != null) {
				String filename = filePart.getSubmittedFileName();
				if(!filename.contains(".xlsx")){
					outputNotification="only support Excel file";
					throw new Exception("this is not Excel file");
				}
				/*
				 * if (!filename.contains(".xls")) { System.out.println(
				 * "do not match type of file"); return; }
				 */
				InputStream fileContent = filePart.getInputStream();
				Workbook workbook = new XSSFWorkbook(fileContent);
				//
				Sheet firstSheet = workbook.getSheetAt(0);
				Iterator<Row> iterator = firstSheet.iterator();
				int stt = 0;
				String userAdding[] = new String[9];
				int iteratorUserAdding = 0;
				while (iterator.hasNext()) {
					Row nextRow = iterator.next();
					Iterator<Cell> cellIterator = nextRow.cellIterator();
					if (stt != 0) {
						while (cellIterator.hasNext()) {
							Cell cell = cellIterator.next();
							switch (cell.getCellType()) {
							case Cell.CELL_TYPE_STRING:
								userAdding[iteratorUserAdding] = cell.getStringCellValue();
								break;
							case Cell.CELL_TYPE_BOOLEAN:
								userAdding[iteratorUserAdding] = cell.getBooleanCellValue() + "";
								break;
							case Cell.CELL_TYPE_NUMERIC:
								if (HSSFDateUtil.isCellDateFormatted(cell)) {
									SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
									Date date = cell.getDateCellValue();
									userAdding[iteratorUserAdding] = formatter.format(date);
									logger.info(formatter.format(date));
								} else {
									userAdding[iteratorUserAdding] = String.valueOf(cell.getNumericCellValue())
											.replaceFirst("\\.0+$", "");
									//logger.info(String.valueOf(cell.getNumericCellValue()).replaceFirst("\\.0+$", ""));
								}
								break;
							}
							iteratorUserAdding += 1;
							if (iteratorUserAdding == 9) {
								try {
									String paencode = passwordEncoder.encode(userAdding[6]);
									java.sql.Date currentDateSQL = java.sql.Date.valueOf(userAdding[2]);
									User newUser = new User(userAdding[0], userAdding[1], currentDateSQL, userAdding[3],
											userAdding[4], userAdding[5], paencode,
											quyenDAO.findById(Integer.parseInt(userAdding[7])));
									if(Integer.parseInt(userAdding[7])==2){
										if(userAdding[8].equals(null)){
											logger.info("Student with lop = null");
											throw new Exception();
										}
										newUser = new User(userAdding[0], userAdding[1], currentDateSQL, userAdding[3],
												userAdding[4], userAdding[5], paencode,
												quyenDAO.findById(Integer.parseInt(userAdding[7])),userAdding[8]);
									}
									if (userDAO.save(newUser) == null) {
										outputNotification += "the user have name: " + userAdding[1] + " is failed \n";
									}
								} catch (Exception e) {
									logger.error(e.toString());
									outputNotification += "the user have name: " + userAdding[1] + " is failed \n";
								}
								iteratorUserAdding = 0;
							}
						}
					}
					System.out.println();
					stt += 1;
				}
				workbook.close();
				fileContent.close();
				if(outputNotification.equals("")){
					outputNotification="Success!";
				}

				out.print(outputNotification+" \ntime:"+new Date());
				//rd.include(request, response);
				return;
			}
		} catch (Exception e) {
			try {
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.print(outputNotification +" \ntime:"+new Date());
				//rd.include(request, response);
			} catch (Exception ex) {

			}
			e.printStackTrace();
			return;
		}
	}
}
