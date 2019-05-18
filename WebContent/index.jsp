<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<style>
	     <%@ include file="style.css"%>
		</style>
		<link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<center>
		<form action="/LoginWithDatabase/decent" method="post">
	<div class="box-login">
		<img alt="" src="https://cdn1.iconfinder.com/data/icons/ninja-things-1/1772/ninja-simple-512.png">
		<span>Enter Username :</span><input type="text" name="username"><br>
		<span>Enter Password :</span><input type="password" name="password"><br>
		
		<button type="submit" >Login</button>
	</div>
		
		</form>
	</center>
	
</body>
</html>