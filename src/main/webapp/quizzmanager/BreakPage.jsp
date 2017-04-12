<%@page import="quizzs.Quizz"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
ArrayList<Quizz> arQuizz = new ArrayList<Quizz>();
if(session.getAttribute("listQuizz")!=null){
	arQuizz = (ArrayList<Quizz>)session.getAttribute("listQuizz");
}
%>
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
			for(int i =currentIndex;i<arQuizz.size();i++){ 
			%>					
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