<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
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
            padding: 20px;
            margin: auto;
            max-width: 400px;
            background-color: #333;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            margin-top: 100px;
            color: white;
        }
        h2 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
           background-color: #333;
           color: white;
        }
        form input[type="text"],
        form input[type="password"] {
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        form input[type="submit"] {
            padding: 10px;
            background-color: #99c2f6;
            color: black;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        form input[type="submit"]:hover {
            background-color:  #4187ff;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="#" class="logo"><img src="logo1.png" alt="Logo"></a>
        <div>
            
            <a href="logout.jsp" class="logout">Logout</a>
        </div>
    </div>
    <div class="container">
        <h2>Admin</h2>
        <form action="AdminLoginServlet" method="post">
            Username: <input type="text" name="username" placeholder="Username" required><br>
            Password: <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="LOGIN">
        </form>
    </div>
</body>
</html>