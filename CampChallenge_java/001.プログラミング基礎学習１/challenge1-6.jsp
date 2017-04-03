<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge1</title>
    </head>
    <body>
        <%
            //変数定義　開始
                final String title_syohin = "商品種別　";
                final String title_nedan = "１個当りの値段　";
                final String title_point = "付与ポイント　";
                int syohin = 0, kosuu = 0, sougaku = 0;
                String param_syohin = null, param_kosuu = null, param_sougaku = null;
            //変数定義　ここまで
            
            //数値受け取り　開始
            //受け取った値をint型に変換;
                try{
                    syohin = Integer.parseInt(request.getParameter("param_syohin"));
                    kosuu = Integer.parseInt(request.getParameter("param_kosuu"));
                    sougaku = Integer.parseInt(request.getParameter("param_sougaku"));
                    
                }catch(NumberFormatException e){
                    out.println("数字以外の文字が受け渡されました！<br>");
                    e.printStackTrace();
                    return;
                }
            //数値受け取り　終了
            
            
            
            //商品種別表示　開始
                out.print(title_syohin);
                
                if(syohin == 1){
                    out.println("１：雑貨<br>");
                }else{
                    if(syohin == 2){
                        out.println("２：生鮮食品<br>");
                    }else{
                        if(syohin == 3){
                            out.println("３：その他<br>");
                        }else{
                            out.println("該当なし<br>");
                        }
                    }
                }
            //商品種別表示　終了
            
            
            
            //1個当りの値段の算出　開始
                out.print(title_nedan);

                //個数、総額が0でない場合に処理を実行
                if(kosuu != 0 && sougaku != 0){
                    out.println(sougaku / kosuu + "<br>");
                }else{
                    out.println("個数または総額の値が不正です！<br>");
                }
            //1個当りの値段の算出　終了
            
            
            
            //ポイント付与　開始
                out.print(title_point);
                if(sougaku >= 3000){
                    out.print(sougaku * 0.04);
                }else{
                    if(sougaku >= 5000){
                        out.print(sougaku * 0.05);
                    }else{
                        out.print(0);
                    }
                }
            //ポイント付与　終了

        %>
    </body>
</html>