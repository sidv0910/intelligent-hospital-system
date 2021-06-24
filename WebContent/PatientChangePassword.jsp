<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password - Patient</title>
<link rel="stylesheet" type="text/css" href="PatientChangePassword.css"> </link>
<script type="text/javascript" src="PatientChangePassword.js"> </script>
</head>
<body>

<jsp:include page="PatientHeader.jsp"></jsp:include>

<form method="post" action="PatientChangePassword" align="center" onsubmit="return validate();">
	<table width='344px' align='center' class='head'>
		<tr align='center'>
			<td> <h1> <u> Change Password </u> </h1> </td>
		</tr>
		<table align='center' width='344px'>
            <tr>
				<td align="center"> <input type='password' name='old' size="41" id="old" placeholder="Current Password" class="old" required > </td>
			</tr>
			<tr> 
				<td> <br> </td> 
			</tr>
			<tr>
				<td align="center"> <input type='password' name='new' size="41" id="new" placeholder="New Password" class="new" required> </td>
			</tr>
			<tr> 
				<td> <br> </td> 
			</tr>
			<tr>
				<td align="center"> <input type='password' name='repeat' size="41" id="repeat" placeholder="Confirm New Password" class="repeat" required> </td>
            </tr>
			<table width='344px' align='center' class='tail'>
				<tr>
					<td align='center'> <input type='submit' name='submit' value="Submit" class='button'></td>
				</tr>
			</table>
		</table>
	</table>
</form>

<jsp:include page="PatientFooter.jsp"></jsp:include>

</body>
</html>