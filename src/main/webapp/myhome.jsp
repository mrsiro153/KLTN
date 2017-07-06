<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%if(session.getAttribute("name")==null){
		response.sendRedirect("Login.jsp");
	}%>
<div class="PerInfor" style="margin-top: 30px">
	<div class="ImgMain col-md-4">
		<center>
			<img
				src="http://images.vov.vn/w600/uploaded/phamhoa/2016_01_27/vu_dai_thang_gjrd.jpg"
				width="400px" height="400px" class="img-circle" style="margin-top:30px">
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