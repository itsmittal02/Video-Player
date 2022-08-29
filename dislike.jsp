 <%-- 
    Document   : dislike
    Created on : 9 Mar, 2022, 11:08:16 PM
    Author     : Sharad Mittal
--%>

 <%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>
<%               
String email=null ;
  Cookie c[] = request.getCookies();
  for(int i=0;i<c.length;i++){
      if(c[i].getName().equals("login")){
          email = c[i].getValue();
          break;
      }
  }
  if(email==null){
      out.print("Login");
  }
else{
    try{       
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn =DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                                Statement st =cn.createStatement(); 
                                ResultSet rs = st.executeQuery("select * from youtube where email='"+email+"'");
                                if(rs.next()){
                                        if(request.getParameter("code")!=null  &&  request.getParameter("ptr")!=null ){
                                                          String code =request.getParameter("code"); 
                                                          String ptr =request.getParameter("ptr"); 
                                                          String pattern="";
                                                          Statement st1 =cn.createStatement(); 
                                                          ResultSet rs1 = st1.executeQuery("select * from userlike where email='"+email+"' AND code='"+code+"'");
                                                          if(rs1.next()){ 
                                                              pattern =rs1.getString("ptr");
                                                          }
                                                          if(ptr.equals(pattern)){
                                                                                PreparedStatement ps =cn.prepareStatement("delete from userlike  where email='"+email+"' AND code='"+code+"'"); 
                                                                                if(ps.executeUpdate()>0){
                                                                                     out.print("black"); 
                                                                                } 
                                                          }    
                                                          else if(pattern.equals("like")){ 
                                                                                PreparedStatement ps =cn.prepareStatement("update userlike set ptr=?   where email=? AND code=?"); 
                                                                                ps.setString(1,"dislike");
                                                                                ps.setString(2,email);
                                                                                ps.setString(3,code);  
                                                                                if(ps.executeUpdate()>0){
                                                                                     out.print("blue"); 
                                                                                } 
                                                          } 
                                                         else{
                                                                    PreparedStatement ps =cn.prepareStatement("insert into userlike values(?,?,?)");
                                                                    ps.setString(1,email);
                                                                    ps.setString(2,code);
                                                                    ps.setString(3,ptr); 
                                                                    if(ps.executeUpdate()>0){
                                                                         out.print("blue");
                                                                    } 
                                                         }
                                                                            String like=""; 
                                                                               Statement st3 =cn.createStatement(); 
                                                                               ResultSet rs3 = st3.executeQuery("select  count(*) from userlike where code='"+code+"' AND ptr='like'");
                                                                               if(rs3.next()){
                                                                                   like=rs3.getString(1);
                                                                               } 
                                                                               out.print("-"+like); 
                                                                               
                                                                               String dislike=""; 
                                                                               Statement st2 =cn.createStatement(); 
                                                                               ResultSet rs2 = st2.executeQuery("select  count(*) from userlike where code='"+code+"' AND ptr='dislike'");
                                                                               if(rs2.next()){
                                                                                   dislike=rs2.getString(1);
                                                                               } 
                                                                               out.print("-"+dislike); 
 
                                         cn.close();
                                        }
                                }
             }
            catch(Exception e){
                out.println(e.getMessage());
             }
   }
%>