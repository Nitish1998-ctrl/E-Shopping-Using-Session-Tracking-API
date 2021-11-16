<%@ page import="java.io.*" %>
<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.UUID" %>
<%@ page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-Shopping</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="style.css" />
<div id="container">




<div id="header">
        	<img src="images/iccn.png" width="105" height="70"></img>
		<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		E-Shopping<span class="off" style="font-size:25px;"> Your gateway to great shopping</span></h1>
		</div>





<div id="menu">
<ul>
	<li class="menuitem"><a href="settings.jsp">Settings</a></li>
    <li class="menuitem"><a href="editprofile.jsp">Profile</a></li>
    <li class="menuitem"><a href="bill.jsp">Bill</a></li>
    <li class="menuitem"><a href="logout.jsp">Logout</a></li>
    </div>





















&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<div id="content_top"> </div>
	<div id="content_main">
	<div>
<%	Vector<String> vec = (Vector)session.getAttribute("vect");
	if(vec.isEmpty()!=true)
	{		
	String uid = UUID.randomUUID().toString();
		uid = uid.substring(0,7);
try
	{
		String dear = (String)session.getAttribute("logn");
	
		Connection con = dao.createconnection();
		PreparedStatement ps=null,ps1=null;		
		ResultSet rs=null,rs1=null;
		String mobs="";
		String login_id="";

		ps1 = con.prepareStatement("select * from rangoli_signup where login_name=?");
		ps1.setString(1,dear);
		rs1 = ps1.executeQuery();	
 		rs1.next();
		
		
		out.print("<br>");
		out.print("<table border='1'>");
		out.print("<tr><th width='30'></th><th style='font-family:arial; font-size:13px; color:green;' width='40'>&nbsp;S.No</th><th style='font-family:arial; font-size:13px; color:green;' width='250'>&nbsp;Product Name</th><th style='font-family:arial; font-size:13px; color:green;' width='30'>&nbsp;Qty</th><th style='font-family:arial; font-size:13px; color:green;' width='60'>&nbsp;Price</th></tr>");
		int i=0;
		
	
		double price=0;
		for(String id : vec)
		{
			i++;
			ps = con.prepareStatement("select * from rangoli_product where product_id=?");
			ps.setString(1,id);
			rs = ps.executeQuery();
			
			if(rs.next())	
			{	
				price = Double.parseDouble(rs.getString("price"));
			

				out.print("<tr>");
out.print("<td>&nbsp;&nbsp;<a href='removecart.jsp?pid="+rs.getString("product_id")+"'><img src='images/cross.png'></img></a></td><td style='font-family:arial; font-size:12px; color:magenta'><b>&nbsp;"+i+"</td><td style='font-family:arial; font-size:12px; color:blue;'>&nbsp;<b>"+rs.getString("product_name")+"</b></td><td style='font-family:arial; font-size:12px; color:blue;'><b>&nbsp;1</b></td><td style='font-family:arial; font-size:12px; color:blue;'>&nbsp;<b>"+rs.getString("price"));
				out.print("</tr>");
			}
		}
	//	out.print("<tr><td colspan='3'></td><td></td><td></td><td></td><td></td><td></td><td></td><td><br><br><br></td></tr>");
	out.print("<tr>");
	out.print("<td colspan='2' style=text-align:center><a href='searchproduct.jsp'>Back</a></td>");
			out.print("<td colspan='3' style=text-align:center> <a href='bill.jsp?cat="+rs.getString("category_name")+"&cmp="+rs.getString("company_name")+"&pro="+rs.getString("product_id")+"'> Buy Now </a></td>");
			out.print("</tr>");
			
	out.print("</table>");
				
		con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	}
	
	else
	{
		out.print("<h3>There is no item in your Cart!!!!!!!!!!</h3>");
		out.print("<br><h4><a href='searchproduct.jsp'>Add To Cart</a></h4>");
		
	}
 %>
 </div> </div>
<div id="content_bottom"></div>

</body>
</html>