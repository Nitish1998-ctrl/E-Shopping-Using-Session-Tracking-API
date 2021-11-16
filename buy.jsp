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
		
	String pid = request.getParameter("pro");
	String cat = request.getParameter("cat");
	String cmp = request.getParameter("cmp");

	String uid = UUID.randomUUID().toString();
	uid = uid.substring(0,7);

	DateFormat dateFormat = new SimpleDateFormat("dd/MMM/yyyy");
	Date date = new Date();
	String orderdate = ""+dateFormat.format(date);

		
	try
	{
		String dear = (String)session.getAttribute("logn");
	
		Connection con = dao.createconnection();
		PreparedStatement ps=null,ps1=null;		
		ResultSet rs=null,rs1=null;
		String mobs="";
		String login_id="";

		ps = con.prepareStatement("select * from rangoli_product where category_name=? and company_name=? and product_id=?");
		ps1 = con.prepareStatement("select * from rangoli_signup where login_name=?");
		ps.setString(1,cat);
		ps.setString(2,cmp);
		ps.setString(3,pid);
		ps1.setString(1,dear);
		rs = ps.executeQuery();
		rs1 = ps1.executeQuery();	
 		rs1.next();
		out.print("<h2 style='font-family:arial; font-size:17px; color:red';>Hi, "+dear+"</h2><hr>");
		out.print("<br><h3 style='font-family:arial; font-size:17px; color:blue';>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Retail / Invoice Bill</h3><br>");
		
		out.print("<b><label style='font-family:arial; font-size:14px; color:black';>Sold By : </label>Rangoli Retail Services Pvt. Ldt.<br>");
		out.print("<b><label style='font-family:arial; font-size:10px; color:black';>Address : 211/5 Nai Sarak, Shastri Nagar, Meerut (U.P)</label><br><br><hr>");

		out.print("<br><table style='font-family:arial; font-size:11px; color:black';>");
		out.print("<tr><td width='80'>&nbsp;Order ID</td><td>:</td><td width='100'>"+uid+"</td><td width='300'>&nbsp;Billing Address</td><td width='250' rowspan='2'>*Keep this invoice and manufacture box for warranty purpose</td></tr>");
		out.print("<tr><td width='80'>&nbsp;Order Date</td><td>:</td>	<td>"+orderdate+"</td> <td rowspan='4'><textarea rows='4' cols='25'>"+rs1.getString("address")+"</textarea></td> </tr>");
		out.print("<tr><td width='80'>&nbsp;Invoice Date</td><td>:</td>	<td>"+orderdate+"</td> <td></td></tr>");
		out.print("<tr><td width='80'>&nbsp;VAT/TIN</td><td>:</td>	<td>EIN:12-30456</td> <td></td></tr>");
		out.print("<tr><td width='80'>&nbsp;Service Tax</td><td>:</td>	<td>FSKAR072BB45</td> <td></td></tr>");
		out.print("<tr><td colspan='3'> <p>Please select your Payent Method:</p></td><td colspan='3'><input type='radio' name='pay'>Credit/Debit Card<input type='text' placeholder='Enter your card Details'><input type='text' placeholder='CVV'</td><td colspan='2'><input type='radio' name='pay'>BHIM UPI<input type='text' placeholder='amanokhdfc@ybl'></td><td colspan='2'><input type='radio' name='pay'>Cash ON Delivery</td></td></tr>");	
		
		out.print("</table>");
		
		out.print("<br>");

		if(rs.next())	
		{	
			double gstam = Double.parseDouble(rs.getString("price")) * Double.parseDouble(rs.getString("gst")) / 100;
			double totam = Double.parseDouble(rs.getString("price")) + gstam;;

			out.print("<table border='1'>");
			out.print("<tr><th style='font-family:arial; font-size:17px; color:green;' width='60'>&nbsp;S.No</th><th style='font-family:arial; font-size:17px; color:green;' width='400'>&nbsp;Product Name</th><th style='font-family:arial; font-size:17px; color:green;' width='100'>&nbsp;Quantity</th><th style='font-family:arial; font-size:17px; color:green;' width='100'>&nbsp;Price</th></tr>");
			
			out.print("<tr>");
			out.print("<td style='font-family:arial; font-size:15px; color:magenta'><b>&nbsp;1</td><td style='font-family:arial; font-size:15px; color:blue;'>&nbsp;<b>"+rs.getString("product_name")+"</b></td><td style='font-family:arial; font-size:15px; color:blue;'><b>&nbsp;1</b></td><td style='font-family:arial; font-size:15px; color:blue;'>&nbsp;<b>"+rs.getString("price")+"</b></td>");
			out.print("</tr>");
			
			out.print("<tr><td colspan='2'></td><td></td><td><br><br><br></td></tr>");
			
			out.print("<tr>	<td colspan='2'></td>	<td>&nbsp;<b>Total</td>	<td>&nbsp;<b>"+rs.getString("price")+"</td></tr>");
			out.print("<tr>	<td colspan='2'></td>	<td>&nbsp;<b>GST : &nbsp;"+rs.getString("gst")+" %</td>	<td>&nbsp;<b>"+gstam+"</td></tr>");
			out.print("<tr><td colspan='2' style='font-family:arial; font-size:11px; color:black';>*this is computer generated invoice</td><td>&nbsp;<b>Grand Total</td><td>&nbsp;<b>"+totam+"</td></tr>");
				
			out.print("</table>");

			out.print("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='confirm.jsp?dear="+dear+"&oid="+uid+"&odt="+orderdate+"'>Confirm</a>&nbsp;&nbsp;&nbsp;<a href='searchproduct.jsp?category="+cat+"&company="+cmp+"'>Cancel</a>");
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}

	%>
</div>
<div id="content_bottom"></div>
<!--</div>-->
</div>

</body>
</html>
