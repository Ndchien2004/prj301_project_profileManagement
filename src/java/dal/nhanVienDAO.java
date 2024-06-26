package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.NhanVien;

public class nhanVienDAO {

    public boolean validateUser(String userName, String password) {
        // Kiểm tra thông tin đăng nhập là admin và mật khẩu là 123
        return "admin".equals(userName) && "123".equals(password);
    }

    private Connection connection;

    public nhanVienDAO() {
        try {
            connection = DBContext.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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

    public void addNhanVien(NhanVien nhanVien) {
        String sql = "INSERT INTO NhanVien (hoTen, ngaySinh, gioiTinh, diaChi, soDienThoai, email, maPhongBan, maChucVu) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, nhanVien.getHoTen());
            ps.setString(2, nhanVien.getNgaySinh());
            ps.setString(3, nhanVien.getGioiTinh());
            ps.setString(4, nhanVien.getDiaChi());
            ps.setString(5, nhanVien.getSoDienThoai());
            ps.setString(6, nhanVien.getEmail());
            ps.setInt(7, nhanVien.getMaPhongBan());
            ps.setInt(8, nhanVien.getMaChucVu());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateNhanVien(NhanVien nhanVien) {
        String sql = "UPDATE NhanVien SET hoTen = ?, ngaySinh = ?, gioiTinh = ?, diaChi = ?, soDienThoai = ?, email = ?, maPhongBan = ?, maChucVu = ? WHERE maNhanVien = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
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
        String sql = "DELETE FROM NhanVien WHERE maNhanVien = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, maNhanVien);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public NhanVien getNhanVienById(int maNhanVien) {
        String sql = "SELECT * FROM NhanVien WHERE maNhanVien = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, maNhanVien);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                NhanVien nhanVien = new NhanVien();
                nhanVien.setMaNhanVien(rs.getInt("maNhanVien"));
                nhanVien.setHoTen(rs.getString("hoTen"));
                nhanVien.setNgaySinh(rs.getString("ngaySinh"));
                nhanVien.setGioiTinh(rs.getString("gioiTinh"));
                nhanVien.setDiaChi(rs.getString("diaChi"));
                nhanVien.setSoDienThoai(rs.getString("soDienThoai"));
                nhanVien.setEmail(rs.getString("email"));
                nhanVien.setMaPhongBan(rs.getInt("maPhongBan"));
                nhanVien.setMaChucVu(rs.getInt("maChucVu"));
                return nhanVien;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        NhanVien nhanVien = new NhanVien();
        // Thiết lập thông tin nhân viên

        nhanVienDAO nhanVienDAO = new nhanVienDAO();
        nhanVienDAO.addNhanVien(nhanVien);
    }
}
