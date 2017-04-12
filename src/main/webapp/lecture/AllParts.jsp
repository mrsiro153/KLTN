<%@page import="lecture.GetSubject"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
			GetSubject gS1=new GetSubject();
			if (request.getParameter("idMonHoc") != null) {
				String idmon = request.getParameter("idMonHoc");
				ResultSet rs1 = gS1.getParts(idmon);
				if (rs1==null) {
					//no parts
				} else {
					do {
		%>
		<tr>
			<td style="display: none"><input name="idPart" value="<%=rs1.getString("idNoiDung")%>"></td>
			<td><%=rs1.getString("TenNoiDung")%></td>
			<td><input type="number" class="form-control" name="numbersQuizz" required></td>
		</tr>
		<%
			} while (rs1.next());
				}
			}
		%>
	</tbody>
</table>