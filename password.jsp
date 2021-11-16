<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="career.connection.*" %>


<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>E-Shopping</title>

	<script>
		function cat()
		{
			var pw = document.myform.pass.value;
			if(pw.length==0)
			{
				alert("Please Enter Password");
				return false;
			}
			return true;
		}
	</script>

	<style>
		.cat
		{		
		height: 2em;
		cursor: pointer;
		background-color: blue;
		color: white;
		}           
		.rat
		{
    		background-color: transparent;
  		color: black;
		width: 80%;
		outline: none;
    		outline-style: none;
   		border-top: none;
    		border-left: none;
  		border-right: none;
    		border-bottom: solid blue 1px;
    		padding: 3px 10px;
		}
	</style>
</head>

<body>
<div id="container">

	<div id="header">
        		<img src="images/iccn.png" width="105" height="70"></img>
		<h1 color:#ff0000;>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		E-Shopping<span class="off" style="font-size:25px; color:#ff0000;"> Your gateway to great shopping</span></h1>   </div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="index.html">Home</a></li>
                <li class="menuitem"><a href="#">SignIn</a></li>
                <li class="menuitem"><a href="signup.jsp">SignUp</a></li>
                <li class="menuitem"><a href="about.html">About</a></li>
                </ul>
        </div>
        
        <div id="leftmenu">

        	<div id="leftmenu_top"></div>
		<div id="leftmenu_main">    
	        	<h3>Links</h3>
             		<ul>
                	    <li><a href="https:\\www.facebook.com">FaceBook</a></li>
                	    <li><a href="https:\\www.linkedin.com">LinkedIn</a></li>
			</ul>
		</div>
        	<div id="leftmenu_bottom"></div>
        </div>
        
	<div id="content">
        	<div id="content_top"></div>
        	
		<div id="content_main">
		
			<%
			String msg=""; 
			try
			{
				msg = (String)application.getAttribute("msg");
				if(msg==null)
				{
					msg="";	
				}
				else
				{
					try
					{
						application.removeAttribute("msg");
					}
					catch(Exception e)
					{
					}
				}
			}	
			catch(Exception e)
			{
				msg="";
			}
			
			%>
			<form name="myform" action="checkpassword.jsp" method="post" onsubmit="return cat()">
			<table align="center" bgcolor="white" >
			<tr><td colspan="2"><font size="6%"><a>WELCOME</a></font></td></tr>
			<tr><td colspan="2"><span class="sp"><font size="3%"><a style="color: green">
			<% 
				if(request.getParameter("un").equals("Admin"))
				{
					out.print("Admin");
					out.print("<input type='hidden' name='un' value='Admin'></input>");
				}
				else
				{				
				try
				{
					Connection con = dao.createconnection();
					PreparedStatement ps = con.prepareStatement("select * from rangoli_signup where login_name=? or mobile=?");
					ps.setString(1,request.getParameter("un"));
					ps.setString(2,request.getParameter("un"));
					ResultSet rs = ps.executeQuery();
					if(rs.next())
					{
						out.print(rs.getString("login_name"));
						out.print("<input type='hidden' name='un' value='"+rs.getString("login_name")+"'></input>");
					}
					con.close();
				}
				catch(Exception e)
				{
				}
				}
			%>
			<a></span></td></tr>
			<tr><td><br></td></tr>
			<tr><td colspan="2"><font size="2%"><a style="color: blue">ENTER YOUR PASSWORD</a></font></td></tr>
			<tr><td><input type="password" name="pass" class="rat"/></td><td><input type="submit" value="   NEXT   " class="cat"/></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td><span><%=msg%></span></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td></td></tr>
			<tr><td colspan="2"><a class="c1" href="forgotpassword.jsp?un=<%=request.getParameter("un")%>">Forgot password?</a></td></tr>
			<tr><td><br></td></tr>
			<tr><td colspan="2"><a href="index.html" class="c1" style="color: blue; font-size:13px">BACK</a></td></tr>
			</table>
			</form>

		</div>
		
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
