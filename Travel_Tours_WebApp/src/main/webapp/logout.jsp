<%-- 
    Document   : logout
    Created on : Mar 22, 2025, 9:03:12 PM
    Author     : ngoth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Xoá toàn bộ session
    session.invalidate();

    // Chuyển hướng về trang login
    response.sendRedirect("login.jsp");
%>