<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="career.connection.dao" %>

<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>E-Shopping</title>
</head>

<body>
<div id="container">

	<%
		String un = (String)session.getAttribute("logn");
		if(un==null)
		{
		response.sendRedirect("signin.jsp");
		}
	%>

	<div id="header">
        		<img src="images/iccn.png" width="105" height="70"></img>
		<h1 color:#ff0000;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		E-Shopping<span class="off" style="font-size:25px; color:#ff0000;"> Your gateway to great shopping</span></h1>
	<%
		File fe = new File(getServletContext().getRealPath("/")+"/photos/");
		String str[] = fe.list();
		for(int i=0 ; i<str.length ; i++)
		{
			String fn = str[i].substring(0,str[i].indexOf("."));
			
			if(fn.equals(un))
			{
			out.print("<h2>Hi, "+un+" <img src='photos/"+str[i]+"' width='40' height='40'></img> </h2>");
			break;
			}	
			else
			{
			out.print("<h2>Hi, "+un+" <img src='photos/default.png' width='40' height='40'></img> </h2>");
			}
		}
		Integer cart = (Integer)session.getAttribute("cart");
	%>
	</div> 
      
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="settings.jsp">Settings</a></li>
                <li class="menuitem"><a href="editprofile.jsp">Profile</a></li>
                <li class="menuitem"><a href="bill.jsp">Bill</a></li>
                <li class="menuitem"><a href="logout.jsp">Logout</a></li>
		<li class="menuitem"><a href="#">Items in Cart ( <%=cart%> )</a></li>
		</ul>
        </div>
        
        <div id="leftmenu">

        	<div id="leftmenu_top"></div>
		<div id="leftmenu_main"> 
			<h3>Links</h3>   
	        	<ul>
			<li><a href='searchitem.jsp'>Search Item</a></li>
			</ul>
		</div>
        	<div id="leftmenu_bottom"></div>
        </div>
        
	<div id="content">
        	<!--<div id="content_top"></div>
        	<div id="content_main">-->

		<%
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   		//get current date time with Date()
	   		Date date = new Date();
	   		String offerdate = ""+dateFormat.format(date);
			try
			{
				int i=0;
				int s=1;
				String str1[]={"solid white","solid yellow","solid magenta","solid green","solid darkred"};
			
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from rangoli_offer where offer_date=?");
				ps.setString(1,offerdate);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					out.print("<center>");
					out.print("<div style='width: 550px;padding: 5px;border: 25px "+str1[i]+";margin: 30px; box-shadow: 10px 10px 5px 0px rgba(0,0,0,0.75); border-radius: 40px 40px 40px 40px; background: linear-gradient(to right, rgba(243,226,199,1) 0%, rgba(193,158,103,1) 0%, rgba(233,212,179,1) 100%);'>");
					out.print("<h3 style='color:black;font-family:arial;font-size:150%;'>Offer ID : " +rs.getString("offer_id")+"</h3>");
					out.print("<h2 style='color:green;font-family:arial;font-size:200%;'>"+rs.getString("category").toUpperCase()+"</h2>");
					out.print("<h3 style='color:blue;font-family:arial;font-size:150%;'>Get Discount : "+rs.getString("discount")+"% Off<h3>");
					out.print("<h2 style='color:brown;font-family:arial;font-size:200%;'>"+rs.getString("description")+"<h3>");
					out.print("</div>");	
					out.print("</center>");
					s++;
					i++;	
				}
				con.close();
			}
			catch(Exception e)
			{
			}
		%>
		<!--</div>
		<div id="content_bottom"></div>
		<div id="footer"></div>-->
      	</div>

</div>
</body>
</html>
