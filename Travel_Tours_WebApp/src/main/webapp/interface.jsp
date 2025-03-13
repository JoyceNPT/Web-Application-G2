<%-- 
    Document   : interface
    Created on : Mar 3, 2025, 7:54:18 PM
    Author     : Khoa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <!-- if user not login show these -->
                        <div class="c-header__user-not-login pc-only">
                            <div class="c-header__user-menu">
                                <div class="c-header__user-toggle" data-slide-toggle="">
                                    <div class="c-header__user-icon">
                                        <svg width="26" height="26" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <rect width="26" height="26" rx="13" fill="white"></rect>
                                        <circle cx="13.0007" cy="11.6667" r="3.66667" stroke="black" stroke-width="2" stroke-linecap="round"></circle>
                                        <path d="M20 19.4451C18.3386 17.5455 15.8197 16.334 13 16.334C10.1803 16.334 7.66143 17.5455 6 19.4451" stroke="black" stroke-width="2" stroke-linecap="round"></path>
                                        </svg>
                                    </div>
                                    <img src="images/home/arrow-down-white.svg" alt="Expand menu" class="c-header__user-arrow">
                                </div>
                                <!-- Dropdown Menu -->
                                <div class="c-header__dropdown">
                                    <a href="login.jsp" class="c-header__dropdown-item">Login</a>
                                    <a href="signup.jsp" class="c-header__dropdown-item">Sign Up</a>
                                </div>
                            </div>
                        </div>
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
        <section id="tourSection" id="tourSection" class="tour-list">
            <div class="tours-grid">

                <!-- Tour 1: Đà Lạt -->
                <div class="tour-card">
                    <div class="tour-image">
                        <img src="images/tours/DL1.jpg" alt="Đà Lạt">
                    </div>
                    <div class="tour-info">
                        <div class="tour-title">Tour Đà Lạt - Thành Phố Ngàn Hoa</div>
                        <div class="tour-description">Khám phá thành phố sương mù với vườn hoa, thác nước và những công trình kiến trúc Pháp cổ kính trong 3 ngày 2 đêm.</div>
                        <div class="tour-price">3,690,000 VNĐ</div>
                        <div class="tour-buttons">
                            <a href="tour-details?id=1" class="btn btn-details">Xem chi tiết</a>
                            <a href="booking?id=1" class="btn btn-booking">Đặt tour</a>
                        </div>
                    </div>
                </div>

                <!-- Tour 2: Huế -->
                <div class="tour-card">
                    <div class="tour-image">
                        <img src="images/tours/Hue1.jpg" alt="Huế">
                    </div>
                    <div class="tour-info">
                        <div class="tour-title">Khám Phá Cố Đô Huế</div>
                        <div class="tour-description">Hành trình 2 ngày 1 đêm khám phá vẻ đẹp lịch sử của cố đô Huế với các di tích, lăng tẩm và ẩm thực cung đình.</div>
                        <div class="tour-price">2,890,000 VNĐ</div>
                        <div class="tour-buttons">
                            <a href="tour-details?id=2" class="btn btn-details">Xem chi tiết</a>
                            <a href="booking?id=2" class="btn btn-booking">Đặt tour</a>
                        </div>
                    </div>
                </div>

                <!-- Tour 3: Vũng Tàu -->
                <div class="tour-card">
                    <div class="tour-image">
                        <img src="images/tours/VT1.jpg" alt="Vũng Tàu">
                    </div>
                    <div class="tour-info">
                        <div class="tour-title">Vũng Tàu Biển Xanh Cát Trắng</div>
                        <div class="tour-description">Tour nghỉ dưỡng 2 ngày 1 đêm tại thành phố biển Vũng Tàu với các bãi tắm đẹp, núi nhỏ và ẩm thực hải sản.</div>
                        <div class="tour-price">1,790,000 VNĐ</div>
                        <div class="tour-buttons">
                            <a href="tour-details?id=3" class="btn btn-details">Xem chi tiết</a>
                            <a href="booking?id=3" class="btn btn-booking">Đặt tour</a>
                        </div>
                    </div>
                </div>

                <!-- Tour 4: Hạ Long -->
                <div class="tour-card">
                    <div class="tour-image">
                        <img src="images/tours/HL1.jpg" alt="Vịnh Hạ Long">
                    </div>
                    <div class="tour-info">
                        <div class="tour-title">Kỳ Quan Vịnh Hạ Long</div>
                        <div class="tour-description">Tour 3 ngày 2 đêm khám phá kỳ quan thiên nhiên thế giới với đêm nghỉ trên du thuyền và khám phá các hang động kỳ vĩ.</div>
                        <div class="tour-price">5,490,000 VNĐ</div>
                        <div class="tour-buttons">
                            <a href="tour-details?id=4" class="btn btn-details">Xem chi tiết</a>
                            <a href="booking?id=4" class="btn btn-booking">Đặt tour</a>
                        </div>
                    </div>
                </div>

                <!-- Tour 5: Đà Nẵng -->
                <div class="tour-card">
                    <div class="tour-image">
                        <img src="images/tours/DN3.jpg" alt="Đà Nẵng">
                    </div>
                    <div class="tour-info">
                        <div class="tour-title">Đà Nẵng - Bà Nà Hills - Hội An</div>
                        <div class="tour-description">Tour 4 ngày 3 đêm trọn vẹn trải nghiệm thành phố đáng sống nhất Việt Nam với Cầu Vàng, Bà Nà Hills và phố cổ Hội An.</div>
                        <div class="tour-price">4,990,000 VNĐ</div>
                        <div class="tour-buttons">
                            <a href="tour-details?id=5" class="btn btn-details">Xem chi tiết</a>
                            <a href="booking?id=5" class="btn btn-booking">Đặt tour</a>
                        </div>
                    </div>
                </div>

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
