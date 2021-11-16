<%@ page import="java.sql.*" %>
<%@page import="career.connection.dao" %>

<% 
	String un = request.getParameter("un");
	
	if(!(un.equals("") || un.equals(null)))
	{
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps1 = con.prepareStatement("select * from rangoli_signup where login_name='"+un+"'");	
		
		ResultSet rs = ps1.executeQuery();
		
		if(rs.next()==true)
		{
			out.print("already in use (try another login name)");	
		}	
		else
		{
			out.print("");
		}
	}
	catch(Exception e)
	{
		System.out.print("ok"+e);
	}
		
	}
	else
	{
		out.print("please enter user name");
	}
%>