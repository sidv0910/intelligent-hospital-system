<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Profile - Patient</title>
<link rel="stylesheet" type="text/css" href="PatientViewProfile.css"> </link>
</head>
<body>

<jsp:include page="PatientHeader.jsp"></jsp:include>

<%
String patient_id, username, email, name, gender, dob, marital, profession, address, path, emgName, emgRelation;
int age;
long mobile, emgContact;

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
		
		String query = "select * from patient where patient_id=?";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, ses.getAttribute("pid").toString());
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			patient_id = rs.getString(1);
			username = rs.getString(2);
			email = rs.getString(3);
			name = rs.getString(5);
			gender = rs.getString(6);
			dob = rs.getString(7);
			marital = rs.getString(8);
			age = Integer.parseInt(rs.getString(9));
			profession = rs.getString(10);
			mobile = Long.parseLong(rs.getString(11));
			address = rs.getString(12);
			emgName = rs.getString(13);
			emgRelation = rs.getString(14);
			emgContact = Long.parseLong(rs.getString(15));
			path = rs.getString(16);
%>

<div class="profilepic">
<img src="<%= path %>" align="center" height="200" width="175">
</div>

<div>
<table width="96%" class="head">
<tr> <td> <h1 align="center"> Profile </h1> </td> </tr>
</table>
</div>

<div class="data">
<center>
<table width="96%" bgcolor="white" cellpadding="15">
<tr>
<td> Patient ID : </td>
<td> <input type="text" value="<%= patient_id %>" size="41" readonly> </td>
<td> Username : </td>
<td> <input type="text" value="<%= username %>" size="41" readonly> </td>
<td> Email : </td>
<td> <input type="text" value="<%= email %>" size="41" readonly> </td>
</tr>
<tr>
<td> Name : </td>
<td> <input type="text" value="<%= name %>" size="41" readonly> </td>
<td> Gender : </td>
<td> <input type="text" value="<%= gender %>" size="41" readonly> </td>
<td> Date of Birth : </td>
<td> <input type="text" value="<%= dob %>" size="41" readonly> </td>
</tr>
<tr>
<td> Marital Status : </td>
<td> <input type="text" value="<%= marital %>" size="41" readonly> </td>
<td> Age : </td>
<td> <input type="text" value="<%= age %>" size="41" readonly> </td>
<td> Profession : </td>
<td> <input type="text" value="<%= profession %>" size="41" readonly> </td>
</tr>
<tr>
<td> Mobile : </td>
<td> <input type="text" value="<%= mobile %>" size="41" readonly> </td>
<td> Address : </td>
<td colspan="3"> <input type="text" value="<%= address %>" size="118" readonly> </td>
</tr>
</table>
</center>
</div>

<div>
<table width="96%" class="head">
<tr> <td> <h1 align="center"> In Case of Emergency </h1> </td> </tr>
</table>
</div>

<div class="data">
<center>
<table width="96%" bgcolor="white" cellpadding="15">
<tr>
<td> Name : </td>
<td> <input type="text" value="<%= emgName %>" size="41" readonly> </td>
<td> Relation : </td>
<td> <input type="text" value="<%= emgRelation %>" size="41" readonly> </td>
<td> Contact : </td>
<td> <input type="text" value="<%= emgContact %>" size="41" readonly> </td>
</tr>
</table>
</center>
</div>

<%
		}
		else
		{
			out.println("<script>");
			out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
			out.println("window.location.href=\"Home.html\"");
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

<jsp:include page="PatientFooter.jsp"></jsp:include>

</body>
</html>