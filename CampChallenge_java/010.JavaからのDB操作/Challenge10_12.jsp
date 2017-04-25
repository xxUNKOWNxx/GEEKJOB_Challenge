<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- セッションに何もなかった場合の処理 -->
        <%            
            if(session.getAttribute("title") == null){
                session.setAttribute("title", "ログイン画面");
                session.setAttribute("login_disp", "block");
                session.setAttribute("product_disp", "none");
                session.setAttribute("product_regist_disp", "none");
                session.setAttribute("product_list_disp", "none");
            }
        %>
        <title><%= session.getAttribute("title") %></title>
    </head>
    <body>
        <form action="Challenge10_12" method="post" style="display: <%= session.getAttribute("login_disp") %>">
            ユーザー名：<input type="text" name="name"><br>
            パスワード：<input type="password" name="pass"><br>
            
            <!-- checkに値が入っていた場合のみエラー文を表示 -->
            <%
                if(request.getAttribute("check") != null){
                    out.println("ユーザーネームまたはパスワードが"+request.getAttribute("check")+"<br>");
                }
            %>
            <input type="submit" name="b_login" value="ログイン">
        </form>
            
        <form action="Challenge10_12" method="post" style="display: <%= session.getAttribute("product_disp") %>">
            <%= session.getAttribute("name")+"としてログイン中" %>
            <input type="submit" name="b_logout" value="ログアウト" style="margin-bottom: 20px;"><br>

            <input type="submit" name="b_product_regist_disp" value="商品情報登録" style="margin-bottom: 20px;"><br>
            <div style="display: <%= session.getAttribute("product_regist_disp") %>; margin: -15px 0px 20px 0px;">
                  製品名：<input type="text" name="p_name"><br>
                カテゴリ：<input type="text" name="p_category"><br>
                
                <!-- product_registに値が入っていた場合のみエラー文を表示 -->
                <%
                    if(request.getAttribute("product_regist") != null){
                        out.println(request.getAttribute("product_regist")+"<br>");
                    }
                %>
                <input type="submit" name="b_product_regist" value="登録" style="margin-top: 5px;">
            </div>

            <input type="submit" name="b_product_list_disp" value="商品情報一覧" style="margin-bottom: 20px;"><br>
            <div style="display: <%= session.getAttribute("product_list_disp") %>; margin: -15px 0px 20px 0px;">
                
                <%
                    //product_list_errorに値が入っていた場合のみエラー文を表示
                    if(request.getAttribute("product_list_error") != null){
                        out.println(request.getAttribute("product_list_error")+"<br>");
                    }
                    
                    //product_listに値が入っていた場合、要素数だけforループして格納されている要素を表示
                    if(session.getAttribute("product_list") != null){
                        
                        String[][] product = (String[][])session.getAttribute("product_list");
                        for(int i=0; i<product.length; i++){
                            for(int j=0; j<product[i].length; j++){
                                out.print(product[i][j]+"　");
                            }
                            //レコードを表示し終わったところで改行
                            out.print("<br>");
                        }
                        //全レコードを表示し終わったところで改行
                        out.print("<br>");
                    }
                %>
                <input type="submit" name="b_product_list" value="表示" style="margin-top: 5px;">
            </div>
        </form>

    </body>
</html>