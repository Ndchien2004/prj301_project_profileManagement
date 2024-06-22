<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-image: url('images/dark-background-abstract-background-network-3d-background-7680x4320-8324.png');
                background-position: center;
                background-repeat: no-repeat;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                padding: 20px;
                overflow: hidden;
            }
            .container {
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                max-width: 900px;
            }
            .login-container {
                background-color: rgba(0, 0, 0, 0.7);
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                max-width: 400px;
                width: 100%;
                text-align: center;
            }
            .login-container h1 {
                margin-bottom: 24px;
                font-size: 24px;
                color: #3ea6ff;
            }
            .login-container input[type="text"],
            .login-container input[type="password"] {
                width: calc(100% - 20px);
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #666;
                border-radius: 4px;
                box-sizing: border-box;
                background-color: #444;
                color: #fff;
            }
            .button-container {
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
            }
            .login-container input[type="submit"],
            .login-container input[type="reset"] {
                width: 48%;
                padding: 10px;
                background-color: #3ea6ff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
                transition: background-color 0.3s;
            }
            .login-container input[type="submit"]:hover,
            .login-container input[type="reset"]:hover {
                background-color: #1f8ae3;
            }
            .info-container {
                max-width: 400px;
                padding: 20px;
                color: #fff;
                text-align: left;
            }
            .info-container h2 {
                color: #3ea6ff;
                font-size: 24px;
            }
            .info-container p {
                margin-top: 10px;
                font-size: 18px;
            }
            .login-container a {
                color: #3ea6ff;
                text-decoration: none;
            }
            .login-container a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="login-container">
                <h1>Login Page</h1>
                <form action="login" method="POST">
                    <input type="text" name="txtUsername" placeholder="Username" required><br>
                    <input type="password" name="txtPassword" placeholder="Password" required><br>
                    <div class="button-container">
                        <input type="submit" value="Login" name="btAction">
                        <input type="reset" value="Reset">
                    </div>
                    <c:if test="${not empty error}">
                        <h3 style="color: red">${error}</h3>
                    </c:if>
                    <c:if test="${not empty message}">
                        <h3 style="color: green">${message}</h3>
                    </c:if>
                </form>
                <br>
                <p style="color: white"> Need a new account? <a href="register"> Register here</a></p>
                <p><a href="https://www.youtube.com/" target="blank">Click here to get more knowledge</a></p>
            </div>
            <div class="info-container">
                <h2>Welcome to Profile Management Website</h2>
                <p>This website is to manage staff records for an agency</p>
            </div>
        </div>
    </body>
</html>
