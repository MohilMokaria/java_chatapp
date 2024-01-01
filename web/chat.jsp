<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Simple Chat App</title>
    
    <!-- BOOTSTRAP CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <!-- LOCAL CSS LINK -->
    <link rel="stylesheet" href="./chat_style.css" />
</head>
<body>

    <% if (session.getAttribute("userEmail") != null) { %>

        <div class="d-flex justify-content-between">
            <span class="navbar-text mr-3">
                <strong><%= session.getAttribute("userEmail") %></strong>
            </span>

            <form action="LogoutServlet" method="get">
                <button class="btn btn-outline-danger">Logout</button>
            </form>
        </div>

        <hr class="border border-primary border-2">
        <form action="ChatServlet" method="post" class="container card mybox">
            <div class="grid gap-0 row-gap-3">
                <div class="myinp">
                    <h2>New Message</h2>
                </div>
                <div class="myinp">
                    <label for="userId" class="col-sm-2 col-form-label col-form-label-lg">Receiver's ID:</label>
                    <input type="text" id="userId" name="userId" class="form-control form-control-lg" required>
                </div>
                <div class="myinp">
                    <label for="message" class="col-sm-2 col-form-label col-form-label-lg">Message:</label>
                    <textarea id="message" name="message" class="form-control form-control-lg" required></textarea>
                </div>
            </div>
            <div class="col-2 d-grid myinp align-self-end">
                <button type="submit" class="btn btn-outline-primary">Send</button>
            </div>
        </form>
        <hr class="border border-primary border-2">

        

    <% } else { %>
        <p>Please log in to access the chat page.</p>
        <a href="login.jsp">Login</a>
    <% } %>

</body>
</html>
