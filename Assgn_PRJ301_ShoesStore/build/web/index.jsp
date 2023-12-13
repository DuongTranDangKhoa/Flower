<%@page import="DAO.ProductDBContext"%>
<%@page import="DAO.AccountDBContext"%>
<%@page import="DAO.OrderDBContext"%>
<%@page import="DAO.CategoryDBContext"%>
<%@page import="model.Order"%>
<%@page import="model.Category"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="model.Product" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>ShoesStore</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <!-- owl stylesheets -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <!-- body -->

    <body class="main-layout ">
        <!-- loader  -->
        <div class="loader_bg">
            <div class="loader"><img src="images/loading.gif" alt="#" /></div>
        </div>
        <!-- end loader -->
        <!-- header -->
        <header>
            <!-- header inner -->
            <div class="header">

                <div class="container">
                    <div class="row">
                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                            <div class="full">
                                <div class="center-desk">
                                    <div class="logo">
                                        <a href="index.jsp"><img src="images/logo.png" alt="#"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                            <div class="menu-area">
                                <div class="limit-box">
                                    <nav class="main-menu">
                                        <ul class="menu-area-main">
                                            <%
                                                if (session.getAttribute("USER") == null) {
                                            %>
                                            <li>
                                                <a href="login.jsp">Login</a>                                                 
                                            </li>
                                            <%
                                            } else {
                                            %>
                                            <li>
                                                <%
                                                    Account acc = (Account) session.getAttribute("USER");
                                                    String fullname = acc.getFullname();
                                                %>
                                                <h4 style="color: beige">    
                                                    Hello, <%= fullname%>
                                                </h4>
                                            </li>
                                            <li>
                                                <a href="LogoutController">Logout</a>
                                            </li>
                                            <%
                                                }
                                            %>
                                            <li class="last">
                                                <a href="viewCart.jsp"><img src="images/shopping-cart.png" alt="icon" /></a>
                                            </li>

                                            <%
                                                if (session.getAttribute("USER") != null) {
                                                    Account acc = (Account) session.getAttribute("USER");
                                                    if (acc.getIsAdmin()) {
                                            %>
                                            <li>
                                                <a href="manage.jsp">MANAGE PAGE</a>
                                            </li>
                                            <%
                                                    }
                                                }
                                            %>

                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 offset-md-6">
                            <div class="location_icon_bottum">
                                <ul>
                                    <li><img src="icon/call.png" />(+71)9876543109</li>
                                    <li><img src="icon/email.png" />demo@gmail.com</li>
                                    <li><img src="icon/loc.png" />Location</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end header inner -->
        </header>
        <!-- end header -->
        <!-- about -->
        <div class="about">

            <!-- brand -->
            <div class="brand">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="titlepage">
                                <h2>Our Product</h2>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <form action="SearchController" method="POST">
                                    <input type="text" name="txtSearchValue" value="" />
                                    <input type="submit" value="Search" name="btAction" />
                                </form>
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
                        <div class="col-md-4">
                            <div class="form-group">
                                <form action="SearchController" method="GET">
                                    <select style="display: none" id="category" name="category">
                                        <%
                                            for (Category cate : listCate) {
                                        %>
                                        <option value="<%= cate.getCategoryId()%>"><%= cate.getCategoryName()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                    <input type="submit" class="btn-primary btn-danger" value="Find" name="btAction"/>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="brand-bg">
                    <div class="container">
                        <div class="brand_box">
                            <div class="row">
                                <%
    //                                    List<Product> productList = (List<Product>)request.getAttribute("ProductList");
                                    ProductDBContext productContext = new ProductDBContext();
                                    List<Product> productList = productContext.getAllProducts();
                                    if (request.getAttribute("PRODUCT_LIST") != null) {
                                        productList = (List<Product>) request.getAttribute("PRODUCT_LIST");
                                    }
                                    if (productList == null || productList.size() == 0) {
                                %>
                                <div class="brand_box">
                                    <h2>No Product Founded</h2>
                                </div>
                                <%
                                } else {
                                    for (Product pr : productList) {
                                        float price = pr.getPrice();
                                        String name = pr.getProductName();
                                        String description = pr.getDescription();
                                        String img = pr.getImg();
                                        Integer id = pr.getProductId();
                                %>

                                <div class="col-xl-4 col-lg-4 col-md-4 col-sm-6 margin"> 
                                    <form action="AddToCartController">
                                        <input type="hidden" name="id" value="<%= id %>" />
                                        <img src="<%= img%>" alt="img" />
                                        <h3>$<strong class="red"><%= price%></strong></h3>
                                        <span><%= name%></span>
                                        <i><img src="images/star.png"/></i>
                                        <i><img src="images/star.png"/></i>
                                        <i><img src="images/star.png"/></i>
                                        <i><img src="images/star.png"/></i>
                                        <span><%= description%></span>
                                        <input type="submit" value="Add To Cart" name="btAction" />
                                    </form>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- end brand -->

            <!-- footer -->
            <footer>
                <div id="contact" class="footer">
                    <div class="container">
                        <div class="row pdn-top-30">
                            <div class="col-md-12 ">
                                <div class="footer-box">
                                    <div class="headinga">
                                        <h3>Address</h3>
                                        <span>Healing Center, 176 W Streetname,New York, NY 10014, US</span>
                                        <p>(+71) 8522369417
                                            <br>demo@gmail.com</p>
                                    </div>
                                    <ul class="location_icon">
                                        <li> <a href="#"><i class="fa fa-facebook-f"></i></a></li>
                                        <li> <a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li> <a href="#"><i class="fa fa-instagram"></i></a></li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--                    <div class="copyright">
                                            <div class="container">
                                                <p>© 2019 All Rights Reserved. Design By<a href="https://html.design/"> Free Html Templates</a></p>
                                            </div>
                                        </div>-->
                </div>
            </footer>
            <!-- end footer -->
            <!-- Javascript files-->
            <script src="js/jquery.min.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap.bundle.min.js"></script>
            <script src="js/jquery-3.0.0.min.js"></script>
            <script src="js/plugin.js"></script>
            <!-- sidebar -->
            <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
            <script src="js/custom.js"></script>
            <!-- javascript -->
            <script src="js/owl.carousel.js"></script>
            <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
            <script>
                $(document).ready(function () {
                    $(".fancybox").fancybox({
                        openEffect: "none",
                        closeEffect: "none"
                    });

                    $(".zoom").hover(function () {

                        $(this).addClass('transition');
                    }, function () {

                        $(this).removeClass('transition');
                    });
                });
                $('select').niceSelect('destroy');
            </script>
    </body>
</html>
