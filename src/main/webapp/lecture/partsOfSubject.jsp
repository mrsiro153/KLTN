<%@page import="doan.quizzOnline.model.NoiDung"%>
<%@page import="doan.quizzOnline.model.NoiDungDAO"%>
<%@page import="doan.quizzOnline.model.MonHoc"%>
<%@page import="java.util.List"%>
<%@page import="doan.quizzOnline.model.DeThiDAO"%>
<%@page import="doan.quizzOnline.model.MonHocDAO"%>
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
MonHocDAO monHocDAO;

@Autowired
NoiDungDAO noiDungDAO;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Exam</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%
	String idSubject = request.getParameter("idSubject");
	if(idSubject==null){
		idSubject="1";
	}
	Integer idSub = Integer.parseInt(idSubject);
	List<NoiDung> nds = noiDungDAO.findByIdMonHoc(monHocDAO.findByidMonHoc(idSub));
	if(nds.isEmpty()){
		out.print("<h5>No Part of Exam</h5>");
	}
	%>
	<table class="table">
		<thead>
      		<tr>
        		<th>idPart</th>
        		<th>Name of Part</th>
     		</tr>
    	</thead>
    	<tbody>
    		<%for(NoiDung nd : nds ){ %>
    			<tr>
    				<td><%=nd.getIdNoiDung() %></td>
    				<td><%=nd.getTenNoiDung() %></td>
    			</tr>
    		<%} %>
    	</tbody>
	</table>
</body>
</html>