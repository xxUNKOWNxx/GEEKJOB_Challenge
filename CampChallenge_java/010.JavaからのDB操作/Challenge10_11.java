import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.text.SimpleDateFormat;

public class Challenge10_11 extends HttpServlet {
    
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        Connection db_con = null;
        PreparedStatement db_st = null;
        ResultSet db_data = null;

        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            db_con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Challenge_db","root","");
            if(db_con != null){
                out.println("データベース："+db_con.getCatalog()+"に接続しました"+"<br><br>");
            }

            //検索条件を文字化けせずに受け取るための文字エンコードセット
            request.setCharacterEncoding("UTF-8");
            //誕生日を取得するための形式定義
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            //検索する文言を設定するための変数
            String search_para = "";

            //各項目が空欄か否かのフラグ用変数
            int name=0, age=0, birthday=0;
            
            //各項目の入力された値を格納
            String name_search = request.getParameter("name_box");
            String age_search = request.getParameter("age_box");
            String byear_search = request.getParameter("b_year");
            
            //生年月日を連結するための変数
            String string_birthday = "";
            
            //--------------------------------以下各項目が空欄かチェックし、その結果によって検索式を設定する式群--------------------------------
            if(name_search != ""){
                search_para += " WHERE name LIKE ?";
                name++;
            }
            
            if(age_search != ""){
                if(name!=0){
                    search_para +=" AND age = ?";
                    age+=2;
                }else{
                    search_para +=" WHERE age = ?";
                    age++;
                }
            }
            
            if(byear_search != ""){
                //生年月日の年数が入力されていた場合のみ、セレクト文のボックス内数値を取得し、yyyy-mm-ddの形式に繋げて連結用変数に格納する
                string_birthday = byear_search+"-"+request.getParameter("b_month")+"-"+request.getParameter("b_day");
                if(name!=0 || age!=0){
                    search_para +=" AND birthday = ?";
                    birthday += name + age;
                }else{
                    search_para +=" WHERE birthday = ?";
                    birthday++;
                }
            }
            //--------------------------------検索式設定ここまで--------------------------------
            
            //検索式を設定
            db_st = db_con.prepareStatement("SELECT * FROM profiles"+search_para);
            
            //--------------------------------以下検索式が設定されたかをチェックし、その結果によって？に値を設定する式群--------------------------------
            if(name!=0){
                db_st.setString(name,"%"+name_search+"%");
            }
            
            if(age!=0){
                db_st.setInt(age, Integer.parseInt(age_search));
            }
            
            if(birthday!=0){
                db_st.setDate(birthday, new java.sql.Date(dateFormat.parse(string_birthday).getTime()));
            }
            //--------------------------------値設定ここまで--------------------------------
            
            if(search_para.equals("")){
                out.println("空欄が入力されたため、データを全表示します<br>");
            }else{
                out.println("検索結果を表示します<br>");
            }
            db_data = db_st.executeQuery();
            
            if(db_data.next() == false){
                out.println("条件に一致するレコードはありませんでした<br>");
                db_data.close();
                db_st.close();
                db_con.close();
                return;
            }
            
            db_data.beforeFirst();
            while(db_data.next()){
                out.println("ID："+db_data.getInt("profilesID")+"｜名前："+db_data.getString("name")+"｜番号："+db_data.getString("tell")+"｜年齢："+db_data.getInt("age")+"｜誕生日："+db_data.getDate("birthday")+"<br>");
            }
            
            db_data.close();
            db_st.close();
            db_con.close();
            
        }catch(SQLException e_sql){
            out.println("接続時にエラーが発生しました："+e_sql.toString());
        }catch(NullPointerException e_null){
                out.println("予期せぬ値が入力されました<br>");
                out.println("処理を中断します");
        }catch(Exception e){
            out.println("予期せぬエラーが発生しました："+e.toString());
        }finally{
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
