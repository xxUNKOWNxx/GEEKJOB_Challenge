<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge2</title>
    </head>
    <body>
        <%
            String str[] = {"10", "100", "soeda", "hayashi", "-20", "118", "END"};
            str[2] = "33";
            out.println(str[2]);
        %>
    </body>
</html>
