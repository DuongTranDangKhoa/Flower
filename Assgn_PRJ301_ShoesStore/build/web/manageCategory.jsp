<%@page import="model.Account"%>
<%@page import="model.Order"%>
<%@page import="DAO.AccountDBContext"%>
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

        <title>CMS</title>
    </head>
    <body>


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
                <li style="margin-left: 50px;">
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



        <!-- CONTENT -->
        <section id="content">
            <!-- MAIN -->
            <main>
                <div class="head-title">
                    <div class="left">
                        <h1>MANAGE</h1>
                    </div>
                </div>
                <%
                    CategoryDBContext categoryDBContext = new CategoryDBContext();
                    List<Category> listCate = categoryDBContext.getAllCategories();
                    int cateNum = listCate.size();

                    ProductDBContext productDBContext = new ProductDBContext();
                    List<Product> listPro = productDBContext.getAllProducts();
                    int proNum = listPro.size();

                    OrderDBContext orderDBContext = new OrderDBContext();
                    List<Order> listOrder = orderDBContext.getAllOrder();
                    int orderNum = listOrder.size();

                    AccountDBContext accountDBContext = new AccountDBContext();
                    List<Account> listAccount = accountDBContext.getAllAccount();
                    int accountNum = listAccount.size();
                %>
                <%
                   Integer cateID = Integer.parseInt(request.getParameter("madm"));
                   String cateName = request.getParameter("tendm");
                %>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Category</h3>
                        </div>
                        <form action="ManageCategoryController" method="GET">
                            Category ID: <%= cateID %> 
                            <br>
                            Category Name: <input style="border: none;  " type="text" name="cateName" value="<%= cateName %>" />
                            
                            <input type="hidden" name="cateID" value="<%= cateID%>" />
                            <input type="hidden" name="cateName" value="<%= cateName%>" />
                            <input type="submit" value="Update" name="btAction" />
                            <input type="submit" value="Delete" name="btAction" />
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
