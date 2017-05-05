<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Application</title>
</head>
<style>
fieldset{
border: blue 2px solid;
}
input { border: 1px solid #f00; 
border-radius: 3px;}
.inputSub { border: 1px solid blue;
background: white;
cursor: pointer}
</style>
<body>
	<form action="loginPath" method="post">
	<center>
		<fieldset style="width: 300px">
			<legend> Login to App </legend>
			<table>
			<tr>
				<td colspan="2"><c:out value="${errorMsg}"/> </td>
			</tr>
				<tr>
					<td>User ID</td>
					<td><input type="text" name="username" required="required" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" required="required" /></td>
				</tr>
				<tr>
					<td><input class="inputSub" type="submit" value="Login" /></td>
				</tr>
			</table>
		</fieldset>
		</center>
	</form>
</body>
</html>