<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="mentordashboard.jsp" %>
<%@ page import="com.klef.jfsd.springboot.model.Mentor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mentor Profile</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            min-height: 100vh;
            background-color: #f3f4f6;
            position: relative;
            margin-left: 200px;
        }

        .page-wrapper {
            display: flex;
            min-height: 100vh;
        }

        .content-wrapper {
            flex: 1;
            margin-left: 250px;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            transition: margin-left 0.3s ease;
        }

        .navbar.collapsed + .page-wrapper .content-wrapper {
            margin-left: 80px;
        }

        .profile-container {
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            width: 100%;
            max-width: 600px;
            padding: 2rem;
        }

        .profile-header {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }

        .profile-header::before {
            content: '';
            position: absolute;
            top: -60px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 80px;
            background: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%237c5a7e'%3E%3Cpath d='M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z'/%3E%3C/svg%3E") center/contain no-repeat;
            opacity: 0.1;
        }

        h3 {
            color: #7c5a7e;
            font-size: 1.75rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .subtitle {
            color: #9ca3af;
            font-size: 0.875rem;
            margin-bottom: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-row {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #4b5563;
            font-weight: 500;
            font-size: 0.875rem;
        }

        input, select {
            width: 100%;
            padding: 0.75rem;
            border: 1.5px solid #e5e7eb;
            border-radius: 8px;
            background: #ffffff;
            color: #374151;
            font-size: 0.875rem;
            transition: all 0.2s ease;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #7c5a7e;
            box-shadow: 0 0 0 3px rgba(124, 90, 126, 0.1);
        }

        select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%237c5a7e' height='24' viewBox='0 0 24 24' width='24'%3E%3Cpath d='M7 10l5 5 5-5z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 0.5rem center;
            padding-right: 2.5rem;
        }

        .btn {
            width: 100%;
            padding: 0.875rem;
            background: #7c5a7e;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 0.875rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .btn:hover {
            background: #6b4b6d;
            transform: translateY(-1px);
            box-shadow: 0 4px 6px -1px rgba(124, 90, 126, 0.1), 0 2px 4px -1px rgba(124, 90, 126, 0.06);
        }

        .error {
            color: #dc2626;
            text-align: center;
            margin-top: 1rem;
            padding: 0.75rem;
            background: #fee2e2;
            border-radius: 8px;
            font-size: 0.875rem;
        }

        @media (max-width: 768px) {
            .content-wrapper {
                margin-left: 80px;
                padding: 1rem;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .profile-container {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="page-wrapper">
        <div class="content-wrapper">
            <div class="profile-container">
                <div class="profile-header">
                    <h3>Mentor Profile</h3>
                    <p class="subtitle">Update your professional information</p>
                </div>

                <form action="updatementorprofile" method="post">
                    <% 
                        Mentor mentor = (Mentor) session.getAttribute("mentor");
                        if (mentor != null) {
                    %>
                    <input type="hidden" name="mid" value="<%= mentor.getId() %>"/>
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="mname" value="<%= mentor.getName() %>" 
                                   placeholder="Enter Name" required/>
                        </div>

                       
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Gender</label>
                            <select name="mgender" required>
                                <option value="Male" <%= "Male".equals(mentor.getGender()) ? "selected" : "" %>>Male</option>
                                <option value="Female" <%= "Female".equals(mentor.getGender()) ? "selected" : "" %>>Female</option>
                                <option value="Other" <%= "Other".equals(mentor.getGender()) ? "selected" : "" %>>Other</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Date of Birth</label>
                            <input type="date" name="mdob" value="<%= mentor.getDateOfBirth() %>" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="memail" value="<%= mentor.getEmail() %>" 
                               placeholder="Enter email address" required/>
                    </div>

                    <div class="form-group">
                        <label>Location</label>
                        <input type="text" name="mlocation" value="<%= mentor.getLocation() %>" 
                               placeholder="Enter your location" required/>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Department</label>
                            <select name="mdept" required>
                                <option value="CSE" <%= "CSE".equals(mentor.getDepartment()) ? "selected" : "" %>>Computer Science</option>
                                <option value="ECE" <%= "ECE".equals(mentor.getDepartment()) ? "selected" : "" %>>Electronics & Communication</option>
                                <option value="EEE" <%= "EEE".equals(mentor.getDepartment()) ? "selected" : "" %>>Electrical & Electronics</option>
                                <option value="MECH" <%= "MECH".equals(mentor.getDepartment()) ? "selected" : "" %>>Mechanical</option>
                                <option value="CIVIL" <%= "CIVIL".equals(mentor.getDepartment()) ? "selected" : "" %>>Civil</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label>Contact Number</label>
                            <input type="tel" name="mcontact" value="<%= mentor.getContact() %>" 
                                   placeholder="Enter contact number" pattern="[0-9]{10}" required/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" name="mpwd" value="<%= mentor.getPassword() %>" 
                               placeholder="Enter password" required/>
                    </div>

                    <button type="submit" class="btn">Update Profile</button>
                    <% } else { %>
                        <div class="error">
                            ⚠ Mentor data not found in session.
                        </div>
                    <% } %>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
