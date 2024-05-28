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
<title>Products</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    
    table {
        width: 300px;
        height: 250px;
        border-collapse: collapse;
        background-color: #fff;
        border-radius: 5px;
        overflow: hidden;
        margin-top: 0px;
    }
    
    th, td {    
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    
    th {    
        background-color: #f0f0f0;
        color: #333;
    }
    
    td {
        color: #666;
    }
    
    img {
        width: 299px;
        height: 150px;
        margin-bottom: 0px;
        border: 1px solid black;
        border-top-left-radius: 10px;
        border-top-right-radius: 10px;
    }
    
    #aa {    
        text-decoration: none;
        color: #fff;
        background-color: green;
        padding: 8px 15px;
        border-radius: 5px;
        transition: background-color 0.3s ease;
    }
    
    #aa:hover {    
        background-color: black;
    }
    
    #c1 {
        margin-top: 20px;
        display: flex;
        justify-content: center;
    }
    
    #c2 {
        display: flex;
        flex-wrap: wrap; 
        justify-content: space-around; 
        gap: 40px;
        width: 90%; 
        max-width: 1350px; 
        margin-top: 20px;
         border-bottom-left-radius: 10px;
         border-bottom-right-radius: 10px;
    }
    
    #c3 {
        width: 300px;
        height: 400px;
        margin-bottom: 20px; 
    }
</style>

</head>
<body>
	

	

		<div id="c1">
		<section id="c2">
        <%
		try
		{
			Connection con = Dao.getconnection();
			Statement st=con.createStatement();
			ResultSet rs= st.executeQuery("select * from product where active='yes'");
			 
			while(rs.next())
			{
        %>
       
        <section id="c3">
        <table>
		<%
                    // Retrieve image data as a byte array
                    byte[] imageData = rs.getBytes(6);
                    // Convert byte array to Base64 string
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
         %>
		<img src="data:image/jpeg;base64, <%= base64Image %>">
		<tbody>
			
			<tr>
			    <td>name</td>
			    <td><%=rs.getString(2) %></td>
			</tr>
			<tr>
				<td>category</td>
			   <td><%=rs.getString(3) %></td>
			</tr>
			<tr>
			    <td>price</td>
			    <td><%=rs.getString(4) %></td>
			</tr>
			<tr>
			   <td>Add to Cart</td>
			  <td><a href="addtocart?id=<%= rs.getString(1) %>&productName=<%= rs.getString(2) %>" id="aa">Add to Cart</a></td>

			</tr>
			</tbody>
		
	    </table>
	</section>
        
        <% } 
		}
		catch(Exception e)
		{
		    System.out.println(e);
		}
		%>
		
		
	</section>
	
</div>
</body>
</html>
