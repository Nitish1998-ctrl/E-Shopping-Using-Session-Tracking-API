<%@ page import="career.connection.dao" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<%
	String pass = request.getParameter("pass");
	String un = request.getParameter("un");
	int cart=0;
	if(un.equals("Admin") && pass.equals("sumit123"))
	{
		session.setAttribute("logn","Admin");
		response.sendRedirect("adminprofile.jsp");
	}
	else
	{
		try
		{
			Connection con = dao.createconnection();
			PreparedStatement ps = con.prepareStatement("select * from rangoli_signup where login_name=? and password=?");
			ps.setString(1,un);
			ps.setString(2,pass);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				session.setAttribute("logn",un);
				Vector<String> vec = new Vector<String>();
				session.setAttribute("cart",cart);
				session.setAttribute("vect",vec);
				response.sendRedirect("profile.jsp");
			}
			else
			{
				application.setAttribute("msg","Sorry! password is incorrect");
				response.sendRedirect("password.jsp?un="+un);						
			}
			con.close();
		}
		catch(Exception e)
		{
			System.out.println("checkuser.jsp "+e);
		}
	}
%>
