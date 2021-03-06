<%@page import="doan.quizzOnline.model.DeThi"%>
<%@page import="doan.quizzOnline.model.DeThiDAO"%>
<%@page import="doan.quizzOnline.model.MonHoc"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="doan.quizzOnline.model.MonHocDAO"%>
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
DeThiDAO deThiDAO;
%>
<link rel="stylesheet" type="text/css" href="lecture/lecture.css">
<div class="lecturemain row">
	<%
	List<MonHoc> rs = monHocDAO.findAll();
	if(rs.isEmpty()){
		return;
	}
	%>
	<div id="lectureTableSubject" class="col-md-4">
		<div style="margin-left:5px">
			<h4>Add new part to subject</h4>
			<select class="form-control" onchange="onValueChangeOfSelecboxSubject(this)" id="selectBoxChooseSubject">
				<%for(MonHoc m :rs){ %>
				<option value="<%=m.getIdMonHoc()%>"><%=m.getTenMonHoc() %></option>
				<%} %>
			</select>
			<form id="formAddNewPartOfSubjet">
				<div class="form-group">
    				<label>idPart:</label>
    				<input type="number" class="form-control" name="idPart" id="idPart" required>
  				</div>
  				<div class="form-group">
    				<label>name Part:</label>
    				<input type="text" class="form-control" name="namePart" id="namePart" required>
  				</div>
			</form>
			<center><button class="btn btn-success" onclick="submitNewPart()">Save</button></center>
			<p id="resultOfAddPart"></p>
			<div id="partsOfSubject">
			</div>
		</div>
	</div>
	<!-- noi dung mon hoc -->
	<div class="col-md-7 col-md-offset-0 listExam">
		<form method="post" action="editExamLecture">
		<table class="table table-hover">
			<thead>
				<tr class="info">
					<th>idExam</th>
					<th>Time (minute)</th>
					<th>Opening date</th>
					<th>Opening time</th>
					<th>Name subject</th>
					<th>Tool</th>
				</tr>
			</thead>
			<tbody>
			<%
			List<DeThi> rs1 = deThiDAO.findAll();
			if(rs1.isEmpty()){
				out.print("No Exam!");
				return;
			}
			for(DeThi d :rs1){	%>	
				<tr>
					<td><input name="idDeThi" readonly class="form-control" size="3" value="<%=d.getIdDeThi()%>"></td>
					<td><input class="form-control" required type="number" size="5" name="TimeOut" value="<%
					int x = Integer.parseInt(d.getThoiLuong());
					out.print(x/60);%>"></td>
					<td><% if(d.getNgayMoDeThi()==null) out.print("Notyet Set"); else out.print(d.getNgayMoDeThi()); %></td>
					<td><% if(d.getGioMoDeThi()==null) out.print("Notyet Set"); else out.print(d.getGioMoDeThi()); %></td>
					<td><% try{out.print(monHocDAO.findByidMonHoc(d.getMaMonHoc()).getTenMonHoc());}catch(Exception e){} %></td>
					<td><button class="btn btn-danger" type="button" onclick="getThisExam(this)" 
					data-toggle="modal" data-target="#DeleteExam">Delete</button></td>
				</tr>
			<% } %>
			</tbody>
		</table>
		<center><button class="btn btn-primary" type="submit">Save</button></center>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
</div>
<!-- Modal delete -->
<div id="DeleteExam" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Do you want to delete it?</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal" method="post" action="deleteExamByLecture">
  			<div class="form-group">
    			<label class="control-label col-sm-2">ID Exam:</label>
    			<div class="col-sm-5">
      				<input type="text" class="form-control" id="idDeThiForDelete" readonly name="idExam" value="">
    			</div>
  			</div>
  			<center><button type="submit" class="btn btn-default">OK</button></center>
  			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        </form>
      </div>
    </div>
  </div>
</div>