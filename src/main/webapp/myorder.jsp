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
<title>Insert title here</title>

<style type="text/css">

body {
  font-family: 'Arial', sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 20px;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

thead {
  background-color: #007bff;
  color: #ffffff;
}

th, td {
  padding: 10px;
  border: 1px solid #ddd;
  text-align: left;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

img {
  width: 120px;
  height: 120px;
  border-radius: 5px;
}

td {
  vertical-align: middle;
}

/* Add some padding and a light border to each table cell */
th, td {
  padding: 15px;
  border-bottom: 1px solid #ddd;
}

/* Style the table header */
th {
  background-color: #4CAF50;
  color: white;
}

/* Highlight the row the user is hovering over */
tr:hover {
  background-color: #ddd;
}

/* Responsive table adjustments */
@media screen and (max-width: 600px) {
  table {
    width: 100%;
  }

  thead {
    display: none;
  }

  tr {
    margin-bottom: 10px;
    display: block;
    border-bottom: 2px solid #ddd;
  }

  td {
    display: block;
    text-align: right;
    padding-left: 50%;
    position: relative;
  }

  td::before {
    content: attr(data-label);
    position: absolute;
    left: 0;
    width: 50%;
    padding-left: 15px;
    font-weight: bold;
    text-align: left;
  }
}


</style>

</head>
<body>

<table>

<table>
  <thead>
    <tr>
      <th>S.No</th>
     
      <th>Product Name</th>
      <th>Category</th>    
      <th>Price</th>
      <th>Quantity</th>
      <th>Sub Total</th>
       <th>Status</th>
        <th>Delivery date</th>
     
   
    </tr>
  </thead>
  <tbody>
  
  <%  
    try {
    	 user user = (user) request.getSession().getAttribute("user");
        Connection con = Dao.getconnection();
        PreparedStatement ps = con.prepareStatement("select * from cart inner join  product where cart.product_id=product.id and cart.email='"+user.getEmail()+"' and cart.orderdate is not NULL");
  
        ResultSet rs = ps.executeQuery();
        
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

    </tr>
    
  <%
        }
    } catch(Exception e) {
        e.printStackTrace(); // Log or handle the exception appropriately
    }
  %>
  </tbody>

</table>


</table>

</body>
</html>