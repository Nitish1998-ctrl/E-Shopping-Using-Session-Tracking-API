<%@ page import="java.util.*" %>
<%
	if(session!=null)
	{
		Vector<String> vec = (Vector)session.getAttribute("vect");
		vec.removeAllElements();
		Integer cart = (Integer)session.getAttribute("cart");
		cart=0;
		session.setAttribute("cart",cart);
		response.sendRedirect("searchproduct.jsp");
	}
%>