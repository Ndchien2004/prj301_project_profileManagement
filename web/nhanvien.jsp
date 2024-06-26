<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh sách nhân viên</title>
    <style>
        body {
            font-family: Open Sans;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
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
        .form-container input[type="number"],
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

        .button-container {
            display: flex;
            justify-content: space-between;
        }

        .button-container button {
            background-color: #f44336;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .button-container button.update {
            background-color: #4CAF50;
        }

        .button-container button:hover {
            opacity: 0.8;
        }

        .back-to-home {
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

        .back-to-home:hover {
            background-color: #0056b3;
        }

        /* CSS cho thông báo */
        .notification {
            visibility: hidden;
            min-width: 300px;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 2px;
            padding: 16px;
            position: fixed;
            z-index: 1;
            left: 20px;
            bottom: 20px;
            font-size: 17px;
        }

        .notification.show {
            visibility: visible;
            -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
            animation: fadein 0.5s, fadeout 0.5s 2.5s;
        }

        @-webkit-keyframes fadein {
            from {bottom: 0; opacity: 0;} 
            to {bottom: 20px; opacity: 1;}
        }

        @keyframes fadein {
            from {bottom: 0; opacity: 0;}
            to {bottom: 20px; opacity: 1;}
        }

        @-webkit-keyframes fadeout {
            from {bottom: 20px; opacity: 1;} 
            to {bottom: 0; opacity: 0;}
        }

        @keyframes fadeout {
            from {bottom: 20px; opacity: 1;}
            to {bottom: 0; opacity: 0;}
        }

        /* CSS cho modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 500px;
            border-radius: 8px;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        .modal-header {
            padding: 10px;
        }

        .modal-body {
            padding: 10px 0;
        }

        .modal-footer {
            padding: 10px;
            display: flex;
            justify-content: flex-end;
        }

        .modal-footer button {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <a href="home" class="back-to-home">Back to Home</a>
    <div class="container">
        <h1>Danh sách nhân viên</h1>
        <table>
            <tr>
                <th>Mã nhân viên</th>
                <th>Họ tên</th>
                <th>Ngày sinh</th>
                <th>Giới tính</th>
                <th>Địa chỉ</th>
                <th>Số điện thoại</th>
                <th>Email</th>
                <th>Mã phòng ban</th>
                <th>Mã chức vụ</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="nv" items="${nhanViens}">
                <tr>
                    <td>${nv.maNhanVien}</td>
                    <td>${nv.hoTen}</td>
                    <td>${nv.ngaySinh}</td>
                    <td>${nv.gioiTinh}</td>
                    <td>${nv.diaChi}</td>
                    <td>${nv.soDienThoai}</td>
                    <td>${nv.email}</td>
                    <td>${nv.maPhongBan}</td>
                    <td>${nv.maChucVu}</td>
                    <td class="button-container">
                        <form action="updateNhanVienForm.jsp" method="get" style="display:inline;">
                            <input type="hidden" name="maNhanVien" value="${nv.maNhanVien}">
                            <button type="submit" class="update">Cập nhật</button>
                        </form>
                        <button type="button" class="delete" onclick="confirmDelete('${nv.maNhanVien}')">Xóa</button>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <div class="form-container">
            <h2>Thêm Nhân Viên Mới</h2>
            <form id="nhanVienForm" action="addNhanVienServlet" method="post">
                <label for="hoTen">Họ tên:</label>
                <input type="text" id="hoTen" name="hoTen" required><br>

                <label for="ngaySinh">Ngày sinh:</label>
                <input type="date" id="ngaySinh" name="ngaySinh" required><br>

                <label for="gioiTinh">Giới tính:</label>
                <select id="gioiTinh" name="gioiTinh" required>
                    <option value="Nam">Nam</option>
                    <option value="Nu">Nữ</option>
                </select><br>

                <label for="diaChi">Địa chỉ:</label>
                <input type="text" id="diaChi" name="diaChi" required><br>

                <label for="soDienThoai">Số điện thoại:</label>
                <input type="text" id="soDienThoai" name="soDienThoai" required><br>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br>

                <label for="maPhongBan">Mã phòng ban:</label>
                <input type="text" id="maPhongBan" name="maPhongBan" required><br>

                <label for="maChucVu">Mã chức vụ:</label>
                <input type="text" id="maChucVu" name="maChucVu" required><br>

                <input type="submit" value="Submit">
            </form>
        </div>
    </div>

    <!-- Modal xác nhận xóa -->
    <div id="deleteModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <div class="modal-header">
                <h2>Xác nhận xóa</h2>
            </div>
            <div class="modal-body">
                <p>Bạn có chắc chắn muốn xóa nhân viên này?</p>
            </div>
            <div class="modal-footer">
                <button onclick="closeModal()">Hủy</button>
                <form id="deleteForm" action="deleteNhanVienServlet" method="post" style="display:inline;">
                    <input type="hidden" name="maNhanVien" id="deleteMaNhanVien">
                    <button type="submit">Xác nhận</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Thông báo -->
    <div id="notification" class="notification">Cập nhật nhân viên thành công!</div>

    <script>
        // Kiểm tra nếu URL có tham số success
        if (new URLSearchParams(window.location.search).has('success')) {
            var notification = document.getElementById('notification');
            notification.innerText = "Cập nhật nhân viên thành công!";
            notification.classList.add('show');
            setTimeout(function() {
                notification.classList.remove('show');
            }, 3000);
        }

        // Kiểm tra nếu URL có tham số deleted
        if (new URLSearchParams(window.location.search).has('deleted')) {
            var notification = document.getElementById('notification');
            notification.innerText = "Xóa nhân viên thành công!";
            notification.classList.add('show');
            setTimeout(function() {
                notification.classList.remove('show');
            }, 3000);
        }

        function confirmDelete(maNhanVien) {
            document.getElementById('deleteMaNhanVien').value = maNhanVien;
            document.getElementById('deleteModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('deleteModal').style.display = 'none';
        }
    </script>
</body>
</html>