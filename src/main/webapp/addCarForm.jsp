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
                                "<option value=''"+car.carName+"'>"+car.carName+"</option>"
                            );
                        });
                    },
                    error: function () {
                        alert("Error fetching car names!");
                    },
                });
            });
        });
    </script>

</head>
<body>
<% 
    List<CompanyModel> companies = (List<CompanyModel>)request.getAttribute("companies");
	List<CarNameModel> carNames = (List<CarNameModel>)request.getAttribute("carNames");
%>

<form action="loginController" method="post">
		<table style="background-color: lightgreen; margin-left: 20px; margin-top: 20px">
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
				<td><input type="submit" name="submit" value="Register Car"></td>
				<td><input type="reset" value="Reset"></td>
			</tr>
		</table>
	</form>


</body>
</html>