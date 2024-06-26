<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dal.nhanVienDAO" %>
<%@ page import="model.NhanVien" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật Nhân viên</title>
    <style>
        body {
            font-family: Open Sans;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            color: #333;
            text-align: center;
        }

        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .form-container label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
        }

        .form-container input[type="text"],
        .form-container input[type="date"],
        .form-container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .form-container input[type="submit"] {
            width: 100%;
            background-color: #1877f2;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .form-container input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .back-to-nhanvien {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #1877f2;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
            transition: background-color 0.3s ease;
        }

        .back-to-nhanvien:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <a href="NhanVien" class="back-to-nhanvien">Quay về trang trước</a>
    <div class="container">
        <h1>Cập nhật Nhân viên</h1>
        <div class="form-container">
            <%
                String maNhanVienStr = request.getParameter("maNhanVien");
                int maNhanVien = Integer.parseInt(maNhanVienStr);
                nhanVienDAO dao = new nhanVienDAO();
                NhanVien nv = dao.getNhanVienById(maNhanVien);
            %>
            <form action="updateNhanVienServlet" method="post">
                <input type="hidden" name="maNhanVien" value="<%= nv.getMaNhanVien() %>">
                
                <label for="hoTen">Họ tên:</label>
                <input type="text" id="hoTen" name="hoTen" value="<%= nv.getHoTen() %>" required><br>

                <label for="ngaySinh">Ngày sinh:</label>
                <input type="date" id="ngaySinh" name="ngaySinh" value="<%= nv.getNgaySinh() %>" required><br>

                <label for="gioiTinh">Giới tính:</label>
                <select id="gioiTinh" name="gioiTinh" required>
                    <option value="Nam" <%= nv.getGioiTinh().equals("Nam") ? "selected" : "" %>>Nam</option>
                    <option value="Nu" <%= nv.getGioiTinh().equals("Nu") ? "selected" : "" %>>Nữ</option>
                </select><br>

                <label for="diaChi">Địa chỉ:</label>
                <input type="text" id="diaChi" name="diaChi" value="<%= nv.getDiaChi() %>" required><br>

                <label for="soDienThoai">Số điện thoại:</label>
                <input type="text" id="soDienThoai" name="soDienThoai" value="<%= nv.getSoDienThoai() %>" required><br>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= nv.getEmail() %>" required><br>

                <label for="maPhongBan">Mã phòng ban:</label>
                <input type="text" id="maPhongBan" name="maPhongBan" value="<%= nv.getMaPhongBan() %>" required><br>

                <label for="maChucVu">Mã chức vụ:</label>
                <input type="text" id="maChucVu" name="maChucVu" value="<%= nv.getMaChucVu() %>" required><br>

                <input type="submit" value="Cập nhật">
            </form>
        </div>
    </div>
</body>
</html>
