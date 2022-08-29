<%-- 
    Document   : add_channel
    Created on : Dec 13, 2021, 1:09:14 AM
    Author     : user
--%>

 
 <%@page contentType="text/html" import="java.sql.*,java.util.*,java.util.Date"  pageEncoding="UTF-8"%>
<%
   String email=null ;
   Cookie c[] = request.getCookies();
   for(int i=0;i<c.length;i++){
       if(c[i].getName().equals("login")){
           email = c[i].getValue();
       }
   }
       if(email==null){
            response.sendRedirect("index.jsp");
       }
    
   if(request.getParameter("cname").length() == 0 || request.getParameter("category").length() == 0  ){
       response.sendRedirect("dashboard.jsp?empty=1");
   }
   else{
                    
                    int sn=0 ;
                    int status=0;
                    String cname=request.getParameter("cname");
                     String category=request.getParameter("category");
                      
                     
                try{
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                     Statement st =  cn.createStatement();
                     ResultSet rs = st.executeQuery("select MAX(sn) from channel");
                     if(rs.next()){
                         sn = rs.getInt(1);
                     }
                     sn = sn+1 ;

                }
                catch(Exception ep){
                       out.print(ep.getMessage());
                }
                String code= "" ;
                LinkedList l = new LinkedList();
                for(char C='A';C<='Z';C++){
                    l.add(C+"");
                }
                for(char C='a';C<='z';C++){
                    l.add(C+"");
                }
                for(char C='0';C<='9';C++){
                    l.add(C+"");
                }
                Collections.shuffle(l);
                for(int i=0;i<=6;i++){
                    code = code+l.get(i);
                }
                code = code+"_"+sn ;


               
              Date date = new Date();
              String  cdate =date.toString();
               try{
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                   PreparedStatement ps = cn.prepareStatement("insert into channel values(?,?,?,?,?,?,?)");
                   ps.setInt(1,sn);
                   ps.setString(2,code);
                   ps.setString(3,cname);
                   ps.setString(4,cdate);
                   ps.setString(5,category);
                   ps.setString(6,email);
                   ps.setInt(7,status);
                    
                    
                   
                   if(ps.executeUpdate()>0){
                       response.sendRedirect("channel_image.jsp?code="+code+"&success=1");
                   }
                   else{
                      response.sendRedirect("dashboard.jsp?again=1");
                   }


               }
               catch(Exception en){
                   out.print(en.getMessage());
               }
   }







%>
  