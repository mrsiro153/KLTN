<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.io.PrintWriter"%>
<html>
<head>
<meta charset=utf-8 />
<title>MainPage</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--font-->
<link
	href="https://fonts.googleapis.com/css?family=Lobster&subset=vietnamese"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style.css">
<script src="jquery.js"></script>
<!--thu vien jquery-->
<script src="javascript.js"></script>
<%
if (session.getAttribute("name") == null) {
	System.out.println("you logged out");
	response.sendRedirect("Login.jsp");
	return;
}
if(session.getAttribute("pre").equals("1")){ 
	out.println("<script type='text/javascript' src='admin1/admin.js'></script>");
}
if(session.getAttribute("pre").equals("2")){ 
	out.println("<script type='text/javascript' src='student/student.js'></script>");
}
if(session.getAttribute("pre").equals("3")){
	out.println("<script type='text/javascript' src='lecture/lecture.js'></script>");
}
if(session.getAttribute("pre").equals("4")){
	out.println("<script type='text/javascript' src='exammanager/manager.js'></script>");
}
if(session.getAttribute("pre").equals("5")){
	out.println("<script type='text/javascript' src='quizzmanager/quizzmanager.js'></script>");
}
%>
<script type="text/javascript" src="timer1.js"></script>
<script type="text/javascript" src="timer2.js"></script>
</head>
<body style="background: url(hinhanh/anh2.jpg);" onbeforeunload="unloadOrInterrupt()">
	<div class="mainpage_navbar">
		<img src="hinhanh/logo2.png" width="160px" height="160px"
			style="margin-left: 150px;">
		<div style="display: inline-block;">
			<h1 class="mainpage_hcmute">Hồ Chí Minh Technical and Education</h1>
			<h6 class="mainpage_hcmute">1 Võ Văn Ngân street, Thủ Đức
				district, Hồ Chí Minh city</h6>
		</div>
	</div>
	<!--NavBar-->
	<div id="navBarMain">
		<ul>
			<li style="margin-left: 10%;" onmouseover="mousehover(this)"
				onmouseout="mouseout(this)" id="myhome" onclick="loadDoc(this)">My
				Home</li>
			<%
				String pre= (String)session.getAttribute("pre").toString();
				if (pre.equals("1")){
					out.print("<li onmouseover='mousehover(this)' onmouseout='mouseout(this)'"
							+"id='admin' onclick='loadDoc(this)'>Admin</li>");
				}
				if(pre.equals("2")){
					out.print("<li onmouseover='mousehover(this)' onmouseout='mouseout(this)'"+
							"id='exam' onclick='loadDoc(this)'>Exam</li>");
				}
				if(pre.equals("3")){
					out.print("<li onmouseover='mousehover(this)' onmouseout='mouseout(this)'"+
							"id='lecture' onclick='loadDoc(this)'>Lecture</li>");
					out.print("<li onmouseover='mousehover(this)' onmouseout='mouseout(this)'"+
							"id='newExam' onclick='window.open(\"lecture/NewExam.jsp?idMonHoc=1\")'>NewExam</li>");
				}
				if(pre.equals("4")){
					out.print("<li onmouseover='mousehover(this)' onmouseout='mouseout(this)'"+
							"id='manager' onclick='loadDoc(this)'>Manage exam</li>");
					out.print("<li onmouseover='mousehover(this)' onmouseout='mouseout(this)'"+
							"id='userManager' onclick='loadDoc(this)'>Exam-Student</li>");
				}
				if(pre.equals("5")){
					out.print("<li onmouseover='mousehover(this)' onmouseout='mouseout(this)'"+
							"id='quizz' onclick='loadDoc(this)'>Manage Quizz</li>");
				}			
			%>
			
			<li onmouseover="mousehover(this)" onmouseout="mouseout(this)"
				id="guiding" onclick="loadDoc(this)">Guiding</li>
			<li onmouseover="mousehover(this)" onmouseout="mouseout(this)"
				id="question" onclick="loadDoc(this)">Question?</li>
			<li onmouseover="mousehover(this)" onmouseout="mouseout(this)" style="position: absolute; right: 0px;">
			<form action="logoutnow" method="get"><Button type="submit" class="btn btn-primary">LogOut</Button></form></li>
		</ul>
	</div>
	<div id="content">
		<jsp:include page="myhome.jsp"></jsp:include>
		<!--INSIDE here-->
	</div>
</body>
</html>