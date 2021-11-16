<%@ page import="java.io.*" %>
<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>E-Shopping</title>

	<script>
		
		function dog()
		{
			var cate = document.myform.cate.value;
			document.myform.ct.value = cate;
			cat();
		}

		function goat()
		{
			var cmp = document.myform.company.value;
			document.myform.cn.value = cmp;
		}

		var request1;  
		function cat()
		{
			var cate = document.myform.cate.value;
			var url = "searchcate1.jsp?cate="+cate;  
  
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

		var request;  
		function sendInfo()  
		{ 
			var pid = document.myform.pid.value;  
			var ct = document.myform.ct.value;  
			var cn = document.myform.cn.value;  
			var pn = document.myform.pn.value;  
			var price = document.myform.price.value;  
			var unit = document.myform.unit.value;  
			var qty = document.myform.qty.value;  
			var gst = document.myform.gst.value;  
			var offer = document.myform.offer.value;  
			var pd = document.myform.pd.value;  

			if(document.myform.ct.value == "")
			{
      				alert("Error: Category can't leave empty");
      				document.myform.ct.focus();
      				return false;
    			}
			else if(document.myform.cn.value == "")
			{
      				alert("Error: Company name can't leave empty");
      				document.myform.cn.focus();
      				return false;
    			}
			else if(document.myform.pn.value == "")
			{
      				alert("Error: Product name can't leave empty");
      				document.myform.pn.focus();
      				return false;
    			}
			else if(document.myform.price.value == "")
			{
      				alert("Error: Price can't leave empty");
      				document.myform.price.focus();
      				return false;
    			}
			else if(document.myform.unit.value == "")
			{
      				alert("Error: Units can't leave empty (enter 0 for none)");
      				document.myform.unit.focus();
      				return false;
    			}
			else if(document.myform.qty.value == "")
			{
      				alert("Error: Qunatity can't leave empty (enter 0 for none)");
      				document.myform.qty.focus();
      				return false;
    			}
			else if(document.myform.gst.value == "")
			{
      				alert("Error: GST can't leave empty (enter 0 for none)");
      				document.myform.gst.focus();
      				return false;
    			}
			else if(document.myform.offer.value == "")
			{
      				alert("Error: Offer can't leave empty (enter 0 for none)");
      				document.myform.offer.focus();
      				return false;
    			}
			else if(document.myform.pd.value == "")
			{
      				alert("Error: Product description can't leave empty");
      				document.myform.pd.focus();
      				return false;
    			}
			else
			{	
				var url = "modifyproduct.jsp?ct="+ct+"&cn="+cn+"&pn="+pn+"&price="+price+"&unit="+unit+"&qty="+qty+"&gst="+gst+"&offer="+offer+"&pd="+pd+"&pid="+pid;  
  
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
			return true;
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

		<h2>Product Profile</h2>		
		<br>
		<%
			String catid = request.getParameter("catid");
			String cmpid = request.getParameter("cmpid");
			String pid = request.getParameter("pid");
			Connection con = null;
			PreparedStatement ps = null,ps1=null;
			ResultSet rs = null,rs1=null;
			try
			{
				con = dao.createconnection();
				ps = con.prepareStatement("select * from rangoli_product where category_name=? and company_name=? and product_name=?");
				ps1 = con.prepareStatement("select * from rangoli_category");
				ps.setString(1,catid);
				ps.setString(2,cmpid);
				ps.setString(3,pid);
				rs = ps.executeQuery();
				rs.next();
				rs1 = ps1.executeQuery();
								
				out.print("<form name='myform'>");
				out.print("<table>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Category Name</td><td><input style='cursor: pointer; font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='ct' value='"+rs.getString("category_name")+"'></input></td>");
				out.print("<td><select name='cate' style='cursor: pointer; font-family:arial; font-size:15px; color:brown; padding-left: 5px;' onchange='dog()'>");
				out.print("<option selected='true' disabled='disabled'>---Select---</option>");
				while(rs1.next())
				{
				out.print("<option>"+rs1.getString("category_name")+"</option>");
				}
				out.print("</select></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Company Name</td><td><input style='cursor: pointer; font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='cn' value='"+rs.getString("company_name")+"'></input></td>");
				out.print("<td><span id='kamal1'></span></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Product Name</td><td><input style='cursor: pointer; font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='pn' value='"+rs.getString("product_name")+"'></input></td><td></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Product Code</td><td><input style='font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='pc' value='"+rs.getString("product_code")+"' title='can not modify' readonly></input></td><td></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Price</td><td><input style='font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='price' value='"+rs.getString("price")+"'></input></td><td></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Units</td><td><input style='font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='unit' value='"+rs.getString("unit")+"'></input></td><td></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Quantity</td><td><input style='font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='qty' value='"+rs.getString("quantity")+"'></input></td><td></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>GST in %</td><td><input style='font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='gst' value='"+rs.getString("gst")+"'></input></td><td></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Any Offer</td><td><input style='font-family:arial; font-size:15px; color:brown; padding-left: 5px;' type='text' name='offer' value='"+rs.getString("offer")+"'></input></td><td></td></tr>");
				out.print("<tr><td style='font-family:arial; font-size:15px; color:blue;'>Description</td><td><textarea style='cursor: pointer; font-family:arial; font-size:15px; color:brown; padding-left: 5px;' cols='23' rows='5' name='pd'>"+rs.getString("description")+"</textarea></td><td></td></tr>");
				out.print("<tr><td></td><td></td><td><br></td></tr>");
				out.print("<tr><td></td><td><input type='button' value='Update' onclick='return sendInfo()'></input></td><td></td></tr>");
				out.print("<tr><td></td><td><br></td></tr>");
				out.print("</table>");
				out.print("<input type='hidden' name='pid' value='"+rs.getString("product_id")+"'></input>");
				out.print("</form>");					
				out.print("<span id='amit1'></span>");
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
