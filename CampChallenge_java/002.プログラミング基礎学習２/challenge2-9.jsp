<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge2</title>
    </head>
    <body>
        <%
            HashMap<String, String> hMap = new HashMap<String, String>();

            hMap.put("1","AAA");                    
            out.println(hMap.get("1"));
            
            hMap.put("hello","world");                    
            out.println(hMap.get("hello"));
            
            hMap.put("soeda","33");                    
            out.println(hMap.get("soeda"));

            hMap.put("20","20");                    
            out.println(hMap.get("20"));

        %>
    </body>
</html>
