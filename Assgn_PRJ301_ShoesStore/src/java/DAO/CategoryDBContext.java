package DAO;

import DAO.AccountDBContext;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;

public class CategoryDBContext extends DBContext {

    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        try {
            String sql = "select * from Category";

            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setCategoryId(rs.getInt("CategoryId"));
                category.setCategoryName(rs.getString("CategoryName"));
                list.add(category);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void insertCategory(String name) {
        try {
            String sql = "INSERT INTO Category "
                    + "   ( CategoryName )"
                    + "   VALUES "
                    + "   (?) ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Category getCategoryByName(String name) {
        try {
            String sql = "select *  from Category where CategoryName = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Category a = new Category();
                a.setCategoryName(rs.getString(1));
                return a;
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public Category getCategoryByID(int id) {
        try {
            String sql = "select *  from Category where CategoryId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                Category a = new Category();
                a.setCategoryId(rs.getInt(1));
                a.setCategoryName(rs.getString(2));
                return a;
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public void updateCategory(String name, Category category) {
        try {
            String sql = "UPDATE Category "
                    + "   SET CategoryName = ? "
                    + "   WHERE categoryId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, name);
            stm.setInt(2, category.getCategoryId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public void removeCategory(Integer cateID) {
        try {
            String sql = "Delete from Category "
                    + "   WHERE CategoryId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cateID);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
