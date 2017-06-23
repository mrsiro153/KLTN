<%@page import="doan.quizzOnline.model.NoiDung"%>
<%@page import="doan.quizzOnline.model.NoiDungDAO"%>
<%@page import="doan.quizzOnline.model.MonHoc"%>
<%@page import="java.util.List"%>
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
//
function submitNewExam() {

    var url = "createNewExam"; // the script where you handle the form input.

    $.ajax({
           type: "POST",
           url: url,
           data: $("#formNewExam").serialize(), // serializes the form's elements.
           success: function(data)
           {
        	   $("#resultOfSubmitNewExam").html(data);
               //console.log(data);
           }
         });
}
</script>
</head>
<body>
	<%
		
		List<MonHoc> rs= monHocDAO.findAll();
		if(rs.isEmpty()){
			return;
		}
	%>
	<div class="col-md-8 col-md-offset-2 AddNewExam">
	<center><h1 style="color:red;">Add a new Exam</h1></center>
		<form action="createNewExam" method="post" style="margin-top: 30px;" id="formNewExam">
			<div class="col-md-3">
				<select name="maMonHoc" onchange="SelectBoxValue(this)">
					<% for(MonHoc m : rs){ %>
						<option value="<%=m.getIdMonHoc()%>"><%=m.getTenMonHoc()%></option>			
					<% } %>
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
							List<NoiDung> rs1=noiDungDAO.findByIdMonHoc((monHocDAO.findByidMonHoc(Integer.parseInt(idmon))));
							if(rs1.isEmpty()){
							}else{
								for(NoiDung n : rs1){
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
			<button class="btn btn-primary btn-block btnSubmit" type="submit" id="btnSubmitNewExam" style="display:none;">OK</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /><br/>
			<button class="btn btn-primary btn-block btnSubmit" type="button" onclick="submitNewExam()">OK</button>
			<center><div id="resultOfSubmitNewExam"></div></center>
		</form>
	</div>
</body>
</html>