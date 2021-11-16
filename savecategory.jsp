<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String cc = request.getParameter("cc");
	String cn = request.getParameter("cn").toUpperCase();
	String cd = request.getParameter("cd");
	
	try
	{
		Connection con = dao.createconnection();
	
		PreparedStatement ps1 = con.prepareStatement("select * from rangoli_category where category_code=? or category_name=?");
		ps1.setString(1,cc);
		ps1.setString(2,cn);
		ResultSet rs1 = ps1.executeQuery();
		if(rs1.next())
		{
			out.print("<h3>category code and name already exists</h3>");
		}
		else
		{
			PreparedStatement ps = con.prepareStatement("INSERT into rangoli_category values(?,?,?)");
			ps.setString(1,cc);
			ps.setString(2,cn);
			ps.setString(3,cd);
			int z = ps.executeUpdate();
			if(z>0)
			{
				con.close();
				out.print("<h3>category successfully added</h3>");
			}
			con.close();
		}
	}
	catch(Exception e)
	{
		out.print("<h3>category already exists</h3>");	
	}
%>