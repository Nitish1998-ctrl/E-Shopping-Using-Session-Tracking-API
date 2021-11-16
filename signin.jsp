<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>E-Shopping</title>

	<script>
		var request;
		var val;
		var p;
		function cat()
		{
			var un = document.myform.un.value;
			if(un.length==0)
			{
				alert("Please Enter Email or Mobile Number");
				return false;
			}
			else
			{
				
				var url = "checkuser.jsp?un="+un;

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
				request.onreadystatechange = rat;  
				request.open("GET",url,true);  
				request.send(); 
					if(p==1)
					{
						return true;
					}
				}
				catch(e)
				{
					alert("Unable to connect to server");
				}
			}
			return false;
		}
			
		function rat()
		{
			if(request.readyState==4)
			{  
				val = request.responseText;
				if(val.length==9)
				{
					p = 1;
				}
				else
				{
					document.getElementById('amit').innerHTML = val;  
				}
			} 
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
		E-Shopping<span class="off" style="font-size:25px; color:#ff0000;"> Your gateway to great shopping</span></h1> </div>   
        
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
			
			<form action="password.jsp" name="myform" onsubmit="return cat()">
			<table align="center" bgcolor="white">
			<tr><td><font size="15%"><a align="center">Sign in</a></font><br></td><td></td></tr>
			<tr><td colspan="2"><font size="5%"><a align="center">to continue to Shopping</a><br><br></font></td></tr>
			<tr><td><font color="blue"><a>Email or phone</a></font><br></td><td></td></tr>
			<tr><td><input class="rat" type="text" name="un"/></td><td><input class="cat" type="submit" value="   NEXT   "/></td></tr>
			<tr><td><span id="amit"></span></td><td></td></tr>
			<tr><td><br><br><a href="forgotemail.jsp" class="c1">Forgot Login ID?</a><br><br></td><td></td></tr>
			<tr><td><a href="signup.jsp" class="c1">Create Account</a></td><td></td></tr>
			</table>
			</form>

		</div>
		
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
