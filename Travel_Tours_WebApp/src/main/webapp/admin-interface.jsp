<%-- 
    Document   : admin_interface
    Created on : Mar 3, 2025, 7:54:18 PM
    Author     : Khoa
--%>

<%@page import="model.User"%>
<%@page import="model.Image"%>
<%@page import="java.util.List"%>
<%@page import="model.Tour"%>
<%@page import="dao.TourDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User loggedUser = (User) session.getAttribute("account");

    Cookie[] cookies = request.getCookies();
    String username = null;
    if (loggedUser == null || loggedUser.getRole() != 1) {
        response.sendRedirect("login.jsp"); // Chuyển hướng nếu không phải admin
        return;
    }
    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equalsIgnoreCase("COOKIE_USERNAME")) {
                username = c.getValue();
            }
        }
    }

    TourDAO dao = new TourDAO();
    List<Tour> list = dao.getAll();

    // Kiểm tra nếu có tham số id và action=delete
    if (request.getParameter("action") != null && request.getParameter("action").equals("delete")) {
        String idParam = request.getParameter("id");
        if (idParam != null && !idParam.isEmpty()) {
            try {
                int tourId = Integer.parseInt(idParam);
                TourDAO tourDAO = new TourDAO();
                boolean deleted = tourDAO.deleteTour(tourId);

                if (deleted) {
                    // Xóa thành công, reload trang
                    response.sendRedirect("admin-interface.jsp");
                    return;
                } else {
                    out.println("<script>alert('Xóa tour không thành công');</script>");
                }
            } catch (NumberFormatException e) {
                out.println("<script>alert('ID tour không hợp lệ');</script>");
            }
        }
    }
%>
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin - Travel Tour</title>

        <link rel="icon" type="image/png" href="images/favicon_io/favicon.ico">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/tour.css">
        <style>
            .admin-controls {
                margin: 30px 0;
                text-align: center;
            }
            .btn-add-tour {
                padding: 12px 30px;
                font-size: 18px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-weight: bold;
                text-decoration: none;
                display: inline-block;
                transition: background-color 0.3s;
            }
            .btn-add-tour:hover {
                background-color: #45a049;
            }
            /* Giữ nguyên các style khác */
            .admin-btn {
                padding: 10px 20px;
                margin: 0 10px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-weight: bold;
                text-decoration: none;
                display: inline-block;
            }
            .btn-edit {
                background-color: #2196F3;
                color: white;
            }
            .btn-delete {
                background-color: #f44336;
                color: white;
            }
            .tour-buttons {
                display: flex;
                justify-content: space-between;
                margin-top: 15px;
            }
            .tour-buttons a {
                flex: 1;
                margin: 0 5px;
                text-align: center;
                padding: 8px 0;
            }
        </style>


    </head>
    <body>
        <div class="wrapper" onclick="void(0);">
            <!-- Đây là phần header -->
            <header class="c-header type_breadcrumb" id="header">
                <div class="c-header__left">
                    <div class="c-header__logo">
                        <a><img class="pc-only" src="images/home/1.png" alt="logo" loading="lazy">
                            <img class="sp-only" src="images/home/4.png" alt="logo" loading="lazy">
                        </a>
                    </div>
                    <div class="c-header__search input-search 1">
                        <form method="GET" action="">
                            <div class="c-header__search__autocomplete autocomplete">
                                <input id="search-bar" type="text" name="term" placeholder="Bạn muốn đi đâu?">
                            </div>
                            <div id="search-barautocomplete-list" class="autocomplete-items" style="display: none">
                                <div id="search-barautocomplete-list-sub"></div>
                                <div id="search-for-all"></div>
                            </div>
                            <button class="c-header__search__submit" type="submit"></button>
                        </form>
                    </div>
                </div>
                <div class="c-header__right" data-navigation="">
                    <div class="c-header__block">
                        <nav class="navigation">
                            <div class="navigation__head">
                                <div class="navigation__home">
                                    <a>TRANG CHỦ</a>
                                </div>
                                <div btn-close-menu="" class="navigation__closebtn">
                                    <img src="images/home/icon_close_black.svg" alt="Đóng menu" loading="lazy">
                                </div>
                            </div>

                            <ul class="navigation__menumain">
                                <li class="navigation__menumain__item">
                                    <a class="navigation__menumain__item__destinations" data-btn-drop-down=""><span
                                            class="pc-only">Điểm đến của chúng tôi</span>
                                        <img src="images/home/arrow-right.svg" alt="mũi tên phải" loading="lazy">
                                    </a>
                                </li>
                                <li class="navigation__menumain__item">
                                    <a>Tại sao chúng tôi khác biệt?</a>
                                </li>
                                <li class="navigation__menumain__item">
                                    <a class="">Về Chúng Tôi</a>
                                </li>
                                <li class="navigation__menumain__item">
                                    <a class="">Hỗ trợ</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class="c-header__group">
                        <% if (loggedUser != null) {%>
                        <!-- Nếu người dùng đã đăng nhập -->
                        <div class="c-header__user-menu">
                            <div class="c-header__user-toggle" data-slide-toggle="">
                                <div class="c-header__user-icon">
                                    <img src="images/home/user-icon.svg" alt="Tài khoản">
                                    <span><%= loggedUser.getUsername()%> (Admin)</span>
                                </div>
                                <img src="images/home/arrow-down-white.svg" alt="Mở menu" class="c-header__user-arrow">
                            </div>
                            <div class="c-header__dropdown">
                                <a href="user-info.jsp" class="c-header__dropdown-item">Thông tin cá nhân</a>
                                <a href="logout.jsp" class="c-header__dropdown-item">Đăng xuất</a>
                            </div>
                        </div>
                        <% } else { %>
                        <!-- Nếu chưa đăng nhập -->
                        <div class="c-header__user-not-login pc-only">
                            <div class="c-header__user-menu">
                                <div class="c-header__user-toggle" data-slide-toggle="">
                                    <div class="c-header__user-icon">
                                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none">
                                        <rect width="26" height="26" rx="13" fill="white"></rect>
                                        <circle cx="13" cy="11.7" r="3.7" stroke="black" stroke-width="2"></circle>
                                        <path d="M20 19.4C18.3 17.5 15.8 16.3 13 16.3C10.2 16.3 7.7 17.5 6 19.4" stroke="black" stroke-width="2"></path>
                                        </svg>
                                    </div>
                                    <img src="images/home/arrow-down-white.svg" alt="Mở menu" class="c-header__user-arrow">
                                </div>
                                <div class="c-header__dropdown">
                                    <a href="login.jsp" class="c-header__dropdown-item">Đăng nhập</a>
                                    <a href="signup.jsp" class="c-header__dropdown-item">Đăng ký</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <a href="https://zalo.me/g/wgyzda401" target="_blank" class="c-header__contact">
                            <p>Có câu hỏi? Liên hệ chúng tôi trên Zalo</p>
                            <p>
                                <img src="images/home/whatsapp.svg" alt="whatsapp" loading="lazy">0384 123 254
                            </p>
                        </a>
                    </div>
                </div>
            </header>
            <main class="destination">
                <section class="tour_in_KV">
                    <picture class="tour_in_KV__bg lazyload">
                        <source type="image/png" media="(min-width: 769px)" srcset="images/home/3.jpg">
                        <source type="image/png" media="(max-width: 768px)" srcset="images/home/3.jpg">
                        <img src="images/home/bali.webp" alt="banner">
                    </picture>
                    <div class="tour_in_KV__brush">
                        <img src="images/home/brush-stroke.svg" alt="Nét vẽ trang trí">
                    </div>
                    <div class="tour_in_KV__main">
                        <div class="c-container">
                            <h1 class="c-title04">Quản lý Tour du lịch</h1>
                            <p class="c-text03">Quản lý các Tour du lịch trong hệ thống</p>
                            <a id="seeAllToursBtn" href="#tourSection" class="c-btn01">
                                Xem Tất Cả Các Tour
                                <img src="images/home/Icon-Plane.svg" alt="ic-plane">
                            </a>
                        </div>
                    </div>
                </section>
            </main>
        </div>

        <div class="admin-controls">
            <a href="add_tour.jsp" class="btn-add-tour">Thêm Tour</a>
        </div>

        <!-- Danh sách tour -->
        <section id="tourSection" class="tour-list">
            <div class="tours-grid">
                <% for (Tour t : list) {
                        List<Image> images = dao.getImagesByTourId(t.getId());
                        String imageUrl = "images/tours/default.jpg"; // Ảnh mặc định nếu không có ảnh trong DB

                        if (images != null && !images.isEmpty()) {
                            imageUrl = images.get(0).getUrl_img(); // Lấy ảnh đầu tiên trong danh sách
                        }
                %>
                <div class="tour-card">
                    <div class="tour-image">
                        <img src="<%= request.getContextPath()%>/<%= imageUrl%>" alt="<%= t.getName()%>">
                    </div>
                    <div class="tour-info">
                        <div class="tour-title"><%= t.getName()%></div>
                        <div class="tour-description"><%= t.getDescrip()%></div>
                        <div class="tour-price"><%= t.getPrice()%> </div>
                        <div class="tour-buttons">
                            <a href="tourdetail.jsp?id=<%= t.getId()%>" class="btn btn-details">Xem chi tiết</a>
                            <a href="edit_tour.jsp?id=<%= t.getId()%>" class="btn btn-edit">Sửa</a>
                            <a href="admin-interface.jsp?action=delete&id=<%= t.getId()%>" 
                               class="btn btn-delete" 
                               onclick="return confirm('Bạn có chắc chắn muốn xóa tour này?')">Xóa</a>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>
        </section>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const userMenu = document.querySelector(".c-header__user-menu");
                const dropdown = document.querySelector(".c-header__dropdown");

                userMenu.addEventListener("click", function (event) {
                    event.stopPropagation();
                    dropdown.classList.toggle("show");
                });

                document.addEventListener("click", function (event) {
                    if (!userMenu.contains(event.target)) {
                        dropdown.classList.remove("show");
                    }
                });
            });

            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("seeAllToursBtn").addEventListener("click", function (event) {
                    event.preventDefault();
                    const tourSection = document.getElementById("tourSection");
                    if (tourSection) {
                        window.scrollTo({
                            top: tourSection.offsetTop - 80, // Điều chỉnh khoảng cách nếu cần
                            behavior: "smooth" // Hiệu ứng cuộn mượt
                        });
                    }
                });
            });
        </script>
    </body>
</html>