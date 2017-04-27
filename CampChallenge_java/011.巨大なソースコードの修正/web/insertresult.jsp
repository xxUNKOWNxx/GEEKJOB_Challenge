<%@page import="javax.servlet.http.HttpSession" %>
<!----- タスク1 ----->
    <%@page import="jums.JumsHelper" %>
<!----- タスク1 ----->

<!----- タスク3 ----->
    <%@page import="jums.UserDataBeans" %>
    <jsp:useBean id="udb" class="jums.UserDataBeans" scope="session"/>
<!----- タスク3 ----->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録結果画面</title>
    </head>
    <body>
        <h1>登録結果</h1><br>
    <!----- タスク3 ----->
        名前:<jsp:getProperty name="udb" property="name"/><br>
        生年月日:<jsp:getProperty name="udb" property="birthday"/><br>
        種別:<jsp:getProperty name="udb" property="type"/><br>
        電話番号:<jsp:getProperty name="udb" property="tell"/><br>
        自己紹介:<jsp:getProperty name="udb" property="comment"/><br>
    <!----- タスク3 ----->
        以上の内容で登録しました。<br>
    <!----- タスク6 ----->
        <% session.invalidate(); %>
    <!----- タスク6 ----->
    </body>
    
<!----- タスク1 ----->
    <%=JumsHelper.getInstance().home()%>
<!----- タスク1 ----->
</html>
