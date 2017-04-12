<%@page import="quizzs.Quizz"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	session.getAttribute("listcauhoi");
	ArrayList<Quizz> arQuizz = (ArrayList<Quizz>) session.getAttribute("listcauhoi");
	String currentQuizz = request.getParameter("currentQuizz");
	int quizz = Integer.parseInt(currentQuizz);
%>
<h4> Quizz <%=quizz + 1%>: <%=arQuizz.get(quizz).getNoiDung()%></h4>
<p style="display: none;" id="currentQuizz"><%=quizz%></p>
<input type="radio" name="kind" value="A" onclick="addToAnswersheet(this)"><%=arQuizz.get(quizz).getDapAnA()%>
<br>
<input type="radio" name="kind" value="B" onclick="addToAnswersheet(this)"><%=arQuizz.get(quizz).getDapAnB()%>
<br>
<input type="radio" name="kind" value="C" onclick="addToAnswersheet(this)"><%=arQuizz.get(quizz).getDapAnC()%>
<br>
<input type="radio" name="kind" value="D" onclick="addToAnswersheet(this)"><%=arQuizz.get(quizz).getDapAnD()%>
<br>
