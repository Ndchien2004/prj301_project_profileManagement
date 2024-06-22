package controller;

import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Connection;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("btAction");

        if ("Register".equals(action)) {
            handleRegistration(request, response);
        } else if ("Reset".equals(action)) {
            handleReset(request, response);
        }
    }

    private void handleRegistration(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userid = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirm");
        String fullname = request.getParameter("txtFullname");
        if (!password.equals(confirm)) {
            request.setAttribute("error", "Password does not match the confirm password.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        String sql = "INSERT INTO Account (userid, password, fullname) VALUES (?, ?, ?)";

        try (Connection conn = DBContext.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, userid);
            pstmt.setString(2, password);
            pstmt.setString(3, fullname);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                request.setAttribute("message", "Registration successful! Redirecting to login page...");
                request.setAttribute("redirect", true);
            } else {
                request.setAttribute("message", "Registration failed!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Database error: " + e.getMessage());
        }

        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    private void handleReset(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
