package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.user;
@WebServlet("/AddressUpdate")
public class AddressUpdate extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		user user = (user) req.getSession().getAttribute("user");
		
		String address=req.getParameter("address");
		String city=req.getParameter("city");
		String state=req.getParameter("state");
		String country=req.getParameter("country");
		
		String status="billed";
		
		try {
			Connection con=Dao.getconnection();
			PreparedStatement pst=con.prepareStatement("update cart set address=?,city=?,state=?,country=?,mobile=?,orderdate=now(),delivarydate=DATE_ADD(orderdate,INTERVAL 7 DAY),status=?,name=1 where email=? and address is NULL");
			pst.setString(1, address);
			pst.setString(2, city);
			pst.setString(3, state);
			pst.setString(4, country);
			pst.setLong(5, user.getMobile());
			pst.setString(6, status);
			pst.setString(7, user.getEmail());
		pst.executeUpdate();
		resp.sendRedirect("AddressForOrder.jsp");
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
}
