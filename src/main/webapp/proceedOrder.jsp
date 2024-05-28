<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.util.Base64"%>
<%@page import="dto.user"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 8px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
    img {
        max-width: 120px;
        max-height: 120px;
    }
    .form-container {
        margin-top: 20px;
     	justify-content:center;
     	
        flex-wrap: wrap;
    }
    .form-input {
        width: calc(25% - 10px);
        padding: 8px;
        margin-right: 10px;
    }
    .form-submit {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        cursor: pointer;
    }
    .form-submit:hover {
        background-color: #45a049;
    }
</style>

<script type="text/javascript">
	if (window.history.forward(1) != null)
		window.history.forward(1);
</script>
</head>
<body>


	<table>
		<thead>

			<%
			user user = (user) request.getSession().getAttribute("user");
			int total = 0;
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			ResultSet rs1 = null;
			try {
				con = Dao.getconnection();
				ps = con.prepareStatement("SELECT SUM(total) FROM cart WHERE email=? and name is  null");
				ps.setString(1, user.getEmail());
				rs = ps.executeQuery();

				if (rs.next()) {
					total = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			%>

			<tr>
				<th>s.no</th>
				<th>Product Image</th>
				<th>Product Name</th>
				<th>Category</th>
				<th>Price</th>
				<th>Quality</th>
				<th>Sub Total</th>
			</tr>

		</thead>
		<tbody>

			<%
			try {
				con = Dao.getconnection();
				ps = con.prepareStatement(
				"SELECT * FROM product INNER JOIN cart ON product.id = cart.product_id WHERE cart.email = ? AND cart.address IS NULL");
				ps.setString(1, user.getEmail());
				rs = ps.executeQuery();

				int sno = 1;
				while (rs.next()) {
			%>

			<tr>
				<td><%=sno++%></td>
				<td>
					<%
					// Retrieve image data as a byte array
					byte[] imageData = rs.getBytes(6);
					// Convert byte array to Base64 string
					String base64Image = Base64.getEncoder().encodeToString(imageData);
					%> <img
					src="data:image/jpeg;base64, <%=base64Image%>" width="120px"
					height="120px">
				</td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(9)%></td>
				<td><%=rs.getString(11)%></td>

			</tr>

			<%
			}
			} catch (SQLException e) {
			e.printStackTrace();
			}
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="7"></td>
				<td>Grand Total:<%=total%></td>

			</tr>
		</tfoot>
	</table>

	<hr>

<form action="AddressUpdate" class="form-container" method="post">

    <input type="text" name="address" class="form-input" placeholder="Enter address">
    
    <input type="text" name="city" class="form-input" placeholder="Enter City">
    <input type="text" name="state" class="form-input" placeholder="Enter State">
    <input type="text" name="country" class="form-input" placeholder="Enter Country">
    <input type="submit" class="form-submit" value="Submit">

</form>


</body>
</html>
