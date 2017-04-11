<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge7</title>
    </head>
    <body>
        <%
            Calendar cal1 = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();
            cal1.set(2015,1,1,0,00,00);
            cal2.set(2015,11,31,23,59,59);

            out.print(cal2.getTimeInMillis() - cal1.getTimeInMillis());
        %>
    </body>
</html>