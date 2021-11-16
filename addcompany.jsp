<%@ page import="java.io.*" %>
<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>E-Shopping</title>

	<script>
		var request;  

		function sendInfo()  
		{ 
			var category = document.myform.category.value;  
			var cc = document.myform.cc.value;  
			var cn = document.myform.cn.value;  
			var cd = document.myform.cd.value;  

			if(document.myform.cn.value == "")
			{
      				alert("Error: Company Name can't leave empty");
      				document.myform.cn.focus();
      				return false;
    			}
			else if(document.myform.cc.value == "")
			{
      				alert("Error: Company Code can't leave empty");
      				document.myform.cc.focus();
      				return false;
    			}
			else if(document.myform.cd.value == "")
			{
      				alert("Error: Company Description can't leave empty");
      				document.myform.cd.focus();
      				return false;
    			}
			else
			{	
				var url = "savecompany.jsp?category="+category+"&cn="+cn+"&cc="+cc+"&cd="+cd;  
  
				if(window.XMLHttpRequest)
				{  
					request = new XMLHttpRequest();  
				}  
				else if(window.ActiveXObject)
				{ 	 	
					request = new ActiveXObject("Microsoft.XMLHTTP");  
				}  
  
				try  
				{  
				request.onreadystatechange = getInfo;  
				request.open("GET",url,true);  
				request.send();  
				}  
				catch(e)  
				{  
				alert("Unable to connect to server");  
				}  
			}  
		}
  
		function getInfo()
		{  
			if(request.readyState==4)
			{  
				var val=request.responseText;  
				document.getElementById('amit1').innerHTML=val;  
			}  
		}  

	</script>


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

		<h2>Add New Company</h2>		
		<br>
		<form name="myform">
			<table>
				<tr>
					<td>Select Category</td>
					<td>
					<select name="category" style="cursor: pointer; width: 161px; height: 23px;">
					<%
						try
						{
							Connection con = dao.createconnection();
							PreparedStatement ps = con.prepareStatement("select * from rangoli_category");
							ResultSet rs = ps.executeQuery();
							while(rs.next())
							{
								out.print("<option>"+rs.getString("category_name")+"</option>");
							} 	
							con.close();
						}
						catch(Exception e)
						{
						}
					%>
					</select>
					</td>
					<td></td>
				</tr>
				<tr><td>Company Name</td><td><input type="text" name="cn"></input></td><td></td></tr>
				<tr><td>Company Code</td><td><input type="text" name="cc"></input></td><td></td></tr>
				<tr><td>Company Description</td><td><textarea cols="40" rows="5" name="cd"></textarea></td><td></td></tr>
				<tr><td></td><td></td><td><br></td></tr>
				<tr><td></td><td><input type="button" value="Add Company" onclick="return sendInfo()"></input>&nbsp;&nbsp<input type="reset" value="Reset All"></input></td><td></td></tr>
				<tr><td></td><td><br></td></tr>
				<tr><td></td><td><span id="amit1"></span></td></tr>
			</table>
		</form>

		</div>
		
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
