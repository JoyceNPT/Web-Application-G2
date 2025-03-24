<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    String firstNameError = null;
    String lastNameError = null;
    String phoneError = null;
    String signupError = null;
    boolean hasError = false;
    boolean isSuccess = false;

    UserDAO udao = new UserDAO();
    
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String nameRegex = "^[\\p{Lu}][\\p{Ll}]*$";
        
        if (firstName == null || !firstName.matches(nameRegex)) {
            firstNameError = "First Name must start with a capital letter and contain only letters.";
            hasError = true;
        }

        if (lastName == null || !firstName.matches(nameRegex)) {
            lastNameError = "Last Name must start with a capital letter and contain only letters.";
            hasError = true;
        }

        if (phone == null || phone.length() < 10 || !phone.matches("^0[1-9](?=.*[1-9].*[1-9].*[1-9])[0-9]{8}$")) {
            phoneError = "Phone must be at least 10 digits and contain only numbers.";
            hasError = true;
        }

        if (!hasError) {
            String fullname = firstName + " " + lastName;
            
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
                    <div class="row mb-3">
                        <div class="col">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter first name" required>
                            <% if (firstNameError != null) { %>
                            <div class="text-danger"><%= firstNameError %></div>
                            <% } %>
                        </div>

                        <div class="col">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter last name" required>
                            <% if (lastNameError != null) { %>
                            <div class="text-danger"><%= lastNameError %></div>
                            <% } %>
                        </div>
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
