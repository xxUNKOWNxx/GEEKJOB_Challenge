<%@page import="javax.servlet.http.HttpSession" %>
<!----- タスク1 ----->
<%@page import="jums.JumsHelper" %>
<!----- タスク1 ----->

<!----- タスク3 ----->
<%@page import="jums.UserDataBeans" %>
<jsp:useBean id="udb" class="jums.UserDataBeans" scope="session"/>
<!----- タスク3 ----->
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
        <!----- タスク3 ----->
        <% if(!udb.getName().equals("")){ %>
       <h1>登録確認</h1>
       名前:<jsp:getProperty name="udb" property="name"/><br>
       生年月日:<jsp:getProperty name="udb" property="birthday"/><br>
       種別:<jsp:getProperty name="udb" property="type"/><br>
       電話番号:<jsp:getProperty name="udb" property="tell"/><br>
       自己紹介:<jsp:getProperty name="udb" property="comment"/><br>
       <!----- タスク3 ----->
       上記の内容で登録します。よろしいですか？
       <form action="insertresult" method="POST">
           <!----- タスク2 ----->
           <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
           <!----- タスク2 ----->
           <% session.setAttribute("udb", udb); %>
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
