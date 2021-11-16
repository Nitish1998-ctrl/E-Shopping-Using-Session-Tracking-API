<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String catname = request.getParameter("catid");
	String cmpname = request.getParameter("cmpid");
	String proname = request.getParameter("pid");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps3 = con.prepareStatement("delete from rangoli_product where category_name=? and company_name=? and product_name=?");
		ps3.setString(1,catname);
		ps3.setString(2,cmpname);
		ps3.setString(3,proname);
		int z3 = ps3.executeUpdate();
		con.close();
	}
	catch(Exception e)
	{
	}
	response.sendRedirect("editproduct.jsp");
%>