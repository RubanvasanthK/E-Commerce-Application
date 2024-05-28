<%@page import="java.util.Base64"%>
<%@page import="java.sql.*"  %>
<%@page import="java.io.*"  %>
<%@page import="dao.Dao"  %>
<%@ include file="adminhome.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

/* Table styles */
table {
  width: 100%;
  border-collapse: collapse;
  margin-top:10px;
}

thead {

  background-color: #f2f2f2;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

/* Image styles */
img {
  width: 120px;
  height: 120px;
  object-fit: cover;
}

/* Edit link style */
a{
  color: green;
  text-decoration: none;
}

a:hover {
  text-decoration: underline;
   color: red;
}

/* Row styles */
tr {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* Add box shadow */
  margin-bottom: 10px; /* Add gap between rows */
}


</style>


</head>
<body>

	<table>

		<thead>

			<tr>
				<th>ProductImg</th>
				<th>ID</th>
				<th>Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Status</th>
				<th>Edit</th>
				<th>Delete</th>

			</tr>

		</thead>
		<tbody>
		<%
		try
		{
			Connection con =Dao.getconnection();
			Statement st=con.createStatement();
			ResultSet rs= st.executeQuery("select * from product");
			
			while(rs.next())
			{
			%>
		
		<tr>
			<td><%
    // Retrieve image data as a byte array
    byte[] imageData = rs.getBytes(6);
    // Convert byte array to Base64 string
    String base64Image = Base64.getEncoder().encodeToString(imageData);
%> <img src="data:image/jpeg;base64, <%= base64Image %>" width="120px" height="120px"></td>
			<td><%= rs.getString(1) %></td>
			<td><%= rs.getString(2) %></td>
			<td><%= rs.getString(3) %></td>
			<td><%= rs.getString(4) %></td>
			<td><%= rs.getString(5) %></td>
		<td><a href="edit.jsp?id=<%= rs.getString(1) %>">Edit</a></td>
		<td><a href="delete?id=<%= rs.getString(1) %>">Delete</a></td>
			
		</tr>
	<%} 
		}
		catch(Exception e)
		{
		 System.out.println(e);
		}
	%>
		</tbody>


	</table>



</body>
</html>