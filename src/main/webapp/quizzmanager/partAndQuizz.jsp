<%@page import="doan.quizzOnline.model.NoiDung"%>
<%@page import="java.util.List"%>
<%@page import="org.bouncycastle.jce.provider.JDKDSASigner.noneDSA"%>
<%@page import="doan.quizzOnline.model.NoiDungDAO"%>
<%@page import="doan.quizzOnline.model.MonHocDAO"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="doan.quizzOnline.service.QuizzBankManagerService"%>
<%@page import="org.springframework.web.context.support.SpringBeanAutowiringSupport"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%!
public void jspInit() 
{
    SpringBeanAutowiringSupport.processInjectionBasedOnServletContext(this,getServletContext());
}

@Autowired
NoiDungDAO noiDungDAO;

@Autowired
MonHocDAO monHocDAO;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String idMH= request.getParameter("idMonHoc");
	if(idMH==null){
		out.print("alert('Nothing here');");
		return;
	}
	List<NoiDung> rs = noiDungDAO.findByIdMonHoc(monHocDAO.findByidMonHoc(Integer.parseInt(idMH)));
	if(rs.isEmpty()){
		out.print("can't find data");
		return;
	}
%>
<p>Select part of subject:</p>
<select name="idPart" class="form-control">
	<% for(NoiDung n: rs){ %>
	<option value="<%=n.getIdNoiDung()%>"><%=n.getTenNoiDung()%></option>
	<%} %>
</select>
<div class="form-group" style="margin-top: 15px;">
      <label class="control-label col-sm-2">ID Quizz:</label>
      <div class="col-sm-10">          
        <input type="number" class="form-control" placeholder="Natural number" name="idQuizz" required>
      </div>
</div>
<div class="form-group">
      <label class="control-label col-sm-2">Content Quizz:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="contentQuizz" required>
      </div>
</div>
<div class="form-group">
      <label class="control-label col-sm-2">True answer:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="trueAnswer" placeholder="A B C or D" required>
      </div>
</div>
<div class="form-group">
      <label class="control-label col-sm-2">Select A</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="selectA" required>
      </div>
</div>
<div class="form-group">
      <label class="control-label col-sm-2">Select B</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="selectB" required>
      </div>
</div>
<div class="form-group">
      <label class="control-label col-sm-2">Select C</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="selectC" required>
      </div>
</div>
<div class="form-group">
      <label class="control-label col-sm-2">Select D</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" name="selectD" required>
      </div>
</div>
<center><button type="submit" class="btn btn-primary" style="margin-top: 10px; margin-bottom: 15px;">OK</button></center>