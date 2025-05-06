<%@ page import="java.sql.*, jakarta.servlet.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Student Records</title>
    <style>
        table { width: 100%; border-collapse: collapse; margin: 20px 0; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #f8f9fa; }
        tr:hover { background-color: #f1f1f1; }
    </style>
</head>
<body>
    <h1 style="text-align: center;">Student Records</h1>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Class</th>
            <th>Division</th>
            <th>City</th>
        </tr>
        <%
        String url = "jdbc:mysql://localhost:3306/student_db";
        String user = "root";
        String password = "root";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM students_info")) {
            
            while(rs.next()) {
        %>
                <tr>
                    <td><%= rs.getInt("stud_id") %></td>
                    <td><%= rs.getString("stud_name") %></td>
                    <td><%= rs.getString("class") %></td>
                    <td><%= rs.getString("division") %></td>
                    <td><%= rs.getString("city") %></td>
                </tr>
        <%
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        %>
    </table>
    
    <div style="text-align: center;">
        <a href="index.html">Add New Student</a>
    </div>
</body>
</html>