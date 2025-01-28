<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Product Display Page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
          crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" 
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" 
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" 
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" 
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" 
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" 
            crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-5">
    <h2>Product List</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Price</th>
                <th>Category</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% 
                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/product_db", "root", "Basavaraj0932@");

                    // SQL query to retrieve products sorted by ID
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM product ORDER BY id ASC");
                    ResultSet rs = ps.executeQuery();
                    
                    // Loop through the result set and display products
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getDouble(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td>
                    <a href="update.jsp?id=<%= rs.getInt(1) %>" class="btn btn-info btn-sm">Update</a>
                    <a href="Delete?eid=<%= rs.getInt(1) %>" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
            <% 
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
