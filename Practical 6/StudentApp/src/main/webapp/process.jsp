<%@ page import="java.sql.*, jakarta.servlet.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
// Database configuration
String url = "jdbc:mysql://localhost:3306/student_db?useSSL=false&allowPublicKeyRetrieval=true";
String user = "root";
String password = "root";

try {
    // Load JDBC driver
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    // Get form data
    int studId = Integer.parseInt(request.getParameter("stud_id"));
    String studName = request.getParameter("stud_name");
    String className = request.getParameter("class");
    String division = request.getParameter("division");
    String city = request.getParameter("city");

    try (Connection conn = DriverManager.getConnection(url, user, password)) {
        String sql = "INSERT INTO students_info (stud_id, stud_name, class, division, city) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        
        pstmt.setInt(1, studId);
        pstmt.setString(2, studName);
        pstmt.setString(3, className);
        pstmt.setString(4, division);
        pstmt.setString(5, city);
        
        int rowsAffected = pstmt.executeUpdate();
        
        if(rowsAffected > 0) {
            response.sendRedirect("display.jsp");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Insert failed");
        }
    }
} catch(Exception e) {
    e.printStackTrace();
    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error: " + e.getMessage());
}
%>