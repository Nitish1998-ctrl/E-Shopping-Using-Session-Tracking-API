<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String catname = request.getParameter("cid");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps1 = con.prepareStatement("delete from rangoli_category where category_name=?");
		PreparedStatement ps2 = con.prepareStatement("delete from rangoli_company where category_name=?");
		PreparedStatement ps3 = con.prepareStatement("delete from rangoli_product where category_name=?");
		ps1.setString(1,catname);
		ps2.setString(1,catname);
		ps3.setString(1,catname);
		int z1 = ps1.executeUpdate();
		int z2 = ps2.executeUpdate();
		int z3 = ps3.executeUpdate();
		con.close();
	}
	catch(Exception e)
	{
	}
	response.sendRedirect("editcategory.jsp");
%>