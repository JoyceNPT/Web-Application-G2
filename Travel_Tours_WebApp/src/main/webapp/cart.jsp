<%@page import="java.util.List"%>
<%@page import="model.Tour"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Object[]> cart = (List<Object[]>) session.getAttribute("cart");
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String action = request.getParameter("action");
        String indexStr = request.getParameter("index");
        if (action != null && indexStr != null) {
            try {
                int index = Integer.parseInt(indexStr);
                if ("pay".equals(action)) {
                    cart.get(index)[6] = true; // Đánh dấu đã thanh toán
                    session.setAttribute("cart", cart);
                    response.sendRedirect("booking.jsp"); // Chuyển sang booking.jsp
                } else if ("cancel".equals(action)) {
                    cart.remove(index); // Xóa tour khỏi giỏ hàng
                    session.setAttribute("cart", cart);
                    response.sendRedirect("cart.jsp"); // Tải lại trang giỏ hàng
                }
            } catch (Exception e) {
                out.println("<script>alert('Hành động không hợp lệ!');</script>");
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/tourdetail.css">
    <style>
        .cart-container { max-width: 1200px; margin: 50px auto; }
        .cart-table { width: 100%; border-collapse: collapse; }
        .cart-table th, .cart-table td { padding: 15px; border: 1px solid #ddd; text-align: left; }
        .cart-table th { background-color: #f8f9fa; }
        .btn-pay { background-color: #28a745; color: white; }
        .btn-cancel { background-color: #dc3545; color: white; }
        .c-header__cart {
            display: inline-flex !important;
            align-items: center;
            color: white;
            text-decoration: none;
        }
        .c-header__cart svg {
            margin-right: 5px;
        }
        .cart-count {
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 2px 6px;
            margin-left: 5px;
            display: inline-block !important;
            font-size: 12px;
            line-height: 1;
        }
        /* Thêm: Định dạng cho nút Back to Home */
        .back-to-home {
            display: inline-block;
            margin: 20px 0;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-to-home:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<header class="c-header type_breadcrumb" id="header">
    <div class="c-header__left">
        <div class="c-header__logo">
            <a><img class="pc-only" src="images/home/1.png" alt="logo" loading="lazy"></a>
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
                        <a href="interface.jsp">HOME</a>
                    </div>
                </div>
                <ul class="navigation__menumain">
                    <li class="navigation__menumain__item">
                        <a class="navigation__menumain__item__destinations" data-btn-drop-down=""><span class="pc-only">Our</span>
                            Destinations
                            <img src="images/home/arrow-right.svg" alt="arrow-right" loading="lazy">
                        </a>
                    </li>
                    <li class="navigation__menumain__item">
                        <a>Why We’re Different</a>
                    </li>
                    <li class="navigation__menumain__item">
                        <a class="">About Us</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="c-header__group">
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
                    <div class="c-header__dropdown">
                        <a href="login.jsp" class="c-header__dropdown-item">Login</a>
                        <a href="signup.jsp" class="c-header__dropdown-item">Sign Up</a>
                    </div>
                </div>
            </div>
            <% 
                int cartSize = (cart != null && !cart.isEmpty()) ? cart.size() : 0;
            %>
            <div class="c-header__cart" style="display: inline-flex; align-items: center; margin-left: 20px; color: white; text-decoration: none;">
                <a href="cart.jsp" style="display: inline-flex; align-items: center; color: white; text-decoration: none;">
                    <svg width="26" height="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" style="margin-right: 5px;">
                        <path d="M3 3H5L5.4 5M7 13H17L21 5H5.4M7 13L5.4 5M7 13L4.707 15.293C4.077 15.923 4.523 17 5.414 17H17M17 17C16.469 17 16 17.469 16 18C16 18.531 16.469 19 17 19C17.531 19 18 18.531 18 18C18 17.469 17.531 17 17 17ZM5.414 17C4.883 17 4.414 17.469 4.414 18C4.414 18.531 4.883 19 5.414 19C5.945 19 6.414 18.531 6.414 18C6.414 17.469 5.945 17 5.414 17Z" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    <span class="cart-count" style="background-color: red; color: white; border-radius: 50%; padding: 2px 6px; margin-left: 5px; display: inline-block;"><%= cartSize %></span>
                </a>
            </div>
        </div>
    </div>
</header>

<div class="c-container" style="padding-top: 75px">
    <!-- Thêm: Thanh breadcrumb giống tourdetail.jsp -->
    <ul class="breadcumbs" style="display: flex; padding-left: 10%; padding-top: 10px; font-weight: 500;">
        <li><a href="interface.jsp" style="text-decoration: none; font-size: 18rem; color: #989898;">Tours in Viet Nam</a></li>
        <li style="font-size: 18rem; color: #989898; margin: 0 5px; list-style: none;">></li>
        <li style="color: #989898; font-size: 18rem; line-height: 18rem; display: inline; margin-top: 3px; text-decoration: underline">
            <span>Your Cart</span>
        </li>
    </ul>

    <div class="cart-container">
        <h1>Your Cart</h1>
        <!-- Thêm: Nút Back to Home -->
        <a href="interface.jsp" class="back-to-home">Back to Home</a>
        <% if (cart == null || cart.isEmpty()) { %>
        <p>Your cart is empty. <a href="interface.jsp">Browse tours</a></p>
        <% } else { %>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>Tour Name</th>
                    <th>Adults</th>
                    <th>Children</th>
                    <th>Total Price</th>
                    <th>Date</th>
                    <th>Start Time</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (int i = 0; i < cart.size(); i++) {
                    Object[] item = cart.get(i);
                    Tour tour = (Tour) item[0];
                    int adultCount = (int) item[1];
                    int childCount = (int) item[2];
                    double totalPrice = (double) item[3];
                    String date = (String) item[4];
                    String startTime = (String) item[5];
                    boolean paid = (boolean) item[6];
                %>
                <tr>
                    <td><%= tour.getName() %></td>
                    <td><%= adultCount %></td>
                    <td><%= childCount %></td>
                    <td><%= String.format("%,.0f", totalPrice) %> VND</td>
                    <td><%= date %></td>
                    <td><%= startTime %></td>
                    <td><%= paid ? "Paid" : "Unpaid" %></td>
                    <td>
                        <% if (!paid) { %>
                        <form method="post" style="display:inline;">
                            <input type="hidden" name="action" value="pay">
                            <input type="hidden" name="index" value="<%= i %>">
                            <button type="submit" class="btn btn-pay">Pay</button>
                        </form>
                        <% } else { %>
                        <form method="post" style="display:inline;">
                            <input type="hidden" name="action" value="cancel">
                            <input type="hidden" name="index" value="<%= i %>">
                            <button type="submit" class="btn btn-cancel">Cancel</button>
                        </form>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
    </div>
</div>
</body>
</html>