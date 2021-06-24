<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" type="text/css" href="PatientFooter.css"> </link>
</head>
<body>
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
%>
	<footer>
		<table align="center" cellspacing="10" cellpadding="5">
		    <tr>
		        <th width="250"> Quick Link </th>
		        <th width="200"> Stay Connected </th>
		    </tr>
		    <tr>
		        <td align="left"> <a href="Patient-About.jsp"> <button class="footer_links"> About Us </button> </a> </td>
		        <td rowspan="2" align="left"> 
		            <a href="https://twitter.com/"><img src="twitter.png" width="50" height="50"></a> &nbsp;
		            <a href="https://www.facebook.com/"><img src="facebook.png" width="40" height="40"></a> &nbsp;
		            <a href="https://www.youtube.com/"><img src="youtube.png" width="60" height="42"></a>
		        </td>
		    </tr>
		    <tr>
		        <td align="left"> <a href="Patient-Contact.jsp"> <button class="footer_links"> Contact Us </button> </a> </td>
		    </tr>
		    <tr>
		        <td align="left" style="vertical-align: top;"> <a href="Patient-Query.jsp"> <button class="footer_links"> Post a Query </button> </a> </td>
		        <td rowspan="2" align="center">
		            <img src="bottom.png" width="150" height="60">
		        </td>
		    </tr>
		</table>
	</footer>
<%

}
%>
</body>
</html>