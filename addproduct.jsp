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

		var request;  
		function sendInfo()  
		{ 
			var category = document.myform.category.value;  
			var company = document.myform.company.value;  
			var pc = document.myform.pc.value;  
			var pn = document.myform.pn.value;  
			var unit = document.myform.unit.value;  
			var price = document.myform.price.value;  
			var qty = document.myform.qty.value;  
			var gst = document.myform.gst.value;  
			var mfg = document.myform.mfg.value;  
			var exp = document.myform.exp.value;  
			var offer = document.myform.offer.value;  
			var pd = document.myform.pd.value;  

			if(document.myform.pc.value == "")
			{
      				alert("Error: Product Code can't leave empty");
      				document.myform.pc.focus();
      				return false;
    			}
			else if(document.myform.pn.value == "")
			{
      				alert("Error: Product Name can't leave empty");
      				document.myform.pn.focus();
      				return false;
    			}
			else if(document.myform.unit.value == "")
			{
      				alert("Error: Units can't leave empty");
      				document.myform.unit.focus();
      				return false;
    			}
			else if(document.myform.price.value == "")
			{
      				alert("Error: Price can't leave empty");
      				document.myform.price.focus();
      				return false;
    			}
			else if(document.myform.qty.value == "")
			{
      				alert("Error: Quantity can't leave empty");
      				document.myform.qty.focus();
      				return false;
    			}
			else if(document.myform.gst.value == "")
			{
      				alert("Error: GST can't leave empty");
      				document.myform.gst.focus();
      				return false;
    			}
			else if(document.myform.mfg.value == "")
			{
      				alert("Error: Manufacturing Date can't leave empty");
      				document.myform.mfg.focus();
      				return false;
    			}
			else if(document.myform.exp.value == "")
			{
      				alert("Error: Expiry Date can't leave empty");
      				document.myform.exp.focus();
      				return false;
    			}
			else if(document.myform.offer.value == "")
			{
      				alert("Error: Offer can't leave empty");
      				document.myform.offer.focus();
      				return false;
    			}
			else if(document.myform.pd.value == "")
			{
      				alert("Error: Product Description can't leave empty");
      				document.myform.pd.focus();
      				return false;
    			}
			else
			{	
				var url = "saveproduct.jsp?cat="+category+"&com="+company+"&pc="+pc+"&pn="+pn+"&unit="+unit+"&price="+price+"&qty="+qty+"&gst="+gst+"&mfg="+mfg+"&exp="+exp+"&offer="+offer+"&pd="+pd;  
  
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

		<h2>Add New Product</h2>		
		<br>
		<form name="myform">
			<table>
				<tr>
					<td>Select Category</td>
					<td>
					<select name="category" onchange="cat()" style="cursor: pointer; width: 161px; height: 23px;">
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

				<tr>
					<td>Select Brand</td>
					<td><span id="kamal1"><input type="text" name="t1"></input></span></td>
					<td></td>
				</tr>


				<tr><td>Product Code</td><td><input type="text" name="pc"></input></td><td></td></tr>
				<tr><td>Product Name</td><td><input type="text" name="pn"></input></td><td></td></tr>
				<tr><td>Units</td><td><input type="text" name="unit"></input></td><td></td></tr>
				<tr><td>Price</td><td><input type="text" name="price"></input></td><td></td></tr>
				<tr><td>Quantity</td><td><input type="text" name="qty"></input></td><td></td></tr>
				<tr><td>GST</td><td><input type="text" name="gst"></input></td><td></td></tr>
				<tr><td>Manufacturing Date</td><td><input type="date" name="mfg" style="width:155px;"></input></td><td></td></tr>
				<tr><td>Expiry Date</td><td><input type="date" name="exp" style="width:155px;"></input></td><td></td></tr>
				<tr><td>Offer</td><td><input type="text" name="offer"></input></td><td></td></tr>
				<tr><td>Product Description</td><td><textarea cols="40" rows="5" name="pd"></textarea></td><td></td></tr>
				<tr><td></td><td></td><td><br></td></tr>
				<tr><td></td><td><input type="button" value="Add Product" onclick="return sendInfo()"></input>&nbsp;&nbsp<input type="reset" value="Reset All"></input></td><td></td></tr>
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
