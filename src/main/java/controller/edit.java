package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.Dao;

@WebServlet("/edit")
@MultipartConfig(maxFileSize = 10*1024*1024)
public class edit extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		String category=req.getParameter("category");
		long price=Integer.parseInt(req.getParameter("price"));
		String status=req.getParameter("status");
		
//		Part imagePart = req.getPart("image");
//		byte[] imagebyte = imagePart.getInputStream().readAllBytes();
		
		Dao dao=new Dao();
		
		try {
			int res=dao.update(id, name, category, price,status);
			
//			if(status.equals("no"))
//			{
//				Connection con=Dao.getconnection();
//				Statement st=con.createStatement();
//				st.executeUpdate("delete from cart where product_id='"+id+"' and address is NULL");
//			}
			
			if(res>0)
			{
				resp.sendRedirect("EditAllProd.jsp");
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}
}
