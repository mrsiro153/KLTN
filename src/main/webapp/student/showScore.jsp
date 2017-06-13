<%@page import="doan.quizzOnline.model.MonHoc"%>
<%@page import="java.util.List"%>
<%@page import="doan.quizzOnline.model.User_DeThi"%>
<%@page import="doan.quizzOnline.model.UserDAO"%>
<%@page import="doan.quizzOnline.model.User_DeThiDAO"%>
<%@page import="doan.quizzOnline.model.MonHocDAO"%>
<%@page import="doan.quizzOnline.model.DeThiDAO"%>
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
DeThiDAO deThiDAO;

@Autowired
MonHocDAO monHocDAO;

@Autowired
User_DeThiDAO user_DeThiDAO;

@Autowired
UserDAO userDAO;
%>
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
			String s="";
			if(session.getAttribute("user")!=null){
				s= session.getAttribute("user").toString();
			}else{
				out.print("<script>alert('please login first!')</script>");
				return;
			}
			//
			List<User_DeThi> us_Ds = user_DeThiDAO.findBymaSinhVien(userDAO.findById(s));
			if(us_Ds.isEmpty()){
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
				<%for(User_DeThi us_D:us_Ds){
						MonHoc mh = monHocDAO.findByidMonHoc(us_D.getMaDeThi().getMaMonHoc());
						%>
				<tr>
					<td><%=mh.getTenMonHoc() %></td>
					<td><%=us_D.getMaDeThi().getIdDeThi() %></td>
					<td><%=us_D.getMaDeThi().getNgayMoDeThi() %></td>
					<td><%=us_D.getMaDeThi().getGioMoDeThi() %></td>
					<td><%=us_D.getDiem() %></td>
				</tr>
				<%}%>
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