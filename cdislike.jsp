<%-- 
    Document   : cdislike
    Created on : Mar 13, 2022, 4:52:19 PM
    Author     : user
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>

  <%
                    Cookie c[]=request.getCookies();
                    String email=null;
                    for(int i=0;i<c.length ;i++){
                        if(c[i].getName().equals("login")){
                            email = c[i].getValue();
                            break;
                        }
                    }
                 if(email==null){
                       // response.sendRedirect("index.jsp");
                          out.print("login");
                    }
                     
                 else{	 		
		          try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn =DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                                Statement st =cn.createStatement();
                                ResultSet rs = st.executeQuery("select * from youtube where email='"+email+"'");
                                if(rs.next()){
                                if(request.getParameter("code")!=null && request.getParameter("ptr")!=null){
                                 String code=request.getParameter("code"); 
                                 String ptr=request.getParameter("ptr"); 
                                 String pattern="";
                                 Statement sp =cn.createStatement();
                                ResultSet rp = sp.executeQuery("select * from cuserlike where email='"+email+"' AND code='"+code+"' ");
                                if(rp.next()){
                                    pattern= rp.getString("ptr");
                                }
                               
                                if(ptr.equals(pattern)){
                                 
                                        PreparedStatement rk =cn.prepareStatement("delete from cuserlike  where email='"+email+"' AND code='"+code+"' ");
                                        if(rk.executeUpdate()>0){
                                             out.print("gray");
			        }
			   }
							
                            else if(pattern.equals("like")){
			       PreparedStatement rm =cn.prepareStatement ("update cuserlike set ptr=? where email=? AND code=?");
				 rm.setString(1,"dislike");
                                  rm.setString(2,email);
                                  rm.setString(3,code);
                                if(rm.executeUpdate()>0){
				    out.print("blue");
					}
					  
				   }
                            else{
                                   PreparedStatement ps = cn.prepareStatement("insert into cuserlike values(?,?,?)");
                                   ps.setString(1,email);
                                   ps.setString(2,code);
                                   ps.setString(3,ptr);
                                    if(ps.executeUpdate()>0){
                                        out.print("blue");
                                       }
				 
				}
                                
                                 String like=""; 
                            Statement st1 =cn.createStatement(); 
                            ResultSet rs1 = st1.executeQuery("select  count(*) from cuserlike where code='"+code+"' AND ptr='like'");
                            if(rs1.next()){
                                like=rs1.getString(1);
                            } 
                            out.print("-"+like); 

                            String dislike=""; 
                            Statement st2 =cn.createStatement(); 
                            ResultSet rs2 = st2.executeQuery("select  count(*) from cuserlike where code='"+code+"' AND ptr='dislike'");
                            if(rs2.next()){
                                dislike=rs2.getString(1);
                            } 
                            out.print("-"+dislike); 
 
                                 cn.close();
			    }
		        } 
                      }    
                     catch(Exception ep){
                       out.print(ep.getMessage());
             
                    }
                 }
            
    %> 

