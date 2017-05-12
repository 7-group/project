<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Login Application</title>
</head>
<body>
<header class="w3-container w3-teal">
  <h3>Login CV Manager</h3>
</header>
<p><c:out value="${errorMsg}"/></p>
<div class="w3-container w3-half w3-margin-top">
	<form class="w3-container w3-card-4" action="loginPath" method="post">
		<p>
		<input class="w3-input" type="text" name="username" style="width:90%" required>
		<label>Username</label></p>
		<p>
		<input class="w3-input" type="password" name="password" style="width:90%" required>
		<label>Password</label></p>
		<p>
		<label>Level</label>
		<select class="w3-select" name="level">
		  <option value="1" selected>User</option>
		  <option value="0">Admin</option>
		</select></p>

		<input class="w3-button w3-section w3-teal w3-ripple" type="submit" value="Login" />
	</form>
	</div>
</body>
</html>