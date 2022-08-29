<%-- 
    Document   : insert_reg
    Created on : Dec 8, 2021, 4:26:44 PM
    Author     : user
--%>
 
<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>

<%
    if (request.getParameter("fname").length() == 0 || request.getParameter("lname").length() == 0 || request.getParameter("email").length() == 0
            || request.getParameter("pass").length() == 0 || request.getParameter("dob").length() == 0
            || request.getParameter("gender").length() == 0 || request.getParameter("country").length() == 0) {
        response.sendRedirect("index.jsp?empty=1");
    }
    else {
      String fname = request.getParameter("fname");
      String lname= request.getParameter("lname");
      String email  = request.getParameter("email");
      String pass   = request.getParameter("pass");
      String dob = request.getParameter("dob");
      String gender = request.getParameter("gender");
      String country = request.getParameter("country");
      
      
      int sn=0 ;
      try{
          Class.forName("com.mysql.jdbc.Driver");
         Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
         Statement st = cn.createStatement();
         ResultSet rs = st.executeQuery("select MAX(sn) from youtube");
         if(rs.next()){
             sn = rs.getInt(1);
         }
         sn = sn+1 ;
      }
      catch(Exception e){
          out.print(e.getMessage());
      }
      String code =  " " ;
       LinkedList l = new LinkedList();
      for(char c='A';c<='Z';c++){
          l.add(c);
      }
      for(char c='0';c<='9';c++){
          l.add(c);
      }
      for(char c='a';c<='z';c++){
          l.add(c);
      }
      Collections.shuffle(l);
      for(int i=0;i<=6;i++){
          code = code+l.get(i);
      }
      code = code+"_"+sn ;
      try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
          PreparedStatement ps = cn.prepareStatement("insert into youtube values(?,?,?,?,?,?,?,?,?)");
          ps.setInt(1,sn);
          ps.setString(2,code);
          ps.setString(3,fname);
          ps.setString(4,lname);
          ps.setString(5,email);
          ps.setString(6,pass);
          ps.setString(7,dob);
          ps.setString(8,gender);
          ps.setString(9,country);
          
          if(ps.executeUpdate()>0){
              response.sendRedirect("user_image.jsp?code="+code+"&success=1");
          }
          else{
               response.sendRedirect("index.jsp?Try_again=1");
              

          }
         
      }
      catch(Exception er){
          out.print(er.getMessage());
      }
      
  }
  
    
%>