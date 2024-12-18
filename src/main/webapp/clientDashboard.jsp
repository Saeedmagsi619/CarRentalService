<%@page import="com.rental.models.CarModel"%>
<%@page import="java.util.List"%>
<%@page import="com.rental.models.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Client - Dashboard</title>

<style>
/* General Reset */
body {
    margin: 0;
    padding: 0;
    font-family: 'Roboto', Arial, sans-serif;
    background-color: #f4f4f9;
    color: #333;
}

/* Container */
.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

/* User Info Section */
.user-info {
    margin-bottom: 30px;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: left;
}

.user-info h5 {
    margin: 0;
    font-size: 1.8em;
    color: #0056b3;
}

.user-info p {
    margin: 10px 0;
    font-size: 1em;
    color: #555;
}

.user-info .add-car-btn {
    display: inline-block;
    margin-top: 15px;
    padding: 10px 20px;
    background-color: #28a745;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-size: 1em;
    font-weight: bold;
    transition: transform 0.2s ease, background-color 0.3s ease;
}

.user-info .add-car-btn:hover {
    background-color: #218838;
    transform: scale(1.05);
}

/* Cards Section */
.cards-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: flex-start;
}

.card {
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
    width: calc(33.333% - 20px);
    overflow: hidden;
    transition: transform 0.2s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
}

.card-header {
    padding: 15px;
    border-bottom: 1px solid #f0f0f0;
}

.card-header h3 {
    margin: 0;
    font-size: 1.4em;
    color: #333;
}

.card-header p {
    margin: 5px 0;
    font-size: 0.9em;
    color: #777;
}

.card-body {
    padding: 15px;
}

.card-body p {
    margin: 5px 0;
    font-size: 1em;
    color: #555;
}

.card-footer {
    padding: 15px;
    background-color: #f9f9f9;
    border-top: 1px solid #f0f0f0;
    display: flex;
    justify-content: space-between;
}

.btn {
    padding: 8px 15px;
    font-size: 0.9em;
    font-weight: bold;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.edit-btn {
    background-color: #007bff;
    color: white;
}

.edit-btn:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}

.delete-btn {
    background-color: #dc3545;
    color: white;
}

.delete-btn:hover {
    background-color: #a71d2a;
    transform: scale(1.05);
}

/* Responsive Design */
@media (max-width: 992px) {
    .card {
        width: calc(50% - 20px);
    }
}

@media (max-width: 768px) {
    .user-info h5 {
        font-size: 1.5em;
    }

    .user-info p {
        font-size: 0.9em;
    }

    .card {
        width: calc(100% - 20px);
    }

    .cards-container {
        justify-content: center;
    }
}
</style>

</head>
<body>
    <div class="container">
        <!-- User Info Section -->
        <div class="user-info">
            <% UserModel userModel = (UserModel) session.getAttribute("user"); 
               List<CarModel> cars = (List<CarModel>)request.getAttribute("clientCars");
            %>
            <h5>Hi, <%= userModel.getName() %></h5>
            <p>Your Role is: <%= userModel.getRole() %></p>
            <a class="add-car-btn" href="${pageContext.request.contextPath}/clientController?action=addNewCar">Add New Car</a>
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
                    <button class="btn edit-btn">Edit</button>
                    <button class="btn delete-btn">Delete</button>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</body>
</html>
