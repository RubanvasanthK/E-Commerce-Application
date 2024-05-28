package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.Dao;

@WebServlet("/Addproduct")
@MultipartConfig(maxFileSize = 10*1024*1024)
public class addproduct extends HttpServlet

{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		String name=req.getParameter("name");
		String cat=req.getParameter("cat");
		int price=Integer.parseInt(req.getParameter("price"));
		String actice=req.getParameter("active");
		
		Part imagePart = req.getPart("image");
		byte[] imagebyte = imagePart.getInputStream().readAllBytes();
	
		Dao dao=new Dao();
		
		try {
			int res=dao.addProduct(id, name, cat, price, actice, imagebyte);
			
			if(res>0)
			{
				resp.sendRedirect("regDone.jsp");
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
