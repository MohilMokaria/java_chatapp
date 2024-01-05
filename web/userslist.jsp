<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users List</title>
        <!-- BOOTSTRAP CDNs -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <div class="container">
            <div class="row align-items-center vh-100">
                <div class="col-md-6 col-sm-9 mx-auto">
                    <div class="card shadow border">
                        <div class="card-body d-flex flex-column align-items-center">
                            <h1>Registered Users</h1>
                            <ol>
                                <%
                                    List<String> users = (List<String>) request.getAttribute("usersList");

                                    if (users != null && !users.isEmpty()) {
                                        for (String user : users) {
                                %>
                                <li class="card-text"><%= user%></li>                  
                                    <%
                                            }
                                        }
                                    %>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
