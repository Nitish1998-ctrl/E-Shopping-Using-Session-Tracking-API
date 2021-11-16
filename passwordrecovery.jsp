<%@page import="career.connection.dao" %>
<%@page import="java.sql.*" %>

<%@ page import="javax.servlet.*,
		javax.servlet.http.*,
		java.io.*,
		java.util.Properties,  
		javax.mail.*,  
		javax.mail.internet.*,  
		javax.activation.*, 
		java.text.*"
%>

<%
	String un = request.getParameter("t1");
	String emailto = request.getParameter("t3");
	String pass="";	
	try
	{
		Connection con = dao.createconnection();
		PreparedStatement ps = con.prepareStatement("SELECT * from rangoli_signup where login_name=? and current_email=?");
		ps.setString(1,un);
		ps.setString(2,emailto);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			pass = rs.getString("password");
			application.setAttribute("status","1");
		}
		else
		{
			pass = "0";
			application.setAttribute("status","0");
		}
		con.close();
	}
	catch(Exception e)
	{
		System.out.println("passwordrecovery.jsp "+e);	
	}
%>


<%
if(!pass.equals("0"))
{
	final String from = "nupur.careercomputer@gmail.com";  
	final String pass1 = "sharadcareer123";
		
	final String to = emailto;
	String subject = "Password Recovery from MailSender.com";
	String body = "Your Current Password is :- " + pass;
	
	Properties props = new Properties();
	props.put("mail.smtp.host", "smtp.gmail.com");
	props.put("mail.smtp.socketFactory.port", "465");
	props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.port", "465");

	try
	{
	
		// Get the Session object.
		Session ses = Session.getInstance(props,
		new javax.mail.Authenticator()
		{
			protected PasswordAuthentication getPasswordAuthentication()
			{
			return new PasswordAuthentication(from,pass1);
			}
		});

	
		Message message = new MimeMessage(ses);
		message.setFrom(new InternetAddress(from));
		message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to));
		message.setSubject(subject);
		message.setContent(body,"text/html");
		Transport.send(message);
		ses=null;
	} 
	catch(MessagingException e)
	{
		System.out.println(e);
	}	
}
	
	response.sendRedirect("forgotpassword.jsp?un="+un);
%>