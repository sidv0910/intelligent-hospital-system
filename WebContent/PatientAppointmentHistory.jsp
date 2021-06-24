<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment History - Patient</title>
<link rel="stylesheet" type="text/css" href="PatientAppointmentHistory.css"> </link>
</head>
<body>

<jsp:include page="PatientHeader.jsp"></jsp:include>

<%
HttpSession sess = request.getSession(false);
if (sess == null)
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
		
		String pid = sess.getAttribute("pid").toString();
		String query = "select * from appointments where patient_id=?";
		PreparedStatement pstmt = conn.prepareStatement(query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt.setString(1, pid);
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			rs.beforeFirst();
%>
			<table class="true">
				<caption> APPOINTMENT HISTORY </caption>
				<tr>
					<th style="border-left: 2px solid black;"> Doctor's Name </th>
					<th> Symptoms </th>
					<th> Date </th>
					<th> Time </th>
					<th> Status </th>
				</tr>
<% 			while(rs.next()) 
			{
				String query2 = "select name from doctor where doctor_id=?";
				PreparedStatement pstmt2 = conn.prepareStatement(query2);
				pstmt2.setString(1, rs.getString(2));
				ResultSet rs2 = pstmt2.executeQuery();
				rs2.next();
%>
				<tr>
					<td> <%= rs2.getString(1) %> </td>
					<td> <%= rs.getString(3) %> </td>
					<td> <%= rs.getString(4) %> </td>
					<td> <%= rs.getString(5) %> </td>
					<td> <%= rs.getString(8) %> </td>
				</tr>
<% 
			}
%>
			</table>
<% 
		}
		else
		{
%>
			<table class="false">
			<tr>
			<td align="center"> No appointments booked by you yet. </td>
			</tr>
			</table>
<%			
		}
		
	}
	catch (ClassNotFoundException e) 
	{
		out.println("<script>");
		out.println("alert(\"Sorry, unable to fetch your appointment history.\")");
		out.println("window.location.href=\"Patient-Login-Home.jsp\"");
		out.println("</script>");
	}
	catch (SQLException e) 
	{
		e.printStackTrace();
		out.println("<script>");
		out.println("alert(\"Sorry, unable to fetch your appointment history.\")");
		out.println("window.location.href=\"Patient-Login-Home.jsp\"");
		out.println("</script>");
	}	
}
%>

<jsp:include page="PatientFooter.jsp"></jsp:include>

</body>
</html>