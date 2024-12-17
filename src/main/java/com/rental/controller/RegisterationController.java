package com.rental.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rental.constants.ViewsConstants;
import com.rental.dao.UserDAO;
import com.rental.models.UserModel;

/**
 * Servlet implementation class RegisterationController
 */
@WebServlet("/registerationController")
public class RegisterationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name          = request.getParameter("name");
        String username      = request.getParameter("username");
        String password      = request.getParameter("password");
        String role          = request.getParameter("role");
        String contactNumber = request.getParameter("contactNumber");

        UserDAO userDAO = new UserDAO();
        RequestDispatcher dispatcher;

        try {
            if (userDAO.isUsernameTaken(username)) {
                // Username already exists
                request.setAttribute("errorMessage", "Username is already taken!");
            } else {
                UserModel userModel = new UserModel();
                userModel.setName(name);
                userModel.setUsername(username);
                userModel.setPassword(password);
                userModel.setRole(role);
                userModel.setContactNumber(contactNumber);
                if (userDAO.registerUser(userModel)) {
                    request.setAttribute("successMessage", "Registration successful!");
                }else {
                	request.setAttribute("errorMessage", "Error during registration!");
                }
            }
            dispatcher = request.getRequestDispatcher(ViewsConstants.SIGN_UP_PAGE);
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error during registration", e);
        }
    }

}
