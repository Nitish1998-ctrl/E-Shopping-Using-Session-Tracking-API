<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String catname = request.getParameter("catid");
	String cmpname = request.getParameter("cmpid");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps2 = con.prepareStatement("delete from rangoli_company where category_name=? and company_name=?");
		PreparedStatement ps3 = con.prepareStatement("delete from rangoli_product where category_name=? and company_name=?");
		ps2.setString(1,catname);
		ps2.setString(2,cmpname);
		ps3.setString(1,catname);
		ps3.setString(2,cmpname);
		int z2 = ps2.executeUpdate();
		int z3 = ps3.executeUpdate();
		con.close();
	}
	catch(Exception e)
	{
	}
	response.sendRedirect("editcompany.jsp");
%>