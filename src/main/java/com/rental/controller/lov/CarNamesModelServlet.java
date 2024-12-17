package com.rental.controller.lov;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.rental.dao.CarDAO;
import com.rental.models.CarNameModel;
import com.rental.models.CarNameVariantModel;

/**
 * Servlet implementation class CarNamesModelServlet
 */
@WebServlet("/CarNamesModelServlet")
public class CarNamesModelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
    private CarDAO carDAO = new CarDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String carName = request.getParameter("carName"); // Get selected company
        List<CarNameVariantModel> carNameVariantModelsList = carDAO.getAllCarNameModelsByCarName(carName);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        out.print(gson.toJson(carNameVariantModelsList));
        out.flush();
    }

}
