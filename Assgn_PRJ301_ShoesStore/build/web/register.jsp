<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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

        .register-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            text-align: center;
        }

        .register-container h2 {
            color: #333;
            margin-bottom: 20px;
        }

        .register-container input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .register-container button {
            background-color: green;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .register-container button:hover {
            background-color: #4CAF50;
        }

        .error-message {
            color: red;
            margin-top: 10px;
        }

        .login-link {
            margin-top: 10px;
            display: block;
            text-decoration: none;
            color: #333;
        }

        .back-to-shop {
            margin-top: 10px;
            display: block;
            text-decoration: none;
            color: #333;
        }
    </style>
</head>
<body>
    <form action="RegisterController" method="POST" class="register-container">
        <h2>Register</h2>
        <input type="text" placeholder="Username" name="txtUsername" required>
        <input type="password" placeholder="Password" name="txtPassword" required>
        <input type="text" placeholder="Fullname" name="txtFullname" required>
        <button type="submit">Submit</button>

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

        <a href="login.jsp" class="login-link">Login</a>
        <a href="index.jsp" class="back-to-shop">Back To Shop</a>
    </form>
</body>
</html>
