<%@page import="doan.quizzOnline.model.UserDAO"%>
<%@page import="doan.quizzOnline.model.User_DeThi"%>
<%@page import="doan.quizzOnline.model.User_DeThiDAO"%>
<%@page import="doan.quizzOnline.model.DeThi"%>
<%@page import="java.util.List"%>
<%@page import="doan.quizzOnline.model.MonHocDAO"%>
<%@page import="doan.quizzOnline.model.DeThiDAO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
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

@Autowired
User_DeThiDAO user_DeThiDAO;

@Autowired
UserDAO userDAO;
%>
    
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
				List<DeThi> dethis = deThiDAO.findAll(); 
				if(!dethis.isEmpty()){
					for(DeThi d : dethis){
						//if NgayMoDeThi or GioMoDeThi = null, don't print anything
						if(d.getGioMoDeThi()==null||d.getNgayMoDeThi()==null||d.getStatus()!=0) continue;
						Date date = new Date();
						DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						Date dateInDatabase = sdf.parse(d.getNgayMoDeThi()+" "+d.getGioMoDeThi());
						if(!date.after(dateInDatabase)){//check date time
				        	//if date after dateindatabse true
				        	//! mean : fasle!
				        	continue;
				        }
						//now check in database, if Student have done it, can't start it again!!!
						User_DeThi currentUser_Dethi = user_DeThiDAO.findBymaSinhVienAndMaDeThi(userDAO.findById(session.getAttribute("user").toString()), d);
						if(currentUser_Dethi!=null){
							continue;
						}
						//pass validation, print exam
						%>
						<tr class="info1">
							<td><%=monHocDAO.findByidMonHoc(d.getMaMonHoc()).getTenMonHoc() %></td>
							<td><%=d.getIdDeThi() %></td>
							<td><%=d.getSoCauHoi() %></td>
							<td><%int x = Integer.parseInt(d.getThoiLuong());
							out.print(x);%></td>
							<td><%=d.getNgayMoDeThi()+"\""+d.getGioMoDeThi() %></td>
							<td>
						<button class="btn btn-primary" onclick="load_exam(this)">Start</button>
						<!-- <button class="btn btn-info" onclick="getDetails(this)">details</button>-->
					</td>
						<%
					}
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