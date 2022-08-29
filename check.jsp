<%-- 
    Document   : check
    Created on : Dec 8, 2021, 7:13:07 PM
    Author     : user
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
 <%
     
     if(request.getParameter("email").length()==0 || request.getParameter("pass").length()==0){
	   response.sendRedirect("location:index.jsp?empty=1");
		  }
		
		else{
		       String email=request.getParameter("email");
                       String pass=request.getParameter("pass");
			  
			 try{
                                   Class.forName("com.mysql.jdbc.Driver");
                                  Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                                  Statement st =cn.createStatement();
                                 ResultSet rs = st.executeQuery("select * from youtube where email='"+email+"'");
                                 if(rs.next()){
                                            if(rs.getString("password").equals(pass)){
                                                      Cookie c = new Cookie("login",email);
                                                       c.setMaxAge(36000);
                                                        response.addCookie(c);
                                                        response.sendRedirect("index.jsp");
                                               }
						 
					    else{
					         response.sendRedirect("location:index.jsp?try_again=1");
				        	}
						
				       }
                                 
                                 
                       else{
				       response.sendRedirect("location:index.jsp?invalid_email=1");
						}
			}
                          
                 catch(NullPointerException e){
                       // response.sendRedirect("index.jsp");
                      out.print(e.getMessage());
               }
     }
    
    
    %>
