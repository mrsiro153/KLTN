<%@page import="doan.quizzOnline.model.User_DeThi"%>
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
			String dethi = request.getParameter("idExam");
			List<User_DeThi> usdts = user_DeThiDAO.findByMaDeThi(deThiDAO.findByidDeThi(Integer.parseInt(dethi)));
			if (usdts == null || usdts.isEmpty()) {
				out.print("<h1>No one do this exam </h1>");
				return;
			}
			for (User_DeThi usdt : usdts) {
		%>
		<tr>
			<td><%=usdt.getMaSinhVien().getId()%></td>
			<td><%=usdt.getMaSinhVien().getHoTen()%></td>
			<td><%=usdt.getDiem()%></td>
			<td><%=usdt.getMaDeThi().getNgayMoDeThi()%></td>
		</tr>
		<%
			}
		%>
	</tbody>
</table>