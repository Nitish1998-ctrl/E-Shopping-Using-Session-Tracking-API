<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>E-Shopping</title>
</head>

<body>
<div id="container">

	<div id="header">
        	<img src="images/iccn.png" width="105" height="70"></img>
		<h1 color:#ff0000;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		E-Shopping<span class="off" style="font-size:25px; color:#ff0000;"> Your gateway to great shopping</span></h1>
	<%
		String un = (String)session.getAttribute("logn");
	
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
                <li class="menuitem"><a href="#">Items in Cart ( <%=cart%> )</a></li></ul>
       		</ul>
        </div>
        
        <div id="leftmenu">

        	<div id="leftmenu_top"></div>
		<div id="leftmenu_main">    
	        	<h3>Links</h3>
             		<ul>
                	    <li><a href="searchitem.jsp">Search Item</a></li>
                	</ul>
		</div>
        	<div id="leftmenu_bottom"></div>
        </div>
        
	<div id="content">
        	<div id="content_top"></div>
        	<div id="content_main">
			<h3>Profile</h3>
			
		<%
				String fn="",ln="",address="",mob="",email="";
				try
				{
					Connection con = dao.createconnection();
					PreparedStatement ps = con.prepareStatement("select * from rangoli_signup where login_name=?");
					ps.setString(1,un);
					ResultSet rs = ps.executeQuery();
					while(rs.next())
					{
						fn = rs.getString("first_name");	
						ln = rs.getString("last_name");	
						address = rs.getString("address");	
						mob = rs.getString("mobile");	
						email = rs.getString("current_email");	
					}
					con.close();
				}
				catch(Exception e)
				{
				}
			%>

			<table>
			<form action="updateprofile.jsp">
			<tr><td><b>Edit Profile</b></td><td></td></tr>
			<tr><td>First Name</td><td><input type="text" name="fn" value="<%=fn%>"></input></td></tr>
			<tr><td>Last Name</td><td><input type="text" name="ln" value="<%=ln%>"></input></td></tr>
			<tr><td>Postal Address</td><td><input type="text" name="address" value="<%=address%>"></input></td></tr>
			<tr><td>Mobile</td><td><input type="text" name="mob" value="<%=mob%>"></input></td></tr>
			<tr><td>Email</td><td><input type="email" name="email" value="<%=email%>"></input></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td></td></tr>
			<tr><td></td><td><input type="submit" value="Update"></input></td></tr>
			</form>
			</table>
		
			<%
				try
				{
					String str1 = request.getParameter("status");
					if(str1!=null)
					{
						out.print("<h4>Profile Updated Successfully.......</h4>");
					}
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
