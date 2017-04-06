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
            void myPro(JspWriter out){           
                try{
                    out.println("名前　　：青木 涼<br>");
                    out.println("生年月日：1991年5月27日<br>");
                    out.println("自己紹介：Javaを勉強中です<br>");

                }catch(IOException e){
                    e.printStackTrace();
                    return;
                }
            }
        %>
        <%
            for(int i=0; i<10; i++){
                myPro(out);
            }
        %>
    </body>
</html>
