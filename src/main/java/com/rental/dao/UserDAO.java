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
	private final String TBL_USER_FULLNAME = "fullname";
	private final String TBL_USER_USERNAME = "user_name";
	private final String TBL_USER_PASSWORD = "user_password";
	private final String TBL_USER_ROLE = "role";

    public UserModel validateUser(String username, String password) {
    	UserModel userModel = null;
        String query = "SELECT * FROM "+TBL_USER+" WHERE "+TBL_USER_USERNAME+" = ? AND "+TBL_USER_PASSWORD+" = ?";
        try (Connection conn = getConnection(UtilConstants.DRIVER,UtilConstants.DB_URL, UtilConstants.DB_USER, UtilConstants.DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
            	userModel  = new UserModel();
            	
            	userModel.setAppUserid(rs.getLong(UtilConstants.APP_USER_ID));
                userModel.setRole(rs.getString(TBL_USER_ROLE));
                userModel.setUsername(rs.getString(TBL_USER_USERNAME));
                userModel.setPassword(rs.getString(TBL_USER_PASSWORD));
                userModel.setName(rs.getString(TBL_USER_FULLNAME));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userModel; // Returns the role if valid, otherwise null
    }
}
