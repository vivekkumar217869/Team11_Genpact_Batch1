<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
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
        .container {
            background-color: #fff;
            padding: 20px;
            margin: auto;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin-top: 100px;
            text-align: center;
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            width: 100%;
            background-color: #99c2f6;
            color: white;
            padding: 12px 20px;
            margin: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #4187ff;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Change Password</h2>
    <form action="ChangePasswordServlet" method="post">
        <input type="password" name="newPassword" placeholder="New Password" required><br>
        <input type="password" name="confirmPassword" placeholder="Confirm Password" required><br>
        <input type="submit" value="Change Password">
    </form>
</div>
</body>
</html>
