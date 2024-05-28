<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

/* styles.css */

/* Style the navigation bar container */
.navbar {
  background-color: #333; /* Dark background color */
  overflow: hidden; /* Ensure contents don't overflow */
}

/* Style the links inside the navigation bar */
.navbar a {
  float: left; /* Float links to the left */
  display: block; /* Display as block elements */
  color: white; /* White text color */
  text-align: center; /* Center-align text */
  padding: 14px 20px; /* Add padding */
  text-decoration: none; /* Remove underline */
}

/* Change background color on hover */
.navbar a:hover {
  background-color: #ddd; /* Light gray background on hover */
  color: black; /* Black text color on hover */
}


</style>
</head>
<body>


<div class="navbar">
  <a href="adminAddProduct.jsp">Add new product</a>
  <a href="EditAllProd.jsp">Edit product</a>
  <a href="adminMessage.jsp">Message Received</a>
  <a href="orderrecived.jsp">Order Received</a>
  <a href="AdminLogOut.jsp">LogOut</a>
</div>
</body>
</html>