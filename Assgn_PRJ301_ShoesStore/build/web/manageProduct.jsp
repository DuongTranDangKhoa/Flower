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
                    String masp = request.getParameter("masp");
                    String tensp = request.getParameter("tensp");
                    String mota = request.getParameter("mota");
                    String dongia = request.getParameter("dongia");
                    String hinhanh = request.getParameter("hinhanh");
                    Integer category_i = Integer.parseInt(request.getParameter("category_id"));
                %>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Account</h3>
                        </div>
                        <form action="ManageProductController" method="GET">
                            Product Id: <%= masp%> 
                            <br>
                            Product Name: <input style="border: none;  " type="text" name="tensp" value="<%= tensp%>" />
                            <br>
                            Description <input style="border: none;  " type="text" name="mota" value="<%= mota%>" />
                            <br>
                            Price <input style="border: none;  " type="text" name="dongia" value="<%= dongia%>" />
                            <br>
                            Image URL <input style="border: none;  " type="text" name="hinhanh" value="<%= hinhanh%>" />
                            <br>
                            <%
                                String category_Name = categoryDBContext.getCategoryByID(category_i).getCategoryName();
                            %>
                            Category: <%= category_Name %>
                            <select id="category_id" name="category_id">
                                <%
                                    for (Category cate : listCate) {
                                        Integer cateid = cate.getCategoryId();
                                        String categoryName = cate.getCategoryName();
                                %>
                               
                                <option value="<%= cateid %>"><span class="status completed"><%= categoryName%></span></option>
                                <%
                                    }
                                %>
                            </select>
                            <br>
                            <input type="hidden" name="masp" value="<%= masp%>" />
                            <input type="hidden" name="tensp" value="<%= tensp%>" />
                            <input type="hidden" name="mota" value="<%= mota%>" />
                            <input type="hidden" name="dongia" value="<%= dongia%>" />
                            <input type="hidden" name="hinhanh" value="<%= hinhanh%>" />
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
