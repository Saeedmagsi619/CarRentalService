package com.rental.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.rental.constants.UtilConstants;
import com.rental.models.CarModel;

public class CustomerDAO {
	
	
	private final String TBL_CAR            = "cars";
	
	//COLUMNS NAMES CAR
	private final String CAR_ID    = "carId";
	private final String COMPANY   = "company";
	private final String CAR_NAME  = "car_name";
	private final String CAR_MODEL = "model";
	private final String CAR_YEAR  = "year";
	private final String CAR_PRICE = "price";
	
	
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

}
