package DAO;

import DAO.CategoryDBContext;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;

public class OrderDBContext extends DBContext {

    public int createReturnId(Order order) {
        try {
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([Username]\n"
                    + "           ,[OrderDate]\n"
                    + "           ,[Total])"
                    + "     VALUES\n"
                    + "           (?,?,?)";
            PreparedStatement stm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, order.getUsername());
            stm.setDate(2, new java.sql.Date(order.getOrderDate().getTime()));
            stm.setFloat(3, order.getTotal());
            stm.executeUpdate();

            ResultSet rs = stm.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public List<Order> getAllOrder() {
        List<Order> Orders = new ArrayList<>();
        try {
            String sql = "select * from [Order]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderId"));
                order.setUsername(rs.getString("Username"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setTotal(rs.getFloat("Total"));
                Orders.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Orders;
    }

    public void updateOrder(Order order) {
        try {
            String sql = "Update [dbo].[Order] set Total = ? where OrderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setFloat(1, order.getTotal());
            stm.setInt(2, order.getOrderId());
            stm.executeUpdate();

            stm.executeUpdate();

        } catch (Exception ex) {
            Logger.getLogger(OrderDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
