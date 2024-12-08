<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Student Project Management</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Theme Variables */
        :root {
            --bg-gradient: linear-gradient(135deg, #E3F2FD 0%, #90CAF9 100%);
            --navbar-bg: rgba(25, 118, 210, 0.05);
            --text-color: #1565C0;
            --border-color: rgba(25, 118, 210, 0.2);
            --hover-bg: rgba(25, 118, 210, 0.1);
        }

        /* Theme Classes */
        body.theme-default {
            --bg-gradient: linear-gradient(135deg, #E3F2FD 0%, #90CAF9 100%);
            --navbar-bg: rgba(25, 118, 210, 0.05);
            --text-color: #1565C0;
            --border-color: rgba(25, 118, 210, 0.2);
            --hover-bg: rgba(25, 118, 210, 0.1);
        }
        
          body.theme-dark {
            --bg-gradient: linear-gradient(135deg, #1A237E 0%, #303F9F 100%);
            --navbar-bg: rgba(255, 255, 255, 0.05);
            --text-color: #90CAF9;
            --border-color: rgba(255, 255, 255, 0.1);
            --hover-bg: rgba(255, 255, 255, 0.1);
        }

        body.theme-purple {
            --bg-gradient: linear-gradient(135deg, #E1BEE7 0%, #9C27B0 100%);
            --navbar-bg: rgba(156, 39, 176, 0.05);
            --text-color: #7B1FA2;
            --border-color: rgba(156, 39, 176, 0.2);
            --hover-bg: rgba(156, 39, 176, 0.1);
        }
        

        body.theme-darkcyan {
            --bg-gradient: linear-gradient(135deg, #008B8B 0%, #006666 100%);
            --navbar-bg: rgba(0, 139, 139, 0.05);
            --text-color: #E0FFFF;
            --border-color: rgba(224, 255, 255, 0.2);
            --hover-bg: rgba(224, 255, 255, 0.1);
        }

        body.theme-brown {
            --bg-gradient: linear-gradient(135deg, #8B4513 0%, #A0522D 100%);
            --navbar-bg: rgba(139, 69, 19, 0.05);
            --text-color: #DEB887;
            --border-color: rgba(222, 184, 135, 0.2);
            --hover-bg: rgba(222, 184, 135, 0.1);
        }

        body.theme-cadetblue {
            --bg-gradient: linear-gradient(135deg, #5F9EA0 0%, #4A7B7C 100%);
            --navbar-bg: rgba(95, 158, 160, 0.05);
            --text-color: #F0F8FF;
            --border-color: rgba(240, 248, 255, 0.2);
            --hover-bg: rgba(240, 248, 255, 0.1);
        }
        
        body.theme-grey {
    --bg-gradient: linear-gradient(135deg, #808080 0%, #696969 100%);
    --navbar-bg: rgba(128, 128, 128, 0.05);
    --text-color: #DCDCDC;
    --border-color: rgba(220, 220, 220, 0.2);
    --hover-bg: rgba(220, 220, 220, 0.1);
}
        body.theme-black {
    --bg-gradient: linear-gradient(135deg, #000000 0%, #2F2F2F 100%);
    --navbar-bg: rgba(0, 0, 0, 0.05);
    --text-color: #E0E0E0;
    --border-color: rgba(224, 224, 224, 0.2);
    --hover-bg: rgba(224, 224, 224, 0.1);
}
        

        body {
            display: flex;
            background: var(--bg-gradient);
            min-height: 100vh;
            overflow-x: hidden;
            transition: background 0.3s ease;
        }

        /* Theme Switcher */
        .theme-switcher {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
            background: rgba(255, 255, 255, 0.2);
            padding: 10px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            display: flex;
            gap: 10px;
        }

        .theme-btn {
            width: 30px;
            height: 30px;
            border-radius: 50%;
            border: 2px solid white;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .theme-btn:hover {
            transform: scale(1.1);
        }

        .theme-btn.default {
            background: linear-gradient(135deg, #E3F2FD 0%, #90CAF9 100%);
        }
        
         .theme-btn.dark {
            background: linear-gradient(135deg, #1A237E 0%, #303F9F 100%);
        }

        .theme-btn.purple {
            background: linear-gradient(135deg, #E1BEE7 0%, #9C27B0 100%);
        }
        

        .theme-btn.darkcyan {
            background: linear-gradient(135deg, #008B8B 0%, #006666 100%);
        }

        .theme-btn.brown {
            background: linear-gradient(135deg, #8B4513 0%, #A0522D 100%);
        }

        .theme-btn.cadetblue {
            background: linear-gradient(135deg, #5F9EA0 0%, #4A7B7C 100%);
        }
        
        .theme-btn.grey {
    background: linear-gradient(135deg, #808080 0%, #696969 100%);
}
        .theme-btn.black {
    background: linear-gradient(135deg, #000000 0%, #2F2F2F 100%);
}
        
        
        .navbar {
            width: 250px;
            background: var(--navbar-bg);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            height: 100vh;
            position: fixed;
            left: 0;
            display: flex;
            flex-direction: column;
            padding: 20px 0;
            transition: 0.3s;
            border-right: 1px solid var(--border-color);
            box-shadow: 2px 0 20px rgba(0, 0, 0, 0.05);
        }

        .navbar.collapsed {
            width: 80px;
        }

        .logo-section {
            display: flex;
            align-items: center;
            padding: 0 20px;
            margin-bottom: 30px;
        }

        .logo-section img {
            width: 40px;
            height: 40px;
            filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.1));
        }

        .logo-section span {
            margin-left: 10px;
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--text-color);
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .navbar.collapsed .logo-section span {
            display: none;
        }

        .navbar a {
            padding: 15px 20px;
            text-decoration: none;
            color: var(--text-color);
            display: flex;
            align-items: center;
            transition: all 0.3s;
            margin: 4px 10px;
            border-radius: 10px;
        }

        .navbar a:hover {
            background: var(--hover-bg);
            transform: translateX(5px);
        }

        .navbar a i {
            width: 40px;
            font-size: 1.2rem;
            text-align: center;
        }

        .navbar a span {
            margin-left: 10px;
            transition: 0.3s;
            font-weight: 500;
        }

        .navbar.collapsed a span {
            display: none;
        }

        .toggle-btn {
            position: absolute;
            right: -15px;
            top: 20px;
            background: rgba(255, 255, 255, 0.95);
            border: none;
            width: 30px;
            height: 30px;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--text-color);
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
        }

        .toggle-btn:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
        }

        .toggle-btn i {
            transition: 0.3s;
        }

        .navbar.collapsed .toggle-btn i {
            transform: rotate(180deg);
        }
        
        .content {
            flex-grow: 1;
            padding: 40px;
            margin-left: 250px;
            transition: 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .content.expanded {
            margin-left: 80px;
        }

        @media (max-width: 768px) {
            .navbar {
                width: 80px;
            }

            .navbar .logo-section span,
            .navbar a span {
                display: none;
            }

            .content {
                margin-left: 80px;
                padding: 20px;
            }

            .toggle-btn {
                display: none;
            }

            .theme-switcher {
                top: auto;
                bottom: 20px;
                right: 20px;
            }
        }
    </style>
</head>
<body class="theme-default">
    <div class="theme-switcher">
        <button class="theme-btn default" onclick="changeTheme('default')" title="Default Theme"></button>
        <button class="theme-btn dark" onclick="changeTheme('dark')" title="Dark Theme"></button>
        <button class="theme-btn purple" onclick="changeTheme('purple')" title="Purple Theme"></button>
        <button class="theme-btn darkcyan" onclick="changeTheme('darkcyan')" title="Dark Cyan Theme"></button>
        <button class="theme-btn brown" onclick="changeTheme('brown')" title="Brown Theme"></button>
        <button class="theme-btn cadetblue" onclick="changeTheme('cadetblue')" title="Cadet Blue Theme"></button>
        <button class="theme-btn grey" onclick="changeTheme('grey')" title="Grey Theme"></button>
        <button class="theme-btn black" onclick="changeTheme('black')" title="Black Theme"></button>
        
    </div>
    
    <nav class="navbar">
        <button class="toggle-btn">
            <i class="fas fa-chevron-left"></i>
        </button>
        <div class="logo-section">
            <img src="https://cdn-icons-png.flaticon.com/512/3135/3135755.png" alt="Logo">
            <span>Student Portal</span>
        </div>
        <a href="stdhome"><i class="fas fa-home"></i><span>Home</span></a>
        <a href="stddashboard"><i class="fas fa-dashboard"></i><span>Dashboard</span></a>
        <a href="stdprojects"><i class="fas fa-project-diagram"></i><span>Projects</span></a>
        <a href="stdachievements"><i class="fas fa-trophy"></i><span>Achievements</span></a>
        <a href="stdarticles"><i class="fas fa-newspaper"></i><span>Articles</span></a>
        <a href="student-portfolios"><i class="fas fa-user-circle"></i><span>Portfolio</span></a>
        <a href="stdprofile"><i class="fas fa-id-card"></i><span>Profile</span></a>
        <a href="viewallperks"><i class="fas fa-gift"></i><span>Perks</span></a>
        <a href="stdseminar"><i class="fas fa-chalkboard-teacher"></i><span>Seminar</span></a>
        <a href="stdprojecttracking"><i class="fas fa-tasks"></i><span>Project Tracking</span></a>
        <a href="stdcontactus"><i class="fas fa-tasks"></i><span>Contact Us</span></a>
        <a href="stdlogout"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a>
    </nav>

    <script>
        // Theme switcher functionality
        function changeTheme(theme) {
            document.body.className = 'theme-' + theme;
            localStorage.setItem('selectedTheme', theme);
        }

        // Load saved theme from localStorage
        document.addEventListener('DOMContentLoaded', () => {
            const savedTheme = localStorage.getItem('selectedTheme');
            if (savedTheme) {
                document.body.className = 'theme-' + savedTheme;
            }
        });

        // Navbar toggle functionality
        const navbar = document.querySelector('.navbar');
        const content = document.querySelector('.content');
        const toggleBtn = document.querySelector('.toggle-btn');

        toggleBtn.addEventListener('click', () => {
            navbar.classList.toggle('collapsed');
            content.classList.toggle('expanded');
        });
    </script>
</body>
</html>