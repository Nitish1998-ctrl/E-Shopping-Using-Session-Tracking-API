<%@ page import="java.io.*" %>

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
			
		%>

		</div>
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
