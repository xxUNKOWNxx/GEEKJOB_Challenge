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
            Integer Calculation(int num, int five, boolean type){
                five = 5;
                type = false;

                num *= five;

                if(type == true){
                    num *= num;
                }
                return num;
            }
            
            void Disp(JspWriter out, int num, boolean type){
                try{
                    out.println("typeは「"+type+"」、計算した値は「"+num+"」です<br>");
                }catch(IOException e){
                    e.printStackTrace();
                    return;
                }
            }
        %>
        <%
            int num = 1;
            int five = 0;
            boolean type = true;
            
            num = Calculation(num, five, type);
            Disp(out, num, type);
        %>
    </body>
</html>