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
                    <div class="c-header__btn-menu" btn-openmenusp="">
                        <div class="bar1"></div>
                        <div class="bar2"></div>
                        <div class="bar3"></div>
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
                            <div class="c-header__location location-sp">
                                <ul>
                                    <li>
                                        <a class="underline" href="https://forevervacation.com/tours-in-bali">Tours in Bali
                                        </a>
                                    </li>
                                    <li><a class="" href="https://forevervacation.com/tours-in-nusa-penida">Tours in Nusa Penida</a></li>
                                    <li class=""><a class="" href="https://forevervacation.com/tours-in-ubud">Tours in Ubud</a></li>

                                    <li><a class="" href="https://forevervacation.com/bali/travel-guide">Bali Travel Guide</a></li>

                                    <li>
                                        <a class="" href="https://forevervacation.com/bali/attractions">Bali Attractions</a>
                                    </li>
                                </ul>
                            </div>
                            <ul class="navigation__menumain">
                                <li class="navigation__menumain__item">
                                    <a class="navigation__menumain__item__destinations" data-btn-drop-down=""><span
                                            class="pc-only">Our</span>
                                        Destinations
                                        <img src="images/menu/arrow-right.svg" alt="arrow-right" loading="lazy">
                                    </a>
                                    <div class="navigation__wrap" data-drop-down="">
                                        <ul class="navigation__submenu">
                                            <li class="navigation__submenu__item">
                                                <a href="https://forevervacation.com/tours-in-indonesia">Indonesia</a>
                                                <div data-submenu-sp="" class="navigation__submenu__inner">
                                                    <div class="navigation__submenu__head">
                                                        <div class="navigation__submenu__head__back" data-btn-prev="">
                                                            <img src="images/menu/Arrow-left-news.svg" alt="arrow-left" loading="lazy">
                                                        </div>
                                                        <a href="https://forevervacation.com/tours-in-indonesia"
                                                           class="navigation__submenu__head__name">
                                                            Indonesia
                                                        </a>
                                                        <div btn-close-menu="" class="navigation__closebtn">
                                                            <img src="images/menu/Icon-Close-news.svg" alt="close-icon" loading="lazy">
                                                        </div>
                                                    </div>
                                                    <ol class="navigation__submenu2">

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">bali</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-bali">Bali</a>
                                                        </li>
                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-nusa-penida">Nusa Penida</a>
                                                        </li>
                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-ubud">Ubud</a>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </li>
                                            <li class="navigation__submenu__item">
                                                <a href="https://forevervacation.com/tours-in-thailand">Thailand</a>
                                                <div data-submenu-sp="" class="navigation__submenu__inner">
                                                    <div class="navigation__submenu__head">
                                                        <div class="navigation__submenu__head__back" data-btn-prev="">
                                                            <img src="images/menu/Arrow-left-news.svg" alt="arrow-left" loading="lazy">
                                                        </div>
                                                        <a href="https://forevervacation.com/tours-in-thailand"
                                                           class="navigation__submenu__head__name">
                                                            Thailand
                                                        </a>
                                                        <div btn-close-menu="" class="navigation__closebtn">
                                                            <img src="images/menu/Icon-Close-news.svg" alt="close-icon" loading="lazy">
                                                        </div>
                                                    </div>
                                                    <ol class="navigation__submenu2">

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">bangkok</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-bangkok">Bangkok</a>
                                                        </li>

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">phuket</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-phuket">Phuket</a>
                                                        </li>

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">chiang-mai</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-chiang-mai">Chiang Mai</a>
                                                        </li>

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">krabi</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-krabi">Krabi</a>
                                                        </li>

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">koh-samui</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-koh-samui">Koh Samui</a>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </li>
                                            <li class="navigation__submenu__item">
                                                <a href="https://forevervacation.com/tours-in-malaysia">Malaysia</a>
                                                <div data-submenu-sp="" class="navigation__submenu__inner">
                                                    <div class="navigation__submenu__head">
                                                        <div class="navigation__submenu__head__back" data-btn-prev="">
                                                            <img src="images/menu/Arrow-left-news.svg" alt="arrow-left" loading="lazy">
                                                        </div>
                                                        <a href="https://forevervacation.com/tours-in-malaysia"
                                                           class="navigation__submenu__head__name">
                                                            Malaysia
                                                        </a>
                                                        <div btn-close-menu="" class="navigation__closebtn">
                                                            <img src="images/menu/Icon-Close-news.svg" alt="close-icon" loading="lazy">
                                                        </div>
                                                    </div>
                                                    <ol class="navigation__submenu2">

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">kuala-lumpur</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-kuala-lumpur">Kuala Lumpur</a>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </li>
                                            <li class="navigation__submenu__item">
                                                <a href="https://forevervacation.com/private-tours-in-vietnam">Vietnam</a>
                                                <div data-submenu-sp="" class="navigation__submenu__inner">
                                                    <div class="navigation__submenu__head">
                                                        <div class="navigation__submenu__head__back" data-btn-prev="">
                                                            <img src="images/menu/Arrow-left-news.svg" alt="arrow-left" loading="lazy">
                                                        </div>
                                                        <a href="https://forevervacation.com/private-tours-in-vietnam"
                                                           class="navigation__submenu__head__name">
                                                            Vietnam
                                                        </a>
                                                        <div btn-close-menu="" class="navigation__closebtn">
                                                            <img src="images/menu/Icon-Close-news.svg" alt="close-icon" loading="lazy">
                                                        </div>
                                                    </div>
                                                    <ol class="navigation__submenu2">

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">ho-chi-minh-city</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-ho-chi-minh-city">Ho Chi Minh City</a>
                                                        </li>

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">da-nang</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-da-nang">Da Nang</a>
                                                        </li>

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">hanoi</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-hanoi">Hanoi</a>
                                                        </li>

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">quy-nhon</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-quy-nhon">Quy Nhon</a>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </li>
                                            <li class="navigation__submenu__item">
                                                <a href="https://forevervacation.com/tours-in-singapore">Singapore</a>
                                                <div data-submenu-sp="" class="navigation__submenu__inner">
                                                    <div class="navigation__submenu__head">
                                                        <div class="navigation__submenu__head__back" data-btn-prev="">
                                                            <img src="images/menu/Arrow-left-news.svg" alt="arrow-left" loading="lazy">
                                                        </div>
                                                        <a href="https://forevervacation.com/tours-in-singapore"
                                                           class="navigation__submenu__head__name">
                                                            Singapore
                                                        </a>
                                                        <div btn-close-menu="" class="navigation__closebtn">
                                                            <img src="images/menu/Icon-Close-news.svg" alt="close-icon" loading="lazy">
                                                        </div>
                                                    </div>
                                                    <ol class="navigation__submenu2">

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">singapore</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-singapore">Singapore</a>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </li>
                                            <li class="navigation__submenu__item">
                                                <a href="https://forevervacation.com/tours-in-usa">United States</a>
                                                <div data-submenu-sp="" class="navigation__submenu__inner">
                                                    <div class="navigation__submenu__head">
                                                        <div class="navigation__submenu__head__back" data-btn-prev="">
                                                            <img src="images/menu/Arrow-left-news.svg" alt="arrow-left" loading="lazy">
                                                        </div>
                                                        <a href="https://forevervacation.com/tours-in-usa" class="navigation__submenu__head__name">
                                                            United States
                                                        </a>
                                                        <div btn-close-menu="" class="navigation__closebtn">
                                                            <img src="images/menu/Icon-Close-news.svg" alt="close-icon" loading="lazy">
                                                        </div>
                                                    </div>
                                                    <ol class="navigation__submenu2">

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">chicago</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-chicago">Chicago</a>
                                                        </li>

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">boston</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-boston">Boston</a>
                                                        </li>

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">san-francisco</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-san-francisco">San Francisco</a>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </li>
                                            <li class="navigation__submenu__item">
                                                <a href="https://forevervacation.com/tours-in-sri-lanka">Sri Lanka</a>
                                                <div data-submenu-sp="" class="navigation__submenu__inner">
                                                    <div class="navigation__submenu__head">
                                                        <div class="navigation__submenu__head__back" data-btn-prev="">
                                                            <img src="images/menu/Arrow-left-news.svg" alt="arrow-left" loading="lazy">
                                                        </div>
                                                        <a href="https://forevervacation.com/tours-in-sri-lanka"
                                                           class="navigation__submenu__head__name">
                                                            Sri Lanka
                                                        </a>
                                                        <div btn-close-menu="" class="navigation__closebtn">
                                                            <img src="images/menu/Icon-Close-news.svg" alt="close-icon" loading="lazy">
                                                        </div>
                                                    </div>
                                                    <ol class="navigation__submenu2">

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">kandy</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-kandy">Kandy</a>
                                                        </li>

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">galle</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-galle">Galle</a>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </li>
                                            <li class="navigation__submenu__item">
                                                <a href="https://forevervacation.com/tours-in-turkey">Turkey</a>
                                                <div data-submenu-sp="" class="navigation__submenu__inner">
                                                    <div class="navigation__submenu__head">
                                                        <div class="navigation__submenu__head__back" data-btn-prev="">
                                                            <img src="images/menu/Arrow-left-news.svg" alt="arrow-left" loading="lazy">
                                                        </div>
                                                        <a href="https://forevervacation.com/tours-in-turkey" class="navigation__submenu__head__name">
                                                            Turkey
                                                        </a>
                                                        <div btn-close-menu="" class="navigation__closebtn">
                                                            <img src="images/menu/Icon-Close-news.svg" alt="close-icon" loading="lazy">
                                                        </div>
                                                    </div>
                                                    <ol class="navigation__submenu2">

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">istanbul</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-istanbul">Istanbul</a>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </li>
                                            <li class="navigation__submenu__item">
                                                <a href="https://forevervacation.com/tours-in-mexico">Mexico</a>
                                                <div data-submenu-sp="" class="navigation__submenu__inner">
                                                    <div class="navigation__submenu__head">
                                                        <div class="navigation__submenu__head__back" data-btn-prev="">
                                                            <img src="images/menu/Arrow-left-news.svg" alt="arrow-left" loading="lazy">
                                                        </div>
                                                        <a href="https://forevervacation.com/tours-in-mexico" class="navigation__submenu__head__name">
                                                            Mexico
                                                        </a>
                                                        <div btn-close-menu="" class="navigation__closebtn">
                                                            <img src="images/menu/Icon-Close-news.svg" alt="close-icon" loading="lazy">
                                                        </div>
                                                    </div>
                                                    <ol class="navigation__submenu2">

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">mexico-city</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-mexico-city">Mexico City</a>
                                                        </li>



                                                    </ol>
                                                </div>
                                            </li>
                                            <li class="navigation__submenu__item">
                                                <a href="https://forevervacation.com/tours-in-philippines">Philippines</a>
                                                <div data-submenu-sp="" class="navigation__submenu__inner">
                                                    <div class="navigation__submenu__head">
                                                        <div class="navigation__submenu__head__back" data-btn-prev="">
                                                            <img src="images/menu/Arrow-left-news.svg" alt="arrow-left" loading="lazy">
                                                        </div>
                                                        <a href="https://forevervacation.com/tours-in-philippines"
                                                           class="navigation__submenu__head__name">
                                                            Philippines
                                                        </a>
                                                        <div btn-close-menu="" class="navigation__closebtn">
                                                            <img src="images/menu/Icon-Close-news.svg" alt="close-icon" loading="lazy">
                                                        </div>
                                                    </div>
                                                    <ol class="navigation__submenu2">

                                                        <!-- <li><a href="#">tours-in-bali/city-tours</a></li> -->
                                                        <!-- <li><a href="#">el-nido</a></li> -->

                                                        <li class="">
                                                            <a href="https://forevervacation.com/tours-in-el-nido">El Nido</a>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
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
                                <div class="c-header__user-dropdown" data-slide-toggle-content="">
                                    <ul>
                                        <li class="flex-row">
                                            <p data-btn-popup="sign_in">Login</p>
                                            <p class="inactive">/</p>
                                            <p data-btn-popup="sign_up">Sign Up</p>
                                        </li>
                                        <li>
                                            <p data-btn-popup="currency">
                                                Currency
                                                (€)
                                            </p>
                                        </li>
                                    </ul>
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

            <input type="hidden" id="total_pages" name="total_pages" value="1">
            <input type="hidden" id="current_page" name="current_page" value="1">

            <main class="destination">
                <picture class="bg-map lazyload">
                    <source type="image/png" srcset="images/menu/map.png">
                    <source type="image/png" srcset="images/menu/map.png">
                    <img src="images/menu/map.png" alt="map">
                </picture>
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
                <section class="destination__sec01" id="Tours">
                    <div class="global_breadcrumb">
                        <a href="https://forevervacation.com">Home</a>
                        <span>></span>
                        <p>Tours in Bali</p>
                        <script type="application/ld+json">
                            {
                            "@context": "https://schema.org",
                            "@type": "BreadcrumbList",
                            "itemListElement": [
                            {
                            "@type": "ListItem",
                            "position": 1,
                            "name": "Home",
                            "item": "https://forevervacation.com"
                            },
                            {
                            "@type": "ListItem",
                            "position": 2,
                            "name": "Tours in Bali",
                            "item": "https://forevervacation.com/tours-in-bali/city-tours"
                            }
                            ]
                            }
                        </script>
                    </div>
                    <div class="c-container">
                        <h2 class="c-title02">
                            City Tours in Bali

                        </h2>
                        <p class="c-text02">
                            Our passionate team have carefully curated Bali tours to suit any vacation.


                            We're adding new

                            City Tours in Bali
                            monthly, so keep checking back to see our new excursions!
                        </p>
                        <!-- dropdown PC -->
                        <div class="dropdown">
                            <div class="dropdown__wrap">
                                <div class="dropdown__box">
                                    <p class="dropdown__text">City Tours</p>
                                    <div class="dropdown__btn">
                                        Choose tour category
                                        <img class="lazyloaded"
                                             data-src="https://storage.googleapis.com/fvallimages/layout_v_3/assets/img/common/pc/Icon-Arrow-Right-2.svg"
                                             alt="arrow-down" src="images/menu/Icon-Arrow-Right-2.svg">
                                    </div>
                                </div>
                                <ul class="dropdown__list">
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali">
                                            All tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-nusa-penida">
                                            Nusa Penida Tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-ubud">
                                            Ubud Tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/boat-tours">
                                            Boat Tours
                                        </a>
                                    </li>
                                    <li class="active">
                                        <a href="https://forevervacation.com/tours-in-bali/city-tours">
                                            City Tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/couples">
                                            Couples
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/cultural-tours">
                                            Cultural Tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/family-friendly-tours">
                                            Family Friendly Tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/foodie-tours">
                                            Foodie Tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/hiking-trekking">
                                            Hiking & Trekking
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/honeymoon-tours">
                                            Honeymoon Tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/island-tours">
                                            Island Tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/luxury-tours">
                                            Luxury Tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/nature-adventure">
                                            Nature & Adventure
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/safaris-wildlife-tours">
                                            Safaris & Wildlife Tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/sightseeing-tours">
                                            Sightseeing Tours
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/spa-relaxation">
                                            Spa & Relaxation
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://forevervacation.com/tours-in-bali/water-sports">
                                            Water Sports
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- end dropdown PC -->

                        <!-- filter Mobile -->
                        <div class="c-gr_filter">
                            <div class="c-gr_filter__item" data-filter="">
                                <img class="lazyloaded" src="images/menu/new-filter.svg" alt="filter">
                                <p>City Tours</p>
                            </div>
                            <div class="c-gr_filter__item" data-filter2="">
                                <img class="lazyloaded" src="images/menu/new-filter.svg" alt="filter">
                                <p>Filter</p>
                            </div>
                        </div>
                        <!-- end filter Mobile -->
                    </div>
                </section>
                <!-- filter Menu Bottom Fixed -->
                <div class="c-filter-menu" data-filter-menu="">
                    <ul>
                        <li>
                            <div class="c-filter-menu__closebtn" data-filter-close=""></div>
                            <p class="c-filter-menu__title">Choose tour category:</p>
                            <ul class="sub-menu">
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali">
                                        All tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-nusa-penida">
                                        Nusa Penida Tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-ubud">
                                        Ubud Tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/boat-tours">
                                        Boat Tours
                                    </a>
                                </li>
                                <li class="active">
                                    <a href="https://forevervacation.com/tours-in-bali/city-tours">
                                        City Tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/couples">
                                        Couples
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/cultural-tours">
                                        Cultural Tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/family-friendly-tours">
                                        Family Friendly Tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/foodie-tours">
                                        Foodie Tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/hiking-trekking">
                                        Hiking & Trekking
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/honeymoon-tours">
                                        Honeymoon Tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/island-tours">
                                        Island Tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/luxury-tours">
                                        Luxury Tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/nature-adventure">
                                        Nature & Adventure
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/safaris-wildlife-tours">
                                        Safaris & Wildlife Tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/sightseeing-tours">
                                        Sightseeing Tours
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/spa-relaxation">
                                        Spa & Relaxation
                                    </a>
                                </li>
                                <li>
                                    <a href="https://forevervacation.com/tours-in-bali/water-sports">
                                        Water Sports
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="c-filter-menu" data-filter-menu2="">
                    <ul>
                        <li>
                            <div class="c-filter-menu__closebtn" data-filter-close2=""></div>
                            <p class="c-filter-menu__title">Filter:</p>
                        </li>
                    </ul>
                </div>
                <!-- end filter Menu Bottom Fixed -->
                <section class="destination__sec02">
                    <div class="destination__sec02__inner">
                        <aside class="sidebar_left">
                            <dl class="sidebar_left__block" style="display: ">
                                <dt>Tour Categories</dt>
                                <dd>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_5000" class="tour_type_class" data-value-params="5000"
                                               value="5000">
                                        <label for="types_5000" class="check-label">Nusa Penida Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_5001" class="tour_type_class" data-value-params="5001"
                                               value="5001">
                                        <label for="types_5001" class="check-label">Ubud Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_30" class="tour_type_class" data-value-params="30"
                                               value="30">
                                        <label for="types_30" class="check-label">Boat Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_10" class="tour_type_class" data-value-params="10"
                                               value="10" checked="" checked""="">
                                        <label for="types_10" class="check-label">City Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_25" class="tour_type_class" data-value-params="25"
                                               value="25">
                                        <label for="types_25" class="check-label">Couples</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_3" class="tour_type_class" data-value-params="3"
                                               value="3">
                                        <label for="types_3" class="check-label">Cultural Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_5" class="tour_type_class" data-value-params="5"
                                               value="5">
                                        <label for="types_5" class="check-label">Family Friendly Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_21" class="tour_type_class" data-value-params="21"
                                               value="21">
                                        <label for="types_21" class="check-label">Foodie Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_22" class="tour_type_class" data-value-params="22"
                                               value="22">
                                        <label for="types_22" class="check-label">Hiking & Trekking</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_29" class="tour_type_class" data-value-params="29"
                                               value="29">
                                        <label for="types_29" class="check-label">Honeymoon Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_7" class="tour_type_class" data-value-params="7"
                                               value="7">
                                        <label for="types_7" class="check-label">Island Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_4" class="tour_type_class" data-value-params="4"
                                               value="4">
                                        <label for="types_4" class="check-label">Luxury Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_28" class="tour_type_class" data-value-params="28"
                                               value="28">
                                        <label for="types_28" class="check-label">Nature & Adventure</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_27" class="tour_type_class" data-value-params="27"
                                               value="27">
                                        <label for="types_27" class="check-label">Safaris & Wildlife Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_14" class="tour_type_class" data-value-params="14"
                                               value="14">
                                        <label for="types_14" class="check-label">Sightseeing Tours</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_13" class="tour_type_class" data-value-params="13"
                                               value="13">
                                        <label for="types_13" class="check-label">Spa & Relaxation</label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input type="checkbox" name="types[]" id="types_17" class="tour_type_class" data-value-params="17"
                                               value="17">
                                        <label for="types_17" class="check-label">Water Sports</label>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="sidebar_left__block">
                                <dt>Length</dt>
                                <dd>
                                    <div class="c-checkbox">
                                        <input data-value-params="halfDay" type="checkbox" name="length_half_day" id="length_half_day">
                                        <label for="length_half_day" class="check-label">Half Day
                                        </label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input data-value-params="fullDay" type="checkbox" name="length_full_day" id="length_full_day">
                                        <label for="length_full_day" class="check-label">Full Day
                                        </label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input data-value-params="multiDay" type="checkbox" name="length_multi_day" id="length_multi_day">
                                        <label for="length_multi_day" class="check-label">Multi-Day
                                        </label>
                                    </div>
                                </dd>
                            </dl>
                            <dl class="sidebar_left__block">
                                <dt>Price per person</dt>
                                <dd>
                                    <div class="c-checkbox">
                                        <input data-value-params="price_per_person_1" type="checkbox" id="price_per_person_1">
                                        <label for="price_per_person_1" class="check-label">Under €97
                                        </label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input data-value-params="price_per_person_2" type="checkbox" id="price_per_person_2">
                                        <label for="price_per_person_2" class="check-label">
                                            €97 - €145
                                        </label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input data-value-params="price_per_person_3" type="checkbox" id="price_per_person_3">
                                        <label for="price_per_person_3" class="check-label">
                                            €145 - €193
                                        </label>
                                    </div>
                                    <div class="c-checkbox">
                                        <input data-value-params="price_per_person_4" type="checkbox" id="price_per_person_4">
                                        <label for="price_per_person_4" class="check-label">
                                            €193+
                                        </label>
                                    </div>
                                </dd>
                            </dl>
                        </aside>
                        <div class="main_content">
                            <ul class="c-list_tour01" id="desktop_tour_top_tours_section">
                                <li class="c-list_tour01__item">
                                    <a href="https://forevervacation.com/bali-instagram-tour-the-most-famous-spots"
                                       class="c-list_tour01__photo">
                                        <picture>
                                            <source type="image/png" media="(min-width: 769px)"
                                                    srcset="images/menu/bali-instagram-tour-the-most-famous-spots-3509_1.jpg">
                                            <source type="image/png" media="(max-width: 768px)"
                                                    srcset="images/menu/bali-instagram-tour-the-most-famous-spots-3509.jpg">
                                            <img src="images/menu/bali-instagram-tour-the-most-famous-spots-3509.jpg"
                                                 alt="Bali Instagram Tour: The Most Famous Spots                      ">
                                        </picture>
                                        <p class="c-list_tour01__cate">Best seller</p>
                                    </a>
                                    <div class="c-list_tour01__cont">
                                        <div class="c-list_tour01__top">
                                            <a href="https://forevervacation.com/bali-instagram-tour-the-most-famous-spots"
                                               class="c-list_tour01__title">
                                                <h2>Bali Instagram Tour: The Most Famous Spots </h2>
                                            </a>
                                            <div class="c-list_tour01__price pc">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€96/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__gr">
                                            <div class="ruk_rating_snippet" data-sku="5CA5E25F"></div>
                                            <div class="c-list_tour01__price sp person-tour">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€96/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__des">
                                            From famous rice terraces, stunning waterfalls and breathtaking views of Mount Agung, our Bali
                                            Instagram Tour is perfect for travelers who want to experience the best of Bali's beautiful
                                            landscapes, as well as its other natural and cultural offerings. Visit a local coffee plantation,
                                            have fun on a jungle swing and enjoy a delicious lunch - all whilst being transported in a private
                                            car! Voted as our best tour in Bali 3 years in a row, this is must-take tour on your Bali vacation!
                                        </div>
                                        <div class="c-list_tour01__bottom">
                                            <p class="c-list_tour01__inclusive">
                                            <picture class="lazyload">
                                                <source type="image/png" media="(min-width: 769px)" srcset="images/menu/clock-tour.png">
                                                <source type="image/png" media="(max-width: 768px)" srcset="images/menu/clock-tour.png">
                                                <img src="images/menu/clock-tour.png" alt="clock-yellow">
                                            </picture>
                                            13 hours
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/star-tour.png" alt="clock-yellow">All-inclusive
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/client-tour.png" alt="clock-yellow">Private Tour
                                            </p>
                                            <a href="https://forevervacation.com/tours-in-bali/city-tours"
                                               class="c-list_tour01__inclusive link2"><span>City Tours</span>
                                            </a>
                                            <a class="c-list_tour01__btn"
                                               href="https://forevervacation.com/bali-instagram-tour-the-most-famous-spots">
                                                View Tour
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li class="c-list_tour01__item">
                                    <a href="https://forevervacation.com/bali-unesco-world-heritage-sites-tour"
                                       class="c-list_tour01__photo">
                                        <picture>
                                            <source type="image/png" media="(min-width: 769px)" srcset="images/menu/best-of-ubud-tour-2630_1.jpg">
                                            <source type="image/png" media="(max-width: 768px)" srcset="images/menu/best-of-ubud-tour-2630.jpg">
                                            <img src="images/menu/best-of-ubud-tour-2630.jpg" alt="Bali Unesco World Heritage Sites Tour          ">
                                        </picture>
                                    </a>
                                    <div class="c-list_tour01__cont">
                                        <div class="c-list_tour01__top">
                                            <a href="https://forevervacation.com/bali-unesco-world-heritage-sites-tour"
                                               class="c-list_tour01__title">
                                                <h2>Bali Unesco World Heritage Sites Tour </h2>
                                            </a>
                                            <div class="c-list_tour01__price pc">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€86/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__gr">
                                            <div class="ruk_rating_snippet" data-sku="5CA5EA78"></div>
                                            <div class="c-list_tour01__price sp person-tour">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€86/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__des">
                                            This full day Bali tour celebrates the island's culture and World Heritage Sites! Our Bali UNESCO
                                            World Heritage Sites Tour visits five unforgettable locations, with plenty of opportunity to take
                                            some snaps; explore the iconic Handara Gate, enjoy the Wanagiri Hidden Hill, experience the
                                            Jatiluwih Rice Terrace and much more. The all-inclusive day trip is finished with a delicious lunch,
                                            local tour guide and private round trip transportation.
                                        </div>
                                        <div class="c-list_tour01__bottom">
                                            <p class="c-list_tour01__inclusive">
                                            <picture class="lazyload">
                                                <source type="image/png" media="(min-width: 769px)" srcset="images/menu/clock-tour.png">
                                                <source type="image/png" media="(max-width: 768px)" srcset="images/menu/clock-tour.png">
                                                <img src="images/menu/clock-tour.png" alt="clock-yellow">
                                            </picture>
                                            10 hours
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/star-tour.png" alt="clock-yellow">All-inclusive
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/client-tour.png" alt="clock-yellow">Private Tour
                                            </p>
                                            <a href="https://forevervacation.com/tours-in-bali/city-tours"
                                               class="c-list_tour01__inclusive link2"><span>City Tours</span>
                                            </a>
                                            <a class="c-list_tour01__btn"
                                               href="https://forevervacation.com/bali-unesco-world-heritage-sites-tour">
                                                View Tour
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li class="c-list_tour01__item">
                                    <a href="https://forevervacation.com/bali-ultimate-monkey-forest-tour" class="c-list_tour01__photo">
                                        <picture>
                                            <source type="image/png" media="(min-width: 769px)"
                                                    srcset="images/menu/ultimate-monkey-forest-tour-3826_1.jpg">
                                            <source type="image/png" media="(max-width: 768px)"
                                                    srcset="images/menu/ultimate-monkey-forest-tour-3826.jpg">
                                            <img src="images/menu/ultimate-monkey-forest-tour-3826.jpg" alt="Bali Ultimate Monkey Forest Tour">
                                        </picture>
                                    </a>
                                    <div class="c-list_tour01__cont">
                                        <div class="c-list_tour01__top">
                                            <a href="https://forevervacation.com/bali-ultimate-monkey-forest-tour" class="c-list_tour01__title">
                                                <h2>Bali Ultimate Monkey Forest Tour</h2>
                                            </a>
                                            <div class="c-list_tour01__price pc">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€91/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__gr">
                                            <div class="ruk_rating_snippet" data-sku="5CA5EFBC"></div>
                                            <div class="c-list_tour01__price sp person-tour">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€91/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__des">
                                            The Bali Ultimate Monkey Forest Tour is an absolute must! You'll spend the day monkeying around with
                                            these fascinating and playful animals in the heart of Ubud. Monkey Forest is just waiting to create
                                            fun and amazing memories, and something that should be on the to-do list of every visitor. Add in
                                            some Balinese temples and a breathtaking waterfall and this is undoubtedly one of the best tours in
                                            Bali.
                                        </div>
                                        <div class="c-list_tour01__bottom">
                                            <p class="c-list_tour01__inclusive">
                                            <picture class="lazyload">
                                                <source type="image/png" media="(min-width: 769px)" srcset="images/menu/clock-tour.png">
                                                <source type="image/png" media="(max-width: 768px)" srcset="images/menu/clock-tour.png">
                                                <img src="images/menu/clock-tour.png" alt="clock-yellow">
                                            </picture>
                                            10 hours
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/star-tour.png" alt="clock-yellow">All-inclusive
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/client-tour.png" alt="clock-yellow">Private Tour
                                            </p>
                                            <a href="https://forevervacation.com/tours-in-bali/city-tours"
                                               class="c-list_tour01__inclusive link2"><span>City Tours</span>
                                            </a>
                                            <a class="c-list_tour01__btn" href="https://forevervacation.com/bali-ultimate-monkey-forest-tour">
                                                View Tour
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li class="c-list_tour01__item">
                                    <a href="https://forevervacation.com/bali-best-of-ubud-tour" class="c-list_tour01__photo">
                                        <picture>
                                            <source type="image/png" media="(min-width: 769px)" srcset="images/menu/besakih-mother-temple_1.jpg">
                                            <source type="image/png" media="(max-width: 768px)" srcset="images/menu/besakih-mother-temple.jpg">
                                            <img src="images/menu/besakih-mother-temple.jpg" alt="Best of Ubud Tour ">
                                        </picture>
                                    </a>
                                    <div class="c-list_tour01__cont">
                                        <div class="c-list_tour01__top">
                                            <a href="https://forevervacation.com/bali-best-of-ubud-tour" class="c-list_tour01__title">
                                                <h2>Best of Ubud Tour </h2>
                                            </a>
                                            <div class="c-list_tour01__price pc">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€91/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__gr">
                                            <div class="ruk_rating_snippet" data-sku="63B6E37F"></div>
                                            <div class="c-list_tour01__price sp person-tour">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€91/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__des">
                                            No trip to Bali would be complete without a visit to Ubud - to say it's a special place would be an
                                            understatement! Think hippie markets and meditation, tropical jungle and rice fields, throw in
                                            stunning waterfalls and some delicious food and you'll soon think you've stumbled on heaven on
                                            earth. Our Best of Ubud Tour really is the best Bali tour around, giving you the opportunity to see
                                            the best this town has to offer.
                                        </div>
                                        <div class="c-list_tour01__bottom">
                                            <p class="c-list_tour01__inclusive">
                                            <picture class="lazyload">
                                                <source type="image/png" media="(min-width: 769px)" srcset="images/menu/clock-tour.png">
                                                <source type="image/png" media="(max-width: 768px)" srcset="images/menu/clock-tour.png">
                                                <img src="images/menu/clock-tour.png" alt="clock-yellow">
                                            </picture>
                                            10 hours
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/star-tour.png" alt="clock-yellow">All-inclusive
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/client-tour.png" alt="clock-yellow">Private Tour
                                            </p>
                                            <a href="https://forevervacation.com/tours-in-bali/city-tours"
                                               class="c-list_tour01__inclusive link2"><span>City Tours</span>
                                            </a>
                                            <a class="c-list_tour01__btn" href="https://forevervacation.com/bali-best-of-ubud-tour">
                                                View Tour
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li class="c-list_tour01__item">
                                    <a href="https://forevervacation.com/balinese-cooking-class-tanah-lot-temple-visit"
                                       class="c-list_tour01__photo">
                                        <picture>
                                            <source type="image/png" media="(min-width: 769px)"
                                                    srcset="images/menu/balinese-cooking-class-tanah-lot-temple-visit4_1.jpg">
                                            <source type="image/png" media="(max-width: 768px)"
                                                    srcset="images/menu/balinese-cooking-class-tanah-lot-temple-visit4.jpg">
                                            <img src="images/menu/balinese-cooking-class-tanah-lot-temple-visit4.jpg"
                                                 alt="Balinese Cooking Class & Tanah Lot Temple Visit ">
                                        </picture>
                                        <p class="c-list_tour01__cate">Popular</p>
                                    </a>
                                    <div class="c-list_tour01__cont">
                                        <div class="c-list_tour01__top">
                                            <a href="https://forevervacation.com/balinese-cooking-class-tanah-lot-temple-visit"
                                               class="c-list_tour01__title">
                                                <h2>Balinese Cooking Class & Tanah Lot Temple Visit </h2>
                                            </a>
                                            <div class="c-list_tour01__price pc">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€91/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__gr">
                                            <div class="ruk_rating_snippet" data-sku="5D2461B9"></div>
                                            <div class="c-list_tour01__price sp person-tour">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€91/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__des">
                                            Calling all cooking enthusiasts, the Balinese Cooking Class & Tanah Lot Temple Visit is for you.
                                            Spend your day with a local chef being taught how to make some traditional meals. This Bali tour is
                                            a great way to learn about the Balinese culture whilst also learning to cook (and taste!) some
                                            traditional food. You'll even visit a local market to pick your ingredients! End the day with a trip
                                            to the famous Tanah Lot Temple.
                                        </div>
                                        <div class="c-list_tour01__bottom">
                                            <p class="c-list_tour01__inclusive">
                                            <picture class="lazyload">
                                                <source type="image/png" media="(min-width: 769px)" srcset="images/menu/clock-tour.png">
                                                <source type="image/png" media="(max-width: 768px)" srcset="images/menu/clock-tour.png">
                                                <img src="images/menu/clock-tour.png" alt="clock-yellow">
                                            </picture>
                                            8 hours
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/star-tour.png" alt="clock-yellow">All-inclusive
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/client-tour.png" alt="clock-yellow">Private Tour
                                            </p>
                                            <a href="https://forevervacation.com/tours-in-bali/city-tours"
                                               class="c-list_tour01__inclusive link2"><span>City Tours</span>
                                            </a>
                                            <a class="c-list_tour01__btn"
                                               href="https://forevervacation.com/balinese-cooking-class-tanah-lot-temple-visit">
                                                View Tour
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li class="c-list_tour01__item">
                                    <a href="https://forevervacation.com/bali-uluwatu-instagram-tour-unforgettable-beaches"
                                       class="c-list_tour01__photo">
                                        <picture>
                                            <source type="image/png" media="(min-width: 769px)"
                                                    srcset="images/menu/uluwatu-instagram-tour-unforgettable-beaches7_1.jpg">
                                            <source type="image/png" media="(max-width: 768px)"
                                                    srcset="images/menu/uluwatu-instagram-tour-unforgettable-beaches7.jpg">
                                            <img src="images/menu/uluwatu-instagram-tour-unforgettable-beaches7.jpg"
                                                 alt="Uluwatu Instagram Tour: Unforgettable Beaches        ">
                                        </picture>
                                        <p class="c-list_tour01__cate">Popular</p>
                                    </a>
                                    <div class="c-list_tour01__cont">
                                        <div class="c-list_tour01__top">
                                            <a href="https://forevervacation.com/bali-uluwatu-instagram-tour-unforgettable-beaches"
                                               class="c-list_tour01__title">
                                                <h2>Uluwatu Instagram Tour: Unforgettable Beaches </h2>
                                            </a>
                                            <div class="c-list_tour01__price pc">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€91/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__gr">
                                            <div class="ruk_rating_snippet" data-sku="5CA5EC69"></div>
                                            <div class="c-list_tour01__price sp person-tour">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€91/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__des">
                                            Our Uluwatu Instagram Tour will leave you breathless! This popular Bali tour introduces you to some
                                            of the most beautiful beaches on earth - truly an unforgettable experience! The emerald sea and
                                            rugged coastlines set the scene for the day. After a full day enjoying Uluwatu's beaches, a
                                            delicious lunch and your own personal driver, your tour ends with a traditional Kecak Dance. This
                                            Bali tour will create memories that you'll cherish forever.
                                        </div>
                                        <div class="c-list_tour01__bottom">
                                            <p class="c-list_tour01__inclusive">
                                            <picture class="lazyload">
                                                <source type="image/png" media="(min-width: 769px)" srcset="images/menu/clock-tour.png">
                                                <source type="image/png" media="(max-width: 768px)" srcset="images/menu/clock-tour.png">
                                                <img src="images/menu/clock-tour.png" alt="clock-yellow">
                                            </picture>
                                            10 hours
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/star-tour.png" alt="clock-yellow">All-inclusive
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/client-tour.png" alt="clock-yellow">Private Tour
                                            </p>
                                            <a href="https://forevervacation.com/tours-in-bali/city-tours"
                                               class="c-list_tour01__inclusive link2"><span>City Tours</span>
                                            </a>
                                            <a class="c-list_tour01__btn"
                                               href="https://forevervacation.com/bali-uluwatu-instagram-tour-unforgettable-beaches">
                                                View Tour
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li class="c-list_tour01__item">
                                    <a href="https://forevervacation.com/bali-uluwatu-kecak-dance-tour-half-day"
                                       class="c-list_tour01__photo">
                                        <picture>
                                            <source type="image/png" media="(min-width: 769px)"
                                                    srcset="images/menu/uluwatu-kecak-dance-tour-half-day-3165_1.jpeg">
                                            <source type="image/png" media="(max-width: 768px)"
                                                    srcset="images/menu/uluwatu-kecak-dance-tour-half-day-3165.jpeg">
                                            <img src="images/menu/uluwatu-kecak-dance-tour-half-day-3165.jpeg"
                                                 alt="Uluwatu & Kecak Dance Tour (Half Day)   ">
                                        </picture>
                                    </a>
                                    <div class="c-list_tour01__cont">
                                        <div class="c-list_tour01__top">
                                            <a href="https://forevervacation.com/bali-uluwatu-kecak-dance-tour-half-day"
                                               class="c-list_tour01__title">
                                                <h2>Uluwatu & Kecak Dance Tour (Half Day) </h2>
                                            </a>
                                            <div class="c-list_tour01__price pc">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€76/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__gr">
                                            <div class="ruk_rating_snippet" data-sku="5CD9A090"></div>
                                            <div class="c-list_tour01__price sp person-tour">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€76/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__des">
                                            Our Uluwatu & Kecak Dance Tour is quite simply a must for any visit to Bali. Our private tour
                                            introduces you to the local culture and stunning scenery. Head straight to Balangan beach which
                                            surfers seek out from near and far, visit the famous Uluwatu Temple and finish the day enjoying the
                                            traditional Kecak Dance. If time is against you, this half-day Bali tour is the perfect way to see
                                            Uluwatu's best bits.
                                        </div>
                                        <div class="c-list_tour01__bottom">
                                            <p class="c-list_tour01__inclusive">
                                            <picture class="lazyload">
                                                <source type="image/png" media="(min-width: 769px)" srcset="images/menu/clock-tour.png">
                                                <source type="image/png" media="(max-width: 768px)" srcset="images/menu/clock-tour.png">
                                                <img src="images/menu/clock-tour.png" alt="clock-yellow">
                                            </picture>
                                            6 hours
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/star-tour.png" alt="clock-yellow">All-inclusive
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/client-tour.png" alt="clock-yellow">Private Tour
                                            </p>
                                            <a href="https://forevervacation.com/tours-in-bali/city-tours"
                                               class="c-list_tour01__inclusive link2"><span>City Tours</span>
                                            </a>
                                            <a class="c-list_tour01__btn"
                                               href="https://forevervacation.com/bali-uluwatu-kecak-dance-tour-half-day">
                                                View Tour
                                            </a>
                                        </div>
                                    </div>
                                </li>
                                <li class="c-list_tour01__item">
                                    <a href="https://forevervacation.com/bali-private-airport-pick-up-service" class="c-list_tour01__photo">
                                        <picture>
                                            <source type="image/png" media="(min-width: 769px)"
                                                    srcset="images/menu/bali-private-airport-pick-up-service-2376_1.jpg">
                                            <source type="image/png" media="(max-width: 768px)"
                                                    srcset="images/menu/bali-private-airport-pick-up-service-2376.jpg">
                                            <img src="images/menu/bali-private-airport-pick-up-service-2376.jpg"
                                                 alt="Bali Private Airport Pick Up Service ">
                                        </picture>
                                    </a>
                                    <div class="c-list_tour01__cont">
                                        <div class="c-list_tour01__top">
                                            <a href="https://forevervacation.com/bali-private-airport-pick-up-service"
                                               class="c-list_tour01__title">
                                                <h2>Bali Private Airport Pick Up Service </h2>
                                            </a>
                                            <div class="c-list_tour01__price pc">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€16/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__gr">
                                            <div class="ruk_rating_snippet" data-sku="63EB6C1D"></div>
                                            <div class="c-list_tour01__price sp person-tour">
                                                <p class="c-list_tour01__price__from">from</p>
                                                <p class="c-list_tour01__price__new">€16/pp</p>
                                            </div>
                                        </div>
                                        <div class="c-list_tour01__des">
                                            Start your VIP experience as soon as you step off the plane with out Private Bali Airport Pick Up
                                            Service! Enjoy being personally met and greeted by one of our friendly, local tour guides and relax
                                            in one of our private air-conditioned vehicles before being taken to your hotel or villa. This
                                            private Bali airport transfer is smooth and hassle-free, and you don't need to worry about spending
                                            any additional money along the way or having to negotiate the price at the end of your journey!
                                        </div>
                                        <div class="c-list_tour01__bottom">
                                            <p class="c-list_tour01__inclusive">
                                            <picture class="lazyload">
                                                <source type="image/png" media="(min-width: 769px)" srcset="images/menu/clock-tour.png">
                                                <source type="image/png" media="(max-width: 768px)" srcset="images/menu/clock-tour.png">
                                                <img src="images/menu/clock-tour.png" alt="clock-yellow">
                                            </picture>
                                            2 hours
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/star-tour.png" alt="clock-yellow">All-inclusive
                                            </p>
                                            <p class="c-list_tour01__inclusive">
                                                <img src="images/menu/client-tour.png" alt="clock-yellow">Private Tour
                                            </p>
                                            <a href="https://forevervacation.com/tours-in-bali/city-tours"
                                               class="c-list_tour01__inclusive link2"><span>City Tours</span>
                                            </a>
                                            <a class="c-list_tour01__btn"
                                               href="https://forevervacation.com/bali-private-airport-pick-up-service">
                                                View Tour
                                            </a>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            <div class="c-nav_01 swiper">
                                <div class="swiper-wrapper">
                                    <div class="c-nav_01__item swiper-slide">
                                        <figure class="c-nav_01__image">
                                            <img class="ls-is-cached lazyloaded"
                                                 data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/pc/Icon-awesome-tripadvisor.svg"
                                                 alt="tripadvisor" src="images/menu/Icon-awesome-tripadvisor.svg">
                                        </figure>
                                        <h3 class="c-nav_01__tt">Top Rated on TripAdvisor</h3>
                                        <div class="c-nav_01__content">
                                            Don’t just take our word for it. Read thousands of 5 star reviews from our happy guests.
                                        </div>
                                    </div>
                                    <div class="c-nav_01__item swiper-slide">
                                        <figure class="c-nav_01__image">
                                            <img class="custom ls-is-cached lazyloaded"
                                                 data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/pc/Icon-Money.svg"
                                                 alt="Icon-Money" src="images/menu/Icon-Money.svg">
                                        </figure>
                                        <h3 class="c-nav_01__tt">Money Back Guarantee</h3>
                                        <div class="c-nav_01__content">
                                            Didn’t have fun on our tour? We’ll offer you a 100% refund. We’re that confident you will love our
                                            tours.
                                        </div>
                                    </div>
                                    <div class="c-nav_01__item swiper-slide">
                                        <figure class="c-nav_01__image">
                                            <img class="custom ls-is-cached lazyloaded"
                                                 data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/pc/Icon-Support.svg"
                                                 alt="Icon-Support" src="images/menu/Icon-Support.svg">
                                        </figure>
                                        <h3 class="c-nav_01__tt">24/7 Customer Support</h3>
                                        <div class="c-nav_01__content">
                                            Speak directly with the owners anytime. We love all of our guests and are excited to chat with you.
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-pagination"></div>
                            </div>
                            <ul class="c-list_tour01 load-more-tours--container" id="desktop_tour_bottom_tours_section">
                            </ul>
                            <div class="loading-container" style="text-align: center">
                                <img class="loading_spinner" src="images/menu/spinner-yellow-sm.svg" alt="Loading Tours" style="display: none">
                            </div>
                        </div>
                    </div>
                </section>
                <section class="sec_contact_move">
                    <picture class="sec_contact_move__bg lazyload">
                        <source type="image/png" media="(min-width: 768px)" srcset="images/menu/banner.png">
                        <source type="image/png" media="(max-width: 768px)" srcset="images/menu/new-email-banner.webp">
                        <img src="images/menu/banner.png" alt="new-bg-top-v2">
                    </picture>
                    <div class="sec_contact_move__top">
                        <div class="sec_contact_move__bg-map">
                            <img src="images/menu/map.png" alt="map">
                        </div>
                        <div class="c-container">
                            <h3 class="c-title03">
                                Over 20,000+ <br class="sp-only">happy<br class="pc-only">
                                guests have <br>
                                chosen US!
                            </h3>
                            <div class="sec_contact_move__group">
                                <div class="sec_contact_move__group__img">
                                    <img src="images/menu/add-to-cart-big-brush.svg">
                                </div>
                                <p class="c-title01">
                                    Get your <br class="sp-only">Vacation on!
                                </p>

                                <form method="post" action="#" onsubmit="return subscribe(this)">
                                    <div class="sec_contact_move__group__form">
                                        <label class="sec_contact_move__group__text" for="email">Expertly curated emails packed full of
                                            vacation
                                            inspiration, travel tips and more!</label>
                                        <div class="sec_contact_move__group__form__field">
                                            <input type="email" name="subscriber_email" id="subscriber_email" placeholder="Your email"
                                                   class="your_email">
                                            <button type="submit" id="subscriber_btn" class="btn_form">
                                                Count me in!
                                            </button>
                                        </div>
                                        <p id="message_result_footer" class="sec_contact_move__group__text02"></p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="destination__sec03">
                    <div class="destination__sec03__bg-map">
                        <img src="images/menu/map.png" alt="map">
                    </div>
                    <div class="c-container">
                        <div class="tour_in_wrap">
                            <div class="c-info fr-element fr-view">
                                <div class="c_container">
                                    <div class="c-wrap">
                                        <h2 class="title_01">City Tour Information in Bali</h2>
                                        <div class="c-text">Getting excited for your dream vacation to Bali? Well.. we are just as excited as
                                            you are! If you're looking for the best city tours in Bali then you came to the right place!</div>
                                        <div class="c-list" data-toggle-position="destination">
                                            <div class="c-item">
                                                <h3 class="title-bb">5 Things To Know About City Tours In Bali</h3>
                                                <div class="c-content" style="display: none">
                                                    <p dir="ltr">1. The easiest and cheapest way to get around is by taxi/scooter. Download Grab
                                                        or GoJek for super cheap fares!�</p>
                                                    <p dir="ltr"><img src="images/menu/1594382411.jpg" style="width: 400px;" class="fr-fic fr-dib"
                                                                      alt="bali taxis"></p>
                                                    <p dir="ltr"><br></p>
                                                    <p dir="ltr">2. With our tours you get your own personal driver and tour guide included in the
                                                        price!�</p>
                                                    <p dir="ltr"><img src="images/menu/1594382471.jpg" style="width: 400px;" class="fr-fic fr-dib"
                                                                      alt="forevervacation tour guide"></p>
                                                    <p dir="ltr"><br></p>
                                                    <p dir="ltr">3. Denpasar is the capital city and the largest in Bali</p>
                                                    <p dir="ltr"><img src="images/menu/1594382536.jpg" style="width: 400px;" class="fr-fic fr-dib"
                                                                      alt="denpasar bali"></p>
                                                    <p dir="ltr"><br></p>
                                                    <p dir="ltr">4. Ubud is the place to go for lush green rice fields and waterfalls</p>
                                                    <p dir="ltr"><img src="images/menu/1594382597.jpg" style="width: 400px;" class="fr-fic fr-dib"
                                                                      alt="ubud bali"></p>
                                                    <p dir="ltr"><br></p>
                                                    <p dir="ltr">5. Kuta/Seminyak are the busiest beach cities�</p>
                                                    <p dir="ltr"><img src="images/menu/1594382650.jpg" style="width: 400px;" class="fr-fic fr-dib"
                                                                      alt="seminyak bali"></p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>


            <footer class="c-footer lazyload ">
                <div class="c-footer__top">
                    <picture class="c-footer__top__bg lazyload">
                        <source type="image/png" media="(min-width: 768px)" srcset="images/menu/Footer-Image.png">
                        <source type="image/png" media="(max-width: 768px)" srcset="images/menu/footer-bg-mobile.webp">
                        <img src="images/menu/Footer-Image.png" alt="new-bg-top-v2">
                    </picture>
                    <div class="c-footer__logo">
                        <a href=""><img class="lazyload"
                                        data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/pc/Logo-footer.svg"
                                        src="images/menu/Logo-footer.svg" alt="Logo-footer"></a>
                    </div>
                    <ul class="c-footer__nav">
                        <li>
                            <p class="c-footer__nav__title">Our Promise</p>
                            <p class="c-footer__nav__text">
                                With ForeverVacation, you will be treated like family. Your
                                safety and enjoyment is our primary mission. We are excited to
                                meet you!
                            </p>
                            <p class="c-footer__nav__img01">
                                <img class="lazyload"
                                     data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/top/award2.webp?tr=w-108,h-108"
                                     alt="img03">
                                <img class="lazyload"
                                     data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/top/award3.webp?tr=w-108,h-108"
                                     alt="img01">
                                <img class="lazyload"
                                     data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/top/award5.webp?tr=w-108,h-108"
                                     alt="img02">
                                <img class="lazyload"
                                     data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/top/award6.webp?tr=w-108,h-108"
                                     alt="img02">
                            </p>
                        </li>
                        <li>
                            <p class="c-footer__nav__title">Payment methods</p>
                            <p class="c-footer__nav__text">
                                At ForeverVacation we take your online security seriously. All
                                of the payments processed are secure and encrypted. You can pay
                                using any of these payment methods:
                            </p>
                            <ol class="c-footer__nav__payment_methods">
                                <li><img class="lazyload" data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/visa.svg"
                                         alt="visa"></li>
                                <li><img class="lazyload"
                                         data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/mastercard.svg"
                                         alt="mastercard"></li>
                                <li><img class="lazyload"
                                         data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/paypal.svg" alt="paypal"></li>
                                <li><img class="lazyload" data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/gpay.svg"
                                         alt="gpay"></li>
                                <li><img class="lazyload" data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/amex.svg"
                                         alt="amex"></li>
                                <li><img class="lazyload"
                                         data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/discover.svg" alt="discover">
                                </li>
                            </ol>
                        </li>
                        <li>
                            <p class="c-footer__nav__title">Contact info</p>
                            <p class="c-footer__nav__text">
                                Our address: Seminyak, Bali, Indonesia <br>

                                Phone:
                                <a style="color: #c0c0c0" href="https://wa.me/16174042125" target="_blank">+1 617 404 2125</a>
                                (WhatsApp)

                                <br>
                                Email: team@forevervacation.com
                                <br>
                                <a href="https://forevervacation.com/branches/bali" style="color:white; text-decoration: underline">Bali
                                    local branch</a>
                            </p>

                            <ol class="c-footer__nav__social">
                                <li><a target="_blank" href="https://www.instagram.com/forevervacationtravel"><img class="lazyload"
                                                                                                                   data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/instagram.svg"
                                                                                                                   alt="instagram"></a></li>
                                <li><a target="_blank" href="https://www.facebook.com/forevervacation"><img class="lazyload"
                                                                                                            data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/facebook.svg"
                                                                                                            alt="facebook"></a></li>
                                <li><a target="_blank" href="https://www.pinterest.com/forevervacationbali"><img class="lazyload"
                                                                                                                 data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/pinterest.svg"
                                                                                                                 alt="pinterest"></a></li>
                                <li><a target="_blank" href="https://www.youtube.com/c/ForevervacationNation"><img class="lazyload"
                                                                                                                   data-src="https://cdn.forevervacation.com/layout_v_3/assets/img/common/youtube.svg"
                                                                                                                   alt="youtube"></a></li>
                            </ol>
                        </li>
                    </ul>
                    <div class="c-footer__center">
                        <ul class="c-footer__links">
                            <li><a target="_blank" href="https://forevervacation.com/money-back-guarantee">Money back guarantee</a></li>
                            <li><a target="_blank" href="https://forevervacation.com/terms-and-conditions">Terms & conditions</a></li>
                            <li><a target="_blank" href="https://forevervacation.com/terms-of-use">Terms of use</a></li>
                            <li><a target="_blank" href="https://forevervacation.com/we-love-influencers">We ❤️ Influencers</a></li>
                            <li><a href="https://forevervacation.com/travel-agency">Travel Agents</a></li>
                            <li><a target="_blank" href="https://forevervacation.com/the-vacationer">Blog</a></li>
                            <li><a target="_blank"
                                   href="https://forevervacation.tapfiliate.com/publisher/signup/forevervacation-affiliate-program/">Become
                                    an Affiliate</a></li>
                            <li><a target="_blank" href="https://forevervacation.com/responsible-travel">Responsible Travel</a></li>
                            <li></li>
                            <li></li>
                        </ul>
                    </div>
                </div>
                <div class="c-footer__bottom">
                    <div class="c-footer__bottom__inner">
                        <div class="c-footer__bottom__gr">

                            <dl class="c-footer__bottom__country">
                                <dt>
                                    <a href="https://forevervacation.com/tours-in-indonesia">Indonesia</a>
                                </dt>
                                <dd>
                                    <a href="https://forevervacation.com/tours-in-bali">Tours in Bali</a>
                                    <a href="https://forevervacation.com/tours-in-nusa-penida">Tours in Nusa Penida</a>
                                    <a href="https://forevervacation.com/tours-in-ubud">Tours in Ubud</a>

                                </dd>
                            </dl>

                            <dl class="c-footer__bottom__country">
                                <dt>
                                    <a href="https://forevervacation.com/tours-in-thailand">Thailand</a>
                                </dt>
                                <dd>
                                    <a href="https://forevervacation.com/tours-in-bangkok">Tours in Bangkok</a>
                                    <a href="https://forevervacation.com/tours-in-phuket">Tours in Phuket</a>
                                    <a href="https://forevervacation.com/tours-in-chiang-mai">Tours in Chiang Mai</a>
                                    <a href="https://forevervacation.com/tours-in-krabi">Tours in Krabi</a>
                                    <a href="https://forevervacation.com/tours-in-koh-samui">Tours in Koh Samui</a>

                                </dd>
                            </dl>

                            <dl class="c-footer__bottom__country">
                                <dt>
                                    <a href="https://forevervacation.com/tours-in-malaysia">Malaysia</a>
                                </dt>
                                <dd>
                                    <a href="https://forevervacation.com/tours-in-kuala-lumpur">Tours in Kuala Lumpur</a>

                                </dd>
                            </dl>

                            <dl class="c-footer__bottom__country">
                                <dt>
                                    <a href="https://forevervacation.com/private-tours-in-vietnam">Vietnam</a>
                                </dt>
                                <dd>
                                    <a href="https://forevervacation.com/tours-in-ho-chi-minh-city">Tours in Ho Chi Minh City</a>
                                    <a href="https://forevervacation.com/tours-in-da-nang">Tours in Da Nang</a>
                                    <a href="https://forevervacation.com/tours-in-hanoi">Tours in Hanoi</a>
                                    <a href="https://forevervacation.com/tours-in-quy-nhon">Tours in Quy Nhon</a>

                                </dd>
                            </dl>

                            <dl class="c-footer__bottom__country">
                                <dt>
                                    <a href="https://forevervacation.com/tours-in-singapore">Singapore</a>
                                </dt>
                                <dd>
                                    <a href="https://forevervacation.com/tours-in-singapore">Tours in Singapore</a>

                                </dd>
                            </dl>

                            <dl class="c-footer__bottom__country">
                                <dt>
                                    <a href="https://forevervacation.com/tours-in-usa">United States</a>
                                </dt>
                                <dd>
                                    <a href="https://forevervacation.com/tours-in-chicago">Tours in Chicago</a>
                                    <a href="https://forevervacation.com/tours-in-boston">Tours in Boston</a>
                                    <a href="https://forevervacation.com/tours-in-san-francisco">Tours in San Francisco</a>

                                </dd>
                            </dl>

                            <dl class="c-footer__bottom__country">
                                <dt>
                                    <a href="https://forevervacation.com/tours-in-sri-lanka">Sri Lanka</a>
                                </dt>
                                <dd>
                                    <a href="https://forevervacation.com/tours-in-kandy">Tours in Kandy</a>
                                    <a href="https://forevervacation.com/tours-in-galle">Tours in Galle</a>

                                </dd>
                            </dl>

                            <dl class="c-footer__bottom__country">
                                <dt>
                                    <a href="https://forevervacation.com/tours-in-turkey">Turkey</a>
                                </dt>
                                <dd>
                                    <a href="https://forevervacation.com/tours-in-istanbul">Tours in Istanbul</a>

                                </dd>
                            </dl>

                            <dl class="c-footer__bottom__country">
                                <dt>
                                    <a href="https://forevervacation.com/tours-in-mexico">Mexico</a>
                                </dt>
                                <dd>
                                    <a href="https://forevervacation.com/tours-in-mexico-city">Tours in Mexico City</a>
                                    <a href="https://forevervacation.com/tours-in-los-cabos">Tours in Los Cabos</a>
                                    <a href="https://forevervacation.com/tours-in-playa-del-carmen">Tours in Playa del Carmen</a>
                                    <a href="https://forevervacation.com/tours-in-cozumel">Tours in Cozumel</a>

                                </dd>
                            </dl>


                            <dl class="c-footer__bottom__country">
                                <dt>
                                    <a href="https://forevervacation.com/tours-in-philippines">Philippines</a>
                                </dt>
                                <dd>
                                    <a href="https://forevervacation.com/tours-in-el-nido">Tours in El Nido</a>

                                </dd>
                            </dl>
                        </div>
                        <p class="c-footer__bottom__text" data-end-add-cart="">
                            Copyright 2018-2025<br class="sp-only">
                            ForeverVacation.com All Right Reserved
                        </p>
                    </div>
                </div>


            </footer>
        </div>
    </body>
</html>
