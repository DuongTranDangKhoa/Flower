<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .login-container h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .login-container input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .login-container button {
            background-color: #4caf50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .login-container button:hover {
            background-color: #45a049;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }

        .register-link {
            margin-top: 10px;
            display: block;
            text-decoration: none;
            color: #333;
        }
    </style>
</head>
<body>
    <form action="LoginController" method="POST" class="login-container">
        <h2>Login</h2>
        <input type="text" placeholder="Username" name="txtUsername" required>
        <input type="password" placeholder="Password" name="txtPassword" required>
        <button type="submit">Login</button>

        <%
            String error = (String) request.getAttribute("ERROR");
            if (error != null && !error.isEmpty()) {
        %>
        <div class="error-message">
            <%= error%>
        </div>
        <%
            }
        %>

        <a href="register.jsp" class="register-link">Register New Account</a>
        <a href="index.jsp" class="register-link">Back To Home Page</a>
    </form>
</body>
</html>
