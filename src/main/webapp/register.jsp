<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
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
	<%
	String sm  = "";
	String erm = "";
	if(request.getAttribute("successMessage") != null){
		sm = (String)request.getAttribute("successMessage");
	}
	if(request.getAttribute("errorMessage") != null){
		erm = (String)request.getAttribute("errorMessage");
	}
	%>
    <h2>User Registration</h2>
    <h3 style="color: red"><%=erm%></h3>
	<h3 style="color: green"><%=sm%></h3>
				
    <form action="registerationController" method="post" onsubmit="return validateForm()">
        <label>Name:</label>
        <input type="text" name="name" required /><br><br>

        <label>Username:</label>
        <input type="text" name="username" required /><br><br>

        <label>Password:</label>
        <input type="password" id="password" name="password" required /><br><br>

        <label>Confirm Password:</label>
        <input type="password" id="confirmPassword" required /><br><br>

        <label>Role:</label>
        <select name="role" required>
            <option value="CLIENT">CLIENT</option>
            <option value="CUSTOMER">CUSTOMER</option>
        </select><br><br>

        <label>Contact Number:</label>
        <input type="text" name="contactNumber" required /><br><br>

        <input type="submit" value="Register" />
    </form>
</body>
</html>
