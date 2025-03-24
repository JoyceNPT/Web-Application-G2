<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String loginError = null;
    String loginSuccess = null;

    if (request.getMethod().equalsIgnoreCase("POST")) {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        String remember = request.getParameter("remember");

        UserDAO udao = new UserDAO();
        User acc = udao.verify(user, pass);

        if (acc.getId() != -1) {
            session.setAttribute("account", acc); // Follow account
            session.setAttribute("loginSuccess", "Chào Mừng Bạn Trở Lại!");
            
            if (remember != null) { // If you have check remember, create a cookie password.
                Cookie usernameCookie = new Cookie("COOKIE_USERNAME", acc.getUsername());
                usernameCookie.setMaxAge(60 * 60 * 24); // 1 day
                response.addCookie(usernameCookie);
            
                Cookie passwordCookie = new Cookie("COOKIE_PASSWORD", pass);
                passwordCookie.setMaxAge(60 * 60 * 24); // 1 day
                response.addCookie(passwordCookie);
            } else { // If you don't check remember then delete cookie password
                Cookie passwordCookie = new Cookie("COOKIE_PASSWORD", "");
                passwordCookie.setMaxAge(0); // Delete immediately
                response.addCookie(passwordCookie);
            }

            response.sendRedirect("redirect.jsp"); // Redirect to intermediate page
        } else {
            session.setAttribute("loginError", "Đã xảy ra sai xót rồi!");
            response.sendRedirect("redirect.jsp"); // Redirect to intermediate page
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Đăng Nhập</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <link rel="stylesheet" href="./css/stylelogin.css">
        <link rel="icon" type="image/png" href="images/favicon_io/favicon.ico">
    </head>
    <body>

        <%
            // Retrieve information if user has memory
            String usernameCookieSaved = "";
            String passwordCookieSaved = "";

            Cookie[] cookieListFromBrowser = request.getCookies();
            if (cookieListFromBrowser != null) {
                for (Cookie cookie : cookieListFromBrowser) {
                    if (cookie.getName().equalsIgnoreCase("COOKIE_USERNAME")) {
                        usernameCookieSaved = cookie.getValue();
                    }
                    if (cookie.getName().equalsIgnoreCase("COOKIE_PASSWORD")) {
                        passwordCookieSaved = cookie.getValue();
                    }
                }
            }
        %>

        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="login-container">
                <h2 class="login-title text-center">Đăng Nhập Vào Tài Khoản</h2>

                <form method="POST">
                    <div class="mb-3">
                        <label for="username" class="form-label">Tên đăng nhập</label>
                        <input type="text" class="form-control" id="username" name="username" value="<%= usernameCookieSaved%>" placeholder="Vui lòng nhập tên đăng nhập" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="password" name="password" value="<%= (passwordCookieSaved.isEmpty() ? "" : passwordCookieSaved)%>" placeholder="Vui lòng nhập mật khẩu" required>
                    </div>

                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="remember" name="remember"
                               <%= passwordCookieSaved.isEmpty() ? "" : "checked"%> >
                        <label class="form-check-label" for="remember">Ghi nhớ?</label>
                    </div>

                    <button type="submit" class="btn btn-login">Đăng Nhập</button>

                    <p class="text-center mt-3">
                        Bạn chưa có tài khoản? <a href="signup.jsp" class="sign-up">Đăng Ký</a>
                    </p>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
