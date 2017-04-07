<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge6</title>
    </head>
    <body>
        <%!
            abstract class Human{
                ArrayList<Integer> myCards = new ArrayList<Integer>();
                abstract public int open();
                abstract public ArrayList<Integer> setCard(ArrayList<Integer> setCards);
                abstract public boolean checkSum(JspWriter out);
            }
            
            class Dealer extends Human{
                //山札
                public ArrayList<Integer> cards = new ArrayList<Integer>();  

                //Dealerに52枚のトランプを渡す処理
                public void getCards(){

                    //トランプのマーク（ハート、ダイヤ、クラブ、スペード4つ）分のループ
                    for(int i=0; i<4; i++){     
                        //1マークに含まれる数字のカード、13枚分ループ
                        for(int j=1; j<=13; j++){
                                cards.add(j);
                        }
                    }
                }
                
                //Deal処理（最初に配る2枚のカード）用のメソッド
                public ArrayList<Integer> deal(){

                    //配るカードを渡すための変数を定義
                    ArrayList<Integer> deal_cards = new ArrayList<Integer>();
                    //ランダムな値を算出するための変数を定義
                    Random rand = new Random();

                    //カードを配る枚数分（2枚なので2回）ループ
                    for(int i=0; i<2; i++){
                        //山札の総枚数からランダムな値を算出（0から51の間）
                        int Index = rand.nextInt(cards.size());  
                        //山札のn番目を配るカード群に加える
                        deal_cards.add(cards.get(Index));
                        //配ったカードを山札から取り除く
                        cards.remove(Index);
                    }
                    //配るカードをまとめて返す
                    return deal_cards;                    
                }

                 //Hit処理（任意に引ける1枚）用のメソッド
                public ArrayList<Integer> hit(){
                    ArrayList<Integer> draw_cards = new ArrayList<Integer>();
                    
                    Random rand = new Random();
                    int Index = rand.nextInt(cards.size());  
                    draw_cards.add(cards.get(Index));
                    cards.remove(Index);

                    return draw_cards;
                }

                //現在の手持ちカードの合計点を返すためのメソッド
                public int open(){
                    int sum=0;
                    //手持ちカードの枚数分だけsumに手持ちカードi番目のカードの数字を足していく
                    for(int i=0; i<myCards.size(); i++){
                        sum += myCards.get(i);
                    }
                    
                    return sum;
                }
                
                //手持ちカードに指定されたカードを加えるためのメソッド
                public ArrayList<Integer> setCard(ArrayList<Integer> setCards){
                    myCards.addAll(setCards);
                    return myCards;
                }
                
                //ヒットするかを選択するメソッド
                public boolean checkSum(JspWriter out){
                    //Dealerの合計点が17点以下の時はカードを引く、18点以上の場合は引かない
                    if(this.open() <= 17){
                        return true;
                    }else{
                        return false;
                    }
                }
                
            }

            class User extends Human{
                
                //現在の手持ちカードの合計点を返すためのメソッド
                public int open(){
                    int sum=0;
                    
                    for(int i=0; i<myCards.size(); i++){
                        sum += myCards.get(i);
                    }
                    
                    return sum;
                }
                
                //手持ちカードに指定されたカードを加えるためのメソッド
                public ArrayList<Integer> setCard(ArrayList<Integer> setCards){
                    myCards.addAll(setCards);
                    return myCards;
                }

                //Hitするかを選択するメソッド
                public boolean checkSum(JspWriter out){
                    try{
                        out.println("手持ちのカードリストです<br>");
                        //手持ちカードの枚数分ループ
                        for(int i=0; i<myCards.size(); i++){
                            //手持ちの最後のカードを表示する時だけ以下に分岐してforを抜ける
                            if(i==(myCards.size())-1){
                                out.print(myCards.get(i)+"<br>");
                                break;
                            }
                            //手持ちカードのi枚目に,をつけて画面に表示
                            out.print(myCards.get(i)+",");
                        }
                        
                        //手持ちカードの合計点が19点か21点より下かで分岐
                        if(this.open() < 19){
                            out.println("まだカードを引きますか？：引く<br><br>");
                            return true;
                        }else{
                            if(this.open() < 21){
                                out.println("まだカードを引きますか？：スタンド<br><br>");
                                return false;
                            //点数が21点以上の場合だけ以下に分岐
                            }else{
                                out.println("<br>");
                                return false;
                            }
                        }
                    //PrintWriter用のエラー処理
                    }catch(IOException e){
                        e.printStackTrace();
                        return false;
                    }
                }
            }
        %>
        <%
        /*
            ○ブラックジャックのルール
                最終的な手持ち合計点が21に近いほうが勝利
            
                ヒット：ディーラーが追加でカードを1枚配る
            　　スタンド：ヒットせずにその手札で勝負する
            　　バスト：手持ちカードの合計点が21点以上になった場合の強制的な負け
            
                1.最初にディーラーがディーラーとユーザーに2枚ずつカードを配る
                2.ユーザーはバストにならない限りヒットし続けられる
                3.ディーラーは手持ち合計点が17点以上になるまでヒットし続ける
                4.互いのカードを開示し、合計点を比べて高いほうが勝利
            
        */

            //オブジェクトの作成
            
            //＜補足＞
            //ディーラー：フェイ・バレンタイン
            //ユーザー　：スパイク・シュピーゲル
            //カウボーイビバップの第３話「ゲートウェイ・シャッフル」でのカジノシーンをイメージ
            Dealer Faye_Valentine = new Dealer();
            User Spike_Spiegel = new User();
            
            //Dealerが山札を取得
            Faye_Valentine.getCards();
            //DealerとUserそれぞれにカード2枚を配布
            Spike_Spiegel.setCard(Faye_Valentine.deal());
            Faye_Valentine.setCard(Faye_Valentine.deal());

            //DealerとUserのどちらか、または両者の手持ちカード合計点が21以上の場合、文章を表示して処理を終了する
            if(Spike_Spiegel.open() >= 21){
                out.println("スパイクさんはバストしました。フェイさんの勝利です");
                return;
            }else{
                if(Faye_Valentine.open() >= 21){
                    out.println("フェイさんはバストしました。スパイクさんの勝利です");
                    return;
                }else{
                    if(Spike_Spiegel.open() >= 21 && Faye_Valentine.open() >= 21){
                        out.println("スパイクさん、フェイさんはバストしました");
                        return;
                    }
                }
            }

            //Userの手持ちカードの合計点が19点より下の場合、Hitし続ける
            while(Spike_Spiegel.checkSum(out) == true){
                Spike_Spiegel.setCard(Faye_Valentine.hit());
            }
            
            //Userの手持ちカードの合計点が21以上の場合、文章を表示して処理を終了
            if(Spike_Spiegel.open() >= 21){
                out.println("スパイクさんはバストしました。フェイさんの勝利です");
                return;
            }

            //Userの手持ちカードの合計点が17点以下の場合、Hitし続ける
            while(Faye_Valentine.checkSum(out) == true){
                Faye_Valentine.setCard(Faye_Valentine.hit());
            }
            
            //Dealerの手持ちカードの合計点が21以上の場合、文章を表示して処理を終了
            if(Faye_Valentine.open() >= 21){
                out.println("フェイさんはバストしました。スパイクさんの勝利です");
                return;
            }
            
            //DealerとUserがバストしていなかった場合、持ち点の合計を表示
            if(Faye_Valentine.open() < 21 && Spike_Spiegel.open() < 21){
                out.println("スパイク："+Spike_Spiegel.open()+"<br>");
                out.println("フェイ　："+Faye_Valentine.open()+"<br><br>");
            }
            
            //DealerとUserの持ち点を比較して勝敗を表示
            if(Spike_Spiegel.open() > Faye_Valentine.open()){
                out.println("スパイクさんの勝利です");
            }else{
                if(Spike_Spiegel.open() < Faye_Valentine.open()){
                    out.println("フェイさんの勝利です");
                }else{
                    if(Spike_Spiegel.open() == Faye_Valentine.open()){
                        out.println("引き分けです");
                    }
                }
            }
        %>
    </body>
</html>