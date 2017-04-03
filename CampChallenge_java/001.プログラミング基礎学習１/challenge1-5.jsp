<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge1</title>
    </head>
    <body>
        <%
            int flag = 1;

            if(flag == 1){
                out.println("１です！");
            }else{
                if(flag == 2){
                    out.println("プログラミングキャンプ！");
                }else{
                    out.println("その他です！");
                }
            }
        %>
    </body>
</html>