<%-- 
    Document   : delete_channel
    Created on : Dec 15, 2021, 11:41:54 PM
    Author     : user
--%>

<%@page contentType="text/html" import= "java.sql.*,javax.servlet.http.Cookie "  pageEncoding="UTF-8"%>
 <% 
	 
                    Cookie c[]=request.getCookies();
                    String email=null;
                    for(int i=0;i<c.length ;i++){
                        if(c[i].getName().equals("login")){
                            email = c[i].getValue();
                            break;
                        }
                    }
                    
                    
   
if(email!=null){
    if(request.getParameter("code")!=null ){
        String code = request.getParameter("code");
         int status=1;
       
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
           PreparedStatement ps = cn.prepareStatement("update channel set status=? where  code=?");
            
           ps.setInt(1,status);
           ps.setString(2,code);
           
           if(ps.executeUpdate()>0){
               out.print("success");
           }
        }
        catch(Exception er){
            out.print(er.getMessage());
        }
    }
}
                     
          %>       
                              
                   