<%@page import="com.rental.models.UserModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin - Dashboard</title>
</head>
<body>
<% UserModel userModel=(UserModel)request.getAttribute("user"); %>

Hi <%=userModel.getName()%>
Your role is : <%=userModel.getRole()%>

</body>
</html>