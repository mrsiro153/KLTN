<%@page import="doan.quizzOnline.model.UserDAO"%>
<%@page import="doan.quizzOnline.model.DeThi"%>
<%@page import="java.util.List"%>
<%@page import="doan.quizzOnline.model.MonHocDAO"%>
<%@page import="doan.quizzOnline.model.DeThiDAO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@page import="java.sql.ResultSet"%>
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
UserDAO userDAO;
%>
<link rel="stylesheet" type="text/css" href="exammanager/manager.css">
<div class="col-md-2"></div>
<div class="col-md-8" id="MainManager">
	<center>
		<h1>Exam And Student Manage Page</h1>
	</center>
	<div class="col-md-5">
		<h2>Choose your exam</h2>
	</div>
	<div>
		<h2>You will see sinh vien with class=xxxx will do this exam</h2>
	</div>
	
</div>