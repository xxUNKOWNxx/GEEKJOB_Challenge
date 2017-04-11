<%@page contentType="text/html" pageEncoding="UTF-8"%>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge7</title>
    </head>
    <body>
        <%
            String name = "あおきりょう";
            out.println("文字数　："+name.length()+"<br>");
            out.println("バイト数："+name.getBytes("UTF-8").length);
        %>
    </body>
</html>