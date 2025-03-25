<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Redirecting...</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="icon" type="image/png" href="images/favicon_io/favicon.ico">
        <link rel="stylesheet" href="./css/stylelogin.css">


        <style>
            body {
                background: url('https://img2.thuthuat123.com/uploads/2020/03/17/anh-hoang-hon-vinh-ha-long_115608289.jpg') no-repeat center center fixed;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <script>
            <% if (session.getAttribute("loginSuccess") != null) {%>
            Swal.fire({
                icon: 'success',
                title: '<%= session.getAttribute("loginSuccess")%>',
                text: 'Bạn đã đăng nhập thành công vào website chúng tôi!',
                confirmButtonText: 'Đi thôi!!!',
                allowOutsideClick: false,
                customClass: {
                    confirmButton: "btn btn-login"
                }
            }).then(() => {
                <% 
                    User loggedInUser = (User)session.getAttribute("login");
                    if (loggedInUser != null && loggedInUser.getRole() == 1) { 
                %>
                    window.location.href = 'admin-interface.jsp';
                <% } else { %>
                    window.location.href = 'interface.jsp';
                <% } %>
            });
            <% session.removeAttribute("loginSuccess"); %>
            <% } %>

            <% if (session.getAttribute("loginError") != null) {%>
            Swal.fire({
                icon: 'error',
                title: '<%= session.getAttribute("loginError")%>',
                text: 'Có lẽ là sai ở tên đăng nhập hoặc mật khẩu rồi!',
                confirmButtonText: 'Trờ về thôi!',
                allowOutsideClick: false,
                customClass: {
                    confirmButton: "btn btn-login"
                }
            }).then(() => {
                window.location.href = 'login.jsp';
            });
            <% session.removeAttribute("loginError"); %>
            <% } %>

            <% if (session.getAttribute("signupSuccess") != null) {%>
            Swal.fire({
                icon: 'success',
                title: '<%= session.getAttribute("signupSuccess")%>',
                text: 'Bạn đã tạo tài khoản thành công!',
                confirmButtonText: 'Tuyệt cà là vời',
                allowOutsideClick: false,
                customClass: {
                    confirmButton: "btn btn-login"
                }
            }).then(() => {
                window.location.href = 'login.jsp';
            });
            <% session.removeAttribute("signupSuccess"); %>
            <% } %>

            <% if (session.getAttribute("signupError") != null) {%>
            Swal.fire({
                icon: 'error',
                title: '<%= session.getAttribute("signupError")%>',
                text: 'Bạn chắc chắn tất cả thông tin là đúng chứ?',
                confirmButtonText: 'Sai ở đâu nhỉ?',
                allowOutsideClick: false,
                customClass: {
                    confirmButton: "btn btn-login"
                }
            }).then(() => {
                window.location.href = 'signup.jsp';
            });
            <% session.removeAttribute("signupError"); %>
            <% }%>
        </script>
    </body>
</html>
