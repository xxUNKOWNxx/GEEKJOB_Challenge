<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Challenge4</title>
    </head>
    <body>
        <%!
            String[][] myPro(int id){

                String prof[] = new String [4];
                String prof_master[][] = {
                    {"11", "田中太郎", "1990/01/01", "東京都"},
                    {"22", "山本花子", "2001/12/31", null},
                    {"33", "鈴木一郎", "1979/08/15", "神奈川県"}
                };
                return prof_master;

                /*
                for(int i=0; i<3; i++){
                    if(id == Integer.parseInt(prof_master[i][0])){
                        
                        for(int j=0; j<4; j++){
                            prof[j] = prof_master[i][j];
                        }
                        return prof;
                        
                    }
                }
                return null;
                */
            }
        %>
        <%
            int id = 11;
            int limit = 2;
            String prof[][] = new String [3][4];
            
            prof = myPro(id);
            if(prof != null){
            
                for(int i=0; i<3; i++){
                    
                    for(int j=1; j<4; j++){
                        if(prof[i][j] == null){
                            continue;
                        }
                        out.println(prof[i][j]+"<br>");
                    }
                    
                    out.println("<br>");
                    
                    if(i == limit-1){
                        break;
                    }
                }
                
            }else{
                    out.println("該当するデータはありません<br>");
            }
        %>
    </body>
</html>
