<%@page import="model.User"%>
<%@page import="model.Tour"%>
<%@page import="dao.TourDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Kiểm tra quyền admin
    User loggedUser = (User) session.getAttribute("account");
    if (loggedUser == null || loggedUser.getRole() != 1) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Khởi tạo tourDAO
    TourDAO tourDAO = new TourDAO();
    
    // Lấy thông tin tour cần chỉnh sửa
    String tourIdParam = request.getParameter("id");
    Tour tour = null;
    if (tourIdParam != null && !tourIdParam.isEmpty()) {
        tour = tourDAO.getById(Integer.parseInt(tourIdParam));
    }

    if (tour == null) {
        response.sendRedirect("admin-interface.jsp");
        return;
    }

    // Xử lý form submit
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        // Lấy dữ liệu từ form
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String destination = request.getParameter("destination");
        String intro = request.getParameter("intro");
        String urlVideo = request.getParameter("url_video");
        String intrPlace = request.getParameter("intr_place");
        String p1 = request.getParameter("p1");
        String p2 = request.getParameter("p2");

        // Cập nhật thông tin tour
        tour.setName(name);
        tour.setDescrip(description);
        tour.setPrice(price);
        tour.setDestina(destination);
        tour.setIntro(intro);
        tour.setUrl_video(urlVideo);
        tour.setIntr_place(intrPlace);
        tour.setP1(p1);
        tour.setP2(p2);

        // Lưu vào database
        boolean success = tourDAO.updateTour(tour);
        if (success) {
            response.sendRedirect("admin-interface.jsp?success=1");
            return;
        } else {
            request.setAttribute("error", "Có lỗi xảy ra khi cập nhật tour");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chỉnh sửa Tour - <%= tour.getName() %></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .edit-tour-container {
            max-width: 1000px;
            margin: 0 auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .form-header {
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            font-weight: 600;
            margin-bottom: 8px;
        }
        .btn-submit {
            background-color: #28a745;
            color: white;
            font-weight: 600;
            padding: 10px 25px;
        }
        .btn-submit:hover {
            background-color: #218838;
            color: white;
        }
        .btn-cancel {
            background-color: #dc3545;
            color: white;
            font-weight: 600;
            padding: 10px 25px;
        }
        .btn-cancel:hover {
            background-color: #c82333;
            color: white;
        }
        textarea {
            min-height: 100px;
        }
    </style>
</head>
<body>
    <div class="container edit-tour-container">
        <div class="form-header">
            <h2>Chỉnh sửa Tour: <%= tour.getName() %></h2>
            <p class="text-muted">ID Tour: <%= tour.getId() %></p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form method="POST" action="edit_tour.jsp?id=<%= tour.getId() %>">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Tên Tour</label>
                        <input type="text" class="form-control" name="name" value="<%= tour.getName() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Giá Tour (VND)</label>
                        <input type="number" class="form-control" name="price" value="<%= (long)tour.getPrice() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">Điểm đến</label>
                        <input type="text" class="form-control" name="destination" value="<%= tour.getDestina() %>" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label">URL Video giới thiệu</label>
                        <input type="text" class="form-control" name="url_video" value="<%= tour.getUrl_video() != null ? tour.getUrl_video() : "" %>">
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Địa điểm tham quan</label>
                        <textarea class="form-control" name="intr_place" required><%= tour.getIntr_place() != null ? tour.getIntr_place() : "" %></textarea>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="form-label">Mô tả ngắn</label>
                <textarea class="form-control" name="description" required><%= tour.getDescrip() %></textarea>
            </div>
            
            <div class="form-group">
                <label class="form-label">Giới thiệu chi tiết</label>
                <textarea class="form-control" name="intro" required><%= tour.getIntro() != null ? tour.getIntro() : "" %></textarea>
            </div>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Phần kết luận (Phần 1)</label>
                        <textarea class="form-control" name="p1" required><%= tour.getP1() != null ? tour.getP1() : "" %></textarea>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">Phần kết luận (Phần 2)</label>
                        <textarea class="form-control" name="p2" required><%= tour.getP2() != null ? tour.getP2() : "" %></textarea>
                    </div>
                </div>
            </div>
            
            <div class="d-flex justify-content-between mt-4">
                <a href="admin-interface.jsp" class="btn btn-cancel">Hủy bỏ</a>
                <button type="submit" class="btn btn-submit">Lưu thay đổi</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>