<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<p style="color: red">file too large, please submit another file 
<%
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss");
out.print(sdf.format(new Date())); %>
</p>