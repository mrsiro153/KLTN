<%@page import="doan.quizzOnline.model.User"%>
<%@page import="doan.quizzOnline.model.UserDAO"%>
<%@page import="doan.quizzOnline.model.DeThi"%>
<%@page import="java.util.List"%>
<%@page import="doan.quizzOnline.model.MonHocDAO"%>
<%@page import="doan.quizzOnline.model.DeThiDAO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
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
<div>
<p>This is Student of class you choose</p>
<%
String idClass= request.getParameter("idClass").toString();
if(idClass.equals(null)){
	return;
}
%>
<table class="table table-hover">
		<thead>
			<tr class="info">
				<th>ID user</th>
				<th>Name</th>
				<th>Date of birth</th>
				<th>Sex</th>
				<th>Address</th>
				<th>phone number</th>
				<th>lop</th>
			</tr>
		</thead>
		<tbody>
		<%
				List<User> uss= userDAO.findByQuyenAndClassOfStudent(idClass);
				System.out.println("a"+idClass+"a");
				if(uss.isEmpty()){
					System.out.print("this student class is EMPTY");
				}
				for(User rs: uss) {
			%>
			<tr>
				<td><%=rs.getId()%></td>
				<td><%=rs.getHoTen()%></td>
				<td><%=rs.getNgaySinh()%></td>
				<td><%=rs.getGioiTinh()%></td>
				<td><%=rs.getDiaChi()%></td>
				<td><%=rs.getsDT()%></td>
				<td><%=rs.getLop()%></td>
				<%
					}
				%>
			</tr>
		</tbody>
</table>
	
</div>