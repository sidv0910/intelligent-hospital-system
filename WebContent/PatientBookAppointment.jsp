<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Appointment - Patient</title>
<link rel="stylesheet" type="text/css" href="PatientBookAppointment.css"> </link>
</head>
<body>

<jsp:include page="PatientHeader.jsp"></jsp:include>

<div class="outside">

<%
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
		
		String query = "select name, position, salary, path, cudegree, othdegree, d.doctor_id from doctor d, doctor_details dd where d.doctor_id=dd.doctor_id";
		PreparedStatement pstmt = conn.prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			String name = rs.getString(1);
			String specialization = rs.getString(2);
			int fee = rs.getInt(3);
			String path = rs.getString(4);
			String cudegree = rs.getString(5);
			String othdegree = rs.getString(6);
			String doctor = rs.getString(7);
			String degree = "";
			if (othdegree == null || othdegree.equals(""))
				degree = cudegree;
			else
				degree = cudegree + ", " + othdegree;
			%>
				<div class="inside">
				<table class="details">
				<tr>
				<td align="center"> <img src="<%= path %>" align="center" height="300" width="300"> </td>
				</tr>
				<tr> <td> <br> </td> </tr>
				<tr>
				<td align="center" style="font-size: 35px;"> <b> <%= name %> </b> </td>
				</tr>
				<tr>
				<td align="center"> <b> <%= degree %> </b> </td>
				</tr>
				<tr>
				<td align="center"> <b> <%= specialization %> </b> </td> 
				</tr>
				<tr> <td> <br> </td> </tr>
				<tr>
				<td align="center" style="color: black; font-size: 20px;"> Fee : <%= fee %> </td>
				</tr>
				<tr> <td> <br> </td> </tr>
				<tr>
				<td align="center">
				<form action="PatientConfirmAppointment.jsp" method="post">
				<input type="hidden" name="doctor" value="<%=doctor%>">
				<input type="submit" value="Book Appointment" class="button">
				</form>
				</td>
				</tr>
				</table>
				</div>
			<%
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

</div>

<jsp:include page="PatientFooter.jsp"></jsp:include>

</body>
</html>