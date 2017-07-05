<%@page import="doan.quizzOnline.service.UserService"%>
<%@page import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="doan.quizzOnline.model.*"%>
<%@ page import="java.sql.*"%>
<%!
public void jspInit() 
{
    SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,getServletContext());
}
@Autowired
UserService userService;
%>
<div class="tablecontain">
	<script>
		function editUser() {
			alert("fdsfs"); 
		}
	</script>
	<form style="margin-top: 15px; margin-left: 10px;" enctype="multipart/form-data" method="post" action="addNewUserByFile" id="fromAddUserFromFile">
      	<p>Add users from file upload: <span id="responseAddFromFile" style="color:blue;"></span></p> <input type="file" name="file">
      	<button type="button" style="margin-top: 5px;" class="btn btn-default" onclick="submitUserFromFile()">Ok</button>
      	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	<table class="table table-hover" id="mytable1" style="margin-top: 15px;">
		<thead>
			<tr class="info">
				<th>Name role</th>
				<th>ID user</th>
				<th>Name</th>
				<th>Date of birth</th>
				<th>Sex</th>
				<th>Address</th>
				<th>phone number</th>
				<th>class</th>
				<th>Tool</th>
			</tr>
		</thead>
		<tbody>
			<%
			
				for(User rs: userService.getAllUsers()) {
			%>
			<tr>
				<td><%=rs.getQuyen().getTenQuyen() %></td>
				<td><%=rs.getId()%></td>
				<td><%=rs.getHoTen()%></td>
				<td><%=rs.getNgaySinh()%></td>
				<td><%=rs.getGioiTinh()%></td>
				<td><%=rs.getDiaChi()%></td>
				<td><%=rs.getsDT()%></td>
				<td><%=rs.getLop() %></td>
				<td>
					<button class="btn btn-info" data-toggle="modal"
						data-target="#ModalEdit" onclick="editUser(this)">Edit</button>
					<button class="btn btn-danger" data-toggle="modal"
						data-target="#ModalDelete" onclick="deleteUser(this)">Delete</button>
				</td>
				<%
					}
						
					
				%>
			</tr>
		</tbody>
	</table>
	<button class="btn btn-primary btn-lg"
		style="position: relative; left: 90%" data-toggle="modal"
		data-target="#ModalAdd">Add</button>
</div>
<!-- Pop up edit user -->
<div class="modal fade" id="ModalEdit" role="dialog">
	<div class="modal-dialog modal-md">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Details Information</h4>
			</div>
			<form action="editUser" method="post">
			<div class="modal-body">
				<!---->
				<div>
				
					<label>Role</label> 
					<input class="form-control" id="edtRole" type="text" value="admin" name="role" readonly>
					<label>ID user</label> 
					<input class="form-control" id="edtId" type="text" value="dsdsdsdsd" name="id" readonly>
					<label>Password</label>
					<input class="form-control" id="edtPa" type="text" value="dsdsdsdsd" name="pa" placeholder="new Password" >
					<label>Name</label>
					<input class="form-control" id="edtName" type="text" value="Nguyễn Nam" name="name" required> 
					<label>Date of birth</label> 
					<input class="form-control" id="edtDob" type="text" value="25/10/2016" name="dob" required> 
					<label>Sex</label>
					<input class="form-control" id="edtSex" type="text" value="25/10/2016" name="sex" required>
					<label>Address</label>
					<input class="form-control" id="edtAddress" type="text" value="25/10/2016" name="address" required>
					<label>Phone number</label>
					<input class="form-control" id="edtPho" type="text" value="25/10/2016" name="phone" required>
		
				</div>
				<!---->
			</div>
			<div class="modal-footer">
				<center><button type="submit" class="btn btn-default">Save</button></center>
			</div>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</form>
			<!--content modal-->
		</div>
	</div>
</div>
<!--End Pop up-->

<!-- Pop up AddUser -->
<div class="modal fade" id="ModalAdd" role="dialog">
	<div class="modal-dialog modal-md">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Add new User</h4>
			</div>
			<div class="modal-body">
				<!---->
				<form action="addnewuser" method="post">
					<select name="pre">
						<option value="1">Admin</option>
						<option value="2">Student</option>
						<option value="3">Lecture</option>
						<option value="4">Exam Manager</option>
						<option value="5">Bank Manager</option>
					</select>
					<div>
						<label>ID user</label> <input class="form-control"
							id="inputdefault" type="text" name="id" required> <label>Password</label>
						<input class="form-control" id="inputdefault" type="text"
							name="pa" required> <label>Name</label> <input
							class="form-control" id="inputdefault" type="text" name="name" required>
						<label>Date of birth</label> <input class="form-control"
							id="inputdefault" type="date" name="dob"> <label>Sex</label>
						<input class="form-control" id="inputdefault" type="text"
							name="sex" required> <label>Address</label> <input
							class="form-control" id="inputdefault" type="text" name="address">
						<label>Phonenumber</label> <input class="form-control"
							id="inputdefault" type="text" name="phone" required>
						<label>Class</label> <input class="form-control"
							id="inputdefault" type="text" name="classStudent" placeholder="Class of Student, ONLY use with student " >	
					</div>
					<center>
						<button type="submit" style="margin-top: 20px" class="btn btn-default">Save</button>
					</center>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				<!---->
			</div>
			<!--content modal-->
		</div>
	</div>
</div>
<!--End Pop up-->
<br>
<!-- model delete -->
<div class="modal fade" id="ModalDelete" role="dialog">
	<div class="modal-dialog modal-md">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Delete User</h4>
			</div>
			<div class="modal-body">
				<!---->
				<form action="deleteuser" method="post">
					<h3>Do you truly want to delete it? </h3>
					<label>ID user</label>
					<input type="text" id="delId" class="form-control" name="id" readonly>
					<label>Role</label>
					<input type="text" id="delRole" class="form-control" name="role" readonly>
					<center>
						<button type="submit" style="margin-top: 20px" class="btn btn-primary">OK</button>
					</center>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				<!---->
			</div>
			<!--content modal-->
		</div>
	</div>
</div>
