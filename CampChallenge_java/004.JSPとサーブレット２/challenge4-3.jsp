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
            void Kisu_Gusu(JspWriter out, Integer num){
                try{
                    if((num%2)==0 && num!=0){
                        out.println("受け取った数値は偶数です<br>");
                    }else{
                        if((num%2)==1){
                            out.println("受け取った数値は奇数です<br>");
                        }else{
                            out.println("受け取った値は0以下です<br>");
                        }
                    }
                }catch(IOException e){
                    e.printStackTrace();
                    return;
                }
            }
        %>
        <%
            int num = 1;
            Kisu_Gusu(out, num);
        %>
    </body>
</html>
