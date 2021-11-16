<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String un = (String)session.getAttribute("logn");
	
	String fn = request.getParameter("fn");
	String ln = request.getParameter("ln");
	String address = request.getParameter("address");
	String mobile = request.getParameter("mob");
	String email = request.getParameter("email");

	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("UPDATE rangoli_signup set first_name=?, last_name=?, address=?, mobile=?, current_email=? where login_name=?");
		ps.setString(1,fn);
		ps.setString(2,ln);
		ps.setString(3,address);
		ps.setString(4,mobile);
		ps.setString(5,email);
		ps.setString(6,un);
		int z = ps.executeUpdate();
		if(z>0)
		{
			con.close();
			response.sendRedirect("editprofile.jsp?status=1");
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("updateprofile.jsp "+e);	
	}
%>