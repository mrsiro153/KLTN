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
%>
<link rel="stylesheet" type="text/css" href="exammanager/manager.css">
<div class="col-md-2"></div>
<div class="col-md-8" id="MainManager">
	<center>
		<h1>Exam Manager Page</h1>
	</center>
	<button onclick="check()" class="btn btn-success" data-toggle="tooltip" title="Click me to show the special Exam!!">filter</button>
	<form action="ManagerEdit" method="post" style="margin-top: 10px;" id="formManagerEdit">
		<table class="table table-hover">
			<thead>
				<tr class="info">
					<th>idExam</th>
					<th>Time (minute)</th>
					<th>Opening date</th>
					<th>Opening time</th>
					<th>Name subject</th>
					<th>status</th>
					<th style="display: none">idMonHoc</th>
				</tr>
			</thead>
			<tbody id="bodyOfTableManagerExam">
				<%
					List<DeThi> dethis = deThiDAO.findAll();
					if (dethis.isEmpty()) {
						return;
					}
					for(DeThi d:dethis) {
				%>
				<tr>
					<td class="col-xs-2"><input class="form-control" name="idDeThi" value="<%=d.getIdDeThi()%>" readonly></td>
					<td>
						<%
							int x = Integer.parseInt(d.getThoiLuong());
								out.print(x / 60);
						%>
					</td>
					<td><input name="OpeningDate" class="form-control"
						value="<% try{out.print(d.getNgayMoDeThi());}catch(Exception e){out.print("not yet set");} %>" type="date"></td>
					<td><input name="OpeningTime" class="form-control"
						value="<%try{out.print(d.getGioMoDeThi());}catch(Exception e){out.print("not yet set");} %>" type="time"></td>
					<td><%=monHocDAO.findByidMonHoc(d.getMaMonHoc()).getTenMonHoc()%></td>
					<td>
					<input name="status" type="checkbox" value="0" 
					<%if(d.getStatus()==0) out.print("checked");%>>
					<input id='statusHidden' type='hidden' value='1' name='status'>
					</td>
					<td style="display: none;"><input name="idMH"
						value="<%=monHocDAO.findByidMonHoc(d.getMaMonHoc()).getIdMonHoc()%>"></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<center><button type="button" class="btn btn-primary" style="margin-top: 10px; margin-bottom: 10px;" onclick="checkStautusOfDeThi()" >Save</button></center>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</div>