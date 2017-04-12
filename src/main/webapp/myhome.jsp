<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%if(session.getAttribute("name")==null){
		response.sendRedirect("Login.jsp");
	}%>
<div class="PerInfor" style="margin-top: 30px">
	<div class="ImgMain col-md-4">
		<center>
			<img
				src="http://tapchianhdep.com/wp-content/uploads/2015/04/nhung-hinh-anh-hai-huoc-sieu-dang-yeu-cua-tre-con-4.jpg"
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