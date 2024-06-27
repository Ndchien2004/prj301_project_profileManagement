<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Danh sách chức vụ</title>
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

            /* CSS for notification */
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
                from {
                    bottom: 0;
                    opacity: 0;
                }
                to {
                    bottom: 20px;
                    opacity: 1;
                }
            }

            @keyframes fadein {
                from {
                    bottom: 0;
                    opacity: 0;
                }
                to {
                    bottom: 20px;
                    opacity: 1;
                }
            }

            @-webkit-keyframes fadeout {
                from {
                    bottom: 20px;
                    opacity: 1;
                }
                to {
                    bottom: 0;
                    opacity: 0;
                }
            }

            @keyframes fadeout {
                from {
                    bottom: 20px;
                    opacity: 1;
                }
                to {
                    bottom: 0;
                    opacity: 0;
                }
            }

            /* CSS for modal */
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
        <a href="home" class="back-to-home">Quay về trang chủ</a>
        <div class="container">
            <h1>Danh sách chức vụ</h1>
            <table>
                <tr>
                    <th>Mã nhân viên</th>
                    <th>Họ tên</th>
                    <th>Chức vụ</th>
                    <th>Actions</th>
                </tr>
                <c:forEach var="nv" items="${nhanViens}">
                    <tr>
                        <td>${nv.maNhanVien}</td>
                        <td>${nv.hoTen}</td>
                        <td>${nv.tenChucVu}</td>
                        <td class="button-container">
                            <form action="updateChucVuForm.jsp" method="get" style="display:inline;">
                                <input type="hidden" name="maNhanVien" value="${nv.maNhanVien}">
                                <button type="submit" class="update">Cập nhật</button>
                            </form>
                            <button type="button" class="delete" onclick="confirmDelete('${nv.maNhanVien}')">Xóa</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <div class="form-container">
                <h2>Thêm Chức Vụ Mới</h2>
                <form id="chucVuForm" action="addChucVuServlet" method="post">
                    <label for="tenChucVu">Tên chức vụ:</label>
                    <input type="text" id="tenChucVu" name="tenChucVu" required><br>
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
                    <p>Bạn có chắc chắn muốn xóa chức vụ này?</p>
                </div>
                <div class="modal-footer">
                    <button onclick="closeModal()">Hủy</button>
                    <form id="deleteForm" action="deleteChucVuServlet" method="post" style="display:inline;">
                        <input type="hidden" name="maChucVu" id="deleteMaChucVu">
                        <button type="submit">Xác nhận</button>
                    </form>
                </div>
            </div>
        </div>
        <script>
            // Check if URL has success parameter
            if (new URLSearchParams(window.location.search).has('success')) {
                var notification = document.getElementById('notification');
                notification.innerText = "Cập nhật chức vụ thành công!";
                notification.classList.add('show');
                setTimeout(function () {
                    notification.classList.remove('show');
                }, 3000);
            }

            // Check if URL has deleted parameter
            if (new URLSearchParams(window.location.search).has('deleted')) {
                var notification = document.getElementById('notification');
                notification.innerText = "Xóa chức vụ thành công!";
                notification.classList.add('show');
                setTimeout(function () {
                    notification.classList.remove('show');
                }, 3000);
            }

            function confirmDelete(maChucVu) {
                document.getElementById('deleteMaChucVu').value = maChucVu;
                document.getElementById('deleteModal').style.display = 'block';
            }

            function closeModal() {
                document.getElementById('deleteModal').style.display = 'none';
            }
        </script>

    </body>
</html>