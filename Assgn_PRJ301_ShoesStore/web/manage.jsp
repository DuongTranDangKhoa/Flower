<%@page import="java.text.SimpleDateFormat"%>
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
        <!-- SIDEBAR -->



        <!-- CONTENT -->
        <section id="content">
            <!-- NAVBAR -->
            <nav>
                <i class='bx bx-menu' ></i>
                <input type="checkbox" id="switch-mode" hidden>

            </nav>
            <!-- NAVBAR -->

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
                <ul class="box-info">
                    <li>
                        <i class='bx bxs-calendar-check' ></i>
                        <span class="text">
                            <h3><%= proNum%></h3>
                            <p>Product</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bxs-calendar-check' ></i>
                        <span class="text">
                            <h3><%= cateNum%></h3>
                            <p>Category</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">
                            <h3><%= orderNum%></h3>
                            <p>Order</p>
                        </span>
                    </li>
                    <li>
                        <i class='bx bxs-dashboard' ></i>
                        <span class="text">
                            <h3><%= accountNum%></h3>
                            <p>Account</p>
                        </span>
                    </li>
                </ul>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Product</h3>
                        </div>
                        <%
                            if (request.getAttribute("PRODUCT_LIST") != null) {
                                listPro = (ArrayList<Product>) request.getAttribute("PRODUCT_LIST");
                            }
                        %>
                        <table>
                            <thead>
                                <tr>
                                    <th>Action</th>
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Image</th>
                                    <th>Category</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Product sanpham : listPro) {
                                        Integer masp = sanpham.getProductId();
                                        String tensp = sanpham.getProductName();
                                        String mota = sanpham.getDescription();
                                        float dongia = sanpham.getPrice();
                                        String hinhanh = sanpham.getImg();
                                        Integer cateId = sanpham.getCategoryId();
                                        String danhmuc = categoryDBContext.getCategoryByID(sanpham.getCategoryId()).getCategoryName();
                                %>
                                <tr>
                            <form action="manageProduct.jsp">
                                <td>
                                    <input type="submit" value="Manage" />
                                    <input type="hidden" name="masp" value="<%= masp%>" />
                                    <input type="hidden" name="tensp" value="<%= tensp%>" />
                                    <input type="hidden" name="mota" value="<%= mota%>" />
                                    <input type="hidden" name="dongia" value="<%= dongia%>" />
                                    <input type="hidden" name="hinhanh" value="<%= hinhanh%>" />
                                    <input type="hidden" name="category_id" value="<%= cateId%>" />
                                </td>
                                <td>
                                    <%= masp%>
                                </td>
                                <td>
                                    <p><%= tensp%></p>
                                </td>
                                <td>
                                    <p><%= mota%></p>
                                </td>
                                <td>
                                    <p><%= dongia%></p>
                                </td>
                                <td>
                                    <img src="<%= hinhanh%>" alt=""/>
                                </td>
                                <td>
                                    <p><%= danhmuc%></p>
                                </td>
                            </form>

                            </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Category</h3>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Action</th>
                                    <th>Category ID</th>
                                    <th>Category Name</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Category danhmuc : listCate) {
                                        Integer madm = danhmuc.getCategoryId();
                                        String tendm = danhmuc.getCategoryName();
                                %>
                                <tr>

                                    <td>
                                        <form action="manageCategory.jsp">
                                            <input type="submit" value="Manage" />
                                            <input type="hidden" name="madm" value="<%= madm%>" />
                                            <input type="hidden" name="tendm" value="<%= tendm%>" />
                                        </form>
                                    </td>
                                    <td>
                                        <%= madm%>
                                    </td>
                                    <td>
                                        <p><%= tendm%></p>
                                    </td>

                                </tr>
                                <%
                                    }
                                %>

                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Order</h3>
                        </div>

                        <table>
                            <thead>
                                <tr>
                                    <th>Action</th>
                                    <th>Order Id</th>
                                    <th>Username</th>
                                    <th>Order Date</th>
                                    <th>Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Order o : listOrder) {
                                        Integer id = o.getOrderId();
                                        String username = o.getUsername();
                                        Date date = o.getOrderDate();
                                        SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                                        String d = df.format(date);
                                        Float total = o.getTotal();
                                %>
                                <tr>
                                    <td>
                                        <form action="viewOrder.jsp">
                                            <input type="submit" value="View Order" />
                                            <input type="hidden" name="id" value="<%= id%>" />
                                            <input type="hidden" name="username" value="<%= username%>" />
                                            <input type="hidden" name="date" value="<%= date%>" />
                                            <input type="hidden" name="total" value="<%= total%>" />
                                        </form>
                                    </td>
                                    <td>
                                        <p><%= id%></p>
                                    </td>
                                    <td>
                                        <p><%= username%></p>
                                    </td>
                                    <td>
                                        <%= d%>
                                    </td>
                                    <td>
                                        <p><%= total%></p>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>

                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="table-data">
                    <div class="order">
                        <div class="head">
                            <h3>Account</h3>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>Action</th>
                                    <th>Username</th>
                                    <th>Password</th>
                                    <th>Fullname</th>
                                    <th>IsAdmin</th>
                                    <th>Active</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    for (Account taikhoan : listAccount) {
                                        String tentk = taikhoan.getUsername();
                                        String matkhau = taikhoan.getPassword();
                                        String ten = taikhoan.getFullname();
                                        boolean admin = taikhoan.getIsAdmin();
                                        boolean status = taikhoan.getActive();
                                %>
                                <tr>
                            <form action="manageAccount.jsp" method="POST">
                                <td>
                                    <input type="submit" value="Manage" />
                                    <input type="hidden" name="tentk" value="<%= tentk%>" />
                                    <input type="hidden" name="matkhau" value="<%= matkhau%>" />
                                    <input type="hidden" name="ten" value="<%= ten%>" />
                                    <input type="hidden" name="admin" value="<%= admin%>" />
                                    <input type="hidden" name="status" value="<%= status%>" />
                                </td>
                                <td>
                                    <p><%= tentk%></p>
                                </td>
                                <td>
                                    <p><%= matkhau%></p>
                                </td>
                                <td>
                                    <p><%= ten%></p>
                                </td>
                                <td>
                                    <%
                                        if (admin) {
                                    %>
                                    <span class="status completed">Admin</span>
                                    <%
                                    } else {
                                    %>
                                    <span class="status pending">User</span>
                                    <%
                                        }
                                    %>
                                </td>
                                <td>
                                    <%
                                        if (status) {
                                    %>
                                    <span class="status completed">Active</span>
                                    <%
                                    } else {
                                    %>
                                    <span class="status pending">Banned</span>
                                    <%
                                        }
                                    %>
                                </td>
                            </form>

                            </tr>
                            <%
                                }
                            %>

                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
            <!-- MAIN -->
        </section>
        <!-- CONTENT -->


        <script src="script.js"></script>
    </body>
</html>
