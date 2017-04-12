<%@page import="bankManager.GetAllQuizzs"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Filter quizzs</title>
<link rel="stylesheet" type="text/css"
	href="quizzmanager.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="quizzmanager.js"></script>
<style type="text/css">
	#myInput {
background-image: url('http://www.w3schools.com/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}
</style>
</head>
<%
	//check session
	if (session.getAttribute("pre") != null) {
		if (!session.getAttribute("pre").equals("5")) {
			return;
		}
	}else{
		return;
	}
	//
	GetAllQuizzs gs = new GetAllQuizzs();
	ResultSet rs = gs.getAllQuizzs();
	if(rs==null){
		return;
	}
%>
<body style="background-color: rgba(233, 252, 252, 0.8);">
	<div style="margin-top: 15px; margin-left: 10px; margin-right: 5px; margin-bottom: 10px;" >
		<center>
			<h1>Quizz Manager (Search view)</h1>
		</center>
		<div class="searchBox" style="margin-top: 10px;">
			<input type="text" id="myInput" onkeyup="searchQuizzs()" placeholder="Search content quizz" title="Type in a name">
		</div>
		<div class="contentQuizz" style="margin-top: 10px;">
			<table class="table table-hover" id="tableContentQuizzs">
				<thead>
					<tr class="info">
						<th>idQuizz</th>
						<th>Content Quizz</th>
						<th>Answer</th>
						<th>Select A</th>
						<th>Select B</th>
						<th>Select C</th>
						<th>Select D</th>
						<th>Part of Subject</th>
						<th>Tool</th>
					</tr>
				</thead>
				<tbody>
					<%
						do {
					%>					
				<tr>
					<td><%=rs.getString("idCauHoi")%></td>
					<td><%=rs.getString("NoiDungCauHoi")%></td>
					<td><%=rs.getString("DapAnDung")%></td>
					<td><%=rs.getString("DapAnA")%></td>
					<td><%=rs.getString("DapAnB")%></td>
					<td><%=rs.getString("DapAnC")%></td>
					<td><%=rs.getString("DapAnD")%></td>
					<td><%=rs.getString("TenNoiDung") %></td>
					<td style="display:none;"><%=rs.getString("idNoiDung") %></td>
					<td><button class="btn btn-primary" data-toggle="modal" data-target="#modalContentQuizz" onclick="changeContentQuizz(this)">Edit</button></td>
				</tr>			
			<%
							} while (rs.next());
						%>
			</tbody>			
			</table>
		</div>
	</div>
	<!-- Modal -->
<div id="modalContentQuizz" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Edit quizz</h4>
      </div>
      <div class="modal-body">
      <form action="editQuizzSearchView" method="post">
      	<table class="table table-bordered">
      		<tbody>
      			<tr>
      				<td>idQuizz</td>
      				<td><input id="formIdQuizz" name="idQuizz" value="" readonly class="form-control" required></td>
      			</tr>
      			<tr>
      				<td>Content quizz</td>
      				<td><input id="formContentQuizz" name="contentQuizz" value="" class="form-control" required></td>
      			</tr>
      			<tr>
      				<td>True Answer</td>
      				<td><input id="formAnswerQuizz" name="trueAnswerQuizz" value="" class="form-control" required></td>
      			</tr>
      			<tr>
      				<td>Select A</td>
      				<td><input id="formSelectAQuizz" name="selectA" value="" class="form-control" required></td>
      			</tr>
      			<tr>
      				<td>Select B</td>
      				<td><input id="formSelectBQuizz" name="selectB" value="" class="form-control" required></td>
      			</tr>
      			<tr>
      				<td>Select C</td>
      				<td><input id="formSelectCQuizz" name="selectC" value="" class="form-control" required></td>
      			</tr>
      			<tr>
      				<td>Select D</td>
      				<td><input id="formSelectDQuizz" name="selectD" value="" class="form-control" required></td>
      			</tr>
      			<tr>
      				<td>Name of Part</td>
      				<td><input id="formPartQuizz" value="" readonly class="form-control" required></td>
      			</tr>
      			<tr style="display: none;">
      				<td>ID of Part</td>
      				<td><input id="formIdPartQuizz" name="idPartQuizz" value="" readonly class="form-control" required></td>
      			</tr>
      		</tbody>
      	</table>	
        <center><button type="submit" class="btn btn-default">Save</button></center>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
        </div>
    </div>
  </div>
</div>
</body>
</html>