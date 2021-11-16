<%@ page import="java.util.*" %>

<%
	String cat = request.getParameter("cat"); 
	String cmp = request.getParameter("cmp"); 
	String pro = request.getParameter("pro"); 

	Vector<String> vec = (Vector)session.getAttribute("vect");
	vec.addElement(pro);
	Integer cart = (Integer)session.getAttribute("cart");
	cart++;
	session.setAttribute("cart",cart);
	response.sendRedirect("searchproduct.jsp?category="+cat+"&company="+cmp+""); 	
%>