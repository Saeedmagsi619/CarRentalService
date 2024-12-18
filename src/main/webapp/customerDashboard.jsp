<%@page import="com.rental.models.CarModel"%>
<%@page import="java.util.List"%>
<%@page import="com.rental.models.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Client - Dashboard</title>
    <style>
        /* General Reset */
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding: 20px;
        }

        /* User Info Section */
        .user-info {
            max-width: 400px;
            text-align: left;
            margin-bottom: 20px;
            color: #333;
            background-color: #ffffff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                margin: 50px auto;
        }

        .user-info h5 {
            margin: 0;
            font-size: 1.8em;
            color: #3498db;
        }

        .user-info p {
            margin: 5px 0;
            font-size: 1.1em;
            color: #555;
        }

        .user-info .add-car-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 15px;
            background-color: #28a745;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 0.9em;
            transition: background-color 0.3s ease;
        }

        .user-info .add-car-btn:hover {
            background-color: #218838;
        }

        /* Cards Section */
        .cards-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            width: 100%;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 29.5%;
            padding: 20px;
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }

        .card-header h3 {
            margin: 0;
            font-size: 1.5em;
            color: #333;
        }

        .card-header p {
            margin: 5px 0;
            font-size: 0.9em;
            color: #777;
        }

        .card-body p {
            margin: 5px 0;
            font-size: 1.1em;
            color: #555;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            align-items: center;
        }

        .btn {
            padding: 8px 15px;
            font-size: 0.9em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .edit-btn {
            background-color: #3498db;
            color: white;
            text-decoration: none;
        }

        .edit-btn:hover {
            background-color: #2980b9;
        }

        .delete-btn {
            background-color: #dc3545;
            color: white;
        }

        .delete-btn:hover {
            background-color: #a71d2a;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .user-info {
                max-width: 100%;
            }

            .cards-container {
                flex-direction: column;
                align-items: center;
                width: 100%;
            }

            .card {
                width: 80%;
                max-width: 500px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- User Info Section -->
        <div class="user-info">
            <% UserModel userModel = (UserModel) session.getAttribute("user"); 
               List<CarModel> cars = (List<CarModel>)request.getAttribute("customerCars");
            %>
            <h5>Hi, <%= userModel.getName() %></h5>
            <p>Your Role is: <%= userModel.getRole() %></p>
        </div>

        <!-- Cards Section -->
        <div class="cards-container">
            <% for(CarModel car : cars) { %>
            <div class="card">
                <div class="card-header">
                    <h3 class="car-name"><%= car.getCarName() %></h3>
                    <p class="car-company">Company: <%= car.getCarCompany() %></p>
                </div>
                <div class="card-body">
                    <p><strong>Model:</strong> <%= car.getCarModel() %></p>
                    <p><strong>Year:</strong> <%= car.getYear() %></p>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/customerController?action=bookCar&carId=<%= car.getCarId() %>" class="btn edit-btn">Book Car</a>
                    <p class="btn delete-btn"><%= car.getPrice() %></p>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>
