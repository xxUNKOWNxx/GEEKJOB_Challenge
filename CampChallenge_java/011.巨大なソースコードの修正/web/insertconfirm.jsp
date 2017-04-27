
<%@page import="javax.servlet.http.HttpSession" %>
<!----- タスク1 ----->
    <%@page import="jums.JumsHelper" %>
<!----- タスク1 ----->

<!----- タスク3 ----->
    <%@page import="jums.UserDataBeans" %>
    <jsp:useBean id="udb" class="jums.UserDataBeans" scope="session"/>
<!----- タスク3 ----->

<!----- タスク4 ----->
    <%@page import="java.text.SimpleDateFormat"%>
<!----- タスク4 ----->

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
        
    <!----- タスク4 ----->
        <%
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        if(!udb.getName().equals("")
        && (udb.getBirthday().compareTo(dateFormat.parse("1000-01-01")) != 0)
        && (udb.getType() != 0 )
        && !udb.getTell().equals("")
        && !udb.getComment().equals("")
        ){ %>
    <!----- タスク4 ----->
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
<!----- タスク4 ----->   
   <%
        if(udb.getName().equals("")){
            out.println("名前が未入力です<br>");
        }

        if(udb.getBirthday().compareTo(dateFormat.parse("1000-01-01")) == 0){
            out.println("誕生日が未入力、または不完全です<br>");    
        }

        if(udb.getType() == 0){
            out.println("種別が未選択です<br>");    
        }

        if(udb.getTell().equals("")){
            out.println("電話番号が未入力です<br>");    
        }
        if(udb.getComment().equals("")){
            out.println("自己紹介が未入力です<br>");  
        }

    } %>
<!----- タスク4 ----->   
        <form action="insert" method="POST">
            <input type="submit" name="no" value="登録画面に戻る">
        </form>
    <!----- タスク1 ----->
        <%=JumsHelper.getInstance().home()%>
        <!----- タスク1 ----->
    </body>
</html>
