package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.user;

@WebServlet("/addtocart")
public class addtocart extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		user user = (user) req.getSession().getAttribute("user");
		if (user == null) {
			resp.sendRedirect("login.jsp"); // Redirect to login page if user is not logged in
			return;
		}

		String email = user.getEmail();
		String proId = req.getParameter("id");
		Dao dao = new Dao();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			con = dao.getconnection();

			// Check if the product is already in the cart
			PreparedStatement selectCartStmt = con
					.prepareStatement("SELECT * FROM cart WHERE product_id = ? AND email = ? AND address IS NULL");
			selectCartStmt.setString(1, proId);
			selectCartStmt.setString(2, email);
			rs = selectCartStmt.executeQuery();
			if (rs.next()) {
				// If the product is already in the cart, update the quantity and total
				int cartTotal = rs.getInt("total") + rs.getInt("price");
				int quan = rs.getInt("quantity") + 1;
				PreparedStatement updateStmt = con.prepareStatement(
						"UPDATE cart SET total = ?, quantity = ? WHERE product_id = ? AND email = ? AND address IS NULL");
				updateStmt.setInt(1, cartTotal);
				updateStmt.setInt(2, quan);
				updateStmt.setString(3, proId);
				updateStmt.setString(4, email);
				updateStmt.executeUpdate();
			} else {
				// If the product is not in the cart, insert it into the cart
				PreparedStatement selectProductStmt = con.prepareStatement("SELECT price FROM product WHERE id = ?");
				selectProductStmt.setString(1, proId);
				ResultSet productRs = selectProductStmt.executeQuery();
				if (productRs.next()) {
					
					Random r=new Random();
					
					int nr=r.nextInt(5000);
					
					int proPrice = productRs.getInt("price");
					PreparedStatement insertStmt = con.prepareStatement(
							"INSERT INTO cart(email, product_id, quantity, price, total ,random) VALUES (?, ?, ?, ?, ?, ?)");
					insertStmt.setString(1, email);
					insertStmt.setString(2, proId);
					insertStmt.setInt(3, 1);
					insertStmt.setInt(4, proPrice);
					insertStmt.setInt(5, proPrice);
					insertStmt.setInt(6, nr);
					insertStmt.executeUpdate();
				}
			}

			resp.sendRedirect("userhome.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			// You should handle exceptions properly here, for example, display an error
			// page
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pst != null) {
					pst.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
