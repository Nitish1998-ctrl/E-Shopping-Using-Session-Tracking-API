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

	Vector<String> vec = (Vector)session.getAttribute("vect");
	if(vec.isEmpty()!=true)
	{		
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

		ps1 = con.prepareStatement("select * from rangoli_signup where login_name=?");
		ps1.setString(1,dear);
		rs1 = ps1.executeQuery();	
 		rs1.next();
		out.print("<h2 style='font-family:arial; font-size:17px; color:red';>Hi, "+dear+"</h2><hr>");
		out.print("<br><h3 style='font-family:arial; font-size:17px; color:blue';>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Retail / Invoice Bill</h3><br>");
		
		out.print("<b><label style='font-family:arial; font-size:14px; color:black';>Sold By : </label>Shukla  Retail Services Pvt. Ldt.<br>");
		out.print("<b><label style='font-family:arial; font-size:10px; color:black';>Address : Semra , Near B.B.D. Green City,Lucknow!(U.P)</label><br><br><hr>");

		out.print("<br><table style='font-family:arial; font-size:11px; color:black';>");
		out.print("<tr><td width='80'>&nbsp;Order ID</td><td>:</td><td width='100'>"+uid+"</td><td width='300'>&nbsp;Billing Address</td><td width='250' rowspan='2'>*Keep this invoice and manufacture box for warranty purpose</td></tr>");
		out.print("<tr><td width='80'>&nbsp;Order Date</td><td>:</td>	<td>"+orderdate+"</td> <td rowspan='4'><textarea rows='4' cols='25'>"+rs1.getString("address")+"</textarea></td> </tr>");
		out.print("<tr><td width='80'>&nbsp;Invoice Date</td><td>:</td>	<td>"+orderdate+"</td> <td></td></tr>");
		out.print("<tr><td width='80'>&nbsp;VAT/TIN</td><td>:</td>	<td>EIN:12-30456</td> <td></td></tr>");
		out.print("<tr><td width='80'>&nbsp;Service Tax</td><td>:</td>	<td>FSKAR072BB45</td> <td></td></tr>");
		out.print("</table>");
		
		out.print("<br>");
		out.print("<table border='1'>");
		out.print("<tr><th width='30'></th><th style='font-family:arial; font-size:13px; color:green;' width='40'>&nbsp;S.No</th><th style='font-family:arial; font-size:13px; color:green;' width='250'>&nbsp;Product Name</th><th style='font-family:arial; font-size:13px; color:green;' width='30'>&nbsp;Qty</th><th style='font-family:arial; font-size:13px; color:green;' width='60'>&nbsp;Price</th><th style='font-family:arial; font-size:13px; color:green;' width='60'>&nbsp;Dis(%)</th><th style='font-family:arial; font-size:13px; color:green;' width='60'>&nbsp;Price</th><th style='font-family:arial; font-size:13px; color:green;' width='60'>&nbsp;GST(%)</th><th style='font-family:arial; font-size:13px; color:green;' width='70'>&nbsp;Tax(Rs)</th><th style='font-family:arial; font-size:13px; color:green;' width='70'>&nbsp;Total</th></tr>");
		int i=0;
		double totam=0;	
		double gstam=0;
		double gtot=0;
		double dis=0;
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
				if(Double.parseDouble(rs.getString("offer"))!=0)
				{
					dis = price * Double.parseDouble(rs.getString("offer")) / 100;
					price = price - dis;
				}
				gstam = price * Double.parseDouble(rs.getString("gst")) / 100;
				totam = price + gstam;
				gtot = gtot + totam;

				out.print("<tr>");
out.print("<td>&nbsp;&nbsp;<a href='removecart.jsp?pid="+rs.getString("product_id")+"'><img src='images/cross.png'></img></a></td><td style='font-family:arial; font-size:12px; color:magenta'><b>&nbsp;"+i+"</td><td style='font-family:arial; font-size:12px; color:blue;'>&nbsp;<b>"+rs.getString("product_name")+"</b></td><td style='font-family:arial; font-size:12px; color:blue;'><b>&nbsp;1</b></td><td style='font-family:arial; font-size:12px; color:blue;'>&nbsp;<b>"+rs.getString("price")+"</td><td style='font-family:arial; font-size:12px; color:blue;'>&nbsp;<b>"+String.format("%.2f",Double.parseDouble(rs.getString("offer")))+"</td><td style='font-family:arial; font-size:12px; color:blue;'>&nbsp;<b>"+String.format("%.2f",price)+"</td><td style='font-family:arial; font-size:12px; color:blue;'>&nbsp;<b>"+String.format("%.2f",Double.parseDouble(rs.getString("gst")))+"</b></td><td style='font-family:arial; font-size:12px; color:blue;'>&nbsp;<b>"+String.format("%.2f",gstam)+"</b></td><td style='font-family:arial; font-size:12px; color:blue;'>&nbsp;<b>"+String.format("%.2f",totam)+"</b></td>");
				out.print("</tr>");
			}
		}
		out.print("<tr><td colspan='3'></td><td></td><td></td><td></td><td></td><td></td><td></td><td><br><br><br></td></tr>");
		out.print("<tr><td colspan='8' style='font-family:arial; font-size:11px; color:black';>*this is computer generated invoice</td><td style='font-family:arial; font-size:10px; color:black';>&nbsp;<b>Grand Total &nbsp;&nbsp;(Rounded)</td><td style='font-family:arial; font-size:14px; color:red';>&nbsp;<b>"+String.format("%.2f",gtot)+"</td></tr>");
		out.print("<tr><td colspan='3'> <p>Please select your Payent Method:</p></td><td colspan='3'><input type='radio' name='pay'>Credit/Debit Card<input type='text' placeholder='Enter your card Details'><input type='text' placeholder='CVV'><input class='inputCard' name='expiry' type='month' required/></td><td colspan='2'><input type='radio' name='pay'>BHIM UPI<input type='text' placeholder='amanokhdfc@ybl'></td><td colspan='2'><input type='radio' name='pay'>Cash ON Delivery</td></td></tr>");	
		
		out.print("</table>");
		out.print("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='confirm2.jsp?dear="+dear+"&oid="+uid+"&odt="+orderdate+"'>Confirm</a>&nbsp;&nbsp;&nbsp;<a href='cancel.jsp'>Cancel</a>&nbsp;&nbsp;&nbsp;<a href='searchproduct.jsp'>Add More Items</a>");
		con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
	}
	else
	{
		out.print("<h3>There is no item in your Cart</h3>");
		out.print("<br><h4><a href='searchproduct.jsp'>Back</a></h4>");
	}

	%>
</div>
<div id="content_bottom"></div>
<!--</div>-->
</div>

</body>
</html>
