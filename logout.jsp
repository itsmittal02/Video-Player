<%-- 
    Document   : logout
    Created on : Dec 15, 2021, 3:05:09 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie c = new Cookie("login","");
    c.setMaxAge(0);
    response.addCookie(c);
    response.sendRedirect("index.jsp");
%>
