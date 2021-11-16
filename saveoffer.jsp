<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.UUID" %>

<%
	String cat = request.getParameter("cat");
	String dis = request.getParameter("dis");
	String des = request.getParameter("des");
	String dt = request.getParameter("dt");

	String uid = UUID.randomUUID().toString();
	uid = uid.substring(0,7);	

	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("INSERT into rangoli_offer values(?,?,?,?,?)");
		ps.setString(1,cat);
		ps.setString(2,dis);
		ps.setString(3,des);
		ps.setString(4,dt);
		ps.setString(5,uid);

		int z = ps.executeUpdate();
		if(z>0)
		{
			con.close();
			out.print("<h3>offer successfully added.....</h3>");
		}
		con.close();
	}
	catch(Exception e)
	{
		out.print("<h3>offer already exists.....</h3>");	
	}
%>