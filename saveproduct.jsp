<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.UUID" %>

<%
	String category = request.getParameter("cat");
	String company = request.getParameter("com");
	String pc = request.getParameter("pc");
	String pn = request.getParameter("pn").toUpperCase();
	String unit = request.getParameter("unit");
	String price = request.getParameter("price");
	String qty = request.getParameter("qty");
	String gst = request.getParameter("gst");
	String mfg = request.getParameter("mfg");
	String exp = request.getParameter("exp");
	String offer = request.getParameter("offer");
	String pd = request.getParameter("pd");
	
	String uid = UUID.randomUUID().toString();
	uid = uid.substring(0,7);

	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("INSERT into rangoli_product values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
		ps.setString(1,category);
		ps.setString(2,company);
		ps.setString(3,pc);
		ps.setString(4,pn);
		ps.setString(5,unit);
		ps.setString(6,price);
		ps.setString(7,qty);
		ps.setString(8,gst);
		ps.setString(9,mfg);
		ps.setString(10,exp);
		ps.setString(11,pd);
		ps.setString(12,offer);
		ps.setString(13,uid);

		int z = ps.executeUpdate();
		if(z>0)
		{
			con.close();
			out.print("<h3>product successfully added <a href='uploadproductphoto.jsp?uid="+uid+"&cat="+category+"&cmp="+company+"'>upload photo</a></h3>");
		}
		con.close();
	}
	catch(Exception e)
	{
		out.print("<h3>Category, Company & product already exists.....</h3>");	
	}
%>