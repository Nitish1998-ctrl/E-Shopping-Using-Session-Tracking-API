<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String cc = request.getParameter("cc");
	String cn = request.getParameter("cn").toUpperCase();
	String cd = request.getParameter("cd");
	
	try
	{
		Connection con = dao.createconnection();
	
		PreparedStatement ps = con.prepareStatement("update rangoli_category set category_code=?,category_name=?,category_description=? where category_code=?");
		ps.setString(1,cc);
		ps.setString(2,cn);
		ps.setString(3,cd);
		ps.setString(4,cc);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			out.print("<h3>category successfully updated</h3>");
		}
		else
		{
			out.print("<h3>error in updating category</h3>");
		}		
		con.close();
	}
	catch(Exception e)
	{
		out.print("<h3>category code or name already exists</h3>");	
	}
%>