<%-- 
    Document   : viewCart
    Created on : Apr 25, 2023, 2:21:59 AM
    Author     : truonglam
--%>

<%@page import="dal.OrderDetailDBContext"%>
<%@page import="model.Product"%>
<%@page import="dal.ProductDBContext"%>
<%@page import="model.OrderDetail"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <%
            Integer orderId = Integer.parseInt(request.getParameter("id"));
            String username = request.getParameter("username");
            String date = request.getParameter("date");
            String total = request.getParameter("total");
        %>
        Order Id: <%= orderId%>
        User: <%= username%>
        Date: <%= date%>
        Total: <%= total%>
        <table border="1">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Product Price</th>
                    <th>Quantity</th>
                    <th>Sum</th>
                </tr>
            </thead>AddToCartControlle
            <tbody>

                <%
                    OrderDetailDBContext orderDetailDBContext = new OrderDetailDBContext();
                    List<OrderDetail> od = orderDetailDBContext.getAllOrderDetailById(orderId);
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
        <a href="manage.jsp">Back</a>
    </body>
</html>
