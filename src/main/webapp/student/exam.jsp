<%@page import="doan.quizzOnline.model.DeThi"%>
<%@page import="doan.quizzOnline.model.DeThiDAO"%>
<%@page import="doan.quizzOnline.model.DeThi_CauHoiDAO"%>
<%@page import="doan.quizzOnline.model.DeThi_CauHoi"%>
<%@page import="doan.quizzOnline.model.TemporaryDAO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@page import="doan.quizzOnline.model.Temporary"%>
<%@page import="java.util.List"%>
<%@page import="doan.quizzOnline.DTO.Quizz"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%!
public void jspInit() 
{
    SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,getServletContext());
}
@Autowired
TemporaryDAO temporaryDAO;

@Autowired
DeThi_CauHoiDAO deThi_CauHoiDAO;

@Autowired
DeThiDAO deThiDAO;
%>
    <%
    //get all quizzs form exam, store in arQuizz
    ArrayList<Quizz> arQuizz=new ArrayList<Quizz>();
    
    String idExam= request.getParameter("idexam");
    
  	//check if the user has do it before
    ArrayList<Quizz> arQuizzbefore = new ArrayList<Quizz>();
  	List<Temporary> continueExam = temporaryDAO.findByIduserAndIdexam((String)session.getAttribute("user"), Integer.parseInt(idExam));
   	/*
   	main mission is set time and table outine, don't care the others
   	*/
   	String timeRe="";
   	if(continueExam==null||continueExam.isEmpty()){
   		System.out.print("ko co gia tri cho continue exam \n");
   	}else{   		
   		timeRe=continueExam.get(0).getTimeRe();
   		//System.out.print(timeRe);
   		for(Temporary t: continueExam){
   			arQuizzbefore.add(new Quizz(t.getIdQuizz()+"",t.getYourAns()));
   		}
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
    List<DeThi_CauHoi> dethi_cauhois= deThi_CauHoiDAO.findByMaDeThi(deThiDAO.findByidDeThi(Integer.parseInt(idExam)));
    if(dethi_cauhois!=null){
    	out.println("<p style='display:none;' id='idSinhVien'>"+session.getAttribute("user")+"</p>");
    	out.println("<p style='display:none;' id='idDeThi'>"+idExam+"</p>");
    	for(DeThi_CauHoi d: dethi_cauhois){
    		String id,content,trueRs,ARs,BRs,CRs,DRs;
    		id=d.getMaCauHoi().getIdCauHoi()+"";
    		content=d.getMaCauHoi().getNoiDungCauHoi();
    		trueRs=d.getMaCauHoi().getDapAnDung();
    		ARs=d.getMaCauHoi().getChiTietCauHoi().getDapAnA();
    		BRs=d.getMaCauHoi().getChiTietCauHoi().getDapAnB();
    		CRs=d.getMaCauHoi().getChiTietCauHoi().getDapAnC();
    		DRs=d.getMaCauHoi().getChiTietCauHoi().getDapAnD();
    		arQuizz.add(new Quizz(id,content,trueRs,ARs,BRs,CRs,DRs));
    	}
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
				<center><button onclick="confirmToCheckAnswer()" class="btn btn-default">SUBMIT</button></center>
			</div>
			<div class="modal-footer">
			</div>
			<!--content modal-->
		</div>
	</div>
</div>
<!--end out line-->