<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <header>
            <h1>Register</h1>
        </header>
        <main>
            <form action="register" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required><br><br>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required><br><br>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br><br>

                <button type="submit">Register</button>
            </form>
        </main>
        <footer>
            <p>&copy; 2024 Courier Service</p>
        </footer>
    </div>
</body>
</html>
