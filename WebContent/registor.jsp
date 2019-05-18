<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Modak|Quicksand:300,400,500,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Kaushan+Script&amp;subset=latin-ext" rel="stylesheet">
    <link rel="stylesheet" href="customer.css">
    <title>Registor</title>
</head>
<body>
  <h3>Create an new Customer</h3>
    <form action="/LoginWithDatabase/resgiCustomer" method="post">
       <div class="form-regis">
            <div class="name">
                    <input type="text" placeholder="Họ" name="ho" required> <input type="text" placeholder="Tên"name="name" required>
            </div> 
            <div class="info">
                    <input type="email" placeholder="Gmail" required>
                    <input type="number" placeholder="SĐT">
                    <input type="username" placeholder="Tên tài khoản">
                    <input type="password" placeholder="Mật khẩu">

            </div>
            <input type="submit" value="Đăng ký">
       </div>
    </form>
     
</body>
</html>