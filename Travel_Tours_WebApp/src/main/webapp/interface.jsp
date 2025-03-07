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
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/froala_style.css">
        <link rel="stylesheet" href="css/destination.css">
    </head>
    <body>
        <div class="wrapper" onclick="void(0);">
            <!-- this is header  -->
            <!-- <header class="c-header home-page" id="header"> -->
            <header class="c-header type_breadcrumb  " id="header">
                <div class="c-header__left">
                    <div class="c-header__logo">
                        <a href="https://forevervacation.com"><img class="pc-only" src="images/menu/1.png" alt="logo" loading="lazy">
                            <img class="sp-only" src="images/menu/logo_header_mobile_new.svg" alt="logo" loading="lazy">
                        </a>
                    </div>
                    <div class="c-header__search input-search 1">
                        <form method="GET" action="https://forevervacation.com/search/result">
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
                                    <a href="https://forevervacation.com">HOME</a>
                                </div>
                                <div btn-close-menu="" class="navigation__closebtn">
                                    <img src="images/menu/icon_close_black.svg" alt="close-icon" loading="lazy">
                                </div>
                            </div>
                            
                            <ul class="navigation__menumain">
                                <li class="navigation__menumain__item">
                                    <a class="navigation__menumain__item__destinations" data-btn-drop-down=""><span
                                            class="pc-only">Our</span>
                                        Destinations
                                        <img src="images/menu/arrow-right.svg" alt="arrow-right" loading="lazy">
                                    </a>
                                    
                                </li>
                                <li class="navigation__menumain__item">
                                    <a>Why We’re Different</a>
                                </li>
                                <li class="navigation__menumain__item">
                                    <a class="" href="https://forevervacation.com/about-us">About Us</a>
                                </li>
                                <li class="navigation__menumain__item">
                                    <a class="" href="https://forevervacation.com/about-us">Support</a>
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
                                        <circle cx="13.0007" cy="11.6667" r="3.66667" stroke="black" stroke-width="2"
                                                stroke-linecap="round"></circle>
                                        <path
                                            d="M20 19.4451C18.3386 17.5455 15.8197 16.334 13 16.334C10.1803 16.334 7.66143 17.5455 6 19.4451"
                                            stroke="black" stroke-width="2" stroke-linecap="round"></path>
                                        </svg>
                                    </div>
                                    <img src="images/menu/arrow-down-white.svg" alt="Expand menu" class="c-header__user-arrow">
                                </div>
                                
                            </div>
                        </div>
                        <!-- if user not login show these -->
                        <a href="https://wa.me/16174042125" target="_blank" class="c-header__contact">
                            <p>Got a question? Text us on Zalo</p>
                            <p>
                                <img src="images/menu/whatsapp.svg" alt="whatsapp" loading="lazy">0384 123 254
                            </p>
                        </a>
                    </div>
                </div>
                
            </header>
            <main class="destination">
                
                <section class="tour_in_KV">
                    <picture class="tour_in_KV__bg lazyload">
                        <source type="image/png" media="(min-width: 769px)" srcset="images/menu/3.jpg">
                        <source type="image/png" media="(max-width: 768px)" srcset="images/menu/3.jpg">
                        <img src="images/menu/bali.webp" alt="banner">
                    </picture>
                    <div class="tour_in_KV__brush">
                        <img src="images/menu/brush-stroke.svg" alt="brush-stroke">
                    </div>
                    <div class="tour_in_KV__main">
                        <div class="c-container">
                            <h1 class="c-title04">Tours around Vietnam</h1>
                            <p class="c-text03">Here are all the Tours we are currently offering across Vietnam</p>
                            <a href="#Tours" class="c-btn01">See All Our Tours<img src="images/menu/Icon-Plane.svg" alt="ic-plane"></a>
                            <p class="c-text01">Over 20,000 Reviews</p>
                            <div class="tour_in_KV__gr">
                                <dl>
                                    <dt>
                                        <img src="images/menu/2.png" alt="tripadvisor">
                                    </dt>
                                    <dd>
                                        <div class="tour_in_KV__gr__star">
                                            <img src="images/menu/icon-rounded.svg" alt="rounded">
                                            <img src="images/menu/icon-rounded.svg" alt="rounded">
                                            <img src="images/menu/icon-rounded.svg" alt="rounded">
                                            <img src="images/menu/icon-rounded.svg" alt="rounded">
                                            <img src="images/menu/icon-rounded.svg" alt="rounded">
                                        </div>
                                        <p>As recommended by 99% of users on Facebook</p>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>
                                        <img src="images/menu/icon-google.svg" alt="google">
                                    </dt>
                                    <dd>
                                        <div class="tour_in_KV__gr__star">
                                            <img src="images/menu/icon-star.svg" alt="star">
                                            <img src="images/menu/icon-star.svg" alt="star">
                                            <img src="images/menu/icon-star.svg" alt="star">
                                            <img src="images/menu/icon-star.svg" alt="star">
                                            <img src="images/menu/icon-star.svg" alt="star">
                                        </div>
                                        <p>As recommended by 99% of users on Google reviews</p>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </section>
                
        </div>
    </body>
</html>
