<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post">
 <c:forEach var="image" items="${listImage}">
 <h3>Day la hinh anh</h3>
  		<c:out value="${image.id}" />
  		<img src="data:image/jpg;base64,${image.base64Image}"/>
  </c:forEach>
</form>
 
</body>
</html>