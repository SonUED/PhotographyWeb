<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
*{
	margin : 0 ;
	padding: 0;
	box-sizing: border-box;
}
.header{
	width : 100%;
	z-index : 50;
	position: fixed;
	top : 0px;
}
header{
    background-color: #333;
    display: block;
    text-align: right;
    
}
header span{
    font-family: "Quicksand";
    font-size: 90%;
    font-weight: 500;
    color: white;
}
header a{
    text-decoration: none;
    color: white;
    margin-right: 30px;
}
nav{
    z-index: 20;
    overflow: hidden;
    background-color : hsl(193, 72%, 26%);
}
/* Nav link */
nav a{
    text-decoration: none;
    color: white;
    float: left;
    font-size: 110%;
    text-align: center;
    padding: 14px 16px;
    font-family: "Quicksand";
}
/* Sub nav */
.subnav{
    float: left;
    overflow: hidden;
}
/* Subnav button */
.subnav .subnav-btn{
    font-family: "Quicksand";
    font-size: 16px;
    border: none;
    outline: none;
    color: white;
    padding: 14px 16px;
    background-color: inherit;
    margin: 0;
}
nav a:hover, .subnav:hover .subnav-btn{
    background-color : hsl(193, 72%, 26%);
}
.subnav-content{
    display: none;
    position: absolute;
    left: 0;
    background-color : hsl(193, 45%, 46%);
    width: 100%;
    z-index: 1;
}
.subnav-content a{
    float: left;
    color: white;
    text-decoration: none;

}
/* add grey color on hover */
.subnav-content a:hover{
    background-color: #eee;
    color: black;
}
/* whhen you hoverr mouse the subnav, opne subnav content */
.subnav:hover .subnav-content{
    display: inline-block;
}
/* ====LOGIN==== */
.login{
	top : 0;
    float: right;
    font-family: "Quicksand";
  
}
.login button{
    border: none;
}
.login a{
    padding: 7px 7px 7px 7px;
    background-color: hsl(193, 45%, 50%);
}
.user-login{
	position : relative;
	z-index : 2000;
	display: block;
	margin-top: -44px;
	  width: 200px;
	margin-right: 20px;
	margin-top: 0px;
}
.user-login a{
	color :white;
	  padding: 14px 16px;
	
	}
 .user-login a:hover{
	border : 1px solid hsl(193, 72%, 26%);
	color : black;
	background-color: white;
}
.login .user-info{
	display: none;
	width: 100%;
	right: 0;

}
.user-info a{
   	right: 0;
   	padding : 5px 5px;
    background-color : hsl(193, 45%, 46%);
    width: 100%;
    z-index: 1;
}
.user-info a:hover{
	border : 1px solid hsl(193, 72%, 26%);
	color : black;
	background-color: white;
}
.user-login:hover .user-info{
	display : flex;
}

</style>
</head>
<body>
	 <div class="header">
	 	<header>
        <span><a href="tel:+0972053951">Hotline : 0972053951 </a></span>
    </header>
    <nav>
        <a href="#home">Home</a>
        <div class="subnav">
                <button class="subnav-btn">Giới thiệu<i class="fa fa-caret-down"></i></button>
                <div class="subnav-content">
                    <a href="#">Thông tin</a>
                    <a href="#">Liên hệ</a>
                </div>
        </div>
        <div class="subnav">
                <button class="subnav-btn">Chụp ảnh ngoại cảnh<i class="fa fa-caret-down"></i></button>
                <div class="subnav-content">
                        <a href="#">Chụp đơn</a>
                        <a href="#">Chụp đôi</a>
                        <a href="#">Chụp nhóm</a>
                    </div>
        </div>
        <div class="subnav">
                <button class="subnav-btn">Chụp ảnh cưới<i class="fa fa-caret-down"></i></button>
                <div class="subnav-content">
                        <a href="#">Chụp đám hỏi</a>
                        <a href="#">Chụp ngoại cảnh</a>
                        <a href="#">Chụp tiệc</a>                    
                    </div>
        </div>
        <div class="subnav">
                <button class="subnav-btn">Chụp ảnh sản phẩm<i class="fa fa-caret-down"></i></button>
                <div class="subnav-content">
                        <a href="#">Chụp sản phẩm</a>                 
                    </div>
        </div>
        <div class="subnav">
                <button class="subnav-btn">Quay phim<i class="fa fa-caret-down"></i></button>
                <div class="subnav-content">
                        <a href="#">Quay Pre-Wedding</a>
                        <a href="#">Quay phóng sự cưới</a>         
                        <a href="#">Quay sản phẩm</a>                    
                    </div>
        </div>
           <div class="login">
           <c:if test="${role == null }">
            <button><a href="index.jsp">Login</a></button>
            <button><a href="#">Register</a></button>
            </c:if>
            <c:if test="${role != null }">
            <div class="user-login">
                <a><c:out value ="${role }"></c:out></a>
            
            <div class="user-info">
            	<a>About</a>
            	<a href="/LoginWithDatabase/logout">Log out</a>
            </div>
             </div>
            </c:if>         
        </div>
         </nav>
	 </div>
     
       
       
   
</body>
</html>