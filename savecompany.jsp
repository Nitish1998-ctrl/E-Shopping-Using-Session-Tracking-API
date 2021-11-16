<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String category = request.getParameter("category");
	String cc = request.getParameter("cc");
	String cn = request.getParameter("cn").toUpperCase();
	String cd = request.getParameter("cd");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("INSERT into rangoli_company values(?,?,?,?)");
		ps.setString(1,category);
		ps.setString(2,cn);
		ps.setString(3,cc);
		ps.setString(4,cd);
		int z = ps.executeUpdate();
		if(z>0)
		{
			con.close();
			out.print("<h3>company successfully added.....</h3>");
		}
		con.close();
	}
	catch(Exception e)
	{
		out.print("<h3>Category & Company already exists.....</h3>");	
	}
%>