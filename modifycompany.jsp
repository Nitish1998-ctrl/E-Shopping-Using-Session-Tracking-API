<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String ct = request.getParameter("ct");
	String cc = request.getParameter("cc");
	String cn = request.getParameter("cn").toUpperCase();
	String cd = request.getParameter("cd");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("update rangoli_company set category_name=?,company_name=?,company_code=?,company_description=? where company_code=?");
		ps.setString(1,ct);
		ps.setString(2,cn);
		ps.setString(3,cc);
		ps.setString(4,cd);
		ps.setString(5,cc);
		int z = ps.executeUpdate();
		if(z>0)
		{
			con.close();
			out.print("<h3>company updated successfully</h3>");
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>