<%@page import="doan.quizzOnline.model.NoiDung"%>
<%@page import="java.util.List"%>
<%@page import="doan.quizzOnline.model.NoiDungDAO"%>
<%@page import="doan.quizzOnline.model.DeThiDAO"%>
<%@page import="doan.quizzOnline.model.MonHocDAO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%!
public void jspInit() 
{
    SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,getServletContext());
}
@Autowired
MonHocDAO monHocDAO;

@Autowired
DeThiDAO deThiDAO;

@Autowired
NoiDungDAO noiDungDAO;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<table class="table table-hover">
	<thead>
		<tr class="info">
			<th style="display: none">idNoiDung</th>
			<th>Choose part of exam</th>
			<th>Numbers</th>
		</tr>
	</thead>
	<tbody>
		<%
			if (request.getParameter("idMonHoc") != null) {
				String idmon = request.getParameter("idMonHoc");
				List<NoiDung> rs1 = noiDungDAO.findByIdMonHoc(monHocDAO.findByidMonHoc(Integer.parseInt(idmon)));
				if (rs1.isEmpty()) {
					//no parts
				} else {
					for(NoiDung n:rs1){
		%>
		<tr>
			<td style="display: none"><input name="idPart" value="<%=n.getIdNoiDung()%>"></td>
			<td><%=n.getTenNoiDung()%></td>
			<td><input type="number" class="form-control" name="numbersQuizz" required></td>
		</tr>
		<%
			}
				}
			}
		%>
	</tbody>
</table>