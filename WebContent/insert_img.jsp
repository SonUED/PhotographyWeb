<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Image</title>
</head>
<body>
	<form action="/LoginWithDatabase/image" method="post" enctype="multipart/form-data">
		<input type="text" name="name">
		<input type="file" name="img"> 
		<button type="submit">Add</button>
	</form>
</body>
</html>