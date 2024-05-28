<%@page import="java.sql.*" %>
<%@page import="dao.Dao" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Product</title>

<style type="text/css">

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 20px;
}

h3 {
    margin-top: 0;
}

form {
    max-width: 400px;
    margin: 0 auto;
}

label {
    font-weight: bold;
}

input[type="text"],
select {
    width: 100%;
    padding: 8px;
    margin: 5px 0;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

input[type="file"] {
    margin-bottom: 10px;
}

.error {
    color: red;
}


</style>

</head>
<body>

<h3>Edit Product</h3>

<%
// Retrieve the product ID from the request parameter
String productId = request.getParameter("id");

try {
    // Establish database connection
    Connection con = Dao.getconnection();
    Statement st = con.createStatement();
    
    // Execute query to retrieve product details based on ID
    ResultSet rs = st.executeQuery("SELECT * FROM product WHERE id='" + productId + "'");
    
    // Check if result set has data
    if (rs.next()) {
        // Retrieve product details
        String name = rs.getString("name");
        String category = rs.getString("category");
        double price = rs.getDouble("price");
        String status = rs.getString("active");
        // Retrieve image data as a byte array
      //  byte[] imageData = rs.getBytes(6);
        // Convert byte array to Base64 string
       // String base64Image = Base64.getEncoder().encodeToString(imageData);

%>

<form action="edit" method="post">
    <!-- Populate form fields with product details -->
    <input type="hidden" name="id" value="<%= productId %>">
    <label>Name:</label><br>
    <input type="text" name="name" value="<%= name %>"><br><br>
    <label>Category:</label><br>
    <input type="text" name="category" value="<%= category %>"><br><br>
    <label>Price:</label><br>
    <input type="number" name="price"><br><br>
    <label>Status:</label><br>
    <select name="status">
			<option value="yes">yes</option>
			<option value="no">no</option>
    </select><br><br>
  
    <input type="submit" value="Save">
    
    
</form>

<%
    } else {
        // If no product found with the given ID
        out.println("Product not found.");
    }
    // Close the database resources
    rs.close();
    st.close();
    con.close();
} catch (Exception e) {
    // Print any exceptions that occur
    out.println(e);
}
%>

</body>
</html>
