package jums;

import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * insertconfirm.jspと対応するサーブレット
 * フォーム入力された情報はここでセッションに格納し、以降持ちまわることになる
 * 直接アクセスした場合はerror.jspに振り分け
 * @author hayashi-s
 */
public class InsertConfirm extends HttpServlet {

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
        
        try{
            HttpSession session = request.getSession();
            request.setCharacterEncoding("UTF-8");//セッションに格納する文字コードをUTF-8に変更
            String accesschk = request.getParameter("ac");
            if(accesschk ==null || (Integer)session.getAttribute("ac")!=Integer.parseInt(accesschk)){
                throw new Exception("不正なアクセスです");
            }
            
            //-----タスク3-----
                UserDataBeans userdata = new UserDataBeans();
                userdata.setName(request.getParameter("name"));

                //-----タスク4-----
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    if(request.getParameter("year").equals("") || request.getParameter("month").equals("") || request.getParameter("day").equals("")){
                        userdata.setBirthday(new java.sql.Date(dateFormat.parse("1000-01-01").getTime()));
                    }else{
                        //-----タスク6-----
                            userdata.setBirthday(new java.sql.Date(dateFormat.parse(request.getParameter("year") + "-" + request.getParameter("month") + "-" + request.getParameter("day")).getTime()));
                        //-----タスク6-----
                    }
                //-----タスク4-----

                userdata.setType((request.getParameter("type") == null) ? 0 : (Integer.parseInt(request.getParameter("type"))));
                userdata.setTell(request.getParameter("tell"));
                userdata.setComment(request.getParameter("comment"));
                
            //-----タスク3-----
            
            System.out.println("Session updated!!");
            
            //-----タスク3-----            
                session.setAttribute("udb", userdata);
            //-----タスク3-----
            
            //-----タスク5-----
                //入力された値を保持しておくためにセッションに格納
                session.setAttribute("year", request.getParameter("year"));
                session.setAttribute("month", request.getParameter("month"));
                session.setAttribute("day", request.getParameter("day"));
            //-----タスク5-----
                
            request.getRequestDispatcher("/insertconfirm.jsp").forward(request, response);
        }catch(Exception e){
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
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
