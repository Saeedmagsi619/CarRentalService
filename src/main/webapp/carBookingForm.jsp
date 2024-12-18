<%@page import="com.rental.models.CarModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Booking Form</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        /* Form Container */
        .form-container {
            background: #ffffff;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.8rem;
            color: #0056b3;
        }

        label {
            font-weight: bold;
            margin-top: 15px;
            display: block;
            color: #444;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        input:read-only {
            background-color: #f9f9f9;
        }

        textarea {
            resize: none;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            font-weight: bold;
        }

        input[type="submit"]:hover {
            background-color: #218838;
            transform: scale(1.05);
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .form-container {
                padding: 20px;
            }

            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
    <script>
        function calculateTotalHours() {
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
    <div class="form-container">
        <h2>Car Booking Form</h2>
        <form action="carBookingServlet" method="post">
            <input type="hidden" value="<%=carModel.getPrice()%>" id="perHourPrice">
            <input type="hidden" value="<%=carModel.getCarId()%>" id="carId" name="carId">

            <!-- Non-editable fields -->
            <label>Car Name:</label>
            <input type="text" name="carName" value="<%=carModel.getCarName()%>" readonly>

            <label>Model:</label>
            <input type="text" name="model" value="<%=carModel.getCarModel()%>" readonly>

            <label>Car Company:</label>
            <input type="text" name="carCompany" value="<%=carModel.getCarCompany()%>" readonly>

            <!-- Date Inputs -->
            <label>Start Date & Time:</label>
            <input type="datetime-local" id="startDate" name="startDate" onchange="calculateTotalHours()" required>

            <label>Ending Date & Time:</label>
            <input type="datetime-local" id="endingDate" name="endingDate" onchange="calculateTotalHours()" required>

            <!-- Total Hours Booked -->
            <label>Total Hours Booked:</label>
            <input type="number" id="totalHoursBooked" name="totalHoursBooked" readonly>

            <!-- Total Fare Price with respect to totalHoursBooked -->
            <label>Total Fare Price:</label>
            <input type="number" id="totalFarePrice" name="totalFarePrice" readonly>

            <!-- Comments -->
            <label>Comments:</label>
            <textarea name="comments" rows="4" placeholder="Any additional information or requests..."></textarea>

            <input type="submit" value="Book Car">
        </form>
    </div>
</body>
</html>
