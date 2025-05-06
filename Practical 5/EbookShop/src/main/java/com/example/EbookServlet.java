package com.example;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.*;
import java.sql.*;

@WebServlet({"/ebooks", ""})
public class EbookServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/ebookdb";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "root";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT * FROM ebookshop")) {

                out.println("<!DOCTYPE html>");
                out.println("<html><head><title>Ebook List</title>");
                out.println("<link rel='stylesheet' href='styles.css'></head><body>");
                out.println("<h1>Ebook Shop Inventory</h1>");
                out.println("<table>");
                out.println("<tr><th>ID</th><th>Title</th><th>Author</th><th>Price</th><th>Quantity</th></tr>");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("book_id") + "</td>");
                    out.println("<td>" + rs.getString("book_title") + "</td>");
                    out.println("<td>" + rs.getString("book_author") + "</td>");
                    out.println("<td>₹" + rs.getDouble("book_price") + "</td>");
                    out.println("<td>" + rs.getInt("quantity") + "</td>");
                    out.println("</tr>");
                }

                out.println("</table>");
                out.println("</body></html>");
            }
        } catch (ClassNotFoundException | SQLException e) {
            out.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}