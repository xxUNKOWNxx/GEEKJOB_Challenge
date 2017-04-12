<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.Cookie, java.util.Date, java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge8</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            
            Cookie c;
            String c_paras[]={"name_box", "sex_box", "hobby_box"};
            
            for(int i=0; i<c_paras.length; i++){
                if(request.getParameter(c_paras[i]) != null){
                    c = new Cookie("c_"+c_paras[i], URLEncoder.encode(request.getParameter(c_paras[i]),"UTF-8"));
                    System.out.println(c.getValue());
                    response.addCookie(c);
                }
            }
            
            out.println("次回の初期値として登録しました<br>");
        %>
    </body>
</html>