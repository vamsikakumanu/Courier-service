package com.courier;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("userId");

        String customerName = request.getParameter("customerName");
        String phoneNumber = request.getParameter("phoneNumber");
        String item = request.getParameter("item");
        String pickupAddress = request.getParameter("pickupAddress");
        String deliveryAddress = request.getParameter("deliveryAddress");

        String dbURL = "jdbc:mysql://localhost:3306/courier_service";
        String dbUser = "root";
        String dbPassword = "7893891841";

        Connection conn = null;
        PreparedStatement statement = null;

        try {
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            String query = "INSERT INTO orders (customer_name, PhoneNumber, item, pickup_address, delivery_address, status, user_id) VALUES (?, ?, ?, ?, ?, 'Pending', ?)";
            statement = conn.prepareStatement(query);
            statement.setString(1, customerName);
            statement.setString(2, phoneNumber);
            statement.setString(3, item);
            statement.setString(4, pickupAddress);
            statement.setString(5, deliveryAddress);
            statement.setInt(6, userId);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new order was inserted successfully!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        response.sendRedirect("orderPlaced.jsp");
    }
}
