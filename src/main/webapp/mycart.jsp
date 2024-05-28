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
    img {
        max-width: 100px;
        max-height: 100px;
        vertical-align: middle;
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

			</tr>

		</thead>
		<tbody>
		
        <%
        String productId = request.getParameter("id");
        
		try
		{
			Connection con = Dao.getconnection();
			Statement st=con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM product WHERE id='" + productId + "'");
		    
			
			while(rs.next())
			{
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




</body>
</html>