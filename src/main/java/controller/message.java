package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import dto.user;

@WebServlet("/message")
public class message extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        user u = (user) req.getSession().getAttribute("user");
        String mes = req.getParameter("mes");
        String user = u.getName();

        try {
            Connection con = Dao.getconnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery("select max(id) from db4.message ");

            int id = 0;

            if (rs.next()) {
                id = rs.getInt(1); // Retrieve the maximum id
            }

            PreparedStatement pst = con.prepareStatement("insert into db4.message values (?,?,?)");

            // Increment id if it's not the first entry
            if (id > 0) {
                id++;
            } else {
                id = 1; // Set id to 1 if it's the first entry
            }

            pst.setInt(1, id);
            pst.setString(2, user);
            pst.setString(3, mes);

            pst.executeUpdate();

            resp.sendRedirect("MessageSent.jsp");

        } catch (Exception e) {
            // Handle exception
            e.printStackTrace();
        }
    }
}

