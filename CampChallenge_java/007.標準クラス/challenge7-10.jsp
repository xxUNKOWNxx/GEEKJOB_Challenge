<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, java.text.*, java.io.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge7</title>
    </head>
    <body>
        <%  
            //ログファイル生成
            File txt = new File(application.getRealPath("challenge7-10.jsp").replace("challenge7-10.jsp","")+"challenge7_log.txt");
            txt.createNewFile();
            out.println();
            
            //ファイル関連のインスタンス作成
            FileWriter fw = new FileWriter(txt);
            FileReader fr = new FileReader(txt);
            BufferedReader br = new BufferedReader(fr);
            BufferedWriter bw = new BufferedWriter(fw);
            
            //ファイル内容の表示用変数定義
            String str;
            
            //日時用のインスタンス生成、フォーマットの指定
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH時mm分ss秒");
            String sdate = sdf.format(date);

            //日時の取得およびログファイルへの書き出し、保存
            bw.write("日時："+sdate+"　状況：開始\r\n");

            //Mathクラスのsinを利用してsinの算出
            double sin_para = 30;
            out.println("数値："+sin_para+"のsinの値は"+Math.sin(sin_para)+"です<br>");
            //ログファイルの時間再取得の結果がわかりにくいためsleepで一度間をおく
            Thread.sleep(1000);
            
            //日時の再取得およびログファイルへの書き出し、保存
            date = new Date();
            sdf = new SimpleDateFormat("yyyy年MM月dd日HH時mm分ss秒");
            sdate = sdf.format(date);
            bw.write("日時："+sdate+"　状況：終了\r\n");
            bw.close();

            //以下ログファイルの表示
            out.println("------ログを表示します-----<br><br>");
            while((str = br.readLine()) != null){
                out.println(str+"<br>");
            }
            br.close();
        %>
    </body>
</html>
