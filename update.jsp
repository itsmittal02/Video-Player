<%-- 
    Document   : update
    Created on : Dec 13, 2021, 12:27:58 AM
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
    if(email==null){
        response.sendRedirect("index.jsp");
    }
    else{
        if(request.getParameter("fname").length()==0 || request.getParameter("lname").length()==0|| request.getParameter("dob").length()==0 
                || request.getParameter("gender").length()==0 || request.getParameter("city").length()==0){
            response.sendRedirect("edit_profile.jsp?empty=1");
        }
        else{
            String fname=request.getParameter("fname");
            String lname=request.getParameter("lname");
             String dob=request.getParameter("dob");
            String gender=request.getParameter("gender");
            String city=request.getParameter("city");
             
        
    try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                PreparedStatement ps = cn.prepareStatement("update youtube set fname=?,lname=?,dob=?,gender=?,city=? where email=?");
                ps.setString(1,fname);
                ps.setString(2,lname);
                ps.setString(3,dob);
                ps.setString(4,gender);
                 ps.setString(5,city);
                ps.setString(6,email);
                 if(ps.executeUpdate()>0){
                    response.sendRedirect("edit_profile.jsp?success=1");
                }
                else{
                    response.sendRedirect("edit_profile.jsp?empty=1");
                 }
                cn.close();
           }
               catch(Exception e){
                   out.println(e.getMessage());
                 }
           }
               
      }
         
    
    %>

