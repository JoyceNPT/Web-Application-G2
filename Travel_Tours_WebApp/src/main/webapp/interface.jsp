<%-- 
    Document   : interface
    Created on : Mar 3, 2025, 7:54:18 PM
    Author     : Khoa
--%>

<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page import="model.Tour"%>
<%@page import="dao.TourDAO"%>
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
    }

    TourDAO dao = new TourDAO();
    List<Tour> list = dao.getAll();


%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travel Tour</title>

        <link rel="icon" type="image/png" href="images/favicon_io/favicon.ico">
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/tour.css">
    </head>
    <body>
        <div class="wrapper" onclick="void(0);">
            <!-- this is header  -->
            <!-- <header class="c-header home-page" id="header"> -->
            <header class="c-header type_breadcrumb  " id="header">
                <div class="c-header__left">
                    <div class="c-header__logo">
                        <a ><img class="pc-only" src="images/home/1.png" alt="logo" loading="lazy">
                            <img class="sp-only" src="images/home/4.png" alt="logo" loading="lazy">
                        </a>
                    </div>
                    <div class="c-header__search input-search 1">
                        <form method="GET" action="">
                            <div class="c-header__search__autocomplete autocomplete">
                                <input id="search-bar" type="text" name="term" placeholder="Where are you going?">
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
                                    <a >HOME</a>
                                </div>
                                <div btn-close-menu="" class="navigation__closebtn">
                                    <img src="images/home/icon_close_black.svg" alt="close-icon" loading="lazy">
                                </div>
                            </div>

                            <ul class="navigation__menumain">
                                <li class="navigation__menumain__item">
                                    <a class="navigation__menumain__item__destinations" data-btn-drop-down=""><span
                                            class="pc-only">Our</span>
                                        Destinations
                                        <img src="images/home/arrow-right.svg" alt="arrow-right" loading="lazy">
                                    </a>

                                </li>
                                <li class="navigation__menumain__item">
                                    <a>Why We’re Different</a>
                                </li>
                                <li class="navigation__menumain__item">
                                    <a class="" >About Us</a>
                                </li>
                                <li class="navigation__menumain__item">
                                    <a class="" >Support</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                    <div class="c-header__group">
                        <% if (loggedUser != null) {%>
                        <!-- Nếu user đã đăng nhập -->
                        <div class="c-header__user-menu">
                            <div class="c-header__user-toggle" data-slide-toggle="">
                                <div class="c-header__user-icon">
                                    <img src="images/home/user-icon.svg" alt="User Icon">
                                    <span><%= loggedUser.getUsername()%></span>
                                </div>
                                <img src="images/home/arrow-down-white.svg" alt="Expand menu" class="c-header__user-arrow">
                            </div>
                            <div class="c-header__dropdown">
                                <a href="user-info.jsp" class="c-header__dropdown-item">Information</a>
                                <a href="logout.jsp" class="c-header__dropdown-item">Logout</a>
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
                                    <img src="images/home/arrow-down-white.svg" alt="Expand menu" class="c-header__user-arrow">
                                </div>
                                <div class="c-header__dropdown">
                                    <a href="login.jsp" class="c-header__dropdown-item">Login</a>
                                    <a href="signup.jsp" class="c-header__dropdown-item">Sign Up</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <!-- if user not login show these -->
                        <a href="https://zalo.me/g/wgyzda401" target="_blank" class="c-header__contact">
                            <p>Got a question? Text us on Zalo</p>
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
                        <img src="images/home/brush-stroke.svg" alt="brush-stroke">
                    </div>
                    <div class="tour_in_KV__main">
                        <div class="c-container">
                            <h1 class="c-title04">Tours around Vietnam</h1>
                            <p class="c-text03">Here are all the Tours we are currently offering across Vietnam</p>
                            <a id="seeAllToursBtn" href="#tourSection" class="c-btn01">
                                See All Our Tours
                                <img src="images/home/Icon-Plane.svg" alt="ic-plane">
                            </a>

                            <p class="c-text01">Over 20,000 Reviews</p>
                            <div class="tour_in_KV__gr">
                                <dl>
                                    <dt>
                                        <img src="images/home/2.png" alt="tripadvisor">
                                    </dt>
                                    <dd>
                                        <div class="tour_in_KV__gr__star">
                                            <img src="images/home/icon-rounded.svg" alt="rounded">
                                            <img src="images/home/icon-rounded.svg" alt="rounded">
                                            <img src="images/home/icon-rounded.svg" alt="rounded">
                                            <img src="images/home/icon-rounded.svg" alt="rounded">
                                            <img src="images/home/icon-rounded.svg" alt="rounded">
                                        </div>
                                        <p>As recommended by 99% of users on Facebook</p>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>
                                        <img src="images/home/icon-google.svg" alt="google">
                                    </dt>
                                    <dd>
                                        <div class="tour_in_KV__gr__star">
                                            <img src="images/home/icon-star.svg" alt="star">
                                            <img src="images/home/icon-star.svg" alt="star">
                                            <img src="images/home/icon-star.svg" alt="star">
                                            <img src="images/home/icon-star.svg" alt="star">
                                            <img src="images/home/icon-star.svg" alt="star">
                                        </div>
                                        <p>As recommended by 99% of users on Google reviews</p>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </section>
        </div>
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
        </script>
        <!-- Danh sách tour -->

        <section id="tourSection" class="tour-list">
            <div class="tours-grid">
                <%
                    for (Tour t : list) {
                %>
                <!-- Tour Card -->
                <div class="tour-card">
                    <div class="tour-image">
                        <!-- Nếu có getImage() thì lấy từ database, nếu không thì tự động lấy theo ID -->
                        <img src="images/tours/<%= t.getId()%>.jpg" alt="<%= t.getName()%>">

                    </div>
                    <div class="tour-info">
                        <div class="tour-title"><%= t.getName()%></div>
                        <div class="tour-description"><%= t.getDescrip()%></div>
                        <div class="tour-price"><%= t.getPrice()%></div>
                        <div class="tour-buttons">
                            <a href="tour-details?id=<%= t.getId()%>" class="btn btn-details">Xem chi tiết</a>
                            <a href="booking?id=<%= t.getId()%>" class="btn btn-booking">Đặt tour</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                %>
            </div>
        </section>



        <script>
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
