<%@page import="java.util.Vector" %>

<%
	String pid = request.getParameter("pid");
	Vector<String> vec = (Vector)session.getAttribute("vect");
	vec.removeElement(pid);

	Integer cart = (Integer)session.getAttribute("cart");
	cart--;
	session.setAttribute("cart",cart);
	response.sendRedirect("bill.jsp");	
%>
