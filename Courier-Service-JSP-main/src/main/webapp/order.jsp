<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Place a New Order</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato&display=swap">
</head>
<body class="order">
    
    <div class="container">
    <%@ include file="navbar.jsp" %>
        <main>
            <h2 align="center">Place a New Order</h2>
            <form action="order" method="post">
                <label for="customerName">Customer Name:</label>
                <input type="text" id="customerName" name="customerName" required><br><br>

                <label for="phoneNumber">Phone Number:</label> <!-- New input field -->
                <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>

                <label for="item">Item:</label>
                <input type="text" id="item" name="item" required><br><br>

                <label for="pickupAddress">Pickup Address:</label>
                <textarea id="pickupAddress" name="pickupAddress" required></textarea><br><br>

                <label for="deliveryAddress">Delivery Address:</label>
                <textarea id="deliveryAddress" name="deliveryAddress" required></textarea><br><br>

                <button type="submit">Submit</button>
            </form>
        </main>
        <%@ include file="footer.jsp" %>
    </div>
</body>
</html>
