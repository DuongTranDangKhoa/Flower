package DAO;

import DAO.CategoryDBContext;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

public class ProductDBContext extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt(1));
                product.setProductName(rs.getString(2));
                product.setPrice(rs.getFloat(3));
                product.setDescription(rs.getString(4));
                product.setImg(rs.getString(5));
                product.setCategoryId(rs.getInt(6));
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> getProductsByCategoryId(int categoryId) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select * from Product where Product.CategoryId = ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, categoryId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setProductName(rs.getString("ProductName"));
                product.setPrice(rs.getFloat("Price"));
                product.setDescription(rs.getString("Description"));
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setImg(rs.getString("img"));
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public List<Product> search(String keyword) {
        List<Product> list = new ArrayList<>();
        try {
            String sql = "select *  from Product where ProductName like ?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + keyword + "%");
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setProductName(rs.getString("ProductName"));
                product.setPrice(rs.getFloat("Price"));
                product.setDescription(rs.getString("Description"));
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setImg(rs.getString("img"));
                list.add(product);
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Product getProductById(int productId) {
        try {
            String sql = "select *  from Product where ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, productId);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt("ProductId"));
                product.setProductName(rs.getString("ProductName"));
                product.setPrice(rs.getFloat("Price"));
                product.setDescription(rs.getString("Description"));
                product.setCategoryId(rs.getInt("CategoryId"));
                product.setImg(rs.getString("img"));
                return product;
            }
        } catch (Exception ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void inSertProduct(Product product) {
        try {
            String sql = "INSERT INTO [product]\n"
                    + "           ([ProductName]\n"
                    + "           ,[Price]\n"
                    + "           ,[Description]\n"
                    + "           ,[img]\n"
                    + "           ,[CategoryId] )"
                    + "     VALUES(? , ? , ? , ? , ?)";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, product.getProductName());
            stm.setFloat(2, product.getPrice());
            stm.setString(3, product.getDescription());
            stm.setString(4, product.getImg());
            stm.setInt(5, product.getCategoryId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteProduct(int id) {
        try {
            String sql = "DELETE FROM [Product]\n"
                    + "WHERE ProductId = ? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateProduct(Product product) {
        try {
            String sql = "UPDATE [product]\n"
                    + "   SET [ProductName] = ?\n"
                    + "      ,[Price] = ?\n"
                    + "      ,[Description] = ?\n"
                    + "      ,[img] = ?\n"
                    + "      ,[CategoryId] = ?\n"
                    + " WHERE ProductId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, product.getProductName());
            stm.setFloat(2, product.getPrice());
            stm.setString(3, product.getDescription());
            stm.setString(4, product.getImg());
            stm.setInt(5, product.getCategoryId());
            stm.setInt(6, product.getProductId());
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
