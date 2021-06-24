<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" type="text/css" href="PatientHeader.css"> </link>
</head>
<body topmargin="0" leftmargin="0">
<% 
String name = "";
HttpSession ses = request.getSession(false);
if (ses == null)
{
	out.println("<script>");
	out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
	out.println("window.location.href=\"Patient-Login.html\"");
	out.println("</script>");
}
else
{
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Intelligent_Hospital_System", "EP_Practical", "190032121");
		
		String query = "select name from patient where patient_id=?";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, ses.getAttribute("pid").toString());
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			name = rs.getString(1);
%>
		<header>
			<img src="Logo.png" width="289" height="102" class="logo">
			<div class="dropdown0">
			    <button class="dropbtn0"> <%= name %> &NoBreak; &#9660; </button>
			    <div class="dropdown-content-0">
			        <a href="PatientViewProfile.jsp"> View Profile </a>
			        <a href="PatientUpdateProfile.jsp"> Update Profile </a>
			        <a href="PatientChangePassword.jsp"> Change Password </a>
			        <a href="PatientLogout"> Log Out </a>
			    </div>
			</div>
			<a href="PatientAppointmentHistory.jsp"> <button class="home"> Appointment History </button> </a>
			<a href="PatientBookAppointment.jsp"> <button class="home"> Book Appointment </button> </a>
			<a href="Patient-Login-Home.jsp"> <button class="home"> Home </button> </a>
		</header>
<%
		}
		else
		{
			out.println("<script>");
			out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
			out.println("window.location.href=\"Patient-Login.html\"");
			out.println("</script>");
		}
	}
	catch (ClassNotFoundException e)
	{
		out.println("<script>");
		out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
		out.println("window.location.href=\"Patient-Login.html\"");
		out.println("</script>");
	}
	catch (SQLException e)
	{	
		out.println("<script>");
		out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
		out.println("window.location.href=\"Patient-Login.html\"");
		out.println("</script>");
	}
	catch (NullPointerException e)
	{
		out.println("<script>");
		out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
		out.println("window.location.href=\"Patient-Login.html\"");
		out.println("</script>");
	}
}
%>
</body>
</html>