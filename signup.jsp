<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>E-Shopping</title>

	<script>
		var request;  

		function sendinfo1(form)  
		{ 
			var v = form.value;  
			var url = "checkdata.jsp?un="+v;  
  
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
				request.onreadystatechange = getInfo1;  
				request.open("GET",url,true);  
				request.send();  
			}  
			catch(e)  
			{  
				alert("Unable to connect to server");  
			}  
		}  
  
		function getInfo1()
		{  
			if(request.readyState==4)
			{  
				var val=request.responseText;  
				document.getElementById('amit1').innerHTML=val;  
			}  
		}  


	function checkForm(form)
	{
	if(form.loginname.value == "")
	{
      	alert("Error: User Login Name cannot be blank!");
      	form.loginname.focus();
      	return false;
    	}

	if(form.password.value != "" && form.password.value == form.cpassword.value)
	{
	      	if(form.password.value.length < 6)
		{
	        	alert("Error: Password must contain at least six characters!");
	        	form.password.focus();
	        	return false;
	      	}
	      	if(form.password.value == form.firstname.value || form.password.value == form.loginname.value)
		{
	        	alert("Error: Password must be different from First Name!");
	        	form.password.focus();
        		return false;
      		}
      	
		re = /[0-9]/;
      		if(!re.test(form.password.value))
		{
        		alert("Error: password must contain at least one number (0-9)!");
       			form.password.focus();
        		return false;
      		}
      		re = /[a-z]/;
      		if(!re.test(form.password.value))
		{
        	alert("Error: password must contain at least one lowercase letter (a-z)!");
        	form.password.focus();
        	return false;
      		}
	      	re = /[A-Z]/;
	      	if(!re.test(form.password.value))
		{
	        alert("Error: password must contain at least one uppercase letter (A-Z)!");
	        form.password.focus();
	        return false;
	      	}
    	}
	else
	{
      	alert("Error: Please check that you've entered and confirmed your password!");
      	form.password.focus();
      	return false;
    	}

	if(form.firstname.value == "")
	{
      	alert("Error: FirstName cannot be blank!");
      	form.firstname.focus();
      	return false;
    	}

	if(form.lastname.value == "")
	{
      	alert("Error: LastName cannot be blank!");
      	form.lastname.focus();
      	return false;
    	}

	if(form.gender.value == "")
	{
      	alert("Error: Gender cannot be blank!");
       	return false;
    	}

	if(form.country.value == "")
	{
      	alert("Error: Country cannot be blank!");
      	form.country.focus();
      	return false;
    	}

	if(form.mobile.value == "")
	{
      	alert("Error: Mobile cannot be blank!");
      	form.mobile.focus();
      	return false;
    	}

	if(form.mobile.value.length < 10)
	{
      	alert("Error: Mobile Number must be of 10 Digits");
      	form.mobile.focus();
      	return false;
    	}

	if(form.email.value == "")
	{
      	alert("Error: Email cannot be blank!");
      	form.email.focus();
      	return false;
    	}

	alert("Please Note Down Your Login ID : " + form.loginname.value);
    	return true;
	}

		function valtxt(obj) 
		{
        		str="0123456789-+"
        		l = obj.value.length;
			if(l<=10)
			{
	        		for(i=0;i<=l;i++)
	        		{
        				if(str.indexOf(obj.value.charAt(i))==-1)
         				{
          				alert("Please Enter Valid Mobile Number.");
          				obj.value="";
          				obj.focus();
          				return false;
         				}
				}
			}
			else
			{
				alert("Mobile Number Must be of 10 Digits");
			obj.value="";
          		obj.focus();
          		return false;
		}
        	return true;
	}

	</script>

	<style>
		.c1
		{
			text-decoration: none;
		}

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
    		border-bottom: solid black 1px;
    		padding: 3px 10px;
		}
	</style>
</head>

<body>
<div id="container">

	<div id="header">
        	<img src="images/iccn.png" width="105" height="105"></img>
		<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		E-Shopping<span class="off" style="font-size:25px;"> Your gateway to great shopping</span></h1>
       </div>   
        
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
		
		<form action="register.jsp" method="post" onsubmit="return checkForm(this)">	
		<table>
		<tr><td colspan="2"><font size="6%"><a style="color: red">Create  Account</a></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.html" class="c1" style="color: blue; font-size:13px">BACK</a></td></tr>
		<tr><td colspan="2"><hr width="100%"><br></td></tr>
		<tr><td><font size="4%"><p style="color: blue"><b>Login Details</b></p></font></td></tr>
		<tr><td>Choose Login Name</td><td><input type="text" class="rat" name="loginname" onchange="sendinfo1(this)" onclick="this.value=''"/></td><td><span id="amit1"></span></td></tr>
		<tr><td>Choose Password</td><td><input type="password" class="rat" name="password"></td><td><span id="pstength"></span></td></tr>
		<tr><td>Confirm Password</td><td><input type="password" class="rat" name="cpassword"></td><td><span id="cpass"></span></td></tr>
		<tr><td><br><font size="4%"><p style="color: blue"><b>Personal Details</b></p></font></td></tr>
		<tr><td>First Name</td><td><input type="text" class="rat" name="firstname"/></td></tr>
		<tr><td>Last Name</td><td><input type="text" class="rat" name="lastname"/></td></tr>
		<tr></tr><tr></tr><tr></tr>
		<tr><td>Gender</td><td><input type="radio" name="gender" value="male">Male&nbsp;&nbsp;&nbsp;&nbsp;</input><input type="radio" name="gender" value="female">Female</input></td></tr>
		<tr></tr><tr></tr><tr></tr>
		<tr><td>Date of Birth</td><td>
		<select name="date">
		<%
			for(int i=1 ; i<=31 ; i++)
			{
			out.print("<option>"+i+"</option>");	
			}
		%>
		</select>
		<select name="month">
		<%
			for(int i=1 ; i<=12 ; i++)
			{
			out.print("<option>"+i+"</option>");	
			}
		%>
		</select>
		<select name="year">
		<%
			for(int i=1970 ; i<=2010 ; i++)
			{
			out.print("<option>"+i+"</option>");	
			}
		%>
		</select></td></tr>
			<tr><td>Postal Address</td><td><input type="text" class="rat" name="country"/></td></tr>
			<tr><td>Mobile</td><td><input type="text" class="rat" name="mobile"/ onKeyUp="return valtxt(this)" ></td></tr>
			<tr><td>Current Email</td><td><input type="email" class="rat" name="email"/><br><br></td></tr>
			<tr><td></td><td><input type="submit" value="Register" class="cat" ></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" class="cat" value="Reset"></input></td></tr>
		</table>
		</form>		
		
		</div>
		
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
