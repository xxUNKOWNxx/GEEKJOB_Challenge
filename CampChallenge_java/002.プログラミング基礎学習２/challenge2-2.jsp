<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge2</title>
    </head>
    <body>
        <%
            String str = "";
            int num = 0;
            String message = "";
            
            if(str == "A"){
                num = 1;
            }else{
                if(str == "あ"){
                    num = 2;
                }else{
                    num = 0;
                }
            }
            
            switch(num){
                case 1:
                    message = "英語";
                    break;
                case 2:
                    message = "日本語";
                    break;
                default :
                    message = "";
                    break;
            }
            out.println(message);
        %>
    </body>
</html>
