<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
		<style>
	     <%@ include file="style_list.css"%>
		</style>
		<link href="https://fonts.googleapis.com/css?family=Gugi" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>List Service</title>
</head>
<body>
 <center>
     
    </center>
    <div class="box-list" align="center">
       <h1>List Service of Photoshot</h1>
        <table border="1" cellpadding="5">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Price</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="photo" items="${listPhoto}">
                <tr>
                    <td><c:out value="${photo.id}" /></td>
                    <td><c:out value="${photo.name}" /></td>
                    <td><c:out value="${photo.price}" /></td>
                    <td><c:out value="${photo.des}" /></td>
                    <td>
                        <a href="/LoginWithDatabase/edit?id=<c:out value="${photo.id}"/>">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="/LoginWithDatabase/delete?id=<c:out value="${photo.id}"/>">Delete</a>                     
                    </td>
                </tr>
            </c:forEach>
        </table>
        <button type="button"><a href="/LoginWithDatabase/PhotoForm.jsp">Add</a></button>
    </div>  
</body>
</html>