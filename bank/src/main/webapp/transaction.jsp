<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*, java.io.*, java.sql.*" %>
<html>
<head>
    <title>Transaction</title>
    <style>
            body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background: url('cusbg.jpeg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }
        .navbar {
            overflow: hidden;
            background-color: rgba(0, 0, 0, 0.7);
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 20px;
        }
        .navbar .logo img {
            height: 30px;
            width: auto; /* Adjusted for responsiveness */
        }
           .navbar .logo:hover {
            background-color: transparent; /* Removed hover effect */
        }
        .navbar .logout {
            display: block;
            background-color: #99c2f6;
            color: black;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 3px;
        }
        .navbar .logout:hover {
            background-color: #4187ff;
        }
        .container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        h2 {
            text-align: center;
        }
        .info {
            margin-bottom: 20px;
        }
        .form-container {
            margin-top: 20px;
            text-align: center;
        }
        form {
            display: inline-block;
            text-align: left;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        form label {
            display: block;
            margin-bottom: 10px;
        }
        form select, form input[type="number"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
            width: 100%;
        }
        form input[type="submit"] {
            padding: 10px;
            background-color: #99c2f6; 
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
        }
        form input[type="submit"]:hover {
            background-color: #4187ff;
        }
        .success-message {
            text-align: center;
            margin-top: 20px;
            padding: 20px;
            background-color: #d4edda; /* Light green background */
            border-radius: 5px;
        }
        .success-message img {
            display: block;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div class="navbar">
    <a href="customerDashboard.jsp" class="logo"><img src="logo1.png" alt="Logo"></a>
    <a href="logoutcust.jsp" class="logout">Logout</a>
</div>

<div class="container">
    

    <div class="form-container">
        <h2>Go Ahead and complete your Transaction</h2>
        <form action="CustomerTransactionServlet" method="post">
            <label for="type">Type:</label>
            <select id="type" name="type">
                <option value="Deposit">Deposit</option>
                <option value="Withdraw">Withdraw</option>
            </select><br>
            <label for="amount">Amount:</label>
            <input type="number" id="amount" name="amount"><br>
            <input type="submit" value="Submit">
        </form>
    </div>

    <!-- Success message with GIF animation and sound -->
    <% if (request.getAttribute("successMessage") != null) { %>
        <div class="success-message">
            <p><%= request.getAttribute("successMessage") %></p>
        </div>
    <% } %>
  
</div>

<!-- JavaScript to play sound -->
<script>
    // Check if success message exists and play sound
    <% if (request.getAttribute("successMessage") != null) { %>
        var successSound = document.getElementById('successSound');
        successSound.play().catch(function(error) {
            console.error('Autoplay was prevented:', error);
            // Add fallback action here if autoplay fails
        });
    <% } %>
</script>

</body>
</html>
