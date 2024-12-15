package com.rental.controller.lov;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.rental.dao.CarDAO;
import com.rental.models.CarNameModel;

@WebServlet("/CarNameServlet")
public class CarNameServlet extends HttpServlet {
	
    private CarDAO carDAO = new CarDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String company = request.getParameter("company"); // Get selected company
        List<CarNameModel> carNames = carDAO.getAllCarNamesByCompany(company);
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        out.print(gson.toJson(carNames));
        out.flush();
    }
}
