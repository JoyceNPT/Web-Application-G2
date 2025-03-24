<%-- 
    Document   : user-info
    Created on : Mar 22, 2025, 11:21:47 PM
    Author     : ngoth
--%>

<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Check if user is logged in
    User acc = (User) session.getAttribute("account");
    if (acc == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserDAO dao = new UserDAO();

    // Handling user information updates
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("update")) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");

            boolean hasError = false;
            String firstNameError = null;
            String lastNameError = null;
            String phoneError = "";

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

                acc.setFullname(fullname);
                acc.setEmail(email);
                acc.setPhone(phone);

                int success = dao.update(acc.getId(), fullname, email, phone);

                if (success > 0) {
                    session.setAttribute("account", acc); // Update session
                    out.println("<script>Swal.fire('Thành công!', 'Cập nhật thông tin thành công.', 'success');</script>");
                } else {
                    out.println("<script>Swal.fire('Lỗi!', 'Cập nhật thất bại.', 'error');</script>");
                }
            } else {
                response.sendRedirect("user-info.jsp");
            }
        } else if (action.equalsIgnoreCase("delete")) {
            int success = dao.delete(acc.getId());
            if (success > 0) {
                session.invalidate(); // Delete session after deleting account
                response.sendRedirect("login.jsp");
                return;
            } else {
                out.println("<script>Swal.fire('Lỗi!', 'Không thể xóa tài khoản.', 'error');</script>");
            }
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông Tin Tài Khoản</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="icon" type="image/png" href="images/favicon_io/favicon.ico">
    </head>
    <body>
        <div class="container">

            <nav class="navbar navbar-light bg-light px-3">
                <a class="navbar-brand" href="#">Tour Booking Website</a>
                <div class="ms-auto">
                    <a class="text-dark me-3 text-decoration-none" href="#">Tài Khoản</a>
                    <span class="text-dark">Hi, <%= acc.getUsername()%>, <a class="text-dark text-decoration-none" href="Logout">Đăng xuất</a></span>
                </div>
            </nav>

            <h1 style="margin-top: 15px; text-align: center;">Thông Tin Tài Khoản</h1>

            <form method="POST">
                <div class="mb-3">
                    <label class="form-label">Họ tên</label>
                    <input type="text" class="form-control" name="name" value="<%= acc.getFullname()%>" readonly/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Hộp thư điện tử</label>
                    <input type="email" class="form-control" name="email" value="<%= acc.getEmail()%>" readonly/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Số điện thoại</label>
                    <input type="number" class="form-control" name="phone" value="<%= acc.getPhone()%>" readonly/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Tên đăng nhập</label>
                    <input type="text" class="form-control" name="username" value="<%= acc.getUsername()%>" disabled/>
                </div>

                <%
                    String roleName = "Không xác định"; // Default if role is not 1 or 2
                    if (acc.getRole() == 1) {
                        roleName = "Quản trị viên";
                    } else if (acc.getRole() == 2) {
                        roleName = "Người dùng";
                    }
                %>

                <div class="mb-3">
                    <label class="form-label">Vai trò</label>
                    <input type="text" class="form-control" name="role" value="<%= roleName%>" disabled/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Ngày tạo tài khoản</label>
                    <input type="text" class="form-control" name="created" value="<%= acc.getCreated()%>" disabled/>
                </div>

                <a href="interface.jsp" class="btn btn-secondary" id="back"><i class="bi bi-arrow-return-left"></i> Trở Về</a>

                <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#updateModal">
                    <i class="bi bi-pencil-square"></i> Cập Nhật Tài Khoản
                </button>

                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    <i class="bi bi-trash"></i> Xoá Tài Khoản
                </button>
            </form>

            <!-- Update Modal -->
            <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="updateModalLabel">Cập Nhật Tài Khoản</h5>

                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="POST">
                            <input type="hidden" name="action" value="update">

                            <div class="modal-body">
                                <input type="hidden" name="id" value="<%= acc.getId()%>">

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
                                    <label class="form-label">Hộp thư điện tử (@gmail.com)</label>
                                    <input type="email" class="form-control" name="email" value="<%= acc.getEmail()%>" required
                                           title="Email must be in the format: example@mail.com"
                                           oninvalid="this.setCustomValidity('Vui lòng nhập email hợp lệ (ví dụ: example@mail.com)')"
                                           oninput="this.setCustomValidity('')">
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Số điện thoại (+84)</label>
                                    <input type="text" class="form-control" name="phone" value="<%= acc.getPhone()%>" 
                                           required pattern="^0[1-9](?=.*[1-9].*[1-9].*[1-9])[0-9]{8}$"
                                           title="Số điện thoại phải có ít nhất 10 chữ số và chỉ chứa số."
                                           oninvalid="this.setCustomValidity('Số điện thoại phải có ít nhất 10 chữ số và chỉ chứa số.')"
                                           oninput="this.setCustomValidity('')">
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Delete Modal -->
            <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteModalLabel">Xác Nhận Xoá Tài Khoản</h5>

                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="POST">
                            <input type="hidden" name="action" value="delete">

                            <div class="modal-body">
                                <input type="hidden" name="id" value="<%= acc.getId()%>">
                                <p>Bạn có chắc chắn muốn xóa tài khoản của mình không?</p>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Trở Về</button>
                                <button type="submit" class="btn btn-danger">Xoá</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
