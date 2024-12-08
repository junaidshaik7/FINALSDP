<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            padding: 20px;
        }

        .form-container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 10px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="date"],
        input[type="tel"] {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            margin-top: 20px;
            padding: 10px;
            background-color: #2c3e50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #1abc9c;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Update Student</h2>
        <form action="savestudent" method="post">
            <input type="hidden" name="id" value="${student.id}"/>

            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstname" value="${student.firstname}" required/>

            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastname" value="${student.lastname}" required/>

            <label for="gender">Gender:</label>
            <input type="text" id="gender" name="gender" value="${student.gender}" required/>

            <label for="dateofbirth">Date of Birth:</label>
            <input type="date" id="dateofbirth" name="dateofbirth" value="${student.dateofbirth}" required/>

            <label for="department">Department:</label>
            <input type="text" id="department" name="department" value="${student.department}" required/>

            <label for="location">Location:</label>
            <input type="text" id="location" name="location" value="${student.location}" required/>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="${student.email}" required/>

            <label for="contact">Contact:</label>
            <input type="tel" id="contact" name="contact" value="${student.contact}" required/>
            
             <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="${student.password}" required/>

            <button type="submit">Save Changes</button>
        </form>
    </div>
</body>
</html>
