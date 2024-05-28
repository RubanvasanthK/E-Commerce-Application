package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.user;

@WebServlet("/saveuser")
public class Saveuser extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		long number=Integer.parseInt(req.getParameter("number"));
		String SecQuestion=req.getParameter("securityQuestion");
		String answer=req.getParameter("answer");
		String password=req.getParameter("password");
		String address="";
		String city="";
		String state="";
		String country="";
		
		user user=new user(name, email, number, SecQuestion, answer, password, address, city, state, country);
		
		Dao dao=new Dao();
		
		try {
			int res=dao.saveUser(user);
			if(res>0)
			{
				resp.sendRedirect("regDone.jsp");
			}
			else
			{
				PrintWriter pw=resp.getWriter();
				pw.print("error occured");
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			PrintWriter pw=resp.getWriter();
			pw.print("error occur");
		}
		
	}
}
