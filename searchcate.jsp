<%@ page import="java.io.*" %>
<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>
<%
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("select * from rangoli_company where category_name=?");
		ps.setString(1,request.getParameter("cate"));	
		ResultSet rs = ps.executeQuery();
		out.print("<select name='company' style='cursor: pointer; width: 161px; height: 23px;'>");
		while(rs.next())
		{
			out.print("<option>"+rs.getString("company_name")+"</option>");
		}
		out.print("</select>");
		con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}
%>