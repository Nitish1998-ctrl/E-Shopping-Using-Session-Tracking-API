<%@ page import="java.io.*" %>
<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>E-Shopping</title>
	<script>
		var request1;  
		function cat()
		{
			var cate = document.myform.category.value;
			var url = "searchcate.jsp?cate="+cate;  
  
			if(window.XMLHttpRequest)
			{  
				request1 = new XMLHttpRequest();  
			}  
			else if(window.ActiveXObject)
			{ 	 	
				request1 = new ActiveXObject("Microsoft.XMLHTTP");  
			}  
			try  
			{  
				request1.onreadystatechange = rat;  
				request1.open("GET",url,true);  
				request1.send();  
			}  
			catch(e)  
			{  
				alert("Unable to connect to server");  
			}	
		}

		function rat()
		{
			if(request1.readyState==4)
			{  
				var val=request1.responseText;  
				document.getElementById('kamal1').innerHTML=val;  
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
		Integer cart = (Integer)session.getAttribute("cart");
	%>
	</div> 
      
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="settings.jsp">Settings</a></li>
                <li class="menuitem"><a href="editprofile.jsp">Profile</a></li>
                <li class="menuitem"><a href="bill.jsp">Bill</a></li>
                <li class="menuitem"><a href="logout.jsp">Logout</a></li>
                <li class="menuitem"><a href="cart1.jsp">Items in Cart ( <%=cart%> )</a></li></ul>
        </div>
        
        <div id="leftmenu">

        	<div id="leftmenu_top"></div>
		<div id="leftmenu_main">    
	        	
		<form name="myform" action="searchproduct.jsp">
			
			<table>
			
			<tr>
				<td></td>
				<td><label style='font-family:arial; font-size:14px; color:white'>Select Category</label><br></td>
				<td></td>
			</tr>

			<tr>
				<td></td>
				<td>
					<select name="category" onchange="cat()" style="cursor: pointer; width: 170px; height: 23px;">
					<option selected="true" disabled="disabled">---Select---</option>
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

				<tr><td></td><td></td><td></td></tr>

				<tr>
					<td></td>
					<td><label style='font-family:arial; font-size:14px; color:white'>Select Company</label><br></td>
					<td></td>
				</tr>


				<tr>
					<td></td>
					<td><span id="kamal1"><input type="text" name="t1" style="cursor: pointer; width: 165px; height: 18px;"></input></span></td>
					<td></td>
				</tr>

				<tr><td></td><td></td><td><br></td></tr>

				<tr><td></td><td><input type="submit" value="Search"></input>&nbsp;&nbsp<input type="reset" value="Reset All"></input></td><td></td></tr>
				<tr><td></td><td><br></td></tr>
				<tr><td></td><td><span id="amit1"></span></td></tr>
			</table>
		</form>
			
             	
                	
		</div>
        	<div id="leftmenu_bottom"></div>
        </div>
        
	<div id="content">
        	<div id="content_top"></div>
        	<div id="content_main">
		
		<%
			String cat = request.getParameter("category");
			String cmp = request.getParameter("company");
			
			File fe1 = new File(getServletContext().getRealPath("/") + File.separator + "product/"+cat+"/"+cmp+"/"); 
			String fn[] = fe1.list();
					
			try
			{
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from rangoli_product where category_name=? and company_name=?");
				ps.setString(1,cat);
				ps.setString(2,cmp);
				ResultSet rs = ps.executeQuery();
				String path = "product/"+cat+"/"+cmp+"/";
				while(rs.next())
				{
					String pid = rs.getString("product_id");
					for(int i=0 ; i<fn.length ; i++)
					{
						String pn = fn[i].substring(0,fn[i].indexOf("."));
						if(pn.equals(pid))
						{
							out.print("&nbsp;&nbsp;&nbsp;&nbsp;<img src='"+path+fn[i]+"' width='80' height='80'></img><b>PID : "+rs.getString("product_code")+"&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getString("product_name")+"</b>&nbsp;&nbsp;&nbsp;&nbsp;<a href='viewprofile.jsp?pid="+rs.getString("product_id")+"&cat="+cat+"&cmp="+cmp+"'>view more</a><br><br>");
						}	
					}			
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
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
