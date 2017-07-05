<!--<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<!-- Latest compiled and minified CSS -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--font-->
<link href="https://fonts.googleapis.com/css?family=Lobster&subset=vietnamese" rel="stylesheet">
<!--<script type="text/javascript" src="admin/admin.js"></script>-->
<link rel="stylesheet" type="text/css" href="admin1/admin.css">
<!---->
<a style="font-size: 150%; cursor:pointer; margin-left:5px;" class="tablink" onclick="opentab(event,this)" id="user">Manage User</a>
<a style="font-size: 150%; margin-left:50px; cursor:pointer;" class="tablink" onclick="opentab(event,this)" id="role">Manage Role</a>
<a style="font-size: 150%; margin-left:50px; cursor:pointer;" class="tablink" onclick="opentab(event,this)" id="exam">Manage Exam</a>
<br><br>
<div id="container1">
	<jsp:include page="manage_user.jsp"></jsp:include>
</div>