<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge2</title>
    </head>
    <body>
        <%
            int num = 1000;
            
            while(num>100){
                num = num/2;
            }
            out.println(num);
        %>
    </body>
</html>
