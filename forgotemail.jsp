<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>E-Shopping</title>
<script>
	function cat()
	{
		var s1 = document.myform1.t1.value;
		var s2 = document.myform1.t2.value;
		if(document.myform1.t1.value.length==0)
		{
			if(document.myform1.t2.value.length==0)
			{
				alert("Please provide at least one information");
				document.myform1.t1.focus();
				return false;
			}	
			else
			{
				return true;
			}
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
		E-Shopping<span class="off" style="font-size:25px; color:#ff0000;"> Your gateway to great shopping</span></h1></div>   
        
        <div id="menu">
        	<ul>
            	<li class="menuitem"><a href="index.html">Home</a></li>
                <li class="menuitem"><a href="signin.jsp">SignIn</a></li>
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
			String resp="";
			try
			{
				String un = request.getParameter("logid");
				if(un!=null)
				{
					if(!un.equals("0"))
					{
						resp = "Your Loing ID is : <a href='password.jsp?un="+un+"'>"+un+"</a>";
					}
					else if(un.equals("0"))
					{
						resp = "Sorry! Mobile or Email ID is invalid";
					}
				}
				else
				{
					resp = " ";
				}
			}
			catch(Exception e)
			{
			}
		%>

		<table>
		
		<tr><td><font size="6%"><a>Having trouble signing in?</a></font></td></tr>
		<tr><td><font size="2%"><a><center>Please provide additional information to aid in the recovery process.</center></a></font></td></tr>
		<tr><td>
		<tr><td></td></tr>
			
		<form name=myform1 action="loginrecovery.jsp" onsubmit="return cat()">
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr><td><font size="3%"><a>Enter Mobile No. OR Email ID associated with your account</a></font></td><td></td></tr>
		<tr><td><br></td></tr>
		<tr><td><center><input class="rat" type="text" name="t1" placeholder="Enter Mobile Number"/></center></td><td><span id="lname"></span></td></tr>
		<tr><td><br></td></tr>
		<tr><td><center><input class="rat" type="email" name="t2" placeholder="Enter Email ID"/></center></td><td><span id="lname"></span></td></tr>
		
		<tr></tr>
		<tr></tr>
		<tr><td><br></td></tr>
		<tr><td><%=resp%></td></tr>
		<tr></tr>
		<tr></tr>
		<tr><td></td><td><input type="submit" value="Next" class="cat"></input><tr></tr><tr></tr><tr></tr>
		<tr><td colspan="2"><a href="signin.jsp" class="c1" style="color: blue; font-size:13px">BACK</a></td></tr>
		</form>		
	
</table>

		</div>
		
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
