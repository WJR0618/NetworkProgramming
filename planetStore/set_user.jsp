<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" import="java.sql.*,java.lang.Math,java.sql.Date"%>
<%@include file="config.jsp"%>

<%
	String new_memName = request.getParameter("name");
	String new_phone = request.getParameter("phone");
	// String new_birthday = request.getParameter("birthday");
	Date new_birthday = Date.valueOf(request.getParameter("birthday"));
	String new_nickname = request.getParameter("nickname");
	String new_pwd = request.getParameter("pwd");
	String new_email = request.getParameter("email");
	String new_sex = request.getParameter("sex");
	
	String memID = (String)session.getAttribute("id");
	out.print("<br>" + new_birthday + "<br>");
	
	sql = "UPDATE `members` SET `pwd` = '"+new_pwd+"',`name` = '"+new_memName+"', `email` ='"+ new_email +"', `sex` = '";
	if( new_sex.equals("boy") ) {
		sql+= "男";
	} // if
	else {
		sql+= "女";
	} // else
	sql+= "', `birthday`='"+ new_birthday + "', `phone`='"+ new_phone +"',`nickname`='"+ new_nickname +"' WHERE `id` ='"+ memID +"'";
	
	//"', `birthday`='"+ new_birthday +
	out.print(sql);
	out.print(request.getParameter("nickname"));
	con.createStatement().execute(sql);
	con.close();
	response.sendRedirect("member.jsp");
%>