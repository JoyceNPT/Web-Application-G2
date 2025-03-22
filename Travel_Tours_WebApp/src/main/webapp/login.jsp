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
            session.setAttribute("loginSuccess", "Login Successful!");
            
            if (remember != null) { // Nếu có check remember thì tạo thêm cookie password
                Cookie usernameCookie = new Cookie("COOKIE_USERNAME", acc.getUsername());
                usernameCookie.setMaxAge(60 * 60 * 24); // 1 ngày
                response.addCookie(usernameCookie);
            
                Cookie passwordCookie = new Cookie("COOKIE_PASSWORD", pass);
                passwordCookie.setMaxAge(60 * 60 * 24); // 1 ngày
                response.addCookie(passwordCookie);
            } else { // Nếu không check remember thì xóa cookie password
                Cookie usernameCookie = new Cookie("COOKIE_USERNAME", "");
                usernameCookie.setMaxAge(0); // 1 ngày
                response.addCookie(usernameCookie);
            
                Cookie passwordCookie = new Cookie("COOKIE_PASSWORD", "");
                passwordCookie.setMaxAge(0); // Xóa ngay lập tức
                response.addCookie(passwordCookie);
            }

            response.sendRedirect("redirect.jsp"); // Chuyển hướng sang trang trung gian
        } else {
            session.setAttribute("loginError", "Invalid username or password!");
            response.sendRedirect("redirect.jsp"); // Chuyển hướng sang trang trung gian
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travel Web Application | Login</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <link rel="stylesheet" href="./css/stylelogin.css">
        <link rel="icon" type="image/png" href="images/favicon_io/favicon.ico">
    </head>
    <body>

        <%
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
                <h2 class="login-title text-center">Log in to your Account</h2>

                <form method="POST">
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" value="<%= usernameCookieSaved%>" placeholder="Enter your username" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" value="<%= (passwordCookieSaved.isEmpty() ? "" : passwordCookieSaved)%>" placeholder="Enter your password" required>
                    </div>

                    <div class="mb-3 form-check">
                        <input type="checkbox" class="form-check-input" id="remember" name="remember"
                               <%= passwordCookieSaved.isEmpty() ? "" : "checked"%> >
                        <label class="form-check-label" for="remember">Remember</label>
                    </div>

                    <button type="submit" class="btn btn-login">Log in</button>

                    <p class="text-center mt-3">
                        Don’t have an account? <a href="signup.jsp" class="sign-up">Sign up</a>
                    </p>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
