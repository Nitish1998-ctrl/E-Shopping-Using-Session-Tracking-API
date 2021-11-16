<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="career.connection.*" %>
<%@page	import="java.util.Properties"%>
<%@page	import="java.util.Random"%>
<%@page	import="javax.mail.Message"%>
<%@page	import="javax.mail.MessagingException"%>
<%@page	import="javax.mail.Session"%>
<%@page	import="javax.mail.Transport"%>
<%@page	import="javax.mail.internet.AddressException"%>
<%@page	import="javax.mail.internet.InternetAddress"%>
<%@page	import="javax.mail.internet.MimeMessage"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="register.jsp" method="post" onsubmit="return checkForm(this)">
Enter Otp Here: <input type="text">
<input type="submit" Value="Submit O.T.P.">

</body>
</html>