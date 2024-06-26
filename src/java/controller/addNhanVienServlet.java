/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.nhanVienDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.NhanVien;

/**
 *
 * @author PC
 */
@WebServlet("/addNhanVienServlet")
public class addNhanVienServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NhanVienServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NhanVienServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        nhanVienDAO dao = new nhanVienDAO();
        List<NhanVien> nhanViens = dao.getAllNhanViens();
        request.setAttribute("nhanViens", nhanViens);
        request.getRequestDispatcher("nhanvien.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        String gioiTinh = request.getParameter("gioiTinh");
        String diaChi = request.getParameter("diaChi");
        String soDienThoai = request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String maPhongBanStr = request.getParameter("maPhongBan");
        String maChucVuStr = request.getParameter("maChucVu");
        int maPhongBan = 0;
        int maChucVu = 0;

        try {
            if (maPhongBanStr != null && !maPhongBanStr.isEmpty()) {
                maPhongBan = Integer.parseInt(maPhongBanStr);
            }
            if (maChucVuStr != null && !maChucVuStr.isEmpty()) {
                maChucVu = Integer.parseInt(maChucVuStr);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input for maPhongBan or maChucVu");
            return;
        }

        NhanVien nhanVien = new NhanVien();
        nhanVien.setHoTen(hoTen);
        nhanVien.setNgaySinh(ngaySinh);
        nhanVien.setGioiTinh(gioiTinh);
        nhanVien.setDiaChi(diaChi);
        nhanVien.setSoDienThoai(soDienThoai);
        nhanVien.setEmail(email);
        nhanVien.setMaPhongBan(maPhongBan);
        nhanVien.setMaChucVu(maChucVu);

        nhanVienDAO nhanVienDao = new nhanVienDAO();
        nhanVienDao.addNhanVien(nhanVien);

        List<NhanVien> nhanViens = nhanVienDao.getAllNhanViens();
        request.setAttribute("nhanViens", nhanViens);
        request.getRequestDispatcher("nhanvien.jsp").forward(request, response);    
    }


    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}