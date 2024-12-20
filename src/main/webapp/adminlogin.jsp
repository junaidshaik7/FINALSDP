<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: system-ui, -apple-system, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background : url("Studentlogin.jpg");
            background-size : 1400px;
            background-color: #f8f6ff;
            padding: 20px;
        }

        .form-container {
            background: white;
            border-radius: 24px;
            padding: 40px;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 4px 20px rgba(138, 135, 165, 0.15);
        }

        .logo-container {
            background: #e8e5ff;
            width: 56px;
            height: 56px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 24px;
        }

        .logo {
            width: 32px;
            height: 32px;
            color: #6b5ecd;
        }

        h3 {
            color: #4a4865;
            font-size: 24px;
            margin-bottom: 32px;
            text-align: center;
            font-weight: 600;
        }

        .input-group {
            margin-bottom: 24px;
        }

        label {
            color: #6b6885;
            font-size: 14px;
            font-weight: 500;
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid #e8e5ff;
            border-radius: 12px;
            background: #fcfbff;
            color: #4a4865;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        input[type="text"]::placeholder,
        input[type="password"]::placeholder {
            color: #a8a5c1;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #6b5ecd;
            background: white;
            box-shadow: 0 0 0 4px rgba(107, 94, 205, 0.1);
        }

        .button-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 32px;
        }

        .submit-btn {
            padding: 12px 24px;
            border: none;
            border-radius: 12px;
            background: #6b5ecd;
            color: white;
            font-weight: 600;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .reset-btn {
            padding: 12px 24px;
            border: 1px solid #e8e5ff;
            border-radius: 12px;
            background: white;
            color: #6b5ecd;
            font-weight: 500;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            background: #5d51b6;
            box-shadow: 0 4px 12px rgba(107, 94, 205, 0.2);
        }

        .reset-btn:hover {
            background: #fcfbff;
            border-color: #6b5ecd;
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 24px;
            }

            .button-group {
                gap: 8px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        
        <h3>Admin Login</h3>
        <form method="post" action="checkadminlogin">
            <div class="input-group">
                <label for="auname">User Name</label>
                <input type="text" id="auname" name="auname" required placeholder="Enter your Username">
            </div>
            <div class="input-group">
                <label for="apwd">Password</label>
                <input type="password" id="apwd" name="apwd" required placeholder="Enter your password">
            </div>
            <div class="button-group">
                <button type="submit" class="submit-btn">Sign In</button>
                <button type="reset" class="reset-btn">Clear</button>
            </div>
        </form>
    </div>
</body>
</html>
