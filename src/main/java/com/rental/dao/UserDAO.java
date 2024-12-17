package com.rental.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.rental.constants.UtilConstants;
import com.rental.models.UserModel;

public class UserDAO {
	
	public Connection getConnection(String DRIVER,String DB_URL,String DB_USER,String DB_PASSWORD) {
        try {
            Class.forName(DRIVER);
            java.sql.Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            return con;
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Exception " + e);
            return null;
        }
    }
	

	
	//TABLE NAMES
	private final String TBL_USER = "app_user";
	
	//COLUMNS NAMES USER
	private final String USER_FULLNAME = "fullname";
	private final String USER_USERNAME = "user_name";
	private final String USER_PASSWORD = "user_password";
	private final String USER_ROLE = "role";
	private final String USER_CONTACT = "contact";

    public UserModel validateUser(String username, String password) {
    	UserModel userModel = null;
        String query = "SELECT * FROM "+TBL_USER+" WHERE "+USER_USERNAME+" = ? AND "+USER_PASSWORD+" = ?";
        try (Connection conn = getConnection(UtilConstants.DRIVER,UtilConstants.DB_URL, UtilConstants.DB_USER, UtilConstants.DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
            	userModel  = new UserModel();
            	
            	userModel.setAppUserid(rs.getLong(UtilConstants.APP_USER_ID));
                userModel.setRole(rs.getString(USER_ROLE));
                userModel.setUsername(rs.getString(USER_USERNAME));
                userModel.setPassword(rs.getString(USER_PASSWORD));
                userModel.setName(rs.getString(USER_FULLNAME));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userModel; // Returns the role if valid, otherwise null
    }
    
 // Check if username already exists
    public boolean isUsernameTaken(String username) {
        String query = "SELECT COUNT(*) FROM "+TBL_USER+" WHERE "+USER_USERNAME+" = ?";
        
        try (Connection conn = getConnection(UtilConstants.DRIVER,UtilConstants.DB_URL, UtilConstants.DB_USER, UtilConstants.DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0; // Username already exists
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
 // Register a new user
    public boolean registerUser(UserModel user) {
        String query = "INSERT INTO app_user ("+USER_FULLNAME+", "+USER_USERNAME+", "+USER_PASSWORD+", "+USER_ROLE+", "+USER_CONTACT+") "
        		+ "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = getConnection(UtilConstants.DRIVER,UtilConstants.DB_URL, UtilConstants.DB_USER, UtilConstants.DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, user.getName());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getRole());
            stmt.setString(5, user.getContactNumber());

    	    int rowsInserted = stmt.executeUpdate();
    	    return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
