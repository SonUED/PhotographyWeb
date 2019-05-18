<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Books Store Application</title>
    <style>
	     <%@ include file="style_form.css"%>
		</style>
		<link href="https://fonts.googleapis.com/css?family=Gugi" rel="stylesheet">
</head>
<body>
    <center>
        <h1>Photo Service Managent</h1>

    </center>
    <div align="center">
	    <c:if test="${existphoto!= null}">
	            <form action="update" method="get">
	        </c:if>
	        <c:if test="${existphoto == null}">
	            <form action="insert" method="get">
	        </c:if>
	        <c:if test="${existphoto != null}">
	            <h2>Edit</h2>
	        </c:if>
	        <c:if test="${existphoto == null}">
	            <h2>Add New</h2>
	        </c:if>
        <table border="1" cellpadding="5">    
         	<input type="hidden" name="id" size="45"value="<c:out value="${existphoto.id}"/>"
             	/>     
         	
            <tr>
                <th>Name Service </th>
                <td>
                    <input type="text" name="name" size="45"
                            value="<c:out value="${existphoto.name }"/>"
                        />
                </td>
            </tr>
            <tr>
                <th>Price</th>
                <td>
                    <input type="text" name="price" size="45"
                            value="<c:out value="${existphoto.price}" />"
                    />
                </td>
            </tr>
            <tr>
                <th>Description</th>
                <td>
                    <input type="text" name="des" size="45"
                            value="<c:out value="${existphoto.des}" />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit"><a>Save</a></button>
                </td>
            </tr>
        </table>
        
    </div>   
</body>
</html>