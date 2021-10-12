<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	if( id != null && pwd != null && email != null ) {
		sql = "SELECT * FROM `members` WHERE `id` = '" + id + "'";
	} // if
	ResultSet rs = con.createStatement().executeQuery(sql);
	
	if( rs.next() ) {
		
		con.close();
		out.print("此ID已經有人使用!!<a href='index.jsp'>按此</a>重新登入");
	} // if
	else {
		session.setAttribute("id", id);
		sql = "INSERT INTO `members`(`id`, `pwd`, `email`) VALUES ('"+ id +"','"+pwd+"','"+email+"')";
		con.createStatement().execute(sql);
		con.close();
		response.sendRedirect("member.jsp");
	} // else


%>
