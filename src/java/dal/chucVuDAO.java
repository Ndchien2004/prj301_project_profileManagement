package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ChucVu;

public class chucVuDAO {
    
    private Connection connection;

    public chucVuDAO() {
        try {
            connection = DBContext.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<ChucVu> getAllChucVus() {
        List<ChucVu> chucVus = new ArrayList<>();
        String sql = "SELECT * FROM ChucVu";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ChucVu cv = new ChucVu();
                cv.setMaChucVu(rs.getInt("MaChucVu"));
                cv.setTenChucVu(rs.getString("TenChucVu"));
                chucVus.add(cv);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return chucVus;
    }

    public ChucVu getChucVuByMaNhanVien(int maNhanVien) {
        String sql = "SELECT cv.* FROM ChucVu cv INNER JOIN NhanVien nv ON cv.MaChucVu = nv.MaChucVu WHERE nv.MaNhanVien = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, maNhanVien);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ChucVu cv = new ChucVu();
                cv.setMaChucVu(rs.getInt("MaChucVu"));
                cv.setTenChucVu(rs.getString("TenChucVu"));
                return cv;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void addChucVu(ChucVu chucVu) {
        String sql = "INSERT INTO ChucVu (TenChucVu) VALUES (?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, chucVu.getTenChucVu());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateChucVu(ChucVu chucVu) {
        String sql = "UPDATE ChucVu SET TenChucVu = ? WHERE MaChucVu = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, chucVu.getTenChucVu());
            ps.setInt(2, chucVu.getMaChucVu());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteChucVu(int maChucVu) {
        String sql = "DELETE FROM ChucVu WHERE MaChucVu = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, maChucVu);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
