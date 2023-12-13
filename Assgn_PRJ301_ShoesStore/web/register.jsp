<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register</title>

        <style>
            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }
            body{
                height:100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .container {
                display: flex;
                flex-direction: column;
                width: 500px;
                padding: 15px;
                border: 1px solid skyblue;
                border-radius: 5px;
            }
            input{
                margin: 5px 0px;
                height: 50px;
                padding: 7px;
            }
            button{
                height: 40px;
                margin: 5px 0px;
                background-color: skyblue;
                border: none;
                border-radius: 5px;
                color: #333;
            }
            button:hover{
                background-color: #333;
                color: skyblue;
            }
        </style>

    </head>
    <body>
        <form action="RegisterController" method="POST">
            <div class="container">
                <h2 style="text-align: center;">Register</h2>
                <input type="text" placeholder="Username" name="txtUsername"/>
                <input type="password" placeholder="Password" name="txtPassword"/>
                <input type="text" placeholder="Fullname" name="txtFullname"/>
                <button type="submit">Create</button>
                <!--            <input type="text" placeholder="Username">
                            <input type="password" placeholder="Password">
                            <button type="submit">Login</button>-->
                <%
                    String error = (String) request.getAttribute("ERROR");
                    if (error != null && !error.isEmpty()) {
                %>
                <h4 style="color: red; text-align: center;">
                    <%= error%>
                </h4>
                <%
                    }
                %>
                <a href="login.jsp" style="text-align: center; text-decoration: none">Login</a>
                <a href="index.jsp" style="text-align: center; text-decoration: none">Back To Home Page</a>
            </div>
        </form>

    </body>
</html>
