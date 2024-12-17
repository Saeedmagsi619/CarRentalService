package com.rental.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rental.constants.UtilConstants;
import com.rental.constants.ViewsConstants;
import com.rental.dao.CarDAO;
import com.rental.dao.CustomerDAO;
import com.rental.models.CarModel;

/**
 * Servlet implementation class CustomerController
 */
@WebServlet("/customerController")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final String ACTION_BOOK_CAR = "bookCar";
	
	private CarDAO carDAO = new CarDAO();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter(UtilConstants.ACTION_PARAMETER);
		long carId = Long.parseLong(request.getParameter("carId"));
		switch (action) {
			case ACTION_BOOK_CAR:
				CarModel carModel = carDAO.getCarByCarId(carId);
				request.setAttribute("carModel", carModel);
				request.getRequestDispatcher(ViewsConstants.CAR_BOOKING_FORM).forward(request, response);
				break;
		}
	}

}
