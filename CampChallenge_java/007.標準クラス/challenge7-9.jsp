<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.*, java.io.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge7</title>
    </head>
    <body>
        <%
            File txt = new File(application.getRealPath("challenge7.txt"));
            FileReader fr = new FileReader(txt);
            BufferedReader br = new BufferedReader(fr);
            String str;
            while((str = br.readLine()) != null){
                out.println(str+"<br>");
            }

            br.close();
        %>
    </body>
</html>
