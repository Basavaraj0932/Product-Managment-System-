package com.pms;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowServlet
 */
public class ShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ShowServlet() {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();      
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        
        out.println("Name: " + name);
        out.println("Price: " + price);
        out.println("Category: " + category);
        
        response.setContentType("text/html");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/product_db?useSSL=false&serverTimezone=UTC", 
                "root", 
                "Basavaraj0932@"
            );
            PreparedStatement ps = con.prepareStatement("INSERT INTO product (name, price, category) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, category);
            ps.execute();

            out.println("<br>Record inserted successfully.");
            out.println("<br><a href='display.jsp'>Display Products</a>");
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
}
