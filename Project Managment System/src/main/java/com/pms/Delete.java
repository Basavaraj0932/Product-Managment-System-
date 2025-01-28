package com.pms;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Delete
 */
public class Delete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("eid"));
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/product_db", "root", "Basavaraj0932@");

            // Prepare delete query
            PreparedStatement ps = con.prepareStatement("DELETE FROM product WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();

            // Redirect to display.jsp, which will show sorted results
            response.sendRedirect("display.jsp");
        } catch (Exception e) {
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
