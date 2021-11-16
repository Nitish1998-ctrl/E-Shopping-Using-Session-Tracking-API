<%@ page import="java.io.*" %>
<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<!Doctype html>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="style.css" />
	<title>E-Shopping</title>
</head>

<body>
<div id="container">

	<div id="header">
        	<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<%=request.getParameter("cmp")%><span class="off" style="font-size:25px;"></h1>
        </div>   
        
              
        <div id="leftmenu">

        	<div id="leftmenu_top"></div>
		<div id="leftmenu_main">    
	        	<ul>
			<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Products Range</h3>
			<%
				String cmp1 = request.getParameter("cmp");
				try
				{
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from rangoli_product where company_name=?");
				ps.setString(1,cmp1);
				ResultSet rs = ps.executeQuery();
				while(rs.next())
				{
					out.print("<li><a href='showitem.jsp?cat="+rs.getString("category_name")+"&cmp="+rs.getString("company_name")+"&pnm="+rs.getString("product_name")+"'>&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getString("product_name")+"</a></li>");
				} 	
				con.close();
			}
			catch(Exception e)
			{
			}
			%>
			</ul>
		</div>
        	<div id="leftmenu_bottom"></div>
        </div>
        
	<div id="content">
        	<div id="content_top"></div>
        	<div id="content_main">

		<%
			String cat = request.getParameter("cat");
			String cmp = request.getParameter("cmp");
			String pnm = request.getParameter("pnm");
						
			File fe1 = new File(getServletContext().getRealPath("/") + File.separator + "product/"+cat+"/"+cmp+"/"); 
			String fn[] = fe1.list();
					
			try
			{
				Connection con = dao.createconnection();
				PreparedStatement ps = con.prepareStatement("select * from rangoli_product where category_name=? and company_name=? and product_name=?");
				ps.setString(1,cat);
				ps.setString(2,cmp);
				ps.setString(3,pnm);
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
							out.print("&nbsp;&nbsp;&nbsp;&nbsp;<img src='"+path+fn[i]+"' width='80' height='80'></img><b>PID : "+rs.getString("product_code")+"&nbsp;&nbsp;&nbsp;&nbsp;"+rs.getString("product_name")+"</b>&nbsp;&nbsp;&nbsp;&nbsp;<a href='viewshowitem.jsp?pid="+rs.getString("product_id")+"&cat="+cat+"&cmp="+cmp+"'>view more</a><br><br>");
						}	
					}			
				} 	
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
