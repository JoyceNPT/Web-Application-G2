<%-- 
    Document   : user-info
    Created on : Mar 22, 2025, 11:21:47 PM
    Author     : ngoth
--%>

<%@page import="dao.UserDAO"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User acc = (User) session.getAttribute("account");
    if (acc == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserDAO dao = new UserDAO();

    // Xử lý cập nhật thông tin người dùng
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

            // Kiểm tra tên
            String nameRegex = "^[\\p{Lu}][\\p{Ll}]*$";

            if (firstName == null || !firstName.matches(nameRegex)) {
                firstNameError = "First Name must start with a capital letter and contain only letters.";
                hasError = true;
            }

            if (lastName == null || !firstName.matches(nameRegex)) {
                lastNameError = "Last Name must start with a capital letter and contain only letters.";
                hasError = true;
            }

            // Kiểm tra số điện thoại
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
                    session.setAttribute("account", acc); // Cập nhật session
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
                session.invalidate(); // Xóa session sau khi xóa tài khoản
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
        <title>Profile Account</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    </head>
    <body>
        <div class="container">

            <nav class="navbar navbar-light bg-light px-3">
                <a class="navbar-brand" href="#">Profile Account</a>
                <div class="ms-auto">
                    <a class="text-dark me-3 text-decoration-none" href="#">Account</a>
                    <span class="text-dark">Hi, <%= acc.getUsername()%>, <a class="text-dark text-decoration-none" href="Logout">logout</a></span>
                </div>
            </nav>

            <h1 style="margin-top: 45px;">Profile Account</h1>

            <form method="POST">
                <div class="mb-3">
                    <label class="form-label">Name</label>
                    <input type="text" class="form-control" name="name" value="<%= acc.getFullname()%>" disabled/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" class="form-control" name="email" value="<%= acc.getEmail()%>" disabled/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Phone</label>
                    <input type="number" class="form-control" name="phone" value="<%= acc.getPhone()%>" disabled/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" class="form-control" name="username" value="<%= acc.getUsername()%>" disabled/>
                </div>

                <%
                    String roleName = "Không xác định"; // Mặc định nếu role không phải 1 hoặc 2
                    if (acc.getRole() == 1) {
                        roleName = "Quản trị viên";
                    } else if (acc.getRole() == 2) {
                        roleName = "Người dùng";
                    }
                %>

                <div class="mb-3">
                    <label class="form-label">Role</label>
                    <input type="text" class="form-control" name="role" value="<%= roleName%>" disabled/>
                </div>

                <div class="mb-3">
                    <label class="form-label">Create Date</label>
                    <input type="text" class="form-control" name="created" value="<%= acc.getCreated()%>" disabled/>
                </div>

                <a href="interface.jsp" class="btn btn-secondary" id="back"><i class="bi bi-arrow-return-left"></i> Back</a>

                <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#updateModal">
                    <i class="bi bi-pencil-square"></i> Update
                </button>

                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    <i class="bi bi-trash"></i> Delete
                </button>
            </form>

            <!-- Update Modal -->
            <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="updateModalLabel">Update Information</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="POST">
                            <input type="hidden" name="action" value="update">
                            <div class="modal-body">
                                <input type="hidden" name="id" value="<%= acc.getId()%>">

                                <div class="row mb-3">
                                    <div class="col">
                                        <label for="firstName" class="form-label">First Name</label>
                                        <input type="text" class="form-control" id="firstName" name="firstName"
                                               placeholder="Enter first name" required 
                                               pattern="^[\p{Lu}][\p{Ll}]*$"
                                               title="First Name must start with a capital letter and contain only letters.">
                                    </div>

                                    <div class="col">
                                        <label for="lastName" class="form-label">Last Name</label>
                                        <input type="text" class="form-control" id="lastName" name="lastName"
                                               placeholder="Enter last name" required 
                                               pattern="^[\p{Lu}][\p{Ll}]*$"
                                               title="Last Name must start with a capital letter and contain only letters.">
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="email" class="form-control" name="email" value="<%= acc.getEmail()%>" required/>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Phone</label>
                                    <input type="text" class="form-control" name="phone" value="<%= acc.getPhone()%>" 
                                           required pattern="^0[1-9](?=.*[1-9].*[1-9].*[1-9])[0-9]{8}$"
                                           title="Phone must be at least 10 digits and contain only numbers.">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
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
                            <h5 class="modal-title" id="deleteModalLabel">Confirm Delete</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="POST">
                            <input type="hidden" name="action" value="delete">
                            <div class="modal-body">
                                <input type="hidden" name="id" value="<%= acc.getId()%>">
                                <p>Are you sure you want to delete your account?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
