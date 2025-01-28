<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
</head>
<body>
    <h1>Update Product</h1>
    <form action="updateProduct" method="POST">
        <% 
            String id = request.getParameter("id");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/product_db", "root", "Basavaraj0932@");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM product WHERE id = ?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
        %>
        <label for="name">Name:</label>
        <input type="text" name="name" value="<%= rs.getString(2) %>"><br><br>
        <label for="price">Price:</label>
        <input type="text" name="price" value="<%= rs.getDouble(3) %>"><br><br>
        <label for="category">Category:</label>
        <input type="text" name="category" value="<%= rs.getString(4) %>"><br><br>
        <input type="hidden" name="id" value="<%= rs.getInt(1) %>">
        <input type="submit" value="Update">
        <% 
            }
        %>
    </form>
</body>
</html>
