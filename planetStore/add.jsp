<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost/?serverTimezone=UTC";
Connection con = DriverManager.getConnection(url,"root","1234");
String sql="USE `Project`";
con.createStatement().execute(sql);
String pType = request.getParameter("type");
String pNumber = request.getParameter("number");
String memID = (String)session.getAttribute("id");
String content = "";
String pID = "";
String pName = "";
int stars = 0;
int counts = 0;
boolean login = true;

if( memID == null || memID.equals("") ) {
	response.sendRedirect("product.jsp?type="+ pType +"&number="+ pNumber +"&error=2");
	login = false;
} // if
else {
	Random ran = new Random();
	stars = ran.nextInt(5)+1;
	content = request.getParameter("myComment");
	java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
	sql = "SELECT * FROM `product` WHERE `type` ='"+ pType +"' AND `number` = '" + pNumber +"'";
	ResultSet rs = con.createStatement().executeQuery(sql);
	if( rs.next() ) {
		pID = rs.getString(1);
		pName = rs.getString(2);
	} // if
	
	sql = "SELECT * FROM `message`";
	rs = con.createStatement().executeQuery(sql);
	rs.last();
	counts = rs.getRow();
	sql = "INSERT `message` VALUES('"+memID+"','"+ stars +"','"+ content +"','" + new_date + "','"+ pID +"','"+ pName +"','" + (counts+1) + "')";
	con.createStatement().execute(sql);
}


con.close();
if( login )
	response.sendRedirect("product.jsp?type="+ pType +"&number="+ pNumber);
%>