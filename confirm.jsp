<%@ page import="java.io.*" %>
<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.UUID" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<title>E-Shopping</title>

</head>

<body>
       
<div id="container">
<!--<div id="content">-->
<br>
<div id="content_top"></div>
<div id="content_main">

	
	<%
		
	String dear = request.getParameter("dear");
	String oid = request.getParameter("oid");
	String odt = request.getParameter("odt");

	out.print("<h2 style='font-family:arial; font-size:19px; color:red';>Hi, "+dear+"</h2>");
	out.print("<br><h3 style='font-family:arial; font-size:15px; color:black';>Your order <label style='font-family:arial; font-size:15px; color:blue';>(ID:"+oid+")</label> has been placed successfully on <label style='font-family:arial; font-size:15px; color:blue';>Date:"+odt+"</label></h3>");
	out.print("<br><h3 style='font-family:arial; font-size:15px; color:black';>Your product will be delivered to you within 5 working days</h3>");
	out.print("<br><br><label style='font-family:arial; font-size:20px; color:magenta';>.....Great Shopping.....</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='index.html'>Go to Home</a>");
	%>
</div>
<div id="content_bottom"></div>
<!--</div>-->
</div>

</body>
</html>
