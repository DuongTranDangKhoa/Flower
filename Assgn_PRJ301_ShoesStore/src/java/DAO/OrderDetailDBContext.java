package DAO;

import DAO.CategoryDBContext;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.OrderDetail;

public class OrderDetailDBContext extends DBContext {

    public List<OrderDetail> getAllOrderDetailById(int id) {
        List<OrderDetail> OrderDetails = new ArrayList<>();
        try {
            String sql = "SELECT * FROM OrderDetail Where OrderId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                OrderDetail order = new OrderDetail();
                order.setOrderId(rs.getInt("OrderId"));
                order.setProductId(rs.getInt("ProductId"));
                order.setQuantity(rs.getInt("Quantity"));
                order.setPrice(rs.getFloat("Price"));

                OrderDetails.add(order);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return OrderDetails;
    }

    public void insert(OrderDetail orderDetail){
        try {
            String sql = "insert into OrderDetail (OrderId, ProductId, Quantity, Price) values (?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, orderDetail.getOrderId());
            stm.setInt(2, orderDetail.getProductId());
            stm.setInt(3, orderDetail.getQuantity());
            stm.setFloat(4, orderDetail.getPrice());
            stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void delete(int id) {

        try {

            String sql = "DELETE FROM [OrderDetail]\n"
                    + "      WHERE id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
