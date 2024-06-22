package controller;

import dal.nhanVienDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.NhanVien;

public class updateNhanVienServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updateNhanVienServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateNhanVienServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maNhanVienStr = request.getParameter("maNhanVien");
        String hoTen = request.getParameter("hoTen");
        String ngaySinh = request.getParameter("ngaySinh");
        String gioiTinh = request.getParameter("gioiTinh");
        String diaChi = request.getParameter("diaChi");
        String soDienThoai = request.getParameter("soDienThoai");
        String email = request.getParameter("email");
        String maPhongBanStr = request.getParameter("maPhongBan");
        String maChucVuStr = request.getParameter("maChucVu");
        int maNhanVien = 0;
        int maPhongBan = 0;
        int maChucVu = 0;

        try {
            if (maNhanVienStr != null && !maNhanVienStr.isEmpty()) {
                maNhanVien = Integer.parseInt(maNhanVienStr);
            }
            if (maPhongBanStr != null && !maPhongBanStr.isEmpty()) {
                maPhongBan = Integer.parseInt(maPhongBanStr);
            }
            if (maChucVuStr != null && !maChucVuStr.isEmpty()) {
                maChucVu = Integer.parseInt(maChucVuStr);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input for numeric fields");
            return;
        }

        NhanVien nhanVien = new NhanVien();
        nhanVien.setMaNhanVien(maNhanVien);
        nhanVien.setHoTen(hoTen);
        nhanVien.setNgaySinh(ngaySinh);
        nhanVien.setGioiTinh(gioiTinh);
        nhanVien.setDiaChi(diaChi);
        nhanVien.setSoDienThoai(soDienThoai);
        nhanVien.setEmail(email);
        nhanVien.setMaPhongBan(maPhongBan);
        nhanVien.setMaChucVu(maChucVu);

        nhanVienDAO nhanVienDao = new nhanVienDAO();
        nhanVienDao.updateNhanVien(nhanVien);

        response.sendRedirect("NhanVien?success=true");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
