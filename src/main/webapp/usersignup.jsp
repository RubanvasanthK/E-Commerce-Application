<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    
    form {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 300px;
    }
    
    input[type="text"],
    input[type="email"],
    input[type="number"],
    input[type="password"],
    select {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    
    input[type="submit"] {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    
    input[type="submit"]:hover {
        background-color: #45a049;
    }
    
    select {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
    }
    
    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="number"]:focus,
    input[type="password"]:focus,
    select:focus {
        outline: none;
        border: 1px solid #4CAF50;
    }
    
    input[type="text"]::placeholder,
    input[type="email"]::placeholder,
    input[type="number"]::placeholder,
    input[type="password"]::placeholder {
        color: #aaa;
    }
</style>
</head>
<body>

<form action="saveuser" method="post">

<input type="text" name="name" placeholder="Enter name" required>

<br>

<input type="email" name="email" placeholder="Enter email" required>
<br>

<input type="number" name="number" placeholder="Enter mobile number" required>
<br>

<select name="securityQuestion" required>
    <option value="" disabled selected>Select security question</option>
    <option value="first_car">What is your first car?</option>
    <option value="pet_name">What is your pet's name?</option>
    <option value="home_town">What is your hometown?</option>
</select>
<br>
<input type="text" name="answer" placeholder="Enter answer" required>
<br>
<input type="password" name="password" placeholder="Enter password" required>
<br>

<input type="submit" value="Sign Up">

</form>

</body>
</html>
