<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge1</title>
    </head>
    <body>
        <%
            final int Constant = 20;
            int tasu = Constant + 10;
            int hiku = Constant;
            int kake = Constant * 10;
            int waru = Constant / 10;
            int amar = Constant % 7;
            
            out.println("足す : "+tasu+"<br>");
            out.println("引く : "+--hiku+"<br>");
            out.println("掛け : "+kake+"<br>");
            out.println("割る : "+waru+"<br>");
            out.println("余り : "+amar+"<br>");
        %>
    </body>
</html>
