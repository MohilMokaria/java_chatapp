<%@page import="java.security.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="myClasses.Message" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>

<head>

    <title>Simple Chat App</title>
    <!--FONT AWESOME CDN-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- BOOTSTRAP CDNs -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <!-- LOCAL CSS LINK -->
    <link rel="stylesheet" href="./chat_style.css" />
</head>
<body>
    <%
        if (session.getAttribute("userEmail") != null) {
    %>

    <div class="d-flex justify-content-between">
        <span class="navbar-text mr-3">
            <strong><%= session.getAttribute("userEmail")%></strong>
        </span>

        <form action="LogoutServlet" method="get">
            <button class="btn btn-outline-danger">Logout</button>
        </form>
    </div>

    <%
        String exceptionMsg = (String) request.getAttribute("exception");
        if (exceptionMsg != null && !exceptionMsg.isEmpty()) {
    %>
    <p class="alert alert-danger"><%= exceptionMsg%></p> 
    <%
        }
    %>
    <br>
    <hr class="border border-primary border-2">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-10 col-sm-8 mx-auto">
                <div class="card shadow align-items-center">
                    <div class="card-body d-flex flex-column col-md-9 col-sm-6 mb-4 mt-4">
                        <form action="ChatServlet" method="post">
                            <%
                                String error = (String) request.getAttribute("error");
                                if (error != null && !error.isEmpty()) {
                            %>          
                            <p class="alert alert-danger"><%= error%></p>  
                            <%
                                }
                            %>
                            <div class="mb-4">
                                <h2>New Message</h2>
                            </div>
                            <div class="form-outline mb-4">
                                <label  for="userId"  class="form-label">Receiver's ID:</label>
                                <input type="email" id="userId" name="userId" class="form-control" required/>
                            </div>

                            <div class="form-outline mb-4">
                                <label class="form-label" for="message">Message:</label>
                                <textarea id="message" name="message" class="form-control" required></textarea>
                            </div>

                            <center><button type="submit" class="btn btn-outline-primary btn-block mb-2 sendbtn">Send</button></center>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <section>
        <div class="row align-items-center mt-4 mb-4">
            <div class="col-md-9 col-sm-8 mx-auto">
                
                    <div class="card-body d-flex flex-column">
                        
                        <ul class="nav nav-pills mb-3 d-flex justify-content-between" id="pills-tab" role="tablist">
                            <div class="d-flex">
                                <li class="nav-item myPill" role="presentation">
                                    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Received</button>
                                </li>
                                <li class="nav-item myPill" role="presentation">
                                    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Sent</button>
                                </li>
                            </div>
                            <div class="d-flex gap-1">
                                <form id="refreshForm" action="ReceiveMessageServet" method="get" class="d-flex justify-content-end">
                                    <button type="submit" class="btn btn-outline-success"><i class="fa-solid fa-arrows-rotate"></i></button>
                                </form>
                                <form id="refreshForm" action="ChatServlet" method="get">
                                    <button type="submit" class="btn btn-link">Users List</button>
                                </form>
                            </div>

                        </ul>

                        <div class="tab-content" id="pills-tabContent">
                            <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
                                <%
                                    List<Message> messageList = (List<Message>) request.getAttribute("messageList");

                                    if (messageList != null && !messageList.isEmpty()) {
                                        for (Message message : messageList) {
                                %>
                                <div class="card mb-2">
                                    <div class="card-header">
                                        <%= message.getSender()%>
                                    </div>
                                    <div class="card-body">
                                        <blockquote class="blockquote mb-0">
                                            <p><%= message.getMsg()%></p>
                                            <footer class="blockquote-footer text-muted"><small><%= message.getFormattedMsgTime()%></small></footer>
                                        </blockquote>
                                    </div>
                                </div>
                                <%
                                    }
                                } else {
                                %>
                                <div class="card messages_card">
                                    <div class="card-body">
                                        <div class="row">
                                            <h5 class="card-title col">No Messages Received Yet</h5>
                                        </div>
                                        <p class="card-text">Try Connecting to Friends to Receive Messages!</p>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
                                <%
                                    List<Message> sentList = (List<Message>) request.getAttribute("sentList");

                                    if (sentList != null && !sentList.isEmpty()) {
                                        for (Message message : sentList) {
                                %>
                                <div class="card mb-2">
                                    <div class="card-header">
                                        <%= message.getReceiver()%>
                                    </div>
                                    <div class="card-body">
                                        <blockquote class="blockquote mb-0">
                                            <p><%= message.getMsg()%></p>
                                            <footer class="blockquote-footer"><%= message.getFormattedMsgTime()%></footer>
                                        </blockquote>
                                    </div>
                                </div>
                                <%
                                    }
                                } else {
                                %>
                                <div class="card messages_card">
                                    <div class="card-body">
                                        <div class="row">
                                            <h5 class="card-title col">No Messages Sent to Display</h5>
                                        </div>
                                        <p class="card-text">Try Sending some Messages!</p>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                
            </div>
        </div>
    </section>

    <% } else { %>
    <p>Please log in to access the chat page.</p>
    <a href="login.jsp">Login</a>
    <% }%>
    <hr class="border border-primary border-2">
</body>

