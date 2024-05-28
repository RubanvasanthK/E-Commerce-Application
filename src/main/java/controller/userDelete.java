package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.user;

@WebServlet("/userDelete")
public class userDelete extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		user u=(user) req.getSession().getAttribute("user");
		
		String id=req.getParameter("id");
		
		Dao dao=new Dao();
		
		try {
			Connection con = dao.getconnection();
			Statement st=con.createStatement();
			
			st.executeUpdate("delete from cart where email='"+u.getEmail()+"' and product_id="+id+" and address is NULL");
			resp.sendRedirect("mycart2.jsp");
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
    	
	}
}

