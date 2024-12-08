<%@page import="com.klef.jfsd.springboot.model.Mentor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Mentor mentor = (Mentor) session.getAttribute("mentor");
if (mentor == null) {
    response.sendRedirect("mentorsessionexpiry.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Mentor</title>
</head>
<body>
    <%@include file="mentordashboard.jsp" %>

    <h4 align="center" style="color:red">
        <c:out value="${message}"></c:out>
    </h4>

    <h3 style="text-align: center;"><u>Update Mentor Profile</u></h3>
    <div class="form-container">
        <form method="post" action="updatementorprofile">
            <table>
                <tr>
                    <td><label for="mid">Mentor ID</label></td>
                    <td><input type="number" id="mid" name="mid" readonly value="<%= mentor.getId() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="mname">Enter  Name</label></td>
                    <td><input type="text" id="mname" name="mname" value="<%= mentor.getName() %>" required/></td>
                </tr>
                
                <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="mgender" value="MALE" <%= mentor.getGender().equals("MALE") ? "checked" : "" %> required/>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="mgender" value="FEMALE" <%= mentor.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="mgender" value="OTHERS" <%= mentor.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                        <label for="others">Others</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="mdob">Enter Date of Birth</label></td>
                    <td><input type="date" id="mdob" name="mdob" value="<%= mentor.getDateOfBirth() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="mdept">Select Department</label></td>
                    <td>
                        <select id="mdept" name="mdept" required>
                            <option value="">---Select---</option>
                            <option value="ARTIFICIAL INTELLIGENCE AND DATA SCIENCE" <%= mentor.getDepartment().equals("ARTIFICIAL INTELLIGENCE AND DATA SCIENCE") ? "selected" : "" %>>ARTIFICIAL INTELLIGENCE AND DATA SCIENCE</option>
                            <option value="COMPUTER SCIENCE AND ENGINEERING" <%= mentor.getDepartment().equals("COMPUTER SCIENCE AND ENGINEERING") ? "selected" : "" %>>COMPUTER SCIENCE AND ENGINEERING</option>
                            <option value="ELECTRONICS AND COMMUNICATION ENGINEERING" <%= mentor.getDepartment().equals("ELECTRONICS AND COMMUNICATION ENGINEERING") ? "selected" : "" %>>ELECTRONICS AND COMMUNICATION ENGINEERING</option>
                            <option value="MECHANICAL ENGINEERING" <%= mentor.getDepartment().equals("MECHANICAL ENGINEERING") ? "selected" : "" %>>MECHANICAL ENGINEERING</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><label for="memail">Enter Email ID</label></td>
                    <td><input type="email" id="memail" name="memail" readonly value="<%= mentor.getEmail() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="mpwd">Enter Password</label></td>
                    <td><input type="password" id="mpwd" name="mpwd" value="<%= mentor.getPassword() %>" required/></td>
                </tr>
                <tr>
                    <td><label for="mcontact">Enter Contact</label></td>
                    <td><input type="number" id="mcontact" name="mcontact" value="<%= mentor.getContact() %>" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Update"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
