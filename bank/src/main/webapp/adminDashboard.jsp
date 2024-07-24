<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%
  
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background: url('bg.jpeg') no-repeat center center fixed;
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
        }.navbar .logo img {
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
        .buttons {
            display: flex;
            justify-content: space-around;
            width: 80%;
            
        }
        .button-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
            border-radius: 10px;
            animation: slideIn 2s;
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
        }
    </style>
</head>
<body>
    <div class="overlay">
        <div class="navbar">
            <a href="#" class="logo"><img src="logo1.png" alt="Logo"></a>
            <a href="logout.jsp" class="logout">Logout</a>
        </div>

        <div class="container">
            <h2>Admin Dashboard</h2>
            <div class="buttons">
                <div class="button-container">
                    <img src="1.jpeg" alt="Register Customer" height= "auto" width= "200px">
                    <a href="registerCustomer.jsp">Register Customer</a>
                </div>
                <div class="button-container">
                    <img src="2.jpeg" alt="Modify Customer" height= "auto" width= "200px">
                    <a href="modifyCustomer.jsp">Modify Customer </a>
                </div>
                <div class="button-container">
                    <img src="3.jpeg" alt="Delete Customer" height= "auto" width= "200px">
                    <a href="deleteCustomer.jsp">Delete Customer</a>
                </div>
                <div class="button-container">
                    <img src="4.jpeg" alt="View Customers" height= "auto" width= "200px">
                    <a href="viewCustomers.jsp">View Customers</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
