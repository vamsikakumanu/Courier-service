<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Orders</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato&display=swap">
</head>
<body>
    <div class="container">
        <%@ include file="navbar.jsp" %>
        <main>
            <h2  align="center">My Orders</h2>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Item</th>
                        <th>Pickup Address</th>
                        <th>Delivery Address</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        HttpSession sessionObj = request.getSession(false);
                        if (sessionObj == null || sessionObj.getAttribute("userId") == null) {
                            response.sendRedirect("login.jsp");
                        } else {
                            int userId = (int) sessionObj.getAttribute("userId");
                            String role = (String) sessionObj.getAttribute("role");

                            String dbURL = "jdbc:mysql://localhost:3306/courier_service";
                            String dbUser = "root";
                            String dbPassword = "Naveen@123";

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
                                String query = "SELECT * FROM orders";
                                if (!"admin".equals(role)) {
                                    query += " WHERE user_id = ?";
                                }

                                PreparedStatement statement = conn.prepareStatement(query);
                                if (!"admin".equals(role)) {
                                    statement.setInt(1, userId);
                                }
                                ResultSet rs = statement.executeQuery();

                                if (!rs.isBeforeFirst()) {
                                    // No orders found for this user
                                    out.println("<tr><td colspan='6'>No orders found.</td></tr>");
                                } else {
                                    while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("customer_name") %></td>
                        <td><%= rs.getString("item") %></td>
                        <td><%= rs.getString("pickup_address") %></td>
                        <td><%= rs.getString("delivery_address") %></td>
                        <td><%= rs.getString("status") %></td>
                    </tr>
                    <%
                                    }
                                }
                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </tbody>
            </table>
        </main>
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
