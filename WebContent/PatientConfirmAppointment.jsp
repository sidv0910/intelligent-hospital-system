<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Appointment - Patient</title>
<link rel="stylesheet" type="text/css" href="PatientConfirmAppointment.css"> </link>
<script type="text/javascript" src="PatientConfirmAppointment.js"> </script>
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
		String doctor = request.getParameter("doctor");
		String query = "select name, position, salary, path, cudegree, othdegree, d.doctor_id from doctor d, doctor_details dd where d.doctor_id=dd.doctor_id and d.doctor_id=?";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, doctor);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			String name = rs.getString(1);
			String specialization = rs.getString(2);
			int fee = rs.getInt(3);
			String path = rs.getString(4);
			String cudegree = rs.getString(5);
			String othdegree = rs.getString(6);
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
				</table>
				</div>
				
				<div class="inside_2">
				<form method="post" action="BookAppointment" onsubmit="return validate();">
				<table class="details_2">
				<tr> <td> <br> <input type="hidden" name="doctor_id" value="<%=doctor%>"> </td> </tr>
				<tr>
				<td colspan="4" align="center" class="heading"> Book Appointment </td>
				</tr>
				<tr> <td> <br> </td> </tr>
				<tr> <td> <br> </td> </tr>
				<tr>
				<td class="sub-heading"> Symptoms / Disease : </td>
				<td colspan="3" align="right"> <input type="text" name="symptoms" id="symptoms" size="90" class="textfield" required> </td>
				</tr>
				<tr> <td> <br> </td> </tr>
				<tr>
				<td class="sub-heading"> Date : </td>
				<td> &nbsp; <input type="date" name="date" id="date" style="width: 208px;" required> </td>
				<td class="sub-heading"> Time : </td>
				<td align="right">
				<select name="time" id="time" style="width: 208px;" required> 
                    <option value="" disabled selected hidden> Visiting Time  </option>
                    <option value="9 a.m. to 10 a.m."> 9 a.m. to 10 a.m. </option>
                    <option value="10 a.m. to 11 a.m."> 10 a.m. to 11 a.m. </option>
                    <option value="11 a.m. to 12 noon"> 11 a.m. to 12 noon </option>
                    <option value="12 noon to 1 p.m."> 12 noon to 1 p.m. </option>
                    <option value="3 p.m. to 4 p.m."> 3 p.m. to 4 p.m. </option>
                    <option value="4 p.m. to 5 p.m."> 4 p.m. to 5 p.m. </option>
                    <option value="5 p.m. to 6 p.m."> 5 p.m. to 6 p.m. </option>
                    <option value="6 p.m. to 7 p.m."> 6 p.m. to 7 p.m. </option>
                </select>
				</td>
				</tr>
				<tr> <td> <br> </td> </tr>
				<tr>
				<td class="sub-heading"> Height (in cm) : </td>
				<td> &nbsp; <input type="number" name="height" id="height" class="inc" required> </td>
				<td class="sub-heading"> Weight (in kg) : </td>
				<td align="right"> <input type="number" name="weight" id="weight" class="inc" required> </td>
				</tr>
				<tr> <td> <br> </td> </tr>
				<tr> <td> <br> </td> </tr>
				<tr>
				<td colspan="4" align="center"> <input type="submit" value="Submit" class="button" onsubmit="return validate();"> </td>
				</tr>
				</table>
				</form>
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