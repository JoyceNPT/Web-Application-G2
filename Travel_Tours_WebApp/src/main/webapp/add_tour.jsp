<%@page import="model.User"%>
<%@page import="model.Tour"%>
<%@page import="model.Image"%>
<%@page import="dao.TourDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Kiểm tra quyền admin
    User loggedUser = (User) session.getAttribute("account");
    if (loggedUser == null || loggedUser.getRole() != 1) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Khởi tạo DAO
    TourDAO tourDAO = new TourDAO();
    List<Tour> sampleTours = tourDAO.getSampleTours();

    // Xử lý khi submit form
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            // Lấy dữ liệu từ form
            int selectedTourId = Integer.parseInt(request.getParameter("tour_id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            String destination = request.getParameter("destination");
            String intro = request.getParameter("intro");
            String urlVideo = request.getParameter("url_video");
            String intrPlace = request.getParameter("intr_place");
            String p1 = request.getParameter("p1");
            String p2 = request.getParameter("p2");
            
            // Tạo tour mới (sử dụng ảnh từ tour mẫu)
            Tour newTour = new Tour();
            newTour.setName(name);
            newTour.setDescrip(description);
            newTour.setPrice(price);
            newTour.setDestina(destination);
            newTour.setIntro(intro);
            newTour.setUrl_video(urlVideo);
            newTour.setIntr_place(intrPlace);
            newTour.setP1(p1);
            newTour.setP2(p2);

            // Thêm vào database
            boolean success = tourDAO.addTour(newTour);
            
            // Lấy ID của tour vừa tạo
            int newTourId = tourDAO.getLastInsertId();
            
            // Thêm ảnh từ tour mẫu vào tour mới
            List<Image> sampleImages = tourDAO.getImagesByTourId(selectedTourId);
            for (Image image : sampleImages) {
                tourDAO.addImage(newTourId, image.getUrl_img());
            }

            if (success) {
                response.sendRedirect("admin-interface.jsp?success=1");
                return;
            } else {
                request.setAttribute("error", "Lỗi khi thêm tour mới");
            }
        } catch (Exception e) {
            request.setAttribute("error", "Lỗi: " + e.getMessage());
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thêm Tour Mới</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 20px;
        }
        .add-tour-container {
            max-width: 1200px;
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
        .tour-option {
            padding: 10px 15px;
            margin-bottom: 8px;
            border: 1px solid #ddd;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .tour-option:hover {
            background-color: #f8f9fa;
        }
        .tour-option.selected {
            background-color: #e9f7ef;
            border-color: #28a745;
        }
        .alert {
            margin-bottom: 20px;
        }
        .required-field::after {
            content: " *";
            color: red;
        }
    </style>
</head>
<body>
    <div class="container add-tour-container">
        <div class="form-header">
            <h2>Thêm Tour Mới</h2>
            <p class="text-muted">Chọn tour mẫu để lấy ảnh và nhập thông tin mới</p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form method="POST" action="add_tour.jsp">
            <div class="form-group">
                <label class="form-label required-field">Chọn tour mẫu (để lấy ảnh)</label>
                <div id="tourOptions">
                    <% for (Tour tour : sampleTours) { %>
                        <div class="tour-option" onclick="selectTour(this, <%= tour.getId() %>)">
                            <input type="radio" name="tour_id" value="<%= tour.getId() %>" required style="display: none;">
                            <div class="d-flex justify-content-between align-items-center">
                                <span>Tour mẫu #<%= tour.getId() %></span>
                                <span class="badge bg-secondary"><%= tourDAO.getImagesByTourId(tour.getId()).size() %> ảnh</span>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label required-field">Tên Tour</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label required-field">Giá Tour (VND)</label>
                        <input type="number" class="form-control" name="price" min="0" required>
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label required-field">Điểm đến chính</label>
                        <input type="text" class="form-control" name="destination" required>
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label">URL Video giới thiệu (Youtube)</label>
                        <input type="text" class="form-control" name="url_video" placeholder="https://www.youtube.com/...">
                    </div>
                    
                    <div class="form-group">
                        <label class="form-label required-field">Danh sách địa điểm tham quan</label>
                        <textarea class="form-control" name="intr_place" rows="3" required placeholder="Mỗi địa điểm cách nhau bằng dấu phẩy"></textarea>
                    </div>
                </div>
            </div>
            
            <div class="form-group">
                <label class="form-label required-field">Mô tả ngắn về tour</label>
                <textarea class="form-control" name="description" rows="3" required placeholder="Mô tả ngắn gọn về tour (khoảng 100-150 từ)"></textarea>
            </div>
            
            <div class="form-group">
                <label class="form-label required-field">Lịch trình chi tiết</label>
                <textarea class="form-control" name="intro" rows="5" required placeholder="Mô tả chi tiết lịch trình tour theo từng ngày"></textarea>
            </div>
            
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label required-field">Phần kết luận (Ưu điểm tour)</label>
                        <textarea class="form-control" name="p1" rows="3" required placeholder="Những điểm nổi bật của tour"></textarea>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="form-label required-field">Phần kết luận (Lưu ý)</label>
                        <textarea class="form-control" name="p2" rows="3" required placeholder="Các lưu ý quan trọng cho khách hàng"></textarea>
                    </div>
                </div>
            </div>
            
            <div class="d-flex justify-content-between mt-4">
                <a href="admin-interface.jsp" class="btn btn-cancel">Hủy bỏ</a>
                <button type="submit" class="btn btn-submit">Thêm Tour Mới</button>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function selectTour(element, tourId) {
            // Xóa class selected từ tất cả các option
            document.querySelectorAll('.tour-option').forEach(opt => {
                opt.classList.remove('selected');
                opt.querySelector('input[type="radio"]').checked = false;
            });
            
            // Thêm class selected vào option được chọn
            element.classList.add('selected');
            element.querySelector('input[type="radio"]').checked = true;
        }
    </script>
</body>
</html>