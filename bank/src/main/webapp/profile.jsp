<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*, java.io.*, java.sql.*" %>
<html>
<head>
    <title>Manage Profile</title>
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
            background-color: #333;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 20px;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }
        .navbar .logo img {
            height: 30px;
            width: auto; /* Adjusted for responsiveness */
        }
           .navbar .logo:hover {
            background-color: transparent; /* Removed hover effect */
        }
        .navbar .logout {
            float: right;
            display: block;
            background-color: #99c2f6;
            color: black;
            padding: 10px 20px;
            text-decoration: none;
        }
        .navbar .logout:hover {
            background-color:  #4187ff;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        h2 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 10px;
        }
        input[type="text"], input[type="email"], input[type="tel"], input[type="password"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            font-size: 14px;
        }
        input[type="submit"] {
            padding: 10px;
            background-color: #99c2f6; /* Sky blue submit button */
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            font-size: 14px;
        }
        input[type="submit"]:hover {
            background-color: #4187ff; /* Darker blue hover effect */
        }
        .message {
            font-weight: bold;
            padding: 10px;
            border-radius: 3px;
        }
        .message-green {
            color: green;
            background-color: #d4edda; /* Light green background for success */
        }
        .message-red {
            color: red;
            background-color: #f8d7da; /* Light red background for error */
        }
    </style>
</head>
<body>
<div class="navbar">
    <a href="customerDashboard.jsp" class="logo"><img src="logo1.png" alt="Logo"></a>
    <a href="logout.jsp" class="logout">Logout</a>
</div>

<div class="container">
    <h2>Manage Profile</h2>

    <%-- Display success or error message --%>
    <% if (request.getAttribute("message") != null) { %>
        <div class="message <%= request.getAttribute("messageColor") %>">
            <%= request.getAttribute("message") %>
        </div>
    <% } %>

    <form action="UpdateProfileServlet" method="post">
        <label for="fullName">Full Name</label>
        <input type="text" id="fullName" name="fullName">

        <label for="mobileNo">Mobile Number</label>
        <input type="tel" id="mobileNo" name="mobileNo">

        <label for="emailId">Email ID</label>
        <input type="email" id="emailId" name="emailId">

        <label for="currentPassword">Current Password</label>
        <input type="password" id="currentPassword" name="currentPassword">

        <label for="newPassword">New Password</label>
        <input type="password" id="newPassword" name="newPassword">

        <label for="confirmPassword">Confirm New Password</label>
        <input type="password" id="confirmPassword" name="confirmPassword">

        <input type="submit" value="Update Profile">
    </form>
</div>
</body>
</html>
