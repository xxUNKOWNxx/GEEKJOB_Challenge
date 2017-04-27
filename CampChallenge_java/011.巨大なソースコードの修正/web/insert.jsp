<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import="jums.JumsHelper" %>
<%
    HttpSession hs = request.getSession();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%@page import="jums.UserDataBeans" %>
    <jsp:useBean id="udb" class="jums.UserDataBeans" scope="session"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JUMS登録画面</title>
    </head>
    <body>
    <form action="insertconfirm" method="POST">
        名前:
    <!----- タスク5 ----->  
        <input type="text" name="name" value="<%= udb.getName() != null ? udb.getName() : "" %>">
    <!----- タスク5 ----->  
        <br><br>

        生年月日:　
        <select name="year">
            <option value="">----</option>
        <!----- タスク5 ----->  
            <%
            int year=0, month=0, day=0;

            if(hs.getAttribute("year") != null && !hs.getAttribute("year").equals("")){
                year = Integer.parseInt(hs.getAttribute("year").toString());
            }
            
            if(hs.getAttribute("month") != null && !hs.getAttribute("month").equals("")){
                month = Integer.parseInt(hs.getAttribute("month").toString());
            }
                        
            if(session.getAttribute("day") != null && !session.getAttribute("day").equals("")){
                day = Integer.parseInt(session.getAttribute("day").toString());
            }

            for(int i=1950; i<=2010; i++){ %>
            <option value="<%=i%>" <%= i==year ? "selected" : "" %>> <%=i%> </option>
        <!----- タスク5 ----->  
            <% } %>
        </select>年
        <select name="month">
            <option value="">--</option>
            <%
            for(int i = 1; i<=12; i++){ %>
        <!----- タスク5 ----->  
            <option value="<%=i%>" <%= i==month ? "selected" : "" %>><%=i%></option>
        <!----- タスク5 ----->  
            <% } %>
        </select>月
        <select name="day">
            <option value="">--</option>
            <%
            for(int i = 1; i<=31; i++){ %>
        <!----- タスク5 ----->  
            <option value="<%=i%>" <%= i==day ? "selected" : "" %>><%=i%></option>
        <!----- タスク5 ----->  
            <% } %>
        </select>日
        <br><br>

        種別:
        <br>
    <!----- タスク5 ----->  
        <input type="radio" name="type" value="1" <%= udb.getType() == 1 ? "checked" : "" %>>エンジニア<br>
        <input type="radio" name="type" value="2" <%= udb.getType() == 2 ? "checked" : "" %>>営業<br>
        <input type="radio" name="type" value="3" <%= udb.getType() == 3 ? "checked" : "" %>>その他<br>
    <!----- タスク5 ----->  
        <br>

        電話番号:
    <!----- タスク5 ----->  
        <input type="text" name="tell" value="<%= udb.getTell() != null ? udb.getTell() : "" %>">
    <!----- タスク5 ----->  
        <br><br>

        自己紹介文
        <br>
    <!----- タスク5 ----->  
        <textarea name="comment" rows=10 cols=50 style="resize:none" wrap="hard"><%= udb.getComment() != null ? udb.getComment() : "" %></textarea><br><br>
    <!----- タスク5 ----->

        <input type="hidden" name="ac"  value="<%= hs.getAttribute("ac")%>">
        <input type="submit" name="btnSubmit" value="確認画面へ">
    </form>
        <br>
        <%=JumsHelper.getInstance().home()%>
    </body>
</html>
