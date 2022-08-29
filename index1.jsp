<%-- 
    Document   : index1
    Created on : 11 Aug, 2022, 5:42:20 PM
    Author     : Sharad Mittal
--%>
  
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
         try{
             Class.forName("com.mysql.jdbc.Driver");
             Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
             Statement st = cn.createStatement();
             ResultSet rs = st.executeQuery("select * from channel where status=0");
             while(rs.next()){
                 String code=rs.getString("code");
                 %>
                 <div class="col-sm-12" style="background-color:white;">
                     <table class="table table-borderless w3-card" >
                         <tr ><td><%out.print(rs.getString("cname"));%></td><td> <a style="float:right;text-decoration: none;"   href="see_all.jsp?code=<%=rs.getString("code")%>"><b>See All</a></b> </td></tr>
                     </table>
                 </div>
                     <div class="col-sm-12"></div>
                     <%
                      Statement st1 = cn.createStatement();
                      ResultSet rs1 = st1.executeQuery("select * from video where ccode='"+code+"' AND status=0  order by rand() limit 0,4");
                      while(rs1.next()){
                          %>
                          <div class="col-sm-3 video-block" >	
                                    <table class="table table-borderless w3-card-4 ">
                                      <tr >
                                        <td ><a href="play_video.jsp?code=<%=rs1.getString("code")%>&ccode=<%=rs.getString("code")%>"><img  src="profile/<%=rs1.getString("code")%>.jpg" class="img-fluid" style="width:100%"></a></td>
                                       </tr>
                                       <tr>
                                           <td><h5 ><strong><%=rs1.getString("vtitle")%></strong></h5></td> 
                                       </tr>
                                    </table>
                         </div>
                          
                          <%
                      }
                 
                 
                    %>
                 <%
             }
         } 
         catch(Exception er){
             out.print(er.getMessage());
         }
          
          
%>
