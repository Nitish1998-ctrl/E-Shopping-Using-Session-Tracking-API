<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>

<%
	String un = request.getParameter("un");
	if(un.equals("Admin"))
	{
		out.print("1");
	}
	else
	{
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("select * from rangoli_signup where login_name=? or mobile=?");
		ps.setString(1,un);
		ps.setString(2,un);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			out.print("1");
		}
		else
		{
			out.print("Could not find your account");
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("checkuser.jsp "+e);
	}
	}
%>
