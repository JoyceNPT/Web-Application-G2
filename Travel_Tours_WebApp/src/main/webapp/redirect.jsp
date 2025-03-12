<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Redirecting...</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
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
            text: 'Redirecting to your dashboard...',
            confirmButtonText: 'OK',
            allowOutsideClick: false
        }).then(() => {
            window.location.href = 'interface.jsp';
        });
            <% session.removeAttribute("loginSuccess"); %>
            <% } %>

            <% if (session.getAttribute("loginError") != null) {%>
        Swal.fire({
            icon: 'error',
            title: 'Login Failed',
            text: '<%= session.getAttribute("loginError")%>'
        }).then(() => {
            window.location.href = 'login.jsp';
        });
            <% session.removeAttribute("loginError"); %>
            <% } %>

            <% if (session.getAttribute("signupSuccess") != null) {%>
        Swal.fire({
            icon: 'success',
            title: '<%= session.getAttribute("signupSuccess")%>',
            text: 'You will be redirected to the login page.',
            confirmButtonText: 'OK',
            allowOutsideClick: false
        }).then(() => {
            window.location.href = 'login.jsp';
        });
            <% session.removeAttribute("signupSuccess"); %>
            <% } %>

            <% if (session.getAttribute("signupError") != null) {%>
        Swal.fire({
            icon: 'error',
            title: 'Sign Up Failed',
            text: '<%= session.getAttribute("signupError")%>'
        }).then(() => {
            window.location.href = 'signup.jsp';
        });
            <% session.removeAttribute("signupError"); %>
            <% }%>
        </script>
    </body>
</html>
