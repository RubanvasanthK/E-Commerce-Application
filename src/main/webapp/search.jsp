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
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        border-radius: 5px;
        overflow: hidden;
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
        max-width: 100px;
        max-height: 100px;
        vertical-align: middle;
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
				<th>Product Image</th>
				<th>ID</th>
				<th>Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Add to Cart</th>
			</tr>

		</thead>
		<tbody>
		
        <%
        int i=0;
		try
		{	
			String name=request.getParameter("search");
			
			Connection con = Dao.getconnection();
			Statement st=con.createStatement();
			ResultSet rs= st.executeQuery("select * from product where 	Name like '%"+name+"%' or Category like '%"+name+"%'");
			
			while(rs.next() && (!name.equals(""))) 
			{ i=1;
        %>
        
			<tr>
				<td><%
                    // Retrieve image data as a byte array
                    byte[] imageData = rs.getBytes(6);
                    // Convert byte array to Base64 string
                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                %><img src="data:image/jpeg;base64, <%= base64Image %>"></td>
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><a href="mycart.jsp?id=<%=rs.getString(1) %>" id="aa">Add to Cart</a></td>
			</tr>
        
        <% } 
		}
		catch(Exception e)
		{
		    System.out.println(e);
		}
		%>
		
		</tbody>
	</table>
<% if(i==0){ %>
<h1>Product not available</h1>
<% } %>
</body>
</html>