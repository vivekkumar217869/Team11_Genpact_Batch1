<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*,java.sql.*" %>

<%
    
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>

<html>
<head>
    <title>View Customers</title>
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
        .navbar {
            overflow: hidden;
            background-color: #333;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px; /* Adjusted padding */
            width: 100%;
        }
        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 10px 16px; /* Adjusted padding */
            text-decoration: none;
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
            background-color: #4187ff;
        }
        .container {
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="navbar">
       <a href="adminDashboard.jsp" class="logo"><img src="logo1.png" alt="Logo"></a>
        <div>
            <a href="logout.jsp" class="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>View Customers</h2>
        <table>
            <tr>
                <th>Account No</th>
                <th>Full Name</th>
                <th>Address</th>
                <th>Mobile No</th>
                <th>Email ID</th>
                <th>Account Type</th>
 
                <th>Date of Birth</th>
                <th>ID Proof</th>
            </tr>
            <%
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank_dbs", "root", "root");

                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM customer");

                    while (rs.next()) {
                        String accountNo = rs.getString("account_no");
                        String fullName = rs.getString("full_name");
                        String address = rs.getString("address");
                        String mobileNo = rs.getString("mobile_no");
                        String emailId = rs.getString("email_id");
                        String accountType = rs.getString("account_type");
                        Date dob = rs.getDate("dob");
                        String idProof = rs.getString("id_proof");
            %>
            <tr>
                <td><%= accountNo %></td>
                <td><%= fullName %></td>
                <td><%= address %></td>
                <td><%= mobileNo %></td>
                <td><%= emailId %></td>
                <td><%= accountType %></td>

                <td><%= dob %></td>
                <td><%= idProof %></td>
            </tr>
            <%
                    }
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </div>
</body>
</html>
