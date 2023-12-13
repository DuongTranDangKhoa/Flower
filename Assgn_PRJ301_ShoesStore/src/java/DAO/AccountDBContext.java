package DAO;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

public class AccountDBContext extends DBContext {

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Account where IsAdmin != 1";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString(1));
                account.setPassword(rs.getString(2));
                account.setFullname(rs.getString(3));
                account.setIsAdmin(rs.getBoolean(4));
                account.setActive(rs.getBoolean(5));
                list.add(account);
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Account login(String user, String pass) {
        try {
            String sql = "SELECT * FROM Account where Username = ? and Password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString(1));
                account.setPassword(rs.getString(2));
                account.setFullname(rs.getString(3));
                account.setIsAdmin(rs.getBoolean(4));
                account.setActive(rs.getBoolean(5));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Account checkAccountExist(String user) {
        try {
            String sql = "SELECT * FROM Account where Username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString(1));
                account.setPassword(rs.getString(2));
                account.setFullname(rs.getString(3));
                account.setIsAdmin(rs.getBoolean(4));
                account.setActive(rs.getBoolean(5));
                return account;
            }
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void insertAccount(String user, String pass, String fullName) {
        try {
            String sql = "INSERT INTO Account( "
                    + "Username , "
                    + "Password, "
                    + "Fullname, "
                    + "IsAdmin, "
                    + "Active ) "
                    + "VALUES(?, ?, ?, 0, 1)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user);
            stm.setString(2, pass);
            stm.setString(3, fullName);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Account getAccountByUsername(String username) {
        try {
            String sql = "select * from Account where Username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Account account = new Account();
                account.setUsername(rs.getString(1));
                account.setPassword(rs.getString(2));
                account.setFullname(rs.getString(3));
                account.setIsAdmin(rs.getBoolean(4));
                account.setActive(rs.getBoolean(5));
                return account;
            }
        } catch (Exception ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void updateAccount(Account account) {
        try {
            String sql = "UPDATE Account "
                    + "   SET Active = ?, Fullname = ?, Password = ? "
                    + "   WHERE Username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, account.getActive());
            stm.setString(2, account.getFullname());
            stm.setString(3, account.getPassword());
            stm.setString(4, account.getUsername());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void removeAccount(String username) {
        try {
            String sql = "Delete from Account "
                    + "   WHERE Username = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(AccountDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        try {
            System.out.println(new AccountDBContext().getAccountByUsername("admin"));
        } catch (Exception e) {
        }
    }
}
