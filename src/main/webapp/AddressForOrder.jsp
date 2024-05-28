<%@page import="java.sql.*"%>
<%@page import="dao.Dao"%>
<%@page import="dto.user"%> <!-- Assuming "User" is the correct class name for your DTO -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 
    user user = (user) request.getSession().getAttribute("user");

    int total = 0;
    int sno = 0;
    
    try {
        Connection con = Dao.getconnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select sum(total) from cart where email='" + user.getEmail() + "' and status='billed'");
        while (rs.next()) {
            total = rs.getInt(1);
        }

        ResultSet rs2 = st.executeQuery("select * from user inner join cart on cart.email='" + user.getEmail() + "' and cart.status='billed'");
        while (rs2.next()) {
%>

            
            <h1>Your order got placed Mr.<%= user.getName() %> </h1>
				<a href="myorder.jsp">back to cart</a>
<% 
            break;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>
