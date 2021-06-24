<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us - Doctor</title>
<link rel="stylesheet" type="text/css" href="Patient-Query.css"> </link>
<script type="text/javascript" src="Patient-Query.js"> </script>
</head>
<body>

<jsp:include page="DoctorHeader.jsp"></jsp:include>

<%
String name = "";
String email = "";
long mobile = 0;
HttpSession ses = request.getSession(false);
if (ses == null)
{
	out.println("<script>");
	out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
	out.println("window.location.href=\"Doctor-Login.html\"");
	out.println("</script>");
}
else
{
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Intelligent_Hospital_System", "EP_Practical", "190032121");
		
		String query = "select name, email, mobile from doctor where doctor_id=?";
		PreparedStatement pstmt = conn.prepareStatement(query);
		pstmt.setString(1, ses.getAttribute("did").toString());
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next())
		{
			name = rs.getString(1);
			email = rs.getString(2);
			mobile = rs.getLong(3);
%>

<form name="form" method="post" action="" align="center" onsubmit="return validate();">
    <table width='650px' align='center' class='head'>
        <tr align='center'>
            <td> <h1> <u> Post a Query </u> </h1> </td>
        </tr>
        <table width='650px' align='center'>
            <tr>
                <td align="center"> <input type='text' name='name' id='name' size="40" placeholder="Name" value="<%= name %>" class="constant" readonly> </td>
                <td align="center"> <input type='email' name='email' id='email' size="40" placeholder="Email" value="<%= email %>" class="constant" readonly> </td>
            </tr>
            <tr> 
                <td> <br> </td> 
            </tr>
            <tr>
                <td align="center"> <input type='text' name='mobile' id='mobile' size="40" placeholder="Contact No." value="<%= mobile %>" class="constant" readonly> </td>
                <td align="center"> <input type='text' name='subject' id='subject' size="40" placeholder="Subject" class="constant" required> </td>
            </tr>
            <tr> 
                <td> <br> </td> 
            </tr>
            <tr>
                <td align="left"> &nbsp; Enter Message : </td>
            </tr>
            <tr>
                <td align="center" colspan="2"> <textarea rows="3" cols="90" name="message" id="message" required ></textarea> </td>
            </tr>
            <tr> 
                <td> <br> </td> 
            </tr>
            <table width='650px' align='center' class='tail'>
                <tr>
                    <td align='center'> <input type='submit' name='submit' value="Submit" class='button'></td>
                </tr>
            </table>
        </table>
    </table>
</form>

<%
		}
		else
		{
			out.println("<script>");
			out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
			out.println("window.location.href=\"Doctor-Login.html\"");
			out.println("</script>");
		}
	}
	catch (ClassNotFoundException e)
	{
		out.println("<script>");
		out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
		out.println("window.location.href=\"Doctor-Login.html\"");
		out.println("</script>");
	}
	catch (SQLException e)
	{	
		out.println("<script>");
		out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
		out.println("window.location.href=\"Doctor-Login.html\"");
		out.println("</script>");
	}
	catch (NullPointerException e)
	{	
		out.println("<script>");
		out.println("alert(\"Sorry, you haven't logged in. \\nPlease login first!\")");
		out.println("window.location.href=\"Doctor-Login.html\"");
		out.println("</script>");
	}
}
%>

<jsp:include page="DoctorFooter.jsp"></jsp:include>

</body>
</html>