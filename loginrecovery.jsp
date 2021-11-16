<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="career.connection.*" %>

<%
	String mob = request.getParameter("t1");
	String email = request.getParameter("t2");
	String logid="";	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("SELECT * from rangoli_signup where mobile=? or current_email=?");
		
		ps.setString(1,mob);
		ps.setString(2,email);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			logid = rs.getString("login_name");
		}
		else
		{
			logid = "0";
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("register.jsp "+e);	
	}

	response.sendRedirect("forgotemail.jsp?logid="+logid);
%>