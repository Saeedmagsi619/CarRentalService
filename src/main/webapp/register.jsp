<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .registration-box {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }

        h2 {
            color: #2c3e50;
        }

        h3 {
            color: #e74c3c;
        }

        .success-message {
            color: green;
            font-size: 16px;
            margin-top: 10px;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-group label {
            font-size: 14px;
            margin-bottom: 5px;
            display: block;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .form-group input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        .form-group input[type="submit"]:hover {
            background-color: #2980b9;
        }

        .form-group a {
            text-decoration: none;
            color: #3498db;
            font-size: 14px;
        }

        .form-group a:hover {
            color: #2980b9;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
        }

        /* Mobile responsiveness */
        @media (max-width: 768px) {
            .registration-box {
                padding: 20px;
                width: 90%;
            }
        }
    </style>

    <script>
        function validateForm() {
            let password = document.getElementById("password").value;
            let confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }
            return true;
        }
    </script>

</head>
<body>

    <div class="container">
        <div class="registration-box">
            <h2>User Registration</h2>

            <%
                String sm = "";
                String erm = "";
                if (request.getAttribute("successMessage") != null) {
                    sm = (String) request.getAttribute("successMessage");
                }
                if (request.getAttribute("errorMessage") != null) {
                    erm = (String) request.getAttribute("errorMessage");
                }
            %>

            <h3 style="color: red"><%= erm %></h3>
            <h3 class="success-message"><%= sm %></h3>

            <form action="registerationController" method="post" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required />
                </div>

                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required />
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required />
                </div>

                <div class="form-group">
                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" required />
                </div>

                <div class="form-group">
                    <label for="role">Role:</label>
                    <select name="role" required>
                        <option value="CLIENT">CLIENT</option>
                        <option value="CUSTOMER">CUSTOMER</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="contactNumber">Contact Number:</label>
                    <input type="text" id="contactNumber" name="contactNumber" required />
                </div>

                <div class="form-group">
                    <input type="submit" value="Register" />
                </div>
            </form>

            <div class="footer">
                <p>&copy; 2024 Car Service. All rights reserved.</p>
            </div>
        </div>
    </div>

</body>
</html>
