<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge2</title>
    </head>
    <body>
        <%
            int num = 0;
            
            for(int i=1; i<=100; i++){
                num = num+i;
            }
            out.println(num);
        %>
    </body>
</html>
