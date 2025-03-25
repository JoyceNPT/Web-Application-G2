<%-- 
    Tài liệu   : booking
    Ngày tạo  : 22 Tháng 3, 2025, 7:24:16 PM
    Tác giả     : NghiLTTCE182357
--%>

<%@page import="dao.OrderdetailDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="model.Image"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="util.DBContext"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.User"%>
<%@page import="model.Tour"%>
<%@page import="dao.TourDAO"%>
<%@page import="model.Booking"%>
<%@page import="java.util.List"%>
<%@page import="dao.BookingDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    // Lấy thông tin user từ session
    HttpSession sessionUser = request.getSession();
    User loggedUser = (User) sessionUser.getAttribute("account");

    // Nếu user chưa đăng nhập, chuyển hướng đến trang đăng nhập
    if (loggedUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }

%>

<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>đặt tour</title>
        <link rel="stylesheet" href="./css/booking.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="icon" type="image/png" href="images/favicon_io/favicon.ico">
        <!-- Bootstrap 5 CDN -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Thanh điều hướng -->

    </head>
    <body>

        <header class="c-header type_breadcrumb" id="header">
            <div class="c-header__left">
                <div class="c-header__logo">
                    
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
                                <a></a>
                            </div>
                            <div btn-close-menu="" class="navigation__closebtn">
                                <img src="images/home/icon_close_black.svg" alt="Đóng menu" loading="lazy">
                            </div>
                        </div>

                        <ul class="navigation__menumain">
                            <li class="navigation__menumain__item">
                                <a class="navigation__menumain__item__destinations" data-btn-drop-down=""><span
                                        class="pc-only"></span>
                                    <img src="images/home/arrow-right.svg" alt="mũi tên phải" loading="lazy">
                                </a>
                            </li>
                            <li class="navigation__menumain__item">
                                <a></a>
                            </li>
                            <li class="navigation__menumain__item">
                                <a class=""></a>
                            </li>
                            <li class="navigation__menumain__item">
                                <a class=""></a>
                            </li>
                        </ul>
                    </nav>
                </div>
                <div class="c-header__group">
                    <% if (loggedUser != null) {%>
                   
                    <div class="c-header__user-menu">
                        
                        <div class="c-header__dropdown">
                            <a href="user-info.jsp" class="c-header__dropdown-item"></a>
                            <a href="logout.jsp" class="c-header__dropdown-item"></a>
                        </div>
                    </div>
                    <% } else { %>
                   
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
                                
                            </div>
                        </div>
                    </div>
                    <% }%>
                    <a href="https://zalo.me/g/wgyzda401" target="_blank" class="c-header__contact">
                       
                        <p>
                            <img src="images/home/whatsapp.svg" alt="whatsapp" loading="lazy">
                        </p>
                    </a>
                </div>
            </div>
        </header>


        <div class="container mt-6">
            <div class="row justify-content-center">
                <!-- Thông Tin Đặt Tour -->
                <div class="col-md-5">
                    <div class="card p-4 shadow-lg">
                        <h4 class="card-title text-center">Thông Tin Đặt Tour</h4>

                        <form method="POST">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Họ và Tên:</label>
                                <input type="text" class="form-control" value="<%= (loggedUser != null) ? loggedUser.getFullname() : ""%>"< readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Email:</label>
                                <input type="email" class="form-control" value="<%= (loggedUser != null) ? loggedUser.getEmail() : ""%>" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Số điện thoại:</label>
                                <input type="text" class="form-control" value="<%= (loggedUser != null) ? loggedUser.getPhone() : ""%>" readonly>
                            </div>
                            <button class="btn btn-warning w-100">Xác nhận</button>
                        </form>
                    </div>
                </div>



                <!-- Thông Tin Booking -->
                <div class="col-md-5">
                    <div class="card p-4 shadow-lg">
                        <h4 class="card-title text-center">Thông Tin Booking</h4>
                        <%
                            BookingDAO bookingDAO = new BookingDAO();
                            TourDAO tourDAO = new TourDAO();
                            Booking book = bookingDAO.getById(1);
                        %>

                        <% if (book == null) { %>
                        <div class="alert alert-warning text-center">Bạn chưa đặt tour nào.</div>
                        <% } else { %>
                        <%
                            Tour tour = tourDAO.getById(book.getTourId());
                            List<Image> imgList = tourDAO.getImagesByTourId(book.getTourId());
                        %>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Ngày đặt:</label>
                            <div class="form-control"><%= book.getDate()%></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Số người:</label>
                            <div class="form-control"><%= book.getNumPeople()%></div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Tổng tiền:</label>
                            <div class="form-control"><%= book.getTotal()%> VND</div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-bold">Tên Tour:</label>
                            <div class="form-control"><%= tour != null ? tour.getName() : "Không tìm thấy tour"%></div>
                        </div>
                        <div class="text-center">
                            <% if (tour != null && !imgList.isEmpty()) {%>
                            <img src="<%= imgList.get(0).getUrl_img()%>" alt="Tour Image" class="img-fluid rounded">
                            <% } else { %>
                            <p class="text-muted">Không có ảnh</p>
                            <% } %>
                        </div>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
        <script>
            <%
                if (request.getMethod().equalsIgnoreCase("POST")) {
//                    response.sendRedirect("interface.jsp");
//                    return;
//                }
            %>
            Swal.fire({
                icon: 'success',
                title: 'Đặt Chuyến Đi Thành Công!',
                text: 'Hãy cùng xem thêm nhiều chuyến du lịch hấp dẫn khác nhé!',
                confirmButtonText: 'OK',
                allowOutsideClick: false,
                customClass: {
                    confirmButton: "btn btn-login"
                }
            }).then(() => {
                window.location.href = 'interface.jsp';
            });

            <%
                 }
            %>
        </script> 
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
