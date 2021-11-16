<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String ct = request.getParameter("ct");
	String cn = request.getParameter("cn");
	String pn = request.getParameter("pn").toUpperCase();
	String price = request.getParameter("price");
	String unit = request.getParameter("unit");
	String qty = request.getParameter("qty");
	String gst = request.getParameter("gst");
	String offer = request.getParameter("offer");
	String pd = request.getParameter("pd");
	String pid = request.getParameter("pid");
	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("update rangoli_product set category_name=?,company_name=?,product_name=?,price=?,unit=?,quantity=?,gst=?,offer=?,description=? where product_id=?");
		ps.setString(1,ct);
		ps.setString(2,cn);
		ps.setString(3,pn);
		ps.setString(4,price);
		ps.setString(5,unit);
		ps.setString(6,qty);
		ps.setString(7,gst);
		ps.setString(8,offer);
		ps.setString(9,pd);
		ps.setString(10,pid);

		int z = ps.executeUpdate();
		if(z>0)
		{
			con.close();
			out.print("<h3>product updated successfully</h3>");
		}
		con.close();
	}
	catch(Exception e)
	{
	}
%>