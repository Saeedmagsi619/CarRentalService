<%@page import="java.time.Year"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.rental.models.CarNameVariantModel"%>
<%@page import="com.rental.models.CarNameModel"%>
<%@page import="com.rental.models.CompanyModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Car - Client</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#company").change(function () {
                let selectedCompany = $(this).val(); // Get selected company
                $.ajax({
                    url: "CarNameServlet",
                    type: "GET",
                    data: { company: selectedCompany },
                    success: function (response) {
                        let carNames = response;//JSON.parse(response); // Parse JSON response
                        let carNameSelect = $("#carName");
                        carNameSelect.empty(); // Clear existing options
                        $.each(carNames, function (index, car) {
                            carNameSelect.append(
                                "<option value='"+car.carName+"'>"+car.carName+"</option>"
                            );
                        });
                    },
                    error: function () {
                        alert("Error fetching car names!");
                    },
                });
            });
            
            $("#carName").change(function () {
                let selectedCarName = $(this).val(); // Get selected Car
                $.ajax({
                    url: "CarNamesModelServlet",
                    type: "GET",
                    data: { carName: selectedCarName },
                    success: function (response) {
                    	debugger;
                        let carModels = response;//JSON.parse(response); // Parse JSON response
                        let carModelSelect = $("#carModel");
                        carModelSelect.empty(); // Clear existing options
                        $.each(carModels, function (index, car) {
                        	carModelSelect.append(
                                "<option value='"+car.model+"'>"+car.model+"</option>"
                            );
                        });
                    },
                    error: function () {
                        alert("Error fetching car models!");
                    },
                });
            });
        });
    </script>
<style>
/* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body Styling */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f8f9fa;
    color: #333;
    line-height: 1.6;
}

/* Form Container */
form {
    max-width: 600px;
    background: #ffffff;
    margin: 20px auto;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
}

table td {
    padding: 10px 15px;
    vertical-align: middle;
    font-size: 14px;
}

/* Headings */
h3 {
    font-size: 18px;
    margin-bottom: 10px;
    text-align: center;
    line-height: 1.4;
}

h3[style*="color: red"] {
    color: #e74c3c;
}

h3[style*="color: green"] {
    color: #2ecc71;
}

/* Inputs and Selects */
select,
input[type="text"],
input[type="submit"],
input[type="reset"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
}

/* Focus Styling */
select:focus,
input[type="text"]:focus {
    border-color: #3498db;
    outline: none;
    box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
}

/* Submit Button */
input[type="submit"] {
    background-color: #28a745;
    color: white;
    border: none;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #218838;
}

/* Reset Button */
input[type="reset"] {
    background-color: #e74c3c;
    color: white;
    border: none;
    cursor: pointer;
    font-weight: bold;
    transition: background-color 0.3s;
}

input[type="reset"]:hover {
    background-color: #c0392b;
}

/* Responsive Design */
@media (max-width: 768px) {
    form {
        padding: 15px;
    }

    table td {
        display: block;
        width: 100%;
        text-align: left;
    }

    table td:first-child {
        font-weight: bold;
        margin-top: 10px;
    }

    table td:nth-child(2) {
        margin-bottom: 10px;
    }

    input[type="submit"],
    input[type="reset"] {
        width: 48%;
        margin-right: 2%;
    }

    input[type="reset"] {
        margin-right: 0;
    }
}

@media (max-width: 480px) {
    input[type="submit"],
    input[type="reset"] {
        width: 100%;
        margin-right: 0;
    }
}

</style>
</head>
<body>
<% 
    List<CompanyModel> companies = (List<CompanyModel>)request.getAttribute("companies");
	List<CarNameModel> carNames =  (List<CarNameModel>)request.getAttribute("carNames");
	List<CarNameVariantModel> carNameVariants = (List<CarNameVariantModel>)request.getAttribute("carModelVariants");
%>

<form action="addEditCarServlet" method="post">
		<table>
			<tr>
				<td>
					<h3 style="color: red">${message}</h3>
					<h3 style="color: green">${successMessage}</h3>
				</td>
			</tr>
			<tr>
				<td>
					<h3 style="color: red">Car Registration Form for Rent!!!</h3>
				</td>
			</tr>
			<tr>
			    <td>Select Company: </td>
			    <td>
			        <select name="company" id="company">
			            <% for (CompanyModel company : companies) { %>
			                <option value="<%= company.getCompanyName() %>"><%= company.getCompanyName() %></option>
			            <% } %>
			        </select>
			    </td>
			</tr>
			<tr>
                <td>Select Car Name: </td>
                <td>
                    <select name="carName" id="carName">
                        <option value="">-- Select Car Name --</option>
                        <% for (CarNameModel carNameModel : carNames) { %>
			                <option value="<%= carNameModel.getCarName() %>"><%= carNameModel.getCarName() %></option>
			            <% } %>
                    </select>
                </td>
            </tr>
            
            <tr>
                <td>Select Car Model: </td>
                <td>
                    <select name="carModel" id="carModel">
                        <option value="">-- Select Car Model --</option>
                        <% for (CarNameVariantModel carNameVariantModel : carNameVariants) { %>
			                <option value="<%= carNameVariantModel.getModel() %>"><%= carNameVariantModel.getModel() %></option>
			            <% } %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Select Car Year: </td>
                <td>
                    <select name="carYear" id="carYear">
                        <option value="">-- Select Car Year --</option>
                        <% for (int i=Year.now().getValue();i>=1950;i--) { %>
			                <option value="<%= i %>"><%= i %></option>
			            <% } %>
                    </select>
                </td>
            </tr>
            
            <tr>
				<td>Rent Price : </td>
				<td><input type="text" name="price"></td>
			</tr>
            					
			<tr>
				<td><input type="submit" name="submit" value="Register Car"></td>
				<td><input type="reset" value="Reset"></td>
			</tr>
		</table>
	</form>


</body>
</html>