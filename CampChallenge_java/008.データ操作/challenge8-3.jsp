<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.Cookie, java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge8</title>
    </head>
    <body>
        <%
           Date date = new Date();
           Cookie c = new Cookie("last", date.toString());
           response.addCookie(c);
           
           Cookie cs[] = request.getCookies();
           if(cs != null){
               for(int i=0; i<cs.length; i++){
                   if(cs[i].getName().equals("last")){
                       out.print("最後のログインは、"+cs[i].getValue());
                       break;
                    }
               }
           }
        %>
    </body>
</html>