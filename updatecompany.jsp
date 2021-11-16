<%@ page import="java.io.*" %>
<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>E-Shopping</title>

	<script>
		function cat()
		{
			var cate = document.myform.cate.value;
			document.myform.ct.value = cate;
		}

		var request;  

		function sendInfo()  
		{ 
			var ct = document.myform.ct.value;  
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
				var url = "modifycompany.jsp?ct="+ct+"&cn="+cn+"&cc="+cc+"&cd="+cd;  
  
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

		<h2>Company Profile</h2>		
		<br>
		<%
			String catid = request.getParameter("catid");
			String cmpid = request.getParameter("cmpid");
			Connection con = null;
			PreparedStatement ps = null,ps1=null;
			ResultSet rs = null,rs1=null;
			try
			{
				con = dao.createconnection();
				ps = con.prepareStatement("select * from rangoli_company where category_name=? and company_name=?");
				ps1 = con.prepareStatement("select * from rangoli_category");
				ps.setString(1,catid);
				ps.setString(2,cmpid);
				rs = ps.executeQuery();
				rs.next();
				rs1 = ps1.executeQuery();
								
				out.print("<form name='myform'>");
				out.print("<table>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Category Name</td><td><input style='cursor: pointer; font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='ct' value='"+rs.getString("category_name")+"'></input></td>");
				out.print("<td><select name='cate' style='cursor: pointer; font-family:arial; font-size:15px; color:brown; padding-left: 5px;' onchange='cat()'>");
				out.print("<option selected='true' disabled='disabled'>---Select---</option>");
				while(rs1.next())
				{
				out.print("<option>"+rs1.getString("category_name")+"</option>");
				}
				out.print("</select></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Company Name</td><td><input style='cursor: pointer; font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='cn' value='"+rs.getString("company_name")+"'></input></td><td></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Company Code</td><td><input style='font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='cc' value='"+rs.getString("company_code")+"' title='can not modify' readonly></input></td><td></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Description</td><td><textarea style='cursor: pointer; font-family:arial; font-size:15px; color:brown; padding-left: 5px;' cols='23' rows='5' name='cd'>"+rs.getString("company_description")+"</textarea></td><td></td></tr>");
				out.print("<tr><td></td><td></td><td><br></td></tr>");
				out.print("<tr><td></td><td><input type='button' value='Update' onclick='return sendInfo()'></input></td><td></td></tr>");
				out.print("<tr><td></td><td><br></td></tr>");
				out.print("<tr><td></td><td><span id='amit1'></span></td></tr>");
				out.print("</table>");
				out.print("</form>");					

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
