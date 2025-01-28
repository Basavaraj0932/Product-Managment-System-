<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Update Employee</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            max-width: 450px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            margin-top: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
            color: #666;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #0078d7;
            color: #ffffff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #005fa8;
        }

        .message {
            color: red;
            text-align: center;
            margin-bottom: 10px;
        }

        .success {
            color: green;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Update Employee Details</h2>

        <%  
            String message = "";
            if (request.getParameter("submit") != null) {
                try {
                    int id = Integer.parseInt(request.getParameter("id").trim());
                    String name = request.getParameter("name").trim();
                    String price = request.getParameter("price").trim();
                    String category = request.getParameter("category").trim();

                    // Database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/product_db?useSSL=false&serverTimezone=UTC",
                        "root",
                        "Basavaraj0932@"
                    );

                    // Update query
                    String sql = "UPDATE product SET name = ?, price = ?, category = ? WHERE id = ?";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setString(1, name);
                    ps.setString(2, price);
                    ps.setString(3, category);
                    ps.setInt(4, id);

                    int rowsUpdated = ps.executeUpdate();
                    con.close();

                    if (rowsUpdated > 0) {
                        response.sendRedirect("display.jsp");
                        return;
                    } else {
                        message = "No employee found with the given ID.";
                    }

                } catch (NumberFormatException e) {
                    message = "Invalid input for ID or Price.";
                } catch (Exception e) {
                    message = "Error: " + e.getMessage();
                }
            }
        %>

        <!-- Display message -->
        <p class="message"><%= message %></p>

        <!-- Update form -->
        <form action="update.jsp" method="post">
            <label for="id">ID:</label>
            <input type="text" id="id" name="id" placeholder="Enter Employee ID" required>

            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter Name" required>

            <label for="price">Price:</label>
            <input type="text" id="price" name="price" placeholder="Enter Price" required>

            <label for="category">Category:</label>
            <input type="text" id="category" name="category" placeholder="Enter Category" required>

            <input type="submit" name="submit" value="Update">
        </form>
    </div>
</body>
</html>
