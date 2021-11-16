<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String opw = request.getParameter("opw");
	String npw = request.getParameter("npw");
	String un = (String)session.getAttribute("logn");
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("select * from rangoli_signup where login_name=? and password=?");
		ps.setString(1,un);
		ps.setString(2,opw);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			PreparedStatement ps1 = con.prepareStatement("update rangoli_signup set password=? where login_name=?");
			ps1.setString(1,npw);
			ps1.setString(2,un);
			int z = ps1.executeUpdate();
			if(z>0)
			{
				out.print("<b>password successfully changed.....</b>");
			}
			else
			{
				out.print("<b>error! in changing password.....</b>");
			}		
		}
		else
		{
			out.print("<b>old password does not matched.....</b>");
		}
	}
	catch(Exception e)
	{
		System.out.println("changepassword.jsp "+e);	
	}
%>