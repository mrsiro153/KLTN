<%@page import="lecture.GetSubject"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Exam</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
div.AddNewExam {
	height: auto;
	background-color: rgba(0, 0, 255, 0.1);
	border-radius: 10px;
	margin-top: 10px;
	padding: 5px;
}

div.SelectQuestion {	
}
div.controls {
}
.btnSubmit {
	position: relative;
	margin-top: 20px;
}
</style>
<script type="text/javascript">
function SelectBoxValue(selectBox){
	var xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("AllParts").innerHTML = this.responseText;
		}
	};
	xhttp.open("GET", "AllParts.jsp?idMonHoc="+selectBox.value, true);
	xhttp.send();
}
</script>
</head>
<body>
	<%
		GetSubject gS=new GetSubject();
		ResultSet rs= gS.getOnlySubjects();
		if(rs==null){
			return;
		}
	%>
	<div class="col-md-8 col-md-offset-2 AddNewExam">
	<center><h1 style="color:red;">Add a new Exam</h1></center>
		<form action="createNewExam" method="get" style="margin-top: 30px;">
			<div class="col-md-3">
				<select name="maMonHoc" onchange="SelectBoxValue(this)">
					<% do{ %>
						<option value="<%=rs.getString("idMonHoc")%>"><%=rs.getString("TenMonHoc")%></option>			
					<% }while(rs.next()); %>
				</select>
			</div>
			<div class="col-md-6 SelectQuestion" id="AllParts">
				<table class="table table-hover">
					<thead>
						<tr class="info">
							<th style="display:none">idNoiDung</th>
							<th>Choose part of exam</th>
							<th>Numbers</th>
						</tr>
					</thead>
					<tbody>
						<%if(request.getParameter("idMonHoc")!=null){
							String idmon=request.getParameter("idMonHoc");
							ResultSet rs1=gS.getParts(idmon);
							if(rs1==null){
							}else{
								do{
						%>
						<tr>
							<td style="display: none"><input name="idPart" value="<%=rs1.getString("idNoiDung")%>"></td>
							<td><%=rs1.getString("TenNoiDung")%></td>
							<td><input type="number" class="form-control" name="numbersQuizz" required></td>
						</tr>
						<%
								}while(rs1.next());
							}
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="col-md-3 controls">
				<p>ID Exam:</p>
				<input type="number" class="form-control" name="idExam"
					placeholder="Type Natural number" required>
				<p>Time:</p>
				<input type="number" class="form-control" name="TimeRe"
					placeholder="time is minute" required>
				
				<h2 style="visibility: hidden">ds</h2>
			</div>
			<br>
			<h4 style="color:red; margin-left: 50px;">You have to type all block!!!!</h4>
			<button class="btn btn-primary btn-block btnSubmit" type="submit">OK</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</body>
</html>