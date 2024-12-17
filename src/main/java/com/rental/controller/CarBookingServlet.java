package com.rental.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rental.dao.CarBookingDAO;
import com.rental.dao.CarDAO;
import com.rental.models.CarBookingModel;
import com.rental.models.CarModel;
import com.rental.models.UserModel;


@WebServlet("/carBookingServlet")
public class CarBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
		UserModel userModel=(UserModel)request.getSession().getAttribute("user");
        long carId = Long.parseLong(request.getParameter("carId"));
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endingDate");
        String comments = request.getParameter("comments");
        int totalHoursBooked = Integer.parseInt(request.getParameter("totalHoursBooked"));
        double totalFarePrice = Double.parseDouble(request.getParameter("totalFarePrice"));

        // Parse dates
        LocalDateTime startDateTime = LocalDateTime.parse(startDateStr);
        LocalDateTime endDateTime = LocalDateTime.parse(endDateStr);
        Date startDate = Date.from(startDateTime.atZone(ZoneId.systemDefault()).toInstant());
        Date endingDate = Date.from(endDateTime.atZone(ZoneId.systemDefault()).toInstant());
        Date bookingDate = new Date(); // Current date

        // Create CarBookingModel object
        CarBookingModel booking = new CarBookingModel();
        booking.setAppUserId(userModel.getAppUserid());
        booking.setCarId(carId);
        booking.setStartDate(startDate);
        booking.setEndingDate(endingDate);
        booking.setBookingDate(bookingDate);
        booking.setComments(comments);
        booking.setTotalHourseBooked(totalHoursBooked);
        booking.setTotalPrice(totalFarePrice);

        // Save to database via DAO
        CarBookingDAO dao = new CarBookingDAO();
        boolean isInserted = dao.saveCarBooking(booking);

        // Response
        if (isInserted) {
        	CarDAO carDAO = new CarDAO();
        	CarModel carModel = carDAO.getCarByCarId(carId);
        	carModel.setStatus("Y");
        	carDAO.updateCar(carModel);
            response.getWriter().println("Car booked successfully!");
        } else {
            response.getWriter().println("Failed to book the car. Please try again.");
        }
    }

}
