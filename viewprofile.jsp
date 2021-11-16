<%@ page import="java.io.*" %>
<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

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
		
	String pid = request.getParameter("pid");
	String cat = request.getParameter("cat");
	String cmp = request.getParameter("cmp");
		
	DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date date = new Date();
	String offerdate = ""+dateFormat.format(date);
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps=null,ps1=null,ps2=null;		
		ResultSet rs=null,rs1=null;
		String mobs="";
		String login_id="";

		ps = con.prepareStatement("select * from rangoli_product where category_name=? and company_name=? and product_id=?");
		ps1 = con.prepareStatement("select * from rangoli_offer where category=? and offer_date=?");
		
		ps.setString(1,cat);
		ps.setString(2,cmp);
		ps.setString(3,pid);
		rs = ps.executeQuery();
		
		ps1.setString(1,cat);
		ps1.setString(2,offerdate);
		rs1 = ps1.executeQuery();

		if(rs.next())	
		{	
			File fe = new File(getServletContext().getRealPath("/") + File.separator + "product/"+cat+"/"+cmp+"/"); 
			String path = "product/"+cat+"/"+cmp+"/";
				
			out.print("<br>");
			out.print("<img src='"+path+pid+".jpg' width='100' height='100'></img>&nbsp;&nbsp;&nbsp;&nbsp;<a href='searchproduct.jsp'>Back</a>");
			out.print("<br><br><hr>");
		
			out.print("<table>");
		
			out.print("<tr>");
			out.print("<td style='font-family:arial; font-size:17px; color:magenta'><b>Category</td><td><b>:</td><td style='font-family:arial; font-size:15px; color:blue'>"+rs.getString("category_name").toUpperCase()+"</td>");
			out.print("</tr>");
		
			out.print("<tr>");
			out.print("<td style='font-family:arial; font-size:15px; color:black'><b>Comapny</td><td><b>:</td><td style='font-family:arial; font-size:15px; color:blue'>"+rs.getString("company_name").toUpperCase()+"</td>");
			out.print("</tr>");
		
			out.print("<tr>");
			out.print("<td style='font-family:arial; font-size:15px; color:black'><b>Product</td><td><b>:</td><td style='font-family:arial; font-size:15px; color:blue'>"+rs.getString("product_name").toUpperCase()+"</td>");
			out.print("</tr>");

			out.print("<tr></tr><tr></tr><tr></tr><tr></tr>");

			out.print("<tr>");
			out.print("<td style='font-family:arial; font-size:17px; color:magenta'><b>Price</td><td><b>:&nbsp;&nbsp;</td><td style='font-family:arial; font-size:15px; color:blue'>"+rs.getString("price")+"</td>");
			out.print("</tr>");

			out.print("<tr>");
			out.print("<td style='font-family:arial; font-size:15px; color:black'><b>GST</td><td><b>:&nbsp;&nbsp;</td><td style='font-family:arial; font-size:15px; color:blue'>"+rs.getString("gst")+" Percent</td>");
			out.print("</tr>");
		
			out.print("<tr>");
			out.print("<td style='font-family:arial; font-size:15px; color:black'><b>Mfg. Date</td><td><b>:&nbsp;&nbsp;</td><td style='font-family:arial; font-size:15px; color:blue'>"+rs.getString("mfg_date").toUpperCase()+"</td>");
			out.print("</tr>");

			out.print("<tr>");
			out.print("<td style='font-family:arial; font-size:15px; color:black'><b>Exp. Date</td><td><b>:&nbsp;&nbsp;</td><td style='font-family:arial; font-size:15px; color:blue'>"+rs.getString("exp_date").toUpperCase()+"</td>");
			out.print("</tr>");
		
			out.print("<tr>");
			out.print("<td style='font-family:arial; font-size:15px; color:black'><b>Description</td><td><b>:&nbsp;&nbsp;</td><td style='font-family:arial; font-size:15px; color:blue'>"+rs.getString("description").toUpperCase()+"</td>");
			out.print("</tr>");

			out.print("<tr></tr><tr></tr><tr></tr><tr></tr>");

			if(rs1.next())
			{
				ps2 = con.prepareStatement("update rangoli_product set offer=? where category_name=?");
				ps2.setString(1,rs1.getString("discount"));
				ps2.setString(2,cat);
				ps2.executeUpdate();
				out.print("<tr>");
				out.print("<td style='font-family:arial; font-size:17px; color:magenta'><b>Offer</td><td><b>:&nbsp;&nbsp;</td><td style='font-family:arial; font-size:15px; color:blue'>"+rs1.getString("discount").toUpperCase()+"</td>");
				out.print("</tr>");
			}
			else
			{
				out.print("<tr>");
				out.print("<td style='font-family:arial; font-size:17px; color:magenta'><b>Offer</td><td><b>:&nbsp;&nbsp;</td><td style='font-family:arial; font-size:15px; color:blue'>"+rs.getString("offer").toUpperCase()+"</td>");
				out.print("</tr>");
			}
			out.print("<tr>");
			out.print("<td style='font-family:arial; font-size:15px; color:black'><b>In Stock</td><td><b>:&nbsp;&nbsp;</td><td style='font-family:arial; font-size:15px; color:blue'>"+rs.getString("quantity").toUpperCase()+"</td>");
			out.print("</tr>");

			out.print("<tr></tr><tr></tr><tr></tr><tr></tr>");

			out.print("<tr>");
			out.print("<td></td><td></td><td style='font-family:arial; font-size:15px; color:blue;'><a href='cart.jsp?cat="+rs.getString("category_name")+"&cmp="+rs.getString("company_name")+"&pro="+rs.getString("product_id")+"'>Add to Cart</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href='buy2.jsp?cat="+rs.getString("category_name")+"&cmp="+rs.getString("company_name")+"&pro="+rs.getString("product_id")+"'>Buy Now</a></td>");
			out.print("</tr>");
		
			out.print("</table>");
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
