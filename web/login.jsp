<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" href="./index_styles.css"/>
</head>
<body>
    <form id="regform" action="LoginServlet" method="post">
        <h1>User Login Form</h1>
        <label for="mail">Email ID : </label>
        <input type="email" id="mail" name="mail" value="mohil@mokaria.com" required>

        <label for="pass">New Password : </label>
        <input type="password" id="pass" name="pass" value="1234567" required>

        <center><button type="submit" autofocus>Login</button></center>
        
        <p>Don't have a account? <a href="./index.jsp">Sign-up</a></p>
    </form>
</body>
</html>
