/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

/**
 *
 * @author PC
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.NhanVien;

public class nhanVienDAO {

    public boolean validateUser(String userName, String password) {
        // Kiểm tra thông tin đăng nhập là admin và mật khẩu là 123
        return "admin".equals(userName) && "123".equals(password);
    }

    public List<NhanVien> getAllNhanViens() {
        List<NhanVien> nhanViens = new ArrayList<>();
        String sql = "SELECT * FROM NhanVien";
        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                NhanVien nv = new NhanVien();
                nv.setMaNhanVien(rs.getInt("MaNhanVien"));
                nv.setHoTen(rs.getString("HoTen"));
                nv.setNgaySinh(rs.getString("NgaySinh"));
                nv.setGioiTinh(rs.getString("GioiTinh"));
                nv.setDiaChi(rs.getString("DiaChi"));
                nv.setSoDienThoai(rs.getString("SoDienThoai"));
                nv.setEmail(rs.getString("Email"));
                nv.setMaPhongBan(rs.getInt("MaPhongBan"));
                nv.setMaChucVu(rs.getInt("MaChucVu"));
                nhanViens.add(nv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nhanViens;
    }

    public void addNhanVien(NhanVien nv) {
        String sql = "INSERT INTO NhanVien (HoTen, NgaySinh, GioiTinh, DiaChi, SoDienThoai, Email, MaPhongBan, MaChucVu) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, nv.getHoTen());
            stmt.setString(2, nv.getNgaySinh());
            stmt.setString(3, nv.getGioiTinh());
            stmt.setString(4, nv.getDiaChi());
            stmt.setString(5, nv.getSoDienThoai());
            stmt.setString(6, nv.getEmail());
            stmt.setInt(7, nv.getMaPhongBan());
            stmt.setInt(8, nv.getMaChucVu());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateNhanVien(NhanVien nhanVien) {
        String query = "UPDATE NhanVien SET hoTen = ?, ngaySinh = ?, gioiTinh = ?, diaChi = ?, soDienThoai = ?, email = ?, maPhongBan = ?, maChucVu = ? WHERE maNhanVien = ?";
        try (Connection conn = DBContext.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, nhanVien.getHoTen());
            ps.setString(2, nhanVien.getNgaySinh());
            ps.setString(3, nhanVien.getGioiTinh());
            ps.setString(4, nhanVien.getDiaChi());
            ps.setString(5, nhanVien.getSoDienThoai());
            ps.setString(6, nhanVien.getEmail());
            ps.setInt(7, nhanVien.getMaPhongBan());
            ps.setInt(8, nhanVien.getMaChucVu());
            ps.setInt(9, nhanVien.getMaNhanVien());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteNhanVien(int maNhanVien) {
        String sql = "DELETE FROM NhanVien WHERE MaNhanVien = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, maNhanVien);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public NhanVien getNhanVienById(int maNhanVien) {
        NhanVien nv = null;
        String sql = "SELECT * FROM NhanVien WHERE MaNhanVien = ?";
        try (Connection conn = DBContext.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, maNhanVien);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                nv = new NhanVien();
                nv.setMaNhanVien(rs.getInt("MaNhanVien"));
                nv.setHoTen(rs.getString("HoTen"));
                nv.setNgaySinh(rs.getString("NgaySinh"));
                nv.setGioiTinh(rs.getString("GioiTinh"));
                nv.setDiaChi(rs.getString("DiaChi"));
                nv.setSoDienThoai(rs.getString("SoDienThoai"));
                nv.setEmail(rs.getString("Email"));
                nv.setMaPhongBan(rs.getInt("MaPhongBan"));
                nv.setMaChucVu(rs.getInt("MaChucVu"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return nv;
    }

    public static void main(String[] args) {
        NhanVien nhanVien = new NhanVien();
        // Thiết lập thông tin nhân viên

        nhanVienDAO nhanVienDAO = new nhanVienDAO();
        nhanVienDAO.addNhanVien(nhanVien);
    }
}
