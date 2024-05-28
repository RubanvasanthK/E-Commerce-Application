package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;
import dto.user;

@WebServlet("/login")
public class login extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		if(email.equals("admin@123") && password.equals("admin"))
		{
			HttpSession session=req.getSession();
			session.setAttribute("email",email);
			resp.sendRedirect("adminAddProduct.jsp");
			
		}
		else
		{
			int z=0;
			
			Dao dao=new Dao();
			try {
				Connection con=Dao.getconnection();
				 
				Statement st=con.createStatement();
				String query="select * from user where email='"+email+"' and password='"+password+"'";
				ResultSet rs=st.executeQuery(query);
				while(rs.next())
				{	 z=1;
				user u=dao.findByEmail(email);
					HttpSession session=req.getSession();
					session.setAttribute("user",u);
					req.getRequestDispatcher("userhome.jsp").include(req, resp);
					
				}
				
				if(z==0)
				{
					resp.sendRedirect("login.jsp");
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
//				e.printStackTrace();
				resp.sendRedirect("login.jsp");
			}
			
		}
		
		
	}
}
