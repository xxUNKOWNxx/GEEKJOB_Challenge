<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge8</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            
            String name = request.getParameter("name_box");
            String sex = request.getParameter("sex_box");
            String hobby = request.getParameter("hobby_box");

            out.println(name+"<br>");
            
            if(sex != null){
                if(sex.equals("1")){
                    out.println("男"+"<br>");
                }else{
                    if(sex.equals("2")){
                        out.println("女"+"<br>");
                    }
                }
            }else{
                out.println(sex);
            }

            if(hobby != null){
                out.println(hobby+"<br>");
            }else{
                out.println(hobby);
            }
            %>
    </body>
</html>