<%@page import="doan.quizzOnline.service.QuizzBankManagerService"%>
<%@page import="doan.quizzOnline.model.CauHoiDAO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@page import="doan.quizzOnline.DTO.Quizz"%>
<%@page import="javax.crypto.AEADBadTagException"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%!
public void jspInit() 
{
    SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,getServletContext());
}

@Autowired
CauHoiDAO cauHoiDAO;

@Autowired
QuizzBankManagerService bankService;
%>
    <link rel="stylesheet" type="text/css" href="quizzmanager/quizzmanager.css">
<div class="col-md-1"></div>
<div class="col-md-10" id="MainQuizzManager">
	<center><h1>Managing Bank Quizz Page</h1></center>
	<%
		ArrayList<Quizz> arQuizz= bankService.getAllQuizzsArrayList();
		if(arQuizz!=null){
			session.setAttribute("listQuizz", arQuizz);
		}
		/*
		ResultSet rs= gs.getAllQuizzs();
		if(rs==null){
			return;
		}
		*/
	%>
	<button class="btn btn-warning" onclick="window.open('quizzmanager/newQuizz.jsp')" style="margin-top: 5px;">
	Add new Quizz</button>
	<button class="btn btn-success" style="margin-top: 5px; display: inline;">
	<a href="quizzmanager/quizzmanagerFilter.jsp" style="text-decoration:none; color:white;">Open seach view</a></button>
	<!-- add quizzs from file -->
	<div>
	<form style="margin-top: 15px; margin-left: 10px;" enctype="multipart/form-data" method="post" action="addNewQuizzByFile">
      	Add Quizzs from file upload: <input type="file" name="file">
      	<button type="submit" style="margin-top: 5px;" class="btn btn-default">Ok</button>
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	</div>
	<hr>
	<div style="max-height:700px;overflow: auto; margin-top: 10px;" id="MainTableQuizzs">
	<!-- content quizzs -->
	<form method="post" action="EditQuizzByBankManager" style="margin-top: 5px;">
		<table class="table table-hover">
			<thead>
				<tr class="info">
					<th>idQuizz</th>
					<th>Content Quizz</th>
					<th>Answer</th>
					<th>Select A</th>
					<th>Select B</th>
					<th>Select C</th>
					<th>Select D</th>
				</tr>
			</thead>
			<tbody>
			<% 
			String currentQuizznumber="0";
			if(request.getParameter("currentOfQuizzNumbers")!=null){
				currentQuizznumber = request.getParameter("currentOfQuizzNumbers");
			}		
			int currentIndex=Integer.parseInt(currentQuizznumber);
			int lastIndex=currentIndex;
			int CountLine=0;
			for(int i =currentIndex;i<arQuizz.size();i++){ %>					
				<tr>
					<td><input name="idQuizz" value="<%=arQuizz.get(i).getMaCauHoi()%>" size="4" readonly></td>
					<td><input name="content" value="<%=arQuizz.get(i).getNoiDung()%>" required></td>
					<td><input name="trueAnswer" value="<%=arQuizz.get(i).getDapAnDung()%>" size="1" required></td>
					<td><input name="selectA" value="<%=arQuizz.get(i).getDapAnA()%>" required> </td>
					<td><input name="selectB" value="<%=arQuizz.get(i).getDapAnB()%>" required></td>
					<td><input name="selectC" value="<%=arQuizz.get(i).getDapAnC()%>" required></td>
					<td><input name="selectD" value="<%=arQuizz.get(i).getDapAnD()%>" required></td>
				</tr>			
			<%
				CountLine+=1;
				lastIndex+=1;
				if(CountLine==10){
					break;
				}
			}
			%>
			</tbody>
		</table>
		<center><button type="submit" class="btn btn-primary" style="margin-top: 10px; margin-bottom: 20px;">Save</button></center>
		<p style="display:none" id="currentOfQuizzNumbers">
		<%
			if(lastIndex%10==0){
				out.print(lastIndex);
			}else{
				lastIndex = lastIndex-lastIndex%10+10;
				out.print(lastIndex);
			}
		%>
		</p>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
	<div style="margin-top: 5px; margin-bottom: 10px;">
		<center>
			<button class="btn btn-warning" onclick="previousPage()">BACK</button>
			<input maxlength="4" size="4" type="number" value="1" style="display: inline;" readonly id="currentPage">
			<p style="display: inline;" id="MaxPage"><%if(arQuizz.size()%10==0) out.print(arQuizz.size()/10); else out.print(arQuizz.size()/10+1);%></p>
			<button class="btn btn-warning" onclick="nextPage()" style="display: inline;">NEXT</button>
		</center>
	</div>
</div>