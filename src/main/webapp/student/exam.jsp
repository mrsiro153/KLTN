<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="student.*"%>
<%@ page import="quizzs.*"%>
    <%
    GetExam ge=new GetExam();
    //get all quizzs form exam, store in arQuizz
    ArrayList<Quizz> arQuizz=new ArrayList<Quizz>();
    
    String idExam= request.getParameter("idexam");
    
  	//check if the user has do it before
    ArrayList<Quizz> arQuizzbefore = new ArrayList<Quizz>();
  	ResultSet rs1=null;
    rs1 = ge.OldResultOfExam((String)session.getAttribute("user"), idExam);
   	/*
   	main mission is set time and table outine, don't care the others
   	*/
   	String timeRe="";
   	if(!rs1.next()){
   		System.out.print("ko co gia tri");
   	}else{   		
   		timeRe=rs1.getString("timeRe");
   		//System.out.print(timeRe);
   		do{
   			//System.out.print(rs1.getString("yourAns")+"  "+rs1.getString("idQuizz"));
   			arQuizzbefore.add(new Quizz(rs1.getString("idQuizz"),rs1.getString("yourAns")));
   		}while(rs1.next());		
   	}
    //check....
    String time1= request.getParameter("time");
    //
    if(!timeRe.equals("")){
    	time1=timeRe;// reset timeout
    }
    //
    out.print("<p id='thoigianlambai' style='display:none;' >"+time1+"</p>");
    int timeMinute= Integer.parseInt(time1)/60;
    ResultSet rs= ge.getContentExam(idExam);//ma de thi
    if(rs!=null){
    	out.println("<p style='display:none;' id='idSinhVien'>"+session.getAttribute("user")+"</p>");
    	out.println("<p style='display:none;' id='idDeThi'>"+idExam+"</p>");
    	do{
    		String id,content,trueRs,ARs,BRs,CRs,DRs;
    		id=rs.getString(2);
    		content=rs.getString(4);
    		trueRs=rs.getString(5);
    		ARs=rs.getString(8);
    		BRs=rs.getString(9);
    		CRs=rs.getString(10);
    		DRs=rs.getString(11);
    		arQuizz.add(new Quizz(id,content,trueRs,ARs,BRs,CRs,DRs));
    	}while(rs.next());
    }
    //add to session
    request.getSession().setAttribute("listcauhoi", arQuizz);
    int i=0;
    %>
 
<h2><%=request.getParameter("nameExam")%></h2>
<p id="maxQuizzs" style="display:none"><%=arQuizz.size() %></p>
<h1 id="noDays"><%=timeMinute%> minutes</h1>
<button class="btn btn-primary" onclick="clickmeee()" id="btnstartnow">Start Quizz</button>
<div style="margin-left: 20px; background-color: rgba(144, 167, 182,0.5); border-radius:10px; height:400px; display:none;" id="contentQizzes">
	<h4>Quizz 1:<%=arQuizz.get(i).getNoiDung() %></h4>
	<p style="display:none;" id="currentQuizz"><%=i%></p>
	<input type="radio" name="kind" value="A" onclick="addToAnswersheet(this)"><%=arQuizz.get(i).getDapAnA() %>
	<br>
	<input type="radio" name="kind" value="B" onclick="addToAnswersheet(this)"><%=arQuizz.get(i).getDapAnB() %>
	<br>
	<input type="radio" name="kind" value="C" onclick="addToAnswersheet(this)"><%=arQuizz.get(i).getDapAnC() %>
	<br>
	<input type="radio" name="kind" value="D" onclick="addToAnswersheet(this)"><%=arQuizz.get(i).getDapAnD() %>
	<br>
</div>
<br>
<center id="btngroup" style="display:none;">
<div class="btn-group">
	<button type="button" class="btn btn-primary btn-lg" id="btnback" onclick="loadquizz(this)">Back</button>
	<button type="button" class="btn btn-primary btn-lg" id="btnnext" onclick="loadquizz(this)">Next</button>
	<button type="button" class="btn btn-success btn-lg" id="btnoutline" data-toggle="modal" data-target="#ModalOutline">Outline</button>
</div>
</center>
<!--popup outline-->
<div class="modal fade" id="ModalOutline" role="dialog">
	<div class="modal-dialog modal-md">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Your quizzes</h4>
			</div>
			<div class="modal-body">
				<!---->
				<table class="table table-hover" id="tableOutline">
					<thead>
						<tr class="info">
							<th>Number</th>
							<th>Content</th>
							<th>Your answer</th>
							<th style="display:none">fdd</th>
						</tr>
					</thead>
					<tbody>
					<%for(int j=0;j<arQuizz.size();j++){ %>
						<tr>
							<td><%=j+1%></td>
							<td><%=arQuizz.get(j).getNoiDung() %></td>
							<td><%
							if(arQuizzbefore.size()!=0){
								out.print(arQuizzbefore.get(j).getYourAnswer());
							}
							%></td>
							<td style="display:none"><%=arQuizz.get(j).getDapAnDung() %></td>
						</tr>
					<%} %>
					</tbody>
				</table>
				<!---->
				<center><button onclick="checkAnswer()" class="btn btn-default">SUBMIT</button></center>
			</div>
			<div class="modal-footer">
			</div>
			<!--content modal-->
		</div>
	</div>
</div>
<!--end out line-->