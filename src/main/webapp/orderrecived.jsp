<%@page import="java.awt.Taskbar.State"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.util.Base64"%>
<%@ include file="adminhome.jsp" %>
<%@page import="java.sql.*"  %>
<%@page import="java.io.*"  %>
<%@page import="dao.Dao"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.cart-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.cart-table th, .cart-table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: left;
}

.cart-table th {
    background-color: #f2f2f2;
}

.cart-table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

.cart-table tbody tr:hover {
    background-color: #f0f0f0;
}


</style>
</head>
<body>

<table class="cart-table">
<thead>
    <tr>
        <th>S.No</th>
        <th>Product Name</th>
        <th>Category</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total</th>
        <th>status</th>
        <th>Order Date</th>
        <th>Address</th>
    </tr>
</thead>
<tbody>
<%
try{
    Connection con = Dao.getconnection();
    Statement st=con.createStatement();
    ResultSet rs=st.executeQuery("select * from cart inner join product where cart.product_id=product.id and cart.orderdate is not NULL and cart.status='billed' ");
    int sno = 1; // Initialize sno
    while(rs.next()) {
        
%>
  
    <tr>
      <td><%= sno++ %></td>
      <td><%= rs.getString(17) %></td>
      <td><%= rs.getString(18) %></td>
      <td><%= rs.getString(4) %></td>
      <td><%= rs.getString(3) %></td>
      <td><%= rs.getString(5) %></td>
      <td><%= rs.getString(14) %></td>
      <td><%= rs.getString(12) %></td>
          <td><%= rs.getString(6) %>,<%= rs.getString(7) %>,<%= rs.getString(8) %></td>

    </tr>
    
<%
    }
} catch(Exception e) {
    e.printStackTrace(); // Log or handle the exception appropriately
}
%>
</tbody>
</table>

</body>
</html>
