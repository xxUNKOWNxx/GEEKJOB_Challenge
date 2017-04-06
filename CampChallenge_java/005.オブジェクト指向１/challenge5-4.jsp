<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge5</title>
    </head>
    <body>
        <%!
            public class Human{
            
                public String name;
                public int age;

                public void prof_set(){
                    name = "田中太郎";
                    age = 18;
                }
                
                public void prof_disp(JspWriter out){
                    try{
                        out.println("名前："+name+"<br>");
                        out.println("年齢："+age+"<br>");
                    }catch(IOException e){
                        e.printStackTrace();
                        return;
                    }
                }
            }

            public class Human_clear extends Human{
                public void prof_clear(){
                    name = null;
                    age = 0;
                }
            }
        %>
        <%
            Human_clear tanaka = new Human_clear();
            tanaka.prof_set();
            tanaka.prof_disp(out);
            
            out.println("<br>");
            
            tanaka.prof_clear();
            tanaka.prof_disp(out);
        %>
    </body>
</html>