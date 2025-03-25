<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="model.Tour"%>
<%@page import="model.Booking"%>
<%@page import="dao.BookingDAO"%>
<%@page import="dao.TourDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User loggedUser = (User) session.getAttribute("account");
    // Get logged-in user ID from session
    int userId = loggedUser.getId();
    if (userId <1) {
        response.sendRedirect("login.jsp"); // Redirect to login if not logged in
        return;
    }

    // Initialize DAOs
    BookingDAO bookingDAO = new BookingDAO();
    TourDAO tourDAO = new TourDAO();

    // Get bookings for the logged-in user
    List<Booking> bookings = bookingDAO.getBookingsByUserId(userId);
    // Handle POST actions (Pay or Cancel)
//    List<Object[]> cart = (List<Object[]>) session.getAttribute("cart");

 
    if ("POST".equalsIgnoreCase(request.getMethod())) {
      
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .cart-container { max-width: 1200px; margin: 50px auto; }
        .cart-table { width: 100%; border-collapse: collapse; }
        .cart-table th, .cart-table td { padding: 15px; border: 1px solid #ddd; text-align: left; }
        .cart-table th { background-color: #f8f9fa; }
        .btn-pay { background-color: #28a745; color: white; }
        .btn-cancel { background-color: #dc3545; color: white; }
    </style>
</head>
<body>
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
                                    <span><%= loggedUser.getUsername()%></span>
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
<div class="cart-container">
    <table class="cart-table">
        <thead>
            <tr>
                <th>Tên chuyến đi</th>
                <th>Số người</th>
                <th>Tổng số tiền</th>
                <th>Thời gian</th>
            </tr>
        </thead>
        <tbody>
            <%
                    for (Booking b : bookings) {
                %>
                <tr>
                    <td><%= b.getTourId()%></td>
                    <td><%= b.getNumPeople()%></td>
                    <td><%= b.getTotal()%></td>
                    <td><%= b.getDate() %></td>
                    <td>
                        <a href="booking.jsp?id=<%= b.getId()%>" class="btn btn-primary"><i class="bi bi-tools"></i>Thanh toán</a>
                    </td>
                </tr>
                <%
                    }
                %>
 
        </tbody>
    </table>
</div>
</body>
</html>
