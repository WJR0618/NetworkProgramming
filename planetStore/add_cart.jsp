<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>

<%

String memID = (String)session.getAttribute("id");
String pType = request.getParameter("type");
String pNumber = request.getParameter("number");
boolean login = true;
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con = DriverManager.getConnection(url,"root","1234");
String sql="USE `Project`";
int counts = 0;
con.createStatement().execute(sql);

if( memID == null || memID.equals("") ) {
	response.sendRedirect("product.jsp?type="+ pType +"&number="+ pNumber +"&error=2");
	login = false;
} // if
else {
	sql = "SELECT * FROM `product` WHERE `type` ='"+ pType +"' AND `number` = '" + pNumber +"'";
	ResultSet rs = con.createStatement().executeQuery(sql);
	if( rs.next() ) {
		sql = "SELECT * FROM `carts`";
		ResultSet rs1 = con.createStatement().executeQuery(sql);
		rs1.last();
		counts = rs1.getRow();
		sql = "INSERT `carts` VALUES( '" + (counts+1) +"','"+ memID +"','"+ rs.getString(1) +"')";
		con.createStatement().execute(sql);
	} // if
} // else

if( login ) {
	response.sendRedirect("product.jsp?type="+ pType +"&number="+ pNumber);
} // if

con.close();
%>