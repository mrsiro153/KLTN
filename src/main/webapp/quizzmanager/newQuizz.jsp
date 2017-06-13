<%@page import="java.util.List"%>
<%@page import="doan.quizzOnline.model.MonHocDAO"%>
<%@page import="doan.quizzOnline.model.MonHoc"%>
<%@page import="doan.quizzOnline.service.QuizzBankManagerService"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%!
public void jspInit() 
{
    SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,getServletContext());
}

@Autowired
MonHocDAO monHocDAO;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Add a new Quizz</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="quizzmanager/quizzmanager.css">
<script type="text/javascript" src="quizzmanager.js"></script>
</head>
<body>
	<center>
		<h1 style="color: blue;">Add a new Quizz</h1>
	</center>
	<div class="col-md-8 col-md-offset-2" style="background: rgba(233, 252, 252, 0.8); margin-top: 15px; border-radius:20px;">
		<div id="MainAddNewQuizz" style="margin-top: 10px;">
			<%
				List<MonHoc> monhocs= monHocDAO.findAll();
				if (monhocs.isEmpty()) {
					out.print("No subject");
					return;
				}
			%>
			<p>Select subject:</p>
			<form class="form-horizontal" action="addNewQuizz" method="post">
				<select name="idMonHoc" onchange="loadPart(this)" class="form-control">
					<%	for(MonHoc m: monhocs) {%>
					<option value="<%=m.getIdMonHoc()%>"><%=m.getTenMonHoc()%></option>
					<%};%>
				</select>
				<div id="contentPartAndQuizz" style="margin-top:20px;">
				</div>			
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
		</div>
	</div>
</body>
</html>