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
        <title>JUMS登録確認画面</title>
    </head>
    <body>
    <% if(!hs.getAttribute("name").equals("")){ %>
        <h1>登録確認</h1>
        名前:<%= hs.getAttribute("name")%><br>
        生年月日:<%= hs.getAttribute("year")+"年"+hs.getAttribute("month")+"月"+hs.getAttribute("day")+"日"%><br>
        種別:<%= hs.getAttribute("type")%><br>
        電話番号:<%= hs.getAttribute("tell")%><br>
        自己紹介:<%= hs.getAttribute("comment")%><br>
        上記の内容で登録します。よろしいですか？
        <form action="insertresult" method="POST">
            <!----- タスク2 ----->
            <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
            <!----- タスク2 ----->
            <input type="submit" name="yes" value="はい">
        </form>
    <% }else{ %>
        <h1>入力が不完全です</h1>
    <% } %>
        <form action="insert" method="POST">
            <input type="submit" name="no" value="登録画面に戻る">
        </form>
        <!----- タスク1 ----->
        <%=JumsHelper.getInstance().home()%>
        <!----- タスク1 ----->
    </body>
</html>
