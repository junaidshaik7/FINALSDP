<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
Student std = (Student) session.getAttribute("student");
if(std==null)
{
	response.sendRedirect("stdsessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
           /*  background-image: url('https://st2.depositphotos.com/1359043/6775/i/450/depositphotos_67750107-stock-photo-universe-filled-with-stars.jpg'); */
            background-size: cover; /* Ensures the image covers the entire background */
            background-position: center; /* Centers the image */
        }

        h3 {
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin-top: 30px;
            font-size: 2.4rem;
            color: #2c3e50;
        }

        form {
            max-width: 600px;
            margin: 50px auto;
            background-color: #1c1c1c; /* Keep this for the form itself */
            padding: 30px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
            border-radius: 8px;
        }

        label {
            color: white;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 275%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #34495e;
            border-radius: 4px;
            background-color: #2c3e50;
            color: #ecf0f1;
            box-sizing: border-box;
        }

        textarea {
            height: 100px;
            resize: vertical;
        }

        input[type="submit"],
        input[type="reset"] {
            width: 230%;
            background-color: #27ae60;
            color: white;
            padding: 15px;
            font-size: 1rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #2ecc71;
        }

        .button-container {
            text-align: center;
        }
    </style>
</head>
<body>
    
  
    <h3><u>Contact Us</u></h3>

    <div class="form-container">
        <form method="post" action="sendemail">
            <table>
                <tr>
                    <td><label for="name">Name</label></td>
                    <td><input type="text" id="name" name="name" required/></td>
                </tr>
                <tr>
                    <td><label for="email">Email ID</label></td>
                    <td><input type="email" id="email" name="email" required/></td>
                </tr>
                <tr>
                    <td><label for="subject">Subject</label></td>
                    <td><input type="text" id="subject" name="subject" required/></td>
                </tr>
                <tr>
                    <td><label for="message">Message</label></td>
                    <td><textarea id="message" name="message" required></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Send"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
