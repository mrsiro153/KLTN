<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%if(session.getAttribute("name")==null){
		response.sendRedirect("Login.jsp");
	}%>
<div class="PerInfor" style="margin-top: 30px">
	<div class="ImgMain col-md-4">
		<center>
			<img
				src="http://1.bp.blogspot.com/-agkIFTFXhOg/UbgD4w2VKJI/AAAAAAAACe0/gWZfWQmSCWk/s1600/20-taylor_swift_by_rajacenna.jpg"
				width="300px" height="300px" class="img-circle" style="margin-top:30px">
		</center>
	</div>
	<div class="InformationUser col-md-6">
		<h2>
			Your Name:
			<%=session.getAttribute("name")%>
		</h2>
		<h2>
			Role:
			<%=session.getAttribute("tenquyen")%></h2>
		<h2>
			Date of birth:
			<%=session.getAttribute("dob")%></h2>
		<h2>
			Sex:
			<%=session.getAttribute("sex")%></h2>
		<h2>
			Phone number:
			<%=session.getAttribute("phone")%></h2>
	</div>
</div>