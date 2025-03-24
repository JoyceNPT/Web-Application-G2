<%-- 
    Tài liệu   : booking
    Ngày tạo  : 22 Tháng 3, 2025, 7:24:16 PM
    Tác giả     : NghiLTTCE182357
--%>

<%@page import="model.Tour"%>
<%@page import="dao.TourDAO"%>
<%@page import="model.Booking"%>
<%@page import="java.util.List"%>
<%@page import="dao.BookingDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    // Kiểm tra người dùng đã đăng nhập chưa
//    Integer userId = (Integer) session.getAttribute("userId");
//    if (userId == null) {
//        response.sendRedirect("login.jsp"); // Chuyển hướng về trang đăng nhập
//        return;
//    }

    // Biến lưu thông báo
    String errorMessage = "";
    String successMessage = "";

    // Xử lý khi người dùng gửi biểu mẫu
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Kiểm tra nhập liệu
        if (firstName == null || firstName.trim().isEmpty() ||
            lastName == null || lastName.trim().isEmpty() ||
            email == null || email.trim().isEmpty() || !email.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$") ||
            phone == null || phone.trim().isEmpty() || !phone.matches("^[0-9]{8,15}$")) {

            errorMessage = "Vui lòng nhập thông tin chính xác, và không để trống ô nào.";
        } else {
            // Đặt tour thành công
            successMessage = "🎉 Bạn đã đặt tour thành công! Chúng tôi sẽ gửi xác nhận qua email.";
        }
    }
%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Biểu mẫu đặt tour</title>
     
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

 <!-- Thanh điều hướng -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <!-- Logo hoặc Tiêu đề -->
        <a class="navbar-brand" href="interface.jsp">
            <i class="fas fa-home"></i> Về Trang Chủ
        </a>

        <!-- Nút thu gọn trên thiết bị nhỏ -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

    </div>
</nav>
</head>
<body>

<div class="container mt-5">
    <div class="card p-4 shadow-sm" style="max-width: 500px; text-align: left; margin-left: 0;">
        <h4 class="mb-3">Thông tin liên hệ</h4>
        <p class="text-muted">Chúng tôi sẽ sử dụng thông tin này để gửi xác nhận và cập nhật về đặt chỗ của bạn.</p>

        <% if (!errorMessage.isEmpty()) { %>
            <div class="alert alert-danger"><%= errorMessage %></div>
        <% } %>

        <% if (!successMessage.isEmpty()) { %>
            <div class="alert alert-success"><%= successMessage %></div>
        <% } %>

        <form method="POST">
            <div class="mb-3">
                <label class="form-label">Họ</label>
                <input type="text" class="form-control" name="firstName" placeholder="Nhập họ" 
                       value="<%= request.getParameter("firstName") != null ? request.getParameter("firstName") : "" %>">
            </div>

            <div class="mb-3">
                <label class="form-label">Tên</label>
                <input type="text" class="form-control" name="lastName" placeholder="Nhập tên" 
                       value="<%= request.getParameter("lastName") != null ? request.getParameter("lastName") : "" %>">
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" class="form-control" name="email" placeholder="Nhập email" 
                       value="<%= request.getParameter("email") != null ? request.getParameter("email") : "" %>">
            </div>

            <div class="mb-3">
                <label class="form-label">Số điện thoại</label>
                <div class="input-group">
                    <select class="form-select" style="max-width: 150px;">
                        <option>🇺🇸 +1</option>
                        <option>🇻🇳 +84</option>
                        <option>🇬🇧 +44</option>
                    </select>
                    <input type="text" class="form-control" name="phone" placeholder="Nhập số điện thoại" 
                           value="<%= request.getParameter("phone") != null ? request.getParameter("phone") : "" %>">
                </div>
            </div>

            <button type="submit" class="btn btn-warning w-100">Gửi</button>
        </form>
    </div>
</div>


<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
