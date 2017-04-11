<%@page contentType="text/html" pageEncoding="UTF-8"%>
        
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge7</title>
    </head>
    <body>
        <%
            String mail_address = "google123@gmail.com";
            out.println("@以降："+mail_address.substring(9));
        %>
    </body>
</html>