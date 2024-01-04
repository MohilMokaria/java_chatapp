<%@page import="java.security.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="myClasses.Message" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Simple Chat App</title>

    <!--JQUERY CDN-->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <!-- BOOTSTRAP CDNs -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
        
        <section id="myMenu">    
            <ul class="nav nav-pills mb-3 d-flex justify-content-center" id="pills-tab" role="tablist">
                <li class="nav-item myPill" role="presentation">
                  <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Received Messages</button>
                </li>
                <li class="nav-item myPill" role="presentation">
                  <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Sent Messages</button>
                </li>
                <form id="refreshForm" action="ReceiveMessageServet" method="get">
                    <button type="submit" class="btn btn-outline-success">Refresh Messages</button>
                </form>
            </ul>
            
            <div class="tab-content" id="pills-tabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
                    <%
                        List<Message> messageList = (List<Message>) request.getAttribute("messageList");

                        if (messageList != null && !messageList.isEmpty()) {
                            for (Message message : messageList) {
                    %>
                        <div class="card messages_card">
                          <div class="card-body">
                              <div class="row">
                                  <h5 class="card-title col">FROM: <%= message.getSender() %></h5>
                                  <p class="col text-end"><%= message.getFormattedMsgTime() %></p>
                              </div>
                            <p class="card-text"><%= message.getMsg() %></p>
                          </div>
                        </div>
                    <%
                            }
                        }
                        else {
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
                        <div class="card messages_card">
                          <div class="card-body">
                              <div class="row">
                                  <h5 class="card-title col">TO: <%= message.getReceiver() %></h5>
                                  <p class="col text-end"><%= message.getFormattedMsgTime() %></p>
                              </div>
                            <p class="card-text"><%= message.getMsg() %></p>
                          </div>
                        </div>
                    <%
                            }
                        }
                        else {
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
        </section>

    <% } else { %>
        <p>Please log in to access the chat page.</p>
        <a href="login.jsp">Login</a>
    <% } %>
</body>
</html>
