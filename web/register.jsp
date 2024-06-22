<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Page</title>
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
            .register-container {
                background-color: rgba(0, 0, 0, 0.7);
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                max-width: 400px;
                width: 100%;
                text-align: center;
            }
            .register-container h1 {
                margin-bottom: 24px;
                font-size: 24px;
                color: #3ea6ff;
            }
            .register-container input[type="text"],
            .register-container input[type="password"] {
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
            .register-container input[type="submit"],
            .register-container input[type="reset"] {
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
            .register-container input[type="submit"]:hover,
            .register-container input[type="reset"]:hover {
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
            .register-container a {
                color: #3ea6ff;
                text-decoration: none;
            }
            .register-container p {
                color: white;
                text-decoration: none;
            }
            .register-container a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="register-container">
                <h1>Register Page</h1>
                <form action="register" method="POST">
                    <c:if test="${not empty error}">
                        <font color="red">${error}</font>
                        <br>
                    </c:if>
                    <input type="text" name="txtUsername" placeholder="Username (6 - 20 chars)" required><br>
                    <input type="password" name="txtPassword" placeholder="Password (8 - 20 chars)" required><br>
                    <input type="password" name="txtConfirm" placeholder="Confirm Password" required><br>
                    <input type="text" name="txtFullname" placeholder="Full name (2 - 40 chars)" required><br>
                    <div class="button-container">
                        <input type="submit" value="Register" name="btAction">
                        <input type="reset" value="Reset">
                    </div>
                </form>
                <br>
                <c:if test="${not empty requestScope.message}">
                    <p style="color: white">${requestScope.message}</p>
                </c:if>
                <p>You already have an account? <a href="login">Login here</a></p>
            </div>
            <div class="info-container">
                <h2>Welcome to Profile Management Website</h2>
                <p>This website is to manage staff records for an agency</p>
            </div>
        </div>
    </body>
</html>
