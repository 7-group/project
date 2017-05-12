<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>CV Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<body>

<header class="w3-container w3-teal">
  <h1>CV Form</h1>
</header>

<div class="w3-container w3-half w3-margin-top" style="margin-left: 25%;">
	<form class="w3-container w3-card-4">
		<p>
		<input class="w3-input" type="text" style="width:90%" required>
		<label>User Name</label></p>
		<p>
		<input class="w3-input" type="password" style="width:90%" required>
		<label>Password</label></p>

		<h2 style="text-decoration: underline;">Basic Information</h2>

		<input class="w3-input" type="text" style="width:90%" required>
		<label>Name</label></p>

		<input class="w3-input" type="text" style="width:90%" required>
		<label>LastName</label></p>

		<input class="w3-input" type="text" style="width:90%" required>
		<label>Profession</label></p>

		<input class="w3-input" type="text" style="width:90%" required>
		<label>Address</label></p>

		<input class="w3-input" type="text" style="width:90%" required>
		<label>email</label></p>

		<input class="w3-input" type="text" style="width:90%" required>
		<label>Telephone</label></p>

		<p>
		<input class="w3-radio" type="radio" name="level" value="1" checked>
		<label>User</label></p>

		<p>
		<input class="w3-radio" type="radio" name="level" value="0">
		<label>Admin</label></p>
		
		<p style="border-top: solid 1px #ccc;">
		<br>
		<label>Add photo</label>
		<br>
		<input class="w3-input" type="file" name="level" value="0">
		</p>

		
		<br><br>

		<p>
		<button class="w3-button w3-section w3-teal w3-ripple"> Add User </button></p>
	</form>
</div>

</body>
</html> 