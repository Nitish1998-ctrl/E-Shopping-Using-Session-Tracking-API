<%@ page import="java.io.*" %>
<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

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
	%>
	</div> 
      
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="adminsettings.jsp">Settings</a></li>
                <li class="menuitem"><a href="offer.jsp">Today's Offer</a></li>
            	<li class="menuitem"><a href="logout.jsp">Logout</a></li>
            	</ul>
        </div>
        
        <div id="leftmenu">

        	<div id="leftmenu_top"></div>
		<div id="leftmenu_main">    
	        	<h3>Links</h3>
             		<ul>
                	    <li><a href="addcategory.jsp">Add Category</a></li>
                	    <li><a href="addcompany.jsp">Add Company</a></li>
                	    <li><a href="addproduct.jsp">Add Product</a></li>
                	    <li><a href="editcategory.jsp">Edit Category</a></li>
                	    <li><a href="editcompany.jsp">Edit Company</a></li>
                	    <li><a href="editproduct.jsp">Edit Product</a></li>
                	    </ul>
		</div>
        	<div id="leftmenu_bottom"></div>
        </div>
        
	<div id="content">
        	<div id="content_top"></div>
        	<div id="content_main">

		<h2>Categories</h2>
	
		<%
			try
			{
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from rangoli_category");
				ResultSet rs = ps.executeQuery();
				out.print("<table border='1'>");
				out.print("<th style='font-family:arial; font-size:15px; color:blue' width='80'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Edit</th><th style='font-family:arial; font-size:15px; color:blue' width='80'>&nbsp;&nbsp;&nbsp;Remove</th><th style='font-family:arial; font-size:15px; color:blue' width='150'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Category Name</th>");
				while(rs.next())
				{
					out.print("<tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='updatecategory.jsp?cid="+rs.getString("category_code")+"'><img src='images/pencil.png'></img></a></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='removecategory.jsp?cid="+rs.getString("category_name")+"'><img src='images/cross.png'></img></a></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>"+rs.getString("category_name")+"</td></tr>");
				} 	
				out.print("</table>");	
				con.close();
			}
			catch(Exception e)
			{
			}
		%>

		</div>
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
