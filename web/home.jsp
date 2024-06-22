<%@ page import="model.Account" %>
<%@ page session="true" %>
<%
    Account account = (Account) session.getAttribute("account");
    if (account == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <link rel="stylesheet" href="Css/Styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                background-image: url('images/dark-background-abstract-background-network-3d-background-7680x4320-8324.png');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                height: 100vh;
                width: 100%;
                overflow: hidden;
            }
        </style>
        <script>
            function navigateTo(page) {
                window.location.href = page;
                
            }
        </script>
    </head>
    <body>
        <div id="nav-bar">
            <div id="nav-header">
                Profile Management
                <label for="nav-toggle">
                    <span id="nav-toggle-burger"></span>
                </label>
                <hr>
            </div>

            <div id="nav-content">
                <div class="nav-button" onclick="navigateTo('general.jsp')">
                    <i class="fas fa-info-circle"></i><span>General Information</span>
                </div>
                <div class="nav-button" onclick="navigateTo('position.jsp')">
                    <i class="fas fa-briefcase"></i><span>Position</span>
                </div>
                <div class="nav-button" onclick="navigateTo('addNhanVienServl')">
                    <i class="fas fa-graduation-cap"></i><span>Education</span>
                </div>
                <div class="nav-button" onclick="navigateTo('department.jsp')">
                    <i class="fas fa-building"></i><span>Departments</span>
                </div>    
                <div class="nav-button" onclick="navigateTo('NhanVien')">
                    <i class="fas fa-users"></i><span>Staff</span>
                </div>
                <div class="nav-button" onclick="navigateTo('rewards.jsp')">
                    <i class="fas fa-award"></i><span>Disciplinary Rewards</span>
                </div>
                <div id="nav-content-highlight"></div>
            </div>

            <input id="nav-footer-toggle" type="checkbox">

            <div id="nav-footer">
                <div id="nav-footer-heading">
                    <div id="nav-footer-avatar">
                        <img src="images/z4959968026255_e8ccdf85b13d9899101a4420a3cccc21.jpg" alt="Avatar">
                    </div>
                    <div id="nav-footer-titlebox">
                        <a id="nav-footer-title" href="authorInformation.html">ndchien12</a>
                        <span id="nav-footer-subtitle">Admin</span>
                    </div>
                    <label for="nav-footer-toggle">
                        <i class="fas fa-caret-up"></i>
                    </label>
                </div>

                <div id="nav-footer-content">
                    <p>Welcome, Admin!</p>
                </div>
            </div>
        </div>
    </body>
</html>
