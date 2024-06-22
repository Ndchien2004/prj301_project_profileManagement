package controller;

import dal.nhanVienDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class deleteNhanVienServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get employee ID from request
        int maNhanVien = Integer.parseInt(request.getParameter("maNhanVien"));

        // Delete employee from database
        nhanVienDAO dao = new nhanVienDAO();
        dao.deleteNhanVien(maNhanVien);

        // Redirect to employee list
        response.sendRedirect("NhanVien");
    }
}
