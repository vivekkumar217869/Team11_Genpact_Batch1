<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*, java.io.*, java.sql.*, com.bank.dao.DatabaseConnection" %>

<%
    // Check if user is logged in
    if (session == null || session.getAttribute("accountNo") == null) {
        response.sendRedirect("customerLogin.jsp");
        return; // Stop further execution
    }

    String accountNo = (String) session.getAttribute("accountNo");

    // Initialize variables for user details
    String fullName = "";
    double balance = 0.0;

    try (Connection con = DatabaseConnection.getConnection(); // Use the DatabaseConnection utility
         PreparedStatement ps = con.prepareStatement("SELECT full_name, current_balance FROM customer WHERE account_no = ?")) {
        
        ps.setString(1, accountNo);
        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                fullName = rs.getString("full_name");
                balance = rs.getDouble("current_balance");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Database error occurred while fetching details.");
        request.getRequestDispatcher("error.jsp").forward(request, response);
        return; // Stop further execution
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Dashboard</title>
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
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.8);
            display: flex;
            flex-direction: column;
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
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
            animation: fadeIn 2s;
            margin-top: 0;
        }
        .info {
            margin-bottom: 20px;
        }
        .buttons {
            display: flex;
            justify-content: space-around;
            width: 100%;
        }
        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
            border-radius: 10px;
            animation: slideIn 2s;
        }
        .button-container img {
            height: 150px;
            width: 200px;
            margin-bottom: 15px;
        }
        .button-container a {
            background-color: #99c2f6;
            color: black;
            padding: 15px 20px;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
            width: 200px;
            font-size: 16px;
        }
        .button-container a:hover {
            background-color: #4187ff;
            transform: scale(1.1);
            transition: transform 0.3s;
        }
    </style>
    <script>
    window.history.pushState(null, "", window.location.href);
    window.onpopstate = function() {
        window.history.pushState(null, "", window.location.href);
    };
    </script>
</head>
<body>
    <div class="overlay">
        <div class="navbar">
            <a href="#" class="logo"><img src="logo1.png" alt="Logo"></a>
            <a href="logoutcust.jsp" class="logout">Logout</a>
        </div>

        <div class="container">
            <h2>Welcome, <%= fullName %></h2>
            <div class="info">
                <p><strong>Account Number:</strong> <%= accountNo %></p>
                <p><strong>Balance:</strong> ₹<%= balance %></p>
            </div>
            <div class="buttons">
                <div class="button-container">
                    <img src="deposit.jpeg" alt="Deposit" height="150" width="200">
                    <a href="transaction.jsp">Deposit/Withdraw</a>
                </div>
                <div class="button-container">
                    <img src="update.jpeg" alt="Update Profile" height="150" width="200">
                    <a href="profile.jsp">Update Profile</a>
                </div>
                <div class="button-container">
                    <img src="history.jpeg" alt="Transaction History" height="150" width="200">
                    <a href="transactionHistory.jsp">Transaction History</a>
                </div>
                <div class="button-container">
                    <img src="delete.jpeg" alt="Delete Account" height="150" width="150">
                    <a href="deleteAccount.jsp">Delete Account</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
