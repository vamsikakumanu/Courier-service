<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Login</h1>
        </header>
        <main>
            <form action="login" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required><br><br>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required><br><br>

                <button type="submit">Login</button>
            </form>
        </main>
        <footer>
            <p>&copy; 2024 Courier Service</p>
        </footer>
    </div>
    <%@ include file="footer.jsp" %>
</body>
</html>
