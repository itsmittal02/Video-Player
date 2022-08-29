 <%-- 
    Document   : favorite
    Created on : 8 Mar, 2022, 11:20:55 AM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String email=null ;
Cookie c[]=request.getCookies();
for(int i=0;i<c.length;i++){
    if(c[i].getName().equals("login")){
        email=c[i].getValue();
        break;
    }
}
if(email==null){
    out.print("Login");
}
else{
     try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
         Statement st = cn.createStatement();
         ResultSet rs = st.executeQuery("select * from youtube where email='"+email+"'");
         if(rs.next()){
             if(request.getParameter("code")!=null){
                 String code=request.getParameter("code");
                 String clr="";
                 Statement st1 = cn.createStatement();
                 ResultSet rs1 = st1.executeQuery("select * from favourite where email='"+email+"' AND code='"+code+"'");
                 if(rs1.next()){
                     clr=rs1.getString("color");
                 }
                 if(clr.equals("red")){
                     PreparedStatement ps = cn.prepareStatement("update favourite set color=? where email=? AND code=?");
                            ps.setString(1,"black");
                            ps.setString(2,email);
                            ps.setString(3,code);
                            if(ps.executeUpdate()>0){
                                out.print("black");
                            }
                 }
                 else if(clr.equals("black")){
                     PreparedStatement ps = cn.prepareStatement("update favourite set color=? where email=? AND code=?");
                            ps.setString(1,"red");
                            ps.setString(2,email);
                            ps.setString(3,code);
                            if(ps.executeUpdate()>0){
                                out.print("red");
                            }
                 }
                 
                 else{
                     PreparedStatement ps = cn.prepareStatement("insert into favourite values(?,?,?)");
                            ps.setString(1,email);
                            ps.setString(2,code);
                            ps.setString(3,"red");
                            if(ps.executeUpdate()>0){
                                out.print("red");
                            }
                 }
             }
         }
     }
     catch(Exception er){
         out.print(er.getMessage());
     }
}
%> 