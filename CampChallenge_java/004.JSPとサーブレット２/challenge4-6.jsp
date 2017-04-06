<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge4</title>
    </head>
    <body>
        <%!
            String[] myPro(){
                int id = 10;
                String name = "田中太郎";
                String birthday = "1990/01/01";
                String address = "東京都";
                
                String prof[] = {String.valueOf(id), name, birthday, address};
                
                return prof;
            }
        %>
        <%
            for(int i=1; i<=3; i++){
                out.println(myPro()[i]+"<br>");
            }
        %>
    </body>
</html>
