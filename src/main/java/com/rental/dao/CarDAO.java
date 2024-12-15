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
import com.rental.models.CarNameModel;
import com.rental.models.CompanyModel;
import com.rental.models.UserModel;

public class CarDAO {
	
	//TABLE NAMES
	private final String TBL_CAR = "cars";
	private final String TBL_COMPANY = "car_companies";
	private final String TBL_CAR_NAMES = "car_names";
	
	//COLUMNS NAMES CAR
	private final String CAR_ID = "carId";
	private final String COMPANY = "company";
	private final String CAR_NAME = "car_name";
	private final String CAR_MODEL = "model";
	private final String CAR_YEAR = "year";
	private final String CAR_PRICE = "price";
	
	//COLUMNS NAMES COMPANY
	private final String COMPANY_ID = "company_id";
	private final String COMPANY_NAME = "company_name";
	
	//COLUMNS NAMES COMPNAY
	private final String CAR_NAME_ID = "car_name_id";
	private final String CAR_COMPANY = "car_company";
	
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
	    
    public List<CarModel> getAllCarsByClient(long appUserId) {
    	List<CarModel> listOfCars = new ArrayList<>();
        String query = "SELECT * FROM "+TBL_CAR+" WHERE "+UtilConstants.APP_USER_ID+" = ?";
        try (Connection conn = getConnection(UtilConstants.DRIVER,UtilConstants.DB_URL,UtilConstants.DB_USER,UtilConstants.DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setLong(1, appUserId);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
            	CarModel car = new CarModel();
            	car.setAppUserid(rs.getLong(UtilConstants.APP_USER_ID));
            	car.setCarCompany(rs.getString(COMPANY));
            	car.setCarName(rs.getString(CAR_NAME));
            	car.setCarModel(rs.getString(CAR_MODEL));
            	car.setYear(rs.getInt(CAR_YEAR));
            	car.setPrice(rs.getDouble(CAR_PRICE));
                
                listOfCars.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listOfCars;
    }
    
    public List<CarNameModel> getAllCarNamesByCompany(String company) {
    	List<CarNameModel> listOfCarNames = new ArrayList<>();
        String query = "SELECT * FROM "+TBL_CAR_NAMES+" WHERE "+CAR_COMPANY+" = ?";
        try (Connection conn = getConnection(UtilConstants.DRIVER,UtilConstants.DB_URL,UtilConstants.DB_USER,UtilConstants.DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {
        	 stmt.setString(1, company);
        	
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
            	
            	CarNameModel carNameModel = new CarNameModel();
            	
            	carNameModel.setCarNameId(rs.getLong(CAR_NAME_ID));
            	carNameModel.setCarName(rs.getString(CAR_NAME));
            	carNameModel.setCompanyName(rs.getString(CAR_COMPANY));
            	
            	listOfCarNames.add(carNameModel);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listOfCarNames;
    }
    
    public List<CompanyModel> getAllCompanies() {
    	List<CompanyModel> listOfCompnies = new ArrayList<>();
        String query = "SELECT * FROM "+TBL_COMPANY;
        try (Connection conn = getConnection(UtilConstants.DRIVER,UtilConstants.DB_URL,UtilConstants.DB_USER,UtilConstants.DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
            	
            	CompanyModel company = new CompanyModel();
            	
            	company.setCompanyId(rs.getLong(COMPANY_ID));
            	company.setCompanyName(rs.getString(COMPANY_NAME));
                
            	listOfCompnies.add(company);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listOfCompnies;
    }
    

}
