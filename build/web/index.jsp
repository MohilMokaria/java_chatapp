<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" href="./index_styles.css"/>
    
    <script>
        function validator(){
            var emailRegex = /^[^\s@]+@[^\s@]+\.[a-z]{2,}$/i;
            var email = document.getElementById("mail").value;
            var pass1 = document.getElementById("pass1").value;
            var pass2 = document.getElementById("pass2").value;
            
            if(!emailRegex.test(email)){
                alert("Invalid Email !");
                return false;
            }
                       
            if(pass1 !== pass2){
                alert("Password Doesn't Match ! Try Again");
                return false;
            }
            
            if(pass1.length < 6 || pass1.length > 12 ){
                alert("Password must be 6 to 12 characters long !");
                return false;
            }
            
            document.getElementById("regform").submit();
            return true;
        }
    </script>
    
</head>
<body>
    <form id="regform" action="SignupServlet" method="post" onsubmit="return validator()">
        <h1>User Sign-up Form</h1>
        <label for="mail">Email ID : </label>
        <input type="email" id="mail" name="mail" autofocus required>

        <label for="pass1">New Password : </label>
        <input type="password" id="pass1" name="pass1" required>
        
        <label for="pass2">Confirm Password : </label>
        <input type="password" id="pass2" name="pass2" required>

        <center><button type="submit">Sign-up</button></center>
        
        <p>Already Signed-up? <a href="./login.jsp">Login</a></p>
    </form>
</body>
</html>
