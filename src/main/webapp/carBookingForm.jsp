<%@page import="com.rental.models.CarModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Booking Form</title>
    <script>
        function calculateTotalHours() {
            /*let startDate = document.getElementById("startDate").value;
            let endDate = document.getElementById("endingDate").value;

            if (startDate && endDate) {
                let start = new Date(startDate);
                let end = new Date(endDate);
                let differenceInMs = end - start;

                if (differenceInMs > 0) {
                    let hours = Math.floor(differenceInMs / (1000 * 60 * 60)); // Convert to hours
                    document.getElementById("totalHoursBooked").value = hours;
                } else {
                    alert("End date/time must be after start date/time.");
                    document.getElementById("totalHoursBooked").value = 0;
                }
            }*/
            
            let startDate = document.getElementById("startDate").value;
            let endDate = document.getElementById("endingDate").value;
            let perHourPrice = parseFloat(document.getElementById("perHourPrice").value);

            if (startDate && endDate) {
                let start = new Date(startDate);
                let end = new Date(endDate);
                let differenceInMs = end - start;

                if (differenceInMs > 0) {
                    let hours = Math.floor(differenceInMs / (1000 * 60 * 60)); // Convert to hours
                    document.getElementById("totalHoursBooked").value = hours;

                    // Calculate Total Fare Price
                    let totalFare = hours * perHourPrice;
                    document.getElementById("totalFarePrice").value = totalFare.toFixed(2); // Set to 2 decimal places
                } else {
                    alert("End date/time must be after start date/time.");
                    document.getElementById("totalHoursBooked").value = 0;
                    document.getElementById("totalFarePrice").value = 0;
                }
            }
            
        }
    </script>
</head>
<body>
<%
CarModel carModel = (CarModel)request.getAttribute("carModel");
%>
    <h2>Car Booking Form</h2>
    <form action="carBookingServlet" method="post">
        <input type="hidden" value="<%=carModel.getPrice()%>" id="perHourPrice">
        <input type="hidden" value="<%=carModel.getCarId()%>" id="carId" name="carId">
        
        <!-- Non-editable fields -->
        <label>Car Name:</label>
        <input type="text" name="carName" value="<%=carModel.getCarName()%>" readonly /><br>

        <label>Model:</label>
        <input type="text" name="model" value="<%=carModel.getCarModel()%>" readonly /><br>

        <label>Car Company:</label>
        <input type="text" name="carCompany" value="<%=carModel.getCarCompany()%>" readonly /><br>

        <!-- Date Inputs -->
        
        <label>Start Date & Time:</label>
        <input type="datetime-local" id="startDate" name="startDate" onchange="calculateTotalHours()" required /><br>

        <label>Ending Date & Time:</label>
        <input type="datetime-local" id="endingDate" name="endingDate" onchange="calculateTotalHours()" required /><br>

        <!-- Total Hours Booked -->
        <label>Total Hours Booked:</label>
        <input type="number" id="totalHoursBooked" name="totalHoursBooked" readonly /><br>
        
        <!-- Total Fare Price with respect to totalHoursBooked -->
        <label>Total Fare Price:</label>
        <input type="number" id="totalFarePrice" name="totalFarePrice" readonly /><br>

        <!-- Comments -->
        <label>Comments:</label>
        <textarea name="comments" rows="4" cols="50"></textarea><br>

        <input type="submit" value="Book Car" />
    </form>
</body>
</html>
