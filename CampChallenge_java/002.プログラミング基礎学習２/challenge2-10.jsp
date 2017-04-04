<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge2</title>
    </head>
    <body>
        <%
            //変数定義　開始
                int num, param_num, sum = 0;
                ArrayList<String> sumArr = new ArrayList<String>();
                int Prim_num = 2;
            //変数定義　ここまで
            
            //数値受け取り　開始
            //受け取った値をint型に変換;
                try{
                    num = Integer.parseInt(request.getParameter("param_num"));
                    
                }catch(NumberFormatException e){
                    out.println("数字以外の文字、または処理限界以上の値が受け渡されました！<br>");
                    e.printStackTrace();
                    return;
                }
            //数値受け取り　終了
            
            
            
            //素因数分解　開始
                sum=num;
                
                while(sum != 1){                                //商の値が1になるまで（1以外の時）処理を繰り返す
                    if((sum%Prim_num) == 0){                    //割り切れた場合以下を実行
                        sum /= Prim_num;                        //渡された値を素数で割る
                        sumArr.add(String.valueOf(Prim_num));   //素数の値を配列に格納
                    }else{                                      //割り切れなかった場合、素数の値を1増やす
                        Prim_num++;
                    }
                }
                
                out.println(num);

                for(int i=0; i<sumArr.size(); i++){                 //配列の格納数より少ない回数を繰り返し、配列の中身を表示する
                    if((Integer.parseInt(sumArr.get(i))/10) != 0){  //配列の要素を10で割れた場合、要素を「その他」に変更してfor文を抜ける
                        sumArr.set(i, " その他");
                        out.print(sumArr.get(i));
                        break;
                    }
                    
                    if(i!=0){
                        sumArr.set(i, "×"+sumArr.get(i));           //最初の要素以外は+を要素の頭につける
                    }
                    
                    out.print(sumArr.get(i));
                }
            //素因数分解　終了
             
        %>
    </body>
</html>
