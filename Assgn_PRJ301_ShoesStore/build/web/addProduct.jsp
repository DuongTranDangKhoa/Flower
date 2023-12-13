<%@page import="java.util.Date"%>
<%@page import="model.Account"%>
<%@page import="DAO.AccountDBContext"%>
<%@page import="model.Order"%>
<%@page import="DAO.OrderDBContext"%>
<%@page import="model.Product"%>
<%@page import="DAO.ProductDBContext"%>
<%@page import="model.Category"%>
<%@page import="DAO.CategoryDBContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Boxicons -->
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <!-- My CSS -->
        <link rel="stylesheet" href="style.css">

        <title>ShoesStore</title>
    </head>
    <body>


        <!-- SIDEBAR -->
        <section id="sidebar">
            <a href="#" class="brand">
                <i class='bx bxs-smile'></i>
                <span class="text">Shoes Store</span>
            </a>
            <ul class="side-menu top">
                <li>
                    <a href="index.jsp">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Home</span>
                    </a>
                </li>
                <li class="active">
                    <a href="manage.jsp">
                        <i class='bx bxs-doughnut-chart' ></i>
                        <span class="text">Manage</span>
                    </a>
                </li>
                <li class="active" style="margin-left: 50px;">
                    <a href="addProduct.jsp">
                        <i class='bx bxs-calendar-check' ></i>
                        <span class="text">Add New Product</span>
                    </a>
                </li>
                <li style="margin-left: 50px;">
                    <a href="addCategory.jsp">
                        <i class='bx bxs-calendar-check' ></i>
                        <span class="text">Add New Category</span>
                    </a>
                </li>
                <li style="margin-left: 50px;">
                    <a href="register.jsp">
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">Add New Account</span>
                    </a>
                </li>
            </ul>
            <%
                if (session.getAttribute("USER") != null) {
            %>
            <ul class="side-menu">
                <li>
                    <a href="LogoutController" class="logout">
                        <i class='bx bxs-log-out-circle' ></i>
                        <span class="text">Logout</span>
                    </a>
                </li>
            </ul>
            <%
            } else {
            %>
            <ul class="side-menu">
                <li>
                    <a href="login.jsp" class="login">
                        <i class='bx bxs-log-in-circle' ></i>
                        <span class="text">Login</span>
                    </a>
                </li>
            </ul>
            <%
                }
            %>

        </section>
        <!-- SIDEBAR -->



        <!-- CONTENT -->
        <section id="content">
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>ADD NEW PRODUCT</h1>
                    </div>
                </div>
                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Product</h3>
                        </div>
                        <form action="AddProductController" method="GET">
                            Product Name: <input style="border: none;  " type="text" name="ProductName" value="" />
                            <br>
                            Price: <input style="border: none; " type="text" name="Price" value="" />
                            <br>
                            Description: <input style="border: none; " type="text" name="Description" value="" />
                            <br>
                            Image Url: <input style="border: none; " type="text" name="img" value="" />
                            <br>
                            <%
                                CategoryDBContext categoryDBContext = new CategoryDBContext();
                                List<Category> listCate = categoryDBContext.getAllCategories();
                                int cateNum = listCate.size();
                            %>
                            <select id="category" name="category">
                                <%
                                    for (Category cate : listCate) {
                                %>
                                <option value="<%= cate.getCategoryId()%>"><%= cate.getCategoryName()%></option>
                                <%
                                    }
                                %>
                                <input type="submit" value="Add" name="btAction" />
                            </select>
                        </form>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="script.js"></script>
    </body>
</html>
