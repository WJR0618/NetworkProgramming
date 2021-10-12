<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>


<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	if( id != null && pwd != null ) {
		sql = "SELECT * FROM `members` WHERE `id` = '" + id + "'"
			+ "AND `pwd` ='" + pwd + "'";
	} // if
	ResultSet rs = con.createStatement().executeQuery(sql);
	
	if( rs.next() ) {
		session.setAttribute("id", id);
		con.close();
		response.sendRedirect("index.jsp");
	} // if
	else {
		con.close();
		response.sendRedirect("index.jsp?error=1");
	} // else


%>