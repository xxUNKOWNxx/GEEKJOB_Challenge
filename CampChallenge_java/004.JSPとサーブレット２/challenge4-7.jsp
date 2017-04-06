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
            String[] myPro(int id){

                String prof[] = new String [4];
                String prof_master[][] = {
                    {"11", "田中太郎", "1990/01/01", "東京都"},
                    {"22", "山本花子", "2001/12/31", "千葉県"},
                    {"33", "鈴木一郎", "1979/08/15", "神奈川県"}
                };

                for(int i=0; i<3; i++){
                    if(id == Integer.parseInt(prof_master[i][0])){
                        
                        for(int j=0; j<4; j++){
                            prof[j] = prof_master[i][j];
                        }
                        return prof;
                        
                    }
                }
                return null;
            }
        %>
        <%
            int id = 11;
            String prof[] = new String [4];
            
            prof = myPro(id);
            if(prof != null){
            
                for(int i=1; i<4; i++){
                    out.println(prof[i]+"<br>");
                }
                
            }else{
                    out.println("該当するデータはありません<br>");
            }
        %>
    </body>
</html>
