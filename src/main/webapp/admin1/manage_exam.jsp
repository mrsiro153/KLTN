<%@page import="doan.quizzOnline.model.User_DeThi"%>
<%@page import="com.fasterxml.jackson.annotation.JsonTypeInfo.Id"%>
<%@page import="doan.quizzOnline.model.DeThi"%>
<%@page import="java.util.List"%>
<%@page import="doan.quizzOnline.model.DeThiDAO"%>
<%@page import="doan.quizzOnline.model.MonHocDAO"%>
<%@page import="doan.quizzOnline.model.User_DeThiDAO"%>
<%@page import="doan.quizzOnline.service.UserService"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page
	import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%!public void jspInit() {
		SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this, getServletContext());
	}

	@Autowired
	UserService userService;

	@Autowired
	User_DeThiDAO user_DeThiDAO;

	@Autowired
	MonHocDAO monHocDAO;

	@Autowired
	DeThiDAO deThiDAO;%>
<div class="tablecontain">
	<h1>Show score of student</h1>
	<div
		style="width: 300px; display: inline-block; position: relative; top: 0px; float: left; left: 5px;">
		<input type="search" id="searchBox" onkeyup="searchExamSubject()" class="form-control" placeholder="type exam here">
		<select id="exam_subject" class="form-control" onchange="loadExamSubject(this)">
			<%
			String dethi = request.getParameter("idExam");
			if(dethi!=null){
				System.out.println(dethi);
			}else{
				dethi="1";
			}
				List<DeThi> ds = deThiDAO.findAll();
				if (ds.isEmpty()) {
					return;
				}
				for (DeThi d : ds) {
			%>
			<option><% out.print(d.getIdDeThi() + " -- " + monHocDAO.findByidMonHoc(d.getMaMonHoc()).getTenMonHoc());%></option>
			<%}%>
		</select>
	</div>
	<!-- ----------------------------------------------------------------------------------- -->
	<div style="display: inline-block; margin-left: 60px; width: 70%" id="ScoresExam">
		<table class="table table-hover">
			<thead>
				<tr class="info">
					<th>Student Id</th>
					<th>Student Name</th>
					<th>Score</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<User_DeThi> usdts = user_DeThiDAO.findByMaDeThi(deThiDAO.findByidDeThi(Integer.parseInt(dethi)));
					if(usdts==null || usdts.isEmpty()){
						return;
					}
					for(User_DeThi usdt : usdts){
				%>
				<tr>
					<td><%=usdt.getMaSinhVien().getId() %></td>
					<td><%=usdt.getMaSinhVien().getHoTen() %></td>
					<td><%=usdt.getDiem() %></td>
					<td><%=usdt.getMaDeThi().getNgayMoDeThi() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</div>
<br>