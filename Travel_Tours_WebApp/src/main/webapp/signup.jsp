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
//        String nameRegex = "^[\\p{Lu}][\\p{Ll}]*$"; // Regular expressions support all letters in Unicode
//
//        if (firstName == null || !firstName.matches(nameRegex)) {
//            firstNameError = "Tên phải bắt đầu bằng chữ in hoa và chỉ chứa các chữ cái.";
//            hasError = true;
//        }
//
//        if (lastName == null || !firstName.matches(nameRegex)) {
//            lastNameError = "Họ phải bắt đầu bằng chữ in hoa và chỉ chứa các chữ cái.";
//            hasError = true;
//        }
//
//        if (phone == null || phone.length() < 10 || !phone.matches("^0[1-9](?=.*[1-9].*[1-9].*[1-9])[0-9]{8}$")) {
//            phoneError = "Số điện thoại phải có ít nhất 10 chữ số và chỉ chứa số.";
//            hasError = true;
//        }
//
//        if (!hasError) {
        String fullname = firstName + " " + lastName;

        int create = udao.insertUser(fullname, email, phone, username, password);

        if (create > 0) {
            session.setAttribute("signupSuccess", "Chào Mừng Thành Viên Mới");
            response.sendRedirect("redirect.jsp");
        } else {
            session.setAttribute("signupError", "Đã Trùng Hoặc Sai Thông Tin");
            response.sendRedirect("redirect.jsp");
        }
//        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Đăng Ký</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./css/stylesignup.css">
        <link rel="icon" type="image/png" href="images/favicon_io/favicon.ico">
    </head>
    <body>
        <div class="container d-flex justify-content-center align-items-center vh-100">
            <div class="login-container">
                <h2 class="login-title text-center">Đăng Ký Tài Khoản</h2>

                <form method="POST">
                    <div class="row mb-3">
                        <div class="col">
                            <label for="firstName" class="form-label">Tên thật</label>
                            <input type="text" class="form-control" id="firstName" name="firstName"
                                   placeholder="Vui lòng nhập tên thật" required 
                                   pattern="^[\p{Lu}][\p{Ll}]*$"
                                   title="Tên phải bắt đầu bằng chữ in hoa và chỉ chứa chữ cái."
                                   oninvalid="this.setCustomValidity('Tên phải bắt đầu bằng chữ in hoa và chỉ chứa chữ cái.')"
                                   oninput="this.setCustomValidity('')">
                        </div>

                        <div class="col">
                            <label for="lastName" class="form-label">Họ thật</label>
                            <input type="text" class="form-control" id="lastName" name="lastName"
                                   placeholder="Vui lòng nhập họ thật" required 
                                   pattern="^[\p{Lu}][\p{Ll}]*$"
                                   title="Họ phải bắt đầu bằng chữ in hoa và chỉ chứa các chữ cái."
                                   oninvalid="this.setCustomValidity('Họ phải bắt đầu bằng chữ in hoa và chỉ chứa các chữ cái.')"
                                   oninput="this.setCustomValidity('')">
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="username" class="form-label">Tên đăng nhập</label>
                        <input type="text" class="form-control" id="username" name="username" placeholder="Vui lòng nhập tên đăng nhập" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Mật khẩu</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Vui lòng nhập mật khẩu" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Hộp thư điện tử (@gmail.com)</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Vui lòng nhập hộp thư điện tử" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Số điện thoại (+84)</label>
                        <input type="text" class="form-control" name="phone" placeholder="Vui lòng nhập số điện thoại" required" 
                               required pattern="^0[1-9](?=.*[1-9].*[1-9].*[1-9])[0-9]{8}$"
                               title="Số điện thoại phải có ít nhất 10 chữ số và chỉ chứa số."
                               oninvalid="this.setCustomValidity('Số điện thoại phải có ít nhất 10 chữ số và chỉ chứa số.')"
                               oninput="this.setCustomValidity('')">
                    </div>

                    <button type="submit" class="btn btn-warning w-100 text-black">Đăng Ký</button>

                    <p class="text-center mt-3">
                        Bạn đã có tài khoản? <a href="login.jsp" class="sign-up">Đăng Nhập</a>
                    </p>
                </form>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
