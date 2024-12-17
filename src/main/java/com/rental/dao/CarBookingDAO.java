package com.rental.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.rental.constants.UtilConstants;
import com.rental.models.CarBookingModel;

import static com.rental.constants.UtilConstants.APP_USER_ID; 

public class CarBookingDAO {
	
	private final String TBL_CAR_BOOKING = "car_booking";
	
	private final String CAR_ID = "car_id";
	private final String COMPANY = "company";
	private final String CAR_NAME = "car_name";
	private final String CAR_MODEL = "model";
	private final String CAR_YEAR = "year";
	private final String CAR_PRICE = "price";
	
	private final String TOTAL_PRICE = "total_price";
	private final String TOTAL_HOURSE_BOOKED = "totalHoursBooked";
	
	
	
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
	
	public boolean saveCarBooking(CarBookingModel booking) {
        String query = "INSERT INTO "+TBL_CAR_BOOKING+" ("+APP_USER_ID+","+TOTAL_PRICE+",start_date,ending_date,create_date,comments,"+TOTAL_HOURSE_BOOKED+","+CAR_ID+") "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(UtilConstants.DRIVER,UtilConstants.DB_URL,UtilConstants.DB_USER,UtilConstants.DB_PASSWORD);
                PreparedStatement stmt = conn.prepareStatement(query)) {

        	stmt.setLong(1, booking.getAppUserId());
        	stmt.setDouble(2, booking.getTotalPrice());
        	stmt.setTimestamp(3, new java.sql.Timestamp(booking.getStartDate().getTime()));
        	stmt.setTimestamp(4, new java.sql.Timestamp(booking.getEndingDate().getTime()));
        	stmt.setTimestamp(5, new java.sql.Timestamp(booking.getBookingDate().getTime()));
        	stmt.setString(6, booking.getComments());
        	stmt.setInt(7, booking.getTotalHourseBooked());
        	stmt.setLong(8, booking.getCarId());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
