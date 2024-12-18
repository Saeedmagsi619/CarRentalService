<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Service - Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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
        
        .login-box {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        h3 {
            color: #e74c3c;
        }

        .error-message {
            color: red;
            margin-bottom: 20px;
            font-size: 14px;
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

        .form-group input {
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
            .login-box {
                padding: 20px;
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-box">
            <h3>Login Page</h3>
            
            <!-- Display Error Message -->
            <c:if test="${not empty errorMessage}">
                <div class="error-message">
                    <h3>${errorMessage}</h3>
                </div>
            </c:if>

            <form action="loginController" method="post">
                <div class="form-group">
                    <label for="username">UserName :</label>
                    <input type="text" id="username" name="username" required>
                </div>

                <div class="form-group">
                    <label for="password">Password :</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <div class="form-group">
                    <input type="submit" name="submit" value="Login">
                </div>
                
                <div class="form-group">
                    <a href="${pageContext.request.contextPath}/register.jsp">Register</a>
                </div>
            </form>

            <div class="footer">
                <p>&copy; 2024 Car Service. All rights reserved.</p>
            </div>
        </div>
    </div>
</body>
</html>
