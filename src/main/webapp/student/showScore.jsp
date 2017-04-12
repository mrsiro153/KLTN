<%@page import="java.sql.ResultSet"%>
<%@page import="connectData.ConnectDatabase"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Show score</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#MainExamsScore {
	background-color: #000000;
	border-radius: 20px;
}

#MainExamsScore h1,h4 {
	color: white;
}

#MainExamsScore table {
	margin-top: 20px;
	color: white;
}
</style>
</head>
<body>
	<div class="col-md-8 col-md-offset-2" style="margin-top: 20px;"
		id="MainExamsScore">
		<center>
			<h1>Exams score</h1>
		</center>
		<%
			ConnectDatabase cn = new ConnectDatabase();
			String s="";
			if(session.getAttribute("user")!=null){
				s= session.getAttribute("user").toString();
			}else{
				out.print("<script>alert('please login first!')</script>");
				return;
			}
			String sql = "SELECT TenMonHoc,MaDeThi,NgayMoDeThi,GioMoDeThi,Diem" + " FROM quizz.user_dethi,dethi,monhoc"
					+ " where user_dethi.MaDeThi=dethi.idDeThi and dethi.MaMonHoc=monhoc.idMonHoc and"
					+ " user_dethi.MaSinhVien='"+s+"'";
			ResultSet rs = cn.GetData(sql);
			if (!rs.next()) {
				out.print("<h2 style='color:red'>You haven't done any exam </h2>");
				return;
			}
		%>
		<h4 style="margin-top: 15px">Student: <%=session.getAttribute("name")%></h4>
		<table class="table">
			<thead>
				<tr>
					<th>Subject Name</th>
					<th>id Exam</th>
					<th>Date</th>
					<th>Time</th>
					<th>Your score</th>
				</tr>
			</thead>
			<tbody>
				<%do{ %>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
				</tr>
				<%}while(rs.next());%>
			</tbody>
		</table>
		<center>
			<form action="printTheResult" method="get">
			<input style="display: none;" name="idUser" value="<%= session.getAttribute("user")%>">
			<button type="submit" class="btn btn-default">Print Result</button>
			</form>
		</center>
	</div>
</body>
</html>