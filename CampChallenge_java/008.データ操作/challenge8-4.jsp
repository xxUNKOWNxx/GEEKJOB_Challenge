<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession, java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge8</title>
    </head>
    <body>
        <%
           Date date = new Date();
           HttpSession hs = request.getSession(true);
           hs .setAttribute("LastLogin", date.toString());
           
           hs = request.getSession(true);
           out.print("最後のログインは、"+hs.getAttribute("LastLogin"));
        %>
    </body>
</html>