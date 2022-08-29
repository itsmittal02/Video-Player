<%-- 
    Document   : update_channel
    Created on : Dec 18, 2021, 7:01:02 PM
    Author     : user
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
 <%
   
   Cookie c[]= request.getCookies();
   String email=null;
    for(int i=0; i<c.length ; i++){
       if(c[i].getName().equals("login")){
           email = c[i].getValue();
           break;
       }
   }
   
if(email!=null){
    if(request.getParameter("code")!=null && request.getParameter("msg")!=null){
        String code = request.getParameter("code");
        String msg = request.getParameter("msg");
        
        try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
           PreparedStatement ps = cn.prepareStatement("update channel set cname=? where email=? AND code=? AND status=0");
           ps.setString(1,msg);
           ps.setString(2,email);
           ps.setString(3,code);
           
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
