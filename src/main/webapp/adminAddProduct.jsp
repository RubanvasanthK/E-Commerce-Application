<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="dao.Dao" %>
    <%@page import="java.sql.*"  %>
    <%@ include file="adminhome.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

/* styles.css */

/* Body styles */
body {
  background-image: url('background.jpg'); /* Replace 'background.jpg' with your image path */
  background-size: cover; /* Cover the entire viewport */
  background-repeat: no-repeat; /* Do not repeat the background image */
}

/* Form styles */
form {
  background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent white background */
  padding: 10px; /* Add padding */
  width: 50%; /* Set the form width */
  margin: 0 auto; /* Center the form horizontally */
  border-radius: 10px; /* Add rounded corners */
}

/* Input field styles */
input[type="text"],
input[type="number"],
input[type="file"],
select {
  width: 100%; /* Set input width to 100% */
  padding: 10px; /* Add padding */
  margin-bottom: 10px; /* Add space between input fields */
  border: 1px solid #ccc; /* Add border */
  border-radius: 5px; /* Add rounded corners */
}

/* Submit button styles */
input[type="submit"] {
  width: 100%; /* Set button width to 100% */
  padding: 10px; /* Add padding */
  background-color: #007bff; /* Blue background color */
  color: white; /* White text color */
  border: none; /* Remove border */
  border-radius: 5px; /* Add rounded corners */
  cursor: pointer; /* Change cursor to pointer on hover */
}

/* Submit button hover effect */
input[type="submit"]:hover {
  background-color: #0056b3; /* Darker blue color on hover */
}


</style>

</head>
<body>


<%

int id=1;

try{
	
	Connection con =Dao.getconnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from db4.product");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e)
{
	
}

%>

<form action="Addproduct" method="post" enctype="multipart/form-data">

<input type="hidden" name="id" value="<%= id %>">



<h3>Enter product Name</h3>
<input type="text" name="name" placeholder="Enter Product Name" required>

<br>

<h3>Enter category</h3>
<input type="text" name="cat" placeholder="Enter category" required>

<br>

<h3>Enter price</h3>
<input type="number" name="price" placeholder="Enter price" required>

<br>

<h3>Active</h3>
<select name="active">

<option value="yes">yes</option>
<option value="no">no</option>

</select>

<br>
<h3>Add image</h3>
<input type="file" name="image">
<br>
<br>


<input type="submit" name="" id="" value="Add product">



</form>

</body>
</html>