import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.RequestDispatcher;
import java.sql.*;


public class Challenge10_12 extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //文字化けを防止するための文字コードセット
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        //変数宣言
        PrintWriter out = response.getWriter();
        Connection db_con = null;
        PreparedStatement db_st = null;
        ResultSet db_data = null;

        try {
            //DBへのアクセス
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db","root","");
            
            //セッションの作成および取得
            HttpSession session = request.getSession(true);
            
            //DBへアクセスできていた場合の処理
            if(db_con != null){
                //jspへ処理を返すためのdispatch変数の定義
                RequestDispatcher dispatch = request.getRequestDispatcher("Challenge10_12.jsp");
                
                //-----------------------------------「ログイン」ボタンが押された場合の動作-----------------------------------
                if(request.getParameter("b_login") != null){
                    //「ユーザーネーム」と「パスワード」に入力された値をSQL文にセットし実行
                    db_st = db_con.prepareStatement("SELECT * FROM product_user WHERE userName=? AND userPassword=?");
                    db_st.setString(1, request.getParameter("name"));
                    db_st.setString(2, request.getParameter("pass"));
                    db_data = db_st.executeQuery();
                    
                    //SQL文実行結果がなかった場合の処理
                    if(db_data.next() == false){
                        
                        //「ユーザーネーム」または「パスワード」に入力された値が空欄であるかで分岐し、
                        //jspファイルに処理を戻して結果を表示
                        if(request.getParameter("name").equals("") || request.getParameter("pass").equals("")){
                            request.setAttribute("check", "空欄です");
                        }else{
                            request.setAttribute("check", "異なります");
                        }
                        dispatch.forward(request, response);
                        
                    //SQL文実行結果があった場合の処理
                    }else{
                        //「ユーザーネーム」があるレコードを検索し、login_statusを*に変更
                        db_st = db_con.prepareStatement("UPDATE product_user SET login_status='*' WHERE userName=?");
                        db_st.setString(1, request.getParameter("name"));
                        db_st.executeUpdate();

                        //jspをログイン後の仕様に変更するための処理をし、jspへ処理を戻す
                        session.setAttribute("login_disp", "none");
                        session.setAttribute("product_disp", "block");
                        session.setAttribute("title", "商品在庫管理システム");
                        session.setAttribute("name",request.getParameter("name"));
                        dispatch.forward(request, response);
                    }
                
                //-----------------------------------「商品情報登録」ボタンが押された場合の動作-----------------------------------
                }else if(request.getParameter("b_product_regist_disp") != null){
                    //「商品情報登録」画面の表示・非表示によって分岐し、反転させてjspへ処理を戻す
                    if(session.getAttribute("product_regist_disp").equals("block")){
                        session.setAttribute("product_regist_disp", "none");
                        dispatch.forward(request, response);
                    }else{
                        session.setAttribute("product_regist_disp", "block");
                        dispatch.forward(request, response);
                    }
                    
                //-----------------------------------「商品情報登録」画面の「登録」ボタンが押された場合の動作-----------------------------------
                }else if(request.getParameter("b_product_regist") != null){
                    
                    //「製品名」と「カテゴリ」が入力されている場合の動作
                    if(!(request.getParameter("p_name").equals("")) && !(request.getParameter("p_category").equals(""))){
                        
                        //製品管理用のテーブルをproductIDの昇順でソートして表示するためのSQL文を実行
                        PreparedStatement db_id = db_con.prepareStatement("SELECT * FROM product_manage ORDER BY productID");
                        db_data = db_id.executeQuery();
                        
                        //製品登録用のSQL文を構成
                        db_st = db_con.prepareStatement("INSERT INTO product_manage VALUES (?,?,?)");

                        //----------------------以下productID自動登録の処理----------------------
                        
                        //製品管理用のテーブル内にデータが存在していなかった場合の処理
                        if(db_data.next() == false){
                            //productIDを0001に設定する
                            db_st.setString(1, "0001");
                            
                        //製品管理用のテーブル内にデータが存在していた場合の処理
                        }else{
                            //取得しているデータの最後のレコードに行を移動
                            db_data.last();
                            
                            //最後のレコードのproductIDが9999より下なら、次の番号（最後のレコードのIDに+1した値）をproductIDに設定する
                            if(Integer.parseInt(db_data.getString("productID")) < 9999){
                                db_st.setString(1, String.format("%04d",(Integer.parseInt(db_data.getString("productID")) + 1)));
                                
                            //最後のレコードのproductIDが9999以上なら、jspにIDが限界値と表示する
                            }else{
                                request.setAttribute("product_regist", "IDが限界値です<br>登録する前に商品を削除してください");
                                dispatch.forward(request, response);
                            }
                        }
                        //----------------------productID自動登録の処理ここまで----------------------
                        
                        //「製品名」と「カテゴリ」をSQLにセットし実行、jspに処理を戻し文章を表示する
                        db_st.setString(2, request.getParameter("p_name"));
                        db_st.setString(3, request.getParameter("p_category"));
                        db_st.executeUpdate();
                        request.setAttribute("product_regist", "商品を登録しました");
                        dispatch.forward(request, response);

                     //「製品名」か「カテゴリ」が空欄である場合の動作
                    }else if(request.getParameter("p_name").equals("") || request.getParameter("p_category").equals("")){
                        request.setAttribute("product_regist", "製品名またはカテゴリが空欄です");
                        dispatch.forward(request, response);
                    }
 
                //-----------------------------------「商品情報一覧」ボタンが押された場合の動作-----------------------------------
                }else if(request.getParameter("b_product_list_disp") != null){
                    //「商品情報一覧」画面の表示・非表示によって分岐し、反転させてjspへ処理を戻す
                    if(session.getAttribute("product_list_disp").equals("block")){
                        session.setAttribute("product_list_disp", "none");
                        dispatch.forward(request, response);
                    }else{
                        session.setAttribute("product_list_disp", "block");
                        dispatch.forward(request, response);
                    }

                //-----------------------------------「商品情報登録」画面の「表示」ボタンが押された場合の動作-----------------------------------
                }else if(request.getParameter("b_product_list") != null){
                    
                    //product_manageの要素をすべて表示するSQL文を実行
                    db_st = db_con.prepareStatement("SELECT * FROM product_manage");
                    db_data = db_st.executeQuery();
                    
                    //表示するものがなかった場合はjspに処理を戻し文章を表示
                    if(db_data.next() == false){
                        request.setAttribute("product_list_error", "商品が登録されていません");
                        dispatch.forward(request, response);
                    //表示するものがあった場合の動作
                    }else{
                        //最終行の行数を取得し、取得したデータの行数を1行目の一つ前へ
                        db_data.last();
                        int lastRow = db_data.getRow();
                        db_data.beforeFirst();
                        
                        //データ格納用の多元配列productを最終行とカラム数で定義する
                        //一番目の[]は行を、二番目の[]はカラムを表す
                        String[][] product = new String[lastRow][3];
                        
                        //ループ用の変数iを定義
                        int i = 0;
                        
                        //データがある限り配列に各行のカラムの値を取得して配列に代入、配列渡しつつjspに処理を戻す
                        while(db_data.next()){
                            product[i][0] = db_data.getString("productID");
                            product[i][1] = db_data.getString("productName");
                            product[i][2] = db_data.getString("productCategory");
                            i++;
                        }
                        session.setAttribute("product_list", product);
                        dispatch.forward(request, response);
                    }
                    
                //-----------------------------------「ログアウト」ボタンが押された場合の動作-----------------------------------
                }else if(request.getParameter("b_logout") != null){
                    //ログイン中の「ユーザー名」があるレコードを検索し、login_statusを-に変更
                    db_st = db_con.prepareStatement("UPDATE product_user SET login_status='-' WHERE userName=?");
                    db_st.setString(1, session.getAttribute("name").toString());
                    db_st.executeUpdate();
                    
                    //jspをログイン前の仕様に変更するための処理をし、jspへ処理を戻す
                    session.setAttribute("login_disp", "block");
                    session.setAttribute("product_disp", "none");
                    session.setAttribute("product_regist_disp", "none");
                    session.setAttribute("product_list_disp", "none");
                    session.setAttribute("title", "ログイン画面");
                    session.setAttribute("name", null);
                    dispatch.forward(request, response);
                }else{
                    out.println("不正なアクセスです");
                }

            //DBへアクセスできなかった場合の動作
            }else{
                out.println("データベースへの接続に失敗しました");
            }

        //SQLのエラー表示
        }catch(SQLException e_sql){
            out.println("接続時にエラーが発生しました："+e_sql.toString());
        //NullPointerExceptionのエラー表示（このプログラムでは主に入力時に発生すると思われるので入力用のエラーを表示）
        }catch(NullPointerException e_null){
            out.println("予期せぬ値が入力されました<br>");
            out.println("処理を中断します");
        //汎用的なエラー表示
        }catch(Exception e){
            out.println("予期せぬエラーが発生しました："+e.toString());
        }finally{
            //dbに接続していた場合はdbをクローズする
            if(db_con != null){
                try{
                    db_con.close();
                }catch(Exception e_con){
                    System.out.println(e_con.getMessage());
                }
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
