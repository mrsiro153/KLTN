<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="student.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="student/student1.css">
<script type="text/javascript" src="timer1.js"></script>
<script type="text/javascript" src="timer2.js"></script>
<!-- <script type="text/javascript" src="student/student.js"></script> -->
<!---->
<div class="exam_content" id="mainExam"><!--quizzes 'll show here-->
	<button style="margin-left: 20px;" class="btn btn-warning" onclick="window.open('student/showScore.jsp')">Show Score</button>
	<div class="subject">
		<div class="detailsinfor">
			<h2 id="details">
			</h2>
		</div>
		<table class="table table-hover">
			<thead>
				<tr class="info">
					<th>Subject</th>
					<th>Code exam</th>
					<th>Numbers</th>
					<th>Time (seconds)</th>
					<th>Date</th>
					<th>Tool</th>					
				</tr>
			</thead>
			<tbody>
				<%
				GetExam ge=new GetExam();
				ResultSet rs=ge.getAllExam();
				if(rs==null){
					//nothing
				}else{
					do{
						if(rs.getString(4)==null||rs.getString(5)==null){
							continue;
							//rejest all exams with null date and time
						}
						Date date = new Date();//today Date type
						DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");				        
				        Date dateInDatabase=sdf.parse(rs.getString(4)+" "+rs.getString(5));//convert date form database
				        //
				        if(!date.after(dateInDatabase)){//check date time
				        	//if date after dateindatabse true
				        	//! mean : fasle!
				        	continue;
				        }
				        //now check in database, if Student have done it, can't start it again!!!
				        int result=ge.CheckStudent_Exam(session.getAttribute("user").toString(),rs.getString("idDeThi"));
				        if(result==1){//ton tai trong database
				        	continue;
				        //khong cho lam
				        }
				%>
				<tr class="info1">
					<td><%=rs.getString("TenMonHoc") %></td>
					<td><%=rs.getString("idDeThi") %></td>
					<td><%=rs.getString("SoCauHoi") %></td>
					<td><%int x = Integer.parseInt(rs.getString("ThoiLuong"));
							out.print(x);%></td>
					<td><%=rs.getString(4)+"\""+rs.getString(5) %></td>
					<td>
						<button class="btn btn-primary" onclick="load_exam(this)">Start</button>
						<button class="btn btn-info" onclick="getDetails(this)">details</button>
					</td>
				<%		
					}while(rs.next());
				}
				%>
			</tbody>
		</table>
	</div>
</div>
<div class="nofitication">
	<h2 style="display:inline;">Hello: <%=session.getAttribute("name") %></h2>
	<center><img src="http://img.v3.news.zdn.vn/w660/Uploaded/qjyyf/2014_01_19/558090_1401888076721499_86365383_n_1.jpg" class="img-circle" width="200" height="200"></center>
</div>
<!---->