<%@page import="javax.servlet.http.HttpSession" %>
<!----- タスク1 ----->
<%@page import="jums.JumsHelper" %>
<!----- タスク1 ----->
<%
    HttpSession hs = request.getSession();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録結果画面</title>
    </head>
    <body>
        <h1>登録結果</h1><br>
        名前:<%= hs.getAttribute("name")%><br>
        生年月日:<%= hs.getAttribute("year")+"年"+hs.getAttribute("month")+"月"+hs.getAttribute("day")+"日"%><br>
        種別:<%= hs.getAttribute("type")%><br>
        電話番号:<%= hs.getAttribute("tell")%><br>
        自己紹介:<%= hs.getAttribute("comment")%><br>
        以上の内容で登録しました。<br>
    </body>
    
    <!----- タスク1 ----->
    <%=JumsHelper.getInstance().home()%>
    <!----- タスク1 ----->
</html>
