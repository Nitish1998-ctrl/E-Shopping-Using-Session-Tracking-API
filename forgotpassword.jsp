<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>MailSender</title>
<script>
function cat()
{
	var s1 = document.myform2.t3.value;
	if(document.myform2.t3.value.length==0)
	{
		alert("Error! Email ID can't be leave blank");
		document.myform2.t3.focus();
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
        	<h1>Mail<span class="off">Sender.com</span></h1>
        </div>   
        
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
			String status = "";
			try
			{
				status = (String)application.getAttribute("status");
				if(status!=null)
				{
					if(status.equals("0"))
					{
						status = "<h3>Sorry! Email ID is invalid</h3>"; 
					}
					else
					{
						status = "<h3>Password Send Successfully</h3>"; 
					}
					application.removeAttribute("status");
				}
				else
				{
					status = " ";
				}
			}
			catch(Exception e)
			{
			}
		%>

		<table>
		<tr><td><font size="6%"><center><a>Password Recovery</center></a></font></td></tr>
		<tr><td><font size="2%"><a><center><b>Please provide current email id which is associated with your Rangoli account.</b></center></a></font></td></tr>
		
		<form name=myform2 action="passwordrecovery.jsp" onsubmit="return cat()">
		<tr><td><input type="hidden" value="<%=request.getParameter("un")%>" name="t1"></input></td></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr></tr>	
		<tr><td><br></td></tr>
		<tr><td><center><input class="rat" type="email" name="t3" placeholder="Enter Email ID"/></center></td><td><span id="lname"></span></td></tr>
				
		<tr></tr>
		<tr></tr>
		<tr></tr>
		<tr><td><%=status%></td></tr>
		<tr></tr>
		<tr><td></td><td><input class="cat" type="submit" value="Next"></input><tr></tr><tr></tr><tr></tr>
		<tr><td colspan="2"><a href="password.jsp?un=<%=request.getParameter("un")%>" class="c1" style="color: blue; font-size:13px">BACK</a></td></tr>
		</form>		
	
		
	
	</td></tr>
	</table>
		</div>
		
		<div id="content_bottom"></div>
		<div id="footer"></div>
      	</div>

</div>
</body>
</html>
