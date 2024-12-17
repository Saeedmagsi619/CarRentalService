<%@page import="com.rental.models.CarModel"%>
<%@page import="java.util.List"%>
<%@page import="com.rental.models.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client - Dashboard</title>

<style>
/* General Reset */
body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
}

.container {
    display: flex;
    flex-direction: column;
    align-items: flex-start; /* Align items to the left */
    padding: 20px;
}

/* User Info Section */
.user-info {
    max-width: 300px;
    text-align: left;
    margin-bottom: 20px; /* Add spacing between user info and cards */
    color: #333;
}

.user-info h5 {
    margin: 0;
    font-size: 1.5em;
    color: #007bff;
}

.user-info p {
    margin: 5px 0;
    font-size: 1em;
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
    justify-content: flex-start; /* Cards start from the left */
}

.card {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    width: 300px;
    padding: 20px;
    display: flex;
    flex-direction: column;
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
    font-size: 1em;
    color: #555;
}

.card-footer {
    display: flex;
    justify-content: space-between;
    margin-top: 15px;
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
    background-color: #007bff;
    color: white;
}

.edit-btn:hover {
    background-color: #0056b3;
}

.delete-btn {
    background-color: #dc3545;
    color: white;
}

.delete-btn:hover {
    background-color: #a71d2a;
}

</style>

</head>
<body>
    <div class="container">
        <!-- User Info Section -->
        <div class="user-info">
            <% UserModel userModel = (UserModel) request.getAttribute("user"); 
               List<CarModel> cars = (List<CarModel>)request.getAttribute("customerCars");
            %>
            <h5>Hi, <%= userModel.getName() %></h5>
            <p>Your Role is: <%= userModel.getRole() %></p>
        </div>

        <!-- Cards Section -->
        <%for(CarModel car:cars) {%>
        <div class="cards-container">
            <div class="card">
                <div class="card-header">
                    <h3 class="car-name"><%=car.getCarName() %></h3>
                    <p class="car-company">Company: <%=car.getCarCompany() %></p>
                </div>
                <div class="card-body">
                    <p><strong>Model:</strong> <%=car.getCarModel() %></p>
                    <p><strong>Year:</strong> <%=car.getYear() %></p>
                </div>
                <div class="card-footer">
                    <button class="btn edit-btn">Book Car</button>
                    <p class="btn delete-btn"><%=car.getPrice() %></p>
                </div>
            </div>
        </div>
        <%} %>
    </div>
</body>
</html>