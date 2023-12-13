<%-- 
    Document   : viewCart
    Created on : Apr 25, 2023, 2:21:59 AM
    Author     : truonglam
--%>

<%@page import="model.Product"%>
<%@page import="DAO.ProductDBContext"%>
<%@page import="model.OrderDetail"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <!-- My CSS -->
        <link rel="stylesheet" href="cartStyle.css">
    </head>
    <body>
        <table border="1">
            <thead>
                <tr>
                    <th class="table-header">Product ID</th>
                    <th class="table-header">Product Name</th>
                    <th class="table-header">Product Price</th>
                    <th class="table-header">Quantity</th>
                    <th class="table-header">Sum</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<OrderDetail> od = (List<OrderDetail>) session.getAttribute("ITEMS");
                    if (od != null) {
                        ProductDBContext productDBContext = new ProductDBContext();
                        for (OrderDetail item : od) {
                            Product product = productDBContext.getProductById(item.getProductId());
                            Integer productId = item.getProductId();
                            String productName = product.getProductName();
                            Float price = product.getPrice();
                            Integer quantity = item.getQuantity();
                            Float sum = quantity * price;
                %>
                <tr>
                    <td><%= productId%></td>
                    <td><%= productName%></td>
                    <td><%= price%></td>
                    <td><%= quantity%></td>
                    <td><%= sum%></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
        <a href="index.jsp">Add More...</a>
        <form action="CheckoutController" method="POST">
            <input type="submit" value="Checkout" name="btAction" />
        </form>
    </body>
</html>
