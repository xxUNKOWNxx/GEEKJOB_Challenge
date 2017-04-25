import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class Challenge10_09 extends HttpServlet {
    
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
                out.println("データベース："+db_con.getCatalog()+"に接続しました"+"<br>");
            }
            
            if(request.getParameter("id_box") == ""){
                out.println("空欄が入力されました<br>");
                out.println("処理を中断します");
                db_con.close();
                return;
            }
            
            db_st = db_con.prepareStatement("SELECT * FROM profiles WHERE profilesID = ?");
            db_st.setInt(1, Integer.parseInt(request.getParameter("id_box")));
            db_data = db_st.executeQuery();
            if(db_data.next() == false){
                out.println("該当するIDを持つレコードはありませんでした<br>");
                return;
            }
            db_data.close();
            db_st.close();

            request.setCharacterEncoding("UTF-8");
            db_st = db_con.prepareStatement("DELETE FROM profiles WHERE profilesID = ?");
            db_st.setInt(1, Integer.parseInt(request.getParameter("id_box")));
            db_st.executeUpdate();
            out.println("DBからデータが削除されました");

            db_st.close();
            db_con.close();
            
        }catch(SQLException e_sql){
            out.println("接続時にエラーが発生しました："+e_sql.toString());
        }catch(NullPointerException e_null){
                out.println("予期せぬ値が入力されました<br>");
                out.println("処理を中断します");
        }catch(Exception e){
            out.println("接続時にエラーが発生しました："+e.toString());
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
