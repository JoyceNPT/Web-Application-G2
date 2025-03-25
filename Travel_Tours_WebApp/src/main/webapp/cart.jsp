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
    if (userId < 1) {
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
        <link rel="stylesheet" href="./css/cart.css"/>
        <style>
            .cart-container {
                max-width: 1200px;
                margin: 50px auto;
            }
            .cart-table {
                width: 100%;
                border-collapse: collapse;
            }
            .cart-table th, .cart-table td {
                padding: 15px;
                border: 1px solid #ddd;
                text-align: left;
            }
            .cart-table th {
                background-color: #f8f9fa;
            }
            .btn-pay {
                background-color: #28a745;
                color: white;
            }
            .btn-cancel {
                background-color: #dc3545;
                color: white;
            }
            .cart-container {
                max-width: 1200px;
                margin: 50px auto;
                font-size: 20px;
            }
        </style>
    </head>
    <body>

        <div class="cart-container">
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Tên chuyến đi</th>
                        <th>Số người</th>
                        <th>Tổng số tiền</th>
                        <th>Thời gian</th>
                        <th>Action</th>
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
                        <td><%= b.getDate()%></td>
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
