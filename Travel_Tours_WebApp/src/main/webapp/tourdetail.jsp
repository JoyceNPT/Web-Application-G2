<%-- 
    Document   : tourdetail
    Created on : Mar 13, 2025, 2:34:03 PM
    Author     : PC
--%>
<%@page import="model.User"%>
<%@page import="model.Hours"%>
<%@page import="model.Place"%>
<%@page import="java.util.List"%>
<%@page import="model.Image"%>
<%@page import="dao.TourDAO"%>
<%@page import="model.Tour"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User loggedUser = (User) session.getAttribute("account");

    Cookie[] cookies = request.getCookies();
    String username = null;

    if (cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equalsIgnoreCase("COOKIE_USERNAME")) {
                username = c.getValue();
            }
        }
    } else {
        response.sendRedirect("login.jsp");
        return;
    }

    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    TourDAO dao = new TourDAO();
    String idRaw = request.getParameter("id");
    int tour_id = 0;
    Tour t = null;
    List<Image> images = null;
    List<Place> place = null;
    List<Hours> hour = null;
    String imageUrl = request.getParameter("imageUrl");
    if (imageUrl == null || imageUrl.isEmpty()) {
        imageUrl = "images/tours/default.jpg"; // Ảnh mặc định nếu không có
    }
    try {
        tour_id = Integer.parseInt(idRaw);
        t = dao.getById(tour_id);
        if (t == null) {
            response.sendRedirect("interface.jsp"); // Chuyển hướng nếu ID không tồn tại
            return;
        }
        images = dao.getImagesByTourId(tour_id);
        if (images != null && !images.isEmpty()) {
            imageUrl = images.get(0).getUrl_img(); // Lấy ảnh đầu tiên nếu có
        }
        place = dao.getPlaceByTourId(tour_id);
        hour = dao.getHoursByTourId(tour_id);

    } catch (Exception e) {
        response.sendRedirect("interface.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/tourdetail.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <!-- Bootstrap JS + jQuery -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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
                    <% }%>
                    <a href="https://zalo.me/g/wgyzda401" target="_blank" class="c-header__contact">
                        <p>Có câu hỏi? Liên hệ chúng tôi trên Zalo</p>
                        <p>
                            <img src="images/home/whatsapp.svg" alt="whatsapp" loading="lazy">0384 123 254
                        </p>
                    </a>
                </div>
            </div>
        </header>

        <div class="c-container" style="padding-top: 75px">
            <ul class="breadcumbs" style="display: flex; padding-left: 10%;padding-top: 10px; font-weight: 500;">
                <li><a href="interface.jsp" style="text-decoration: none; font-size: 18rem; color: #989898; ">Tours in Viet Nam</a></li>
                <li style="font-size: 18rem; color: #989898; margin: 0 5px; list-style: none;">&gt;</li>
                <li style="color: #989898; font-size: 18rem; line-height: 18rem; display: inline; margin-top: 3px; text-decoration: underline">
                    <span><%= t.getName()%></span>
                </li>
            </ul>

            <h1 style="margin: 10px 0 10px 0;padding-left: 10%;"><%= t.getName()%></h1>
            <div class="group  row" style="margin-left: 10%;margin-right:10%">
                <!-- Ảnh lớn bên trái -->
                <div class="group_left col-md-6">
                    <img src="<%= imageUrl%>" alt="alt" class="img-fluid rounded w-100">
                </div>

                <!-- Nhóm ảnh nhỏ bên phải -->
                <div class="group_right col-md-6">
                    <div class="row g-2">
                        <%
                            if (images != null && images.size() > 1) {
                                int totalImages = images.size();
                                int maxDisplay = 5; // Hiển thị tối đa 4 ảnh nhỏ + 1 ảnh che số lượng
                                for (int i = 1; i < Math.min(maxDisplay, totalImages); i++) {
                        %>
                        <div class="col-6">
                            <img src="<%= images.get(i).getUrl_img()%>" alt="" class="img-fluid rounded">
                        </div>
                        <%
                            }
                            if (totalImages > maxDisplay) { // Nếu còn ảnh chưa hiển thị
                        %>
                        <div class="col-6 position-relative">
                            <img src="<%= images.get(maxDisplay).getUrl_img()%>" alt="" class="img-fluid rounded">
                            <div class="overlay d-flex align-items-center justify-content-center">
                                <span class="fw-bold text-white">+<%= totalImages - maxDisplay%></span>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <section class="tour-detail">
            <div class="tour-container">
                <div class="tour-detail-page__inner">
                    <div class="tour-detail-left">
                        <article class="tour-detail-page__block">
                            <h2 class="tour-detail-title">Tour Detail</h2>
                            <div class="tour-detail-page__info">                                
                                <p class="tour-detail-page__info__item">
                                    <img class=" ls-is-cached lazyloaded" data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/tour-detail/pc/icon-clock.svg" src="https://cdn.forevervacation.com/layout_v_3/assets/img/tour-detail/pc/icon-star.svg" alt="alt"/>
                                    All-inclusive
                                </p>
                                <p class="tour-detail-page__info__item">
                                    <img class=" ls-is-cached lazyloaded" data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/tour-detail/pc/icon-clock.svg" src="https://cdn.forevervacation.com/layout_v_3/assets/img/tour-detail/pc/icon-happy-face.svg" alt="alt"/>
                                    Public Tour
                                </p>
                                <p class="tour-detail-page__info__item">
                                    <img class=" ls-is-cached lazyloaded" data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/tour-detail/pc/icon-clock.svg" src="https://cdn.forevervacation.com/layout_v_3/FV_new/assets/img/checkout/icon_info.svg" alt="alt"/>
                                    Comfortable
                                </p>

                            </div>
                            <div class="tour-detail-intro">
                                <div>
                                    <div class="tour_detail visible-ul">
                                        <p dir="ltr"><%= t.getIntro()%></p>
                                        <iframe class="tour_detail_video"  src="<%= t.getUrl_video()%>"></iframe>
                                        <p dir="ltr"><%= t.getIntr_place()%></p>
                                        <% if (place != null && !place.isEmpty()) {%>  
                                        <ul class="detail-ul">
                                            <li>
                                                <a href=""><%= place.get(0).getPlace()%></a>
                                            </li>
                                            <li>
                                                <a href=""><%= place.get(1).getPlace()%></a>
                                            </li>
                                            <li>
                                                <a href=""><%= place.get(2).getPlace()%></a>
                                            </li>
                                            <li>
                                                <a href=""><%= place.get(3).getPlace()%></a>
                                            </li>
                                            <li>
                                                <a href=""><%= place.get(4).getPlace()%></a>
                                            </li>
                                        </ul>
                                        <% }%>     
                                        <p dir="ltr"><%= t.getP1()%></p>
                                        <p dir="ltr"><%= t.getP2()%></p>

                                    </div>

                                </div>

                            </div>
                        </article>
                    </div>
                    <div class="tour-detail-right">
                        <article class="tour-detail-page__block">
                            <form data-form-add-cart id="tourmaster-enquiry-formss" method="post" class="tour-options" action="action">
                                <div class="tour-options-header">
                                    <h2 class="tour-options__title">Select Dates And Participants</h2>
                                    <div class="tour-options__selection">
                                        <div class="tour-options__selection-wrap" id="picker-container">
                                            <input  name="tourist_date" id="myID" class="tour-options__date" value="D/M/YYYY" readonly>
                                            <svg id="icon-datepicker" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg" width="30" height="30"><path d="M23.75 5H22.5V3.75c0-.688-.563-1.25-1.25-1.25-.688 0-1.25.563-1.25 1.25V5H10V3.75c0-.688-.563-1.25-1.25-1.25-.688 0-1.25.563-1.25 1.25V5H6.25a2.489 2.489 0 0 0-2.487 2.5L3.75 25a2.5 2.5 0 0 0 2.5 2.5h17.5c1.375 0 2.5-1.125 2.5-2.5V7.5c0-1.375-1.125-2.5-2.5-2.5zm0 18.75c0 .688-.563 1.25-1.25 1.25h-15c-.688 0-1.25-.563-1.25-1.25v-12.5h17.5v12.5zm-15-10h2.5v2.5h-2.5v-2.5zm5 0h2.5v2.5h-2.5v-2.5zm5 0h2.5v2.5h-2.5v-2.5z" fill="currentColor"></path></svg>
                                        </div>
                                        <div class="tour-options__selection-wrap">
                                            <input type="text" name="tourist_guests" id="tourist_guests" placeholder="Select guests" class="tour-options__guests js-guest" value="Select" autocomplete="false" readonly data-btn-popup="select_guest">
                                            <svg data-btn-popup="select_guest" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" width="30" height="30"><path opacity="0.7" d="M15.334 11.167a2.49 2.49 0 0 0 2.491-2.5 2.497 2.497 0 1 0-4.992 0c0 1.383 1.117 2.5 2.5 2.5zm-6.667 0a2.49 2.49 0 0 0 2.492-2.5 2.497 2.497 0 1 0-4.992 0c0 1.383 1.117 2.5 2.5 2.5zm0 1.666c-1.942 0-5.833.975-5.833 2.917V17c0 .458.374.833.833.833h10A.836.836 0 0 0 14.5 17v-1.25c0-1.942-3.892-2.917-5.833-2.917zm6.667 0a9.76 9.76 0 0 0-.809.042c.017.008.025.025.034.033.95.692 1.608 1.617 1.608 2.842V17c0 .292-.059.575-.15.833h4.317a.836.836 0 0 0 .833-.833v-1.25c0-1.942-3.892-2.917-5.834-2.917z" fill="#0A2342"></path></svg>
                                        </div>

                                    </div>
                                </div>
                                <div class="tour-options__content " data-tour-options-content="">
                                    <div class="tour-card">
                                        <h2 class="tour-header">Private & All-Inclusive Tour</h2>
                                        <div class="tour-price">
                                            <span class="price-detail">2 Adults x US$119</span>
                                            <span class="price-total"></span>
                                        </div>
                                        <p class="price-note">(Price includes taxes and booking fees)</p>

                                        <!-- Lựa chọn thời gian -->
                                        <div class="time-selection">
                                            <label for="start-time">Select a starting time</label>
                                            <div class="time-options">
                                                <input type="text" id="start-time" name="start-time" value="<%= hour.get(0).getHour()%> AM" readonly/>
                                                <input type="text" id="start-time" name="start-time" value="<%= hour.get(1).getHour()%> AM" readonly/>
                                            </div>
                                        </div>

                                        <div class="duration">
                                            <p><strong>Duration:</strong> 13 hours</p>
                                        </div>

                                        <a href="#" class="more-info">See what is included</a>
                                    </div>
                                </div>
                                <div class="wrap">
                                    <button class="tour-options__add-to-cart" data-frm-add-to-cart-btn="">Add To Cart</button>
                                </div>
                                </div>

                            </form>
                        </article>
                    </div>
                </div>

            </div>

        </section>
        <!-- Bảng chọn số khách -->
        <%
            double child_price = t.getPrice() * 0.7;

        %>
        <div class="overlay">
            <div class="guest-modal">
                <div class="close-btn">×</div>
                <h2>Select Number Of Guests</h2>
                <div class="guest-type">
                    <div class="label">
                        <strong>Người lớn</strong><br>
                        <span><%= t.getPrice()%>vnd/người</span>
                    </div>
                    <div class="counter">
                        <button class="decrease" data-type="adult">&lt;</button>
                        <span id="adult-count">0</span>
                        <button class="increase" data-type="adult">&gt;</button>
                    </div>
                </div>
                <div class="guest-type">
                    <div class="label">
                        <strong>Trẻ em</strong>
                        <span title="Only bookable with adult">ℹ️</span><br>
                        <span><%= child_price%>vnd/người</span>
                    </div>
                    <div class="counter">
                        <button class="decrease" data-type="child">&lt;</button>
                        <span id="child-count">0</span>
                        <button class="increase" data-type="child">&gt;</button>
                    </div>
                </div>
                <p class="note">ⓘ Booking for a child is only possible if accompanied by one or more adults.</p>
                <button class="confirm-btn" id="confirm-btn">Confirm</button>
            </div>
        </div>
        <!-- jQuery và Bootstrap Datepicker -->
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
        <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/vn.js"></script>
        <script>
            // Thiết lập giá trị mặc định là 0 khi mở modal
            document.getElementById("tourist_guests").addEventListener("click", function () {
                let div = document.querySelector(".overlay"); // Tìm div overlay
                div.style.display = (div.style.display === "none" || div.style.display === "") ? "flex" : "none";

                // Nếu lần đầu tiên mở modal, giá trị sẽ là 0
                if (document.getElementById("adult-count").textContent === "0" && document.getElementById("child-count").textContent === "0") {
                    document.getElementById("adult-count").textContent = 0;
                    document.getElementById("child-count").textContent = 0;
                    document.getElementById('tourist_guests').value = "0 guests"; // Hiển thị 0 khách khi mở lần đầu
                }
            });

            // Đóng modal khi click vào nút đóng (X)
            document.querySelector(".close-btn").addEventListener("click", function () {
                document.querySelector(".overlay").style.display = "none";
            });
            // Xử lý sự kiện tăng/giảm số lượng người
            document.querySelectorAll('.decrease, .increase').forEach(button => {
                button.addEventListener('click', function () {
                    const type = this.getAttribute('data-type');
                    const countElement = document.getElementById(type + '-count');
                    let currentCount = parseInt(countElement.textContent);

                    if (this.classList.contains('decrease')) {
                        if (type === 'child') {
                            // Giảm số lượng trẻ em nếu có người lớn
                            if (currentCount > 0) {
                                currentCount--;
                            }
                        } else if (type === 'adult' && currentCount > 0) {
                            // Giảm số lượng người lớn nhưng nếu có trẻ em thì không cho giảm xuống 0
                            if (currentCount > 0 && parseInt(document.getElementById('child-count').textContent) === 0) {
                                currentCount--;
                            } else if (currentCount > 1 || parseInt(document.getElementById('child-count').textContent) === 0) {
                                currentCount--;
                            }
                        }
                    } else if (this.classList.contains('increase')) {
                        if (type === 'child' && parseInt(document.getElementById('adult-count').textContent) > 0) {
                            // Tăng số lượng trẻ em chỉ khi có ít nhất một người lớn
                            currentCount++;
                        } else if (type === 'adult') {
                            // Tăng số lượng người lớn
                            currentCount++;
                        }
                    }

                    countElement.textContent = currentCount; // Cập nhật số lượng

                    // Cập nhật ô input mỗi khi tăng hoặc giảm số lượng
                    let adultCount = parseInt(document.getElementById('adult-count').textContent);
                    let childCount = parseInt(document.getElementById('child-count').textContent);
                    let totalGuests = adultCount + childCount;
                    document.getElementById('tourist_guests').value = totalGuests + ' guests';
                });
            });
            document.getElementById('confirm-btn').addEventListener('click', function () {
                // Lấy số lượng người lớn và trẻ em
                let adultCount = parseInt(document.getElementById('adult-count').textContent);
                let childCount = parseInt(document.getElementById('child-count').textContent);

                // Lấy giá cho người lớn và trẻ em từ server (ví dụ: từ t.getPrice() và child_price)
                let adultPrice = 1200000;  // Giá cho 1 người lớn là 1.200.000 VND
                let childPrice = 840000;   // Giá cho 1 trẻ em là 840.000 VND

                // Tính tổng giá
                let totalAdultPrice = adultCount * adultPrice;
                let totalChildPrice = childCount * childPrice;
                let totalPrice = totalAdultPrice + totalChildPrice;

                // Kiểm tra nếu không có khách, hiển thị thông báo
                if (totalPrice === 0) {
                    alert("Vui lòng chọn ít nhất một khách!");
                    return; // Ngừng thực hiện hành động nếu không có khách
                }

                // Cập nhật thông tin số lượng và tổng giá vào tour-price
                let priceDetail = "";
                if (adultCount > 0) {
                    priceDetail += `${adultCount} Người lớn x ${adultPrice.toLocaleString()} VND`;
                }
                if (childCount > 0) {
                    if (priceDetail)
                        priceDetail += ", ";
                    priceDetail += `${childCount} Trẻ em x ${childPrice.toLocaleString()} VND`;
                }

                // Cập nhật giá vào phần tử HTML
                document.querySelector('.price-detail').textContent = priceDetail;
                document.querySelector('.price-total').textContent = `Tổng cộng ${totalPrice.toLocaleString()} VND`;

                // Cập nhật ô input với số lượng khách đã chọn
                document.getElementById('tourist_guests').value = (adultCount + childCount) + ' khách';

                // Đóng modal (overlay)
                document.querySelector('.overlay').style.display = 'none';


            });


        </script>
        <script>


            flatpickr("#myID", {
                locale: "vn", // Chuyển sang tiếng Việt
                dateFormat: "d/m/Y", // Định dạng ngày DD/MM/YYYY
                minDate: "today", // Không cho chọn ngày trong quá khứ
                enableTime: false,
            })
                    ;

        </script>



    </body>
</html>
