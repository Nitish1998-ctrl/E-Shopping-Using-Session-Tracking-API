<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%
	String logn = request.getParameter("loginname");
	String pass = request.getParameter("password");
	String first = request.getParameter("firstname");
	String last = request.getParameter("lastname");
	String gen = request.getParameter("gender");
	String dt = request.getParameter("date");
	String mt = request.getParameter("month");
	String yr = request.getParameter("year");
	String dob = dt+"-"+mt+"-"+yr;
	String coun = request.getParameter("country");
	String mob = request.getParameter("mobile");
	String em = request.getParameter("email");

	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("INSERT into rangoli_signup values(?,?,?,?,?,?,?,?,?)");
		ps.setString(1,logn);
		ps.setString(2,pass);
		ps.setString(3,first);
		ps.setString(4,last);
		ps.setString(5,gen);
		ps.setString(6,dob);
		ps.setString(7,coun);
		ps.setString(8,mob);
		ps.setString(9,em);
		int z = ps.executeUpdate();
		if(z>0)
		{
			con.close();
			response.sendRedirect("welcomepage.jsp?logn="+logn);
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("register.jsp "+e);	
	}
%>