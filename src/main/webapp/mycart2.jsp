<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.util.Base64"%>
<%@ include file="userHead.jsp"%>
<%@page import="java.sql.*"  %>
<%@page import="java.io.*"  %>
<%@page import="dao.Dao"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
<style type="text/css">

body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    color: #333;
    margin: 0;
    padding: 0;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    margin-bottom: 20px;
}

thead th {
    background-color: #f3f3f3;
    border-bottom: 2px solid #ddd;
    padding: 10px;
    text-align: left;
}

tbody td, tfoot td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

tfoot td {
    font-weight: bold;
    text-align: right;
}

tfoot td:last-child {
    color: #ff6600;
}

tfoot td:last-child a {
    color: #fff;
    background-color: #ff6600;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    display: inline-block;
}

tfoot td:last-child a:hover {
    background-color: #e55f00;
}

tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

tbody tr:hover {
    background-color: #f0f0f0;
}

img {
    max-width: 100%;
    
}

a {
    color: #007bff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}
#id{
text-align: center;
}


</style>
</head>
<body>

<% 
  user user = (user) request.getSession().getAttribute("user");
  int total = 0;

  try {
    Connection con = Dao.getconnection();
    PreparedStatement ps = con.prepareStatement("SELECT SUM(total) FROM cart WHERE email=? and name is  null");
    ps.setString(1, user.getEmail());
    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
      total = rs.getInt(1);
    }
  } catch (Exception e) {
    e.printStackTrace(); 
  } finally {
   
  }
%>

<table>
  <thead>
    <tr>
      <th>S.No</th>
      <th>Product_image</th>
      <th>Product Name</th>
      <th>Category</th>    
      <th>Price</th>
      <th>Quantity</th>
      <th>Sub Total</th>
      <th>Remove</th>        
   
    </tr>
  </thead>
  <tbody>
  
  <%  
    try {
        Connection con = Dao.getconnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM product INNER JOIN cart ON product.id = cart.product_id WHERE cart.email = ? AND cart.address IS NULL");
        ps.setString(1, user.getEmail());
        ResultSet rs = ps.executeQuery();
        
        int sno = 1; // Initialize sno
        while(rs.next()) {
        	
  %>
  
    <tr>
      <td><%= sno++ %></td>
      <td><%
    // Retrieve image data as a byte array
    byte[] imageData = rs.getBytes(6);
    // Convert byte array to Base64 string
    String base64Image = Base64.getEncoder().encodeToString(imageData);
%> <img src="data:image/jpeg;base64, <%= base64Image %>" width="120px" height="120px"></td>
      <td><%= rs.getString(2) %></td>
      <td><%= rs.getString(3) %></td>
      <td><%= rs.getString(4) %></td>
      <td><%= rs.getString(9) %></td>
      <td><%= rs.getString(11) %></td>
      <td><a href="userDelete?id=<%= rs.getInt(1) %>">Remove from cart</a></td>

    </tr>
    
  <%
        }
    } catch(Exception e) {
        e.printStackTrace(); // Log or handle the exception appropriately
    }
  %>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="7"></td>
      <td>Grand Total:<%= total %></td>
   
    </tr>
    <%
if (total > 0) {
%>
<tr>
  <td colspan="7"></td>
  <td><a href="proceedOrder.jsp">Proceed to Order</a></td>
</tr>
<%
}
%>

    
  </tfoot>
</table>

</body>
</html>

