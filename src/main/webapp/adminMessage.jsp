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

tbody td {
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

tbody tr:hover {
    background-color: #f0f0f0;
}


</style>
</head>
<body>

 	<table>

		<thead>

			<tr>
				<th>UserName</th>
				<th>Message</th>

			</tr>

		</thead>

<%   try {
    Connection con = Dao.getconnection();
    PreparedStatement ps = con.prepareStatement("SELECT * from db4.message");
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
   %>
   
  
		<tbody>
			
			<tr> 
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			</tr>
		
		</tbody>
		
		  <% }
  } catch (Exception e) {
    e.printStackTrace(); // Log or handle the exception appropriately
  }  %>
		</table>
   
     


</body>
</html>