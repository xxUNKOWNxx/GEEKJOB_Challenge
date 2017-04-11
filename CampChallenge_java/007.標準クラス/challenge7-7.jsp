<%@page contentType="text/html" pageEncoding="UTF-8"%>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge7</title>
    </head>
    <body>
        <%
            String str = "きょUはぴIえIちぴIのくみこみかんすUのがくしゅUをしてIます";
            out.println("元の文章："+str+"<br>");
            
            str = str.replace("U","う");
            str = str.replace("I","い");

            out.println("変換結果："+str);
        %>
    </body>
</html>