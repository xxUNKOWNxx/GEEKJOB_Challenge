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
            FileWriter fw = new FileWriter(txt);
            BufferedWriter bw = new BufferedWriter(fw);
            
            bw.write("名前：青木 涼\r\n");
            bw.write("年齢：25才\r\n");
            bw.write("一言：Javaを勉強中です");
            
            bw.close();
        %>
    </body>
</html>
