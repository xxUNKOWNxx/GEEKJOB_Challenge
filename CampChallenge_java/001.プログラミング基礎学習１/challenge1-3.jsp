<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge1</title>
    </head>
    <body>
        <%
            String name ="Name: Ryo Aoki<br>";
            String age = "Age : 25<br>";
            String sex = "Sex : Male<br>";
            
            out.println(name);
            out.println(age);
            out.println(sex);
        %>
    </body>
</html>
