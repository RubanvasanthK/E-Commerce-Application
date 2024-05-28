<%@page import="dto.user"%>
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
  transition: background-color 0.3s ease;
  display: flex; /* Use flexbox for layout */
  align-items: center; /* Align items vertically */
}

.navbar a {
  color: white; 
  text-align: center;
  padding: 14px 20px; 
  text-decoration: none; 
  transition: background-color 0.3s ease;
}

/* Change background color on hover */
.navbar a:hover {
  background-color: #ddd; /* Light gray background on hover */
  color: black; /* Black text color on hover */
  border-radius: 5px;
}

.navbar form {
  margin-left: auto; /* Push the search bar to the right */
  margin-right: 20px; /* Add some right margin */
  display: flex; /* Use flexbox for layout */
}

.navbar form input[type="text"] {
  padding: 8px;
  border-radius: 5px;
  border: none;
  margin-right: 5px; /* Add some right margin */
}

.navbar form input[type="text"] {
  padding: 8px;
  background-color: #555;
  border-radius: 5px;
  cursor: pointer;
}

</style>
</head>
<body>

<% user u=(user)request.getSession().getAttribute("user"); %>
<h1>Welcome <%= u.getName() %></h1>

<div class="navbar">
  <a href="userhome.jsp">Home</a>
  <a href="mycart2.jsp">My Cart</a>
  <a href="myorder.jsp">My Order</a>
  <a href="Messageus.jsp">Message Us</a>
  <a href="AboutUs.jsp">About Us</a>
  <a href="AdminLogOut.jsp">LogOut</a>
  <form action="search.jsp">
    <input type="text" placeholder="Search" name="search">
   <input type="submit" value="search"> 
  </form>
</div>

</body>
</html>
