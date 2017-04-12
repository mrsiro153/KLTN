<%@page import="java.sql.ResultSet"%>
<%@page import="manager.ExamManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<link rel="stylesheet" type="text/css" href="exammanager/manager.css">
<div class="col-md-2"></div>
<div class="col-md-8" id="MainManager">
	<center>
		<h1>Exam Manager Page</h1>
	</center>
	<button onclick="check()" class="btn btn-success" data-toggle="tooltip" title="Click me to show the special Exam!!">filter</button>
	<form action="ManagerEdit" method="post" style="margin-top: 10px;">
		<table class="table table-hover">
			<thead>
				<tr class="info">
					<th>idExam</th>
					<th>Time (minute)</th>
					<th>Opening date</th>
					<th>Opening time</th>
					<th>Name subject</th>
					<th style="display: none">idMonHoc</th>
				</tr>
			</thead>
			<tbody id="bodyOfTableManagerExam">
				<%
					ExamManager gS = new ExamManager();
					ResultSet rs = gS.getExam();
					if (rs == null) {
						return;
					}
					do {
				%>
				<tr>
					<td><input class="form-control" name="idDeThi" value="<%=rs.getString("idDeThi")%>" readonly></td>
					<td>
						<%
							int x = Integer.parseInt(rs.getString("ThoiLuong"));
								out.print(x / 60);
						%>
					</td>
					<td><input name="OpeningDate" class="form-control"
						value="<%=rs.getString("NgayMoDeThi")%>" type="date"></td>
					<td><input name="OpeningTime" class="form-control"
						value="<%=rs.getString("GioMoDeThi")%>" type="time"></td>
					<td><%=rs.getString("TenMonHoc")%></td>
					<td style="display: none;"><input name="idMH"
						value="<%=rs.getString("MaMonHoc")%>"></td>
				</tr>
				<%
					} while (rs.next());
				%>
			</tbody>
		</table>
		<center><button type="submit" class="btn btn-primary" style="margin-top: 10px; margin-bottom: 10px;" >Save</button></center>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</div>