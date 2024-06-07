Courier Service Web Application
Overview
This project is a web-based courier service application developed using JavaServer Pages (JSP) and a MySQL database. The application is designed to facilitate the process of placing and managing courier orders. It provides a user-friendly interface for users to register, log in, place orders, and view their order history. Additionally, it includes administrative capabilities for viewing all orders.

Features
User Registration and Login
The application allows new users to create an account by registering with a username and password. Once registered, users can log in to their accounts. The authentication mechanism ensures that only registered users can access the main features of the application.

Place Orders
Authenticated users can place new courier orders. The order form requires users to provide the customer's name, phone number, item description, pickup address, and delivery address. Once the order is placed, it is stored in the database with a status of "Pending."

View Orders
Users can view a list of their own orders. Each order displays relevant details such as the order ID, customer name, item, pickup address, delivery address, and the current status of the order. Admin users have the additional capability to view all orders placed by all users, providing them with a comprehensive overview of all courier activities.

Session Management
The application includes session management to ensure secure access to user-specific features. Only logged-in users can place and view orders. If a user attempts to access these features without logging in, they are redirected to the login page.

Technical Details
The backend of the application is built using JSP and servlets. The frontend utilizes HTML and CSS for structure and styling, ensuring a clean and responsive user interface. The application interacts with a MySQL database to store user information and order details. The database schema includes tables for users and orders, with appropriate relationships and constraints to maintain data integrity.

Database Schema
Users Table
The users table stores information about registered users, including their usernames, passwords, and roles.

Columns:
id (INT, PRIMARY KEY, AUTO_INCREMENT)
username (VARCHAR(255), UNIQUE, NOT NULL)
password (VARCHAR(255), NOT NULL)
role (VARCHAR(50), NOT NULL, DEFAULT 'user')
Orders Table
The orders table stores details about each courier order, including customer information, order details, and the user who placed the order.

Columns:
id (INT, PRIMARY KEY, AUTO_INCREMENT)
customer_name (VARCHAR(255), NOT NULL)
phone_number (VARCHAR(20), NOT NULL)
item (VARCHAR(255), NOT NULL)
pickup_address (TEXT, NOT NULL)
delivery_address (TEXT, NOT NULL)
status (VARCHAR(50), NOT NULL, DEFAULT 'Pending')
user_id (INT, FOREIGN KEY referencing users(id))
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

Conclusion
This Courier Service Web Application demonstrates a practical implementation of a web-based courier management system. It provides essential features for both users and administrators, ensuring efficient and secure handling of courier orders. The use of JSP and MySQL provides a robust foundation for the application, making it a reliable solution for managing courier services.
