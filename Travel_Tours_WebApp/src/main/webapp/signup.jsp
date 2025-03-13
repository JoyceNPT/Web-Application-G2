<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String fullname = request.getParameter("fullname");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    String fullnameError = null;
    String phoneError = null;
    String signupError = null;
    boolean hasError = false;
    boolean isSuccess = false;

    UserDAO udao = new UserDAO();

    if (request.getMethod().equalsIgnoreCase("POST")) {
        if (fullname == null || !fullname.matches("^[a-zA-Z]+(\\s[a-zA-Z]+)*$")) {
            fullnameError = "Full Name can only contain letters and spaces.";
            hasError = true;
        }

        if (phone == null || phone.length() < 10 || !phone.matches("^0[1-9](?=.*[1-9].*[1-9].*[1-9])[0-9]{8}$")) {
            phoneError = "Phone must be at least 10 digits and contain only numbers.";
            hasError = true;
        }

        if (!hasError) {
            int create = udao.insertUser(fullname, email, phone, username, password);

            if (create > 0) {
                session.setAttribute("signupSuccess", "Sign Up Successful!");
                response.sendRedirect("redirect.jsp");
            } else {
                session.setAttribute("signupError", "Sign Up Failed. Please try again!");
                response.sendRedirect("redirect.jsp");
            }
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Travel Web Application | Sign Up</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/stylesignup.css">
        <link rel="icon" type="image/png" href="images/favicon_io/favicon.ico">
    </head>
    <body>
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="login-container">
                <h2 class="login-title text-center">Sign Up for your Account</h2>

                <form method="POST">
                    <div class="mb-3">
                        <label for="fullname" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter your full name" required>
                        <% if (fullnameError != null) {%>
                        <div class="text-danger"><%= fullnameError%></div>
                        <% } %>
                    </div>

                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Enter your username" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                    </div>

                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" required>
                        <% if (phoneError != null) {%>
                        <div class="text-danger"><%= phoneError%></div>
                        <% }%>
                    </div>

                    <button type="submit" class="btn btn-warning w-100 text-black">Sign Up</button>

                    <p class="text-center mt-3">
                        Already have an account? <a href="login.jsp" class="sign-up">Log in</a>
                    </p>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
