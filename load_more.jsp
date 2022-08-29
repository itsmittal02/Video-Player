<%-- 
    Document   : load_more
    Created on : 8 Aug, 2022, 10:13:42 PM
    Author     : Sharad Mittal
--%>

 
 
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
 <%
  if(request.getParameter("code")!=null && request.getParameter("num")!=null){
      String code = request.getParameter("code");
       
       try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                 Statement st = cn.createStatement();
                  int id  = Integer.parseInt(request.getParameter("num"));
      
                 int start =id*4 ;
                    int flag=0;
                 ResultSet rs = st.executeQuery("select * from video where ccode='"+code+"' AND status=0 limit "+start+",4");
                 while(rs.next()){
                     flag++;
                     %>
                      <div class="col-sm-3 video-block"  id="user">	
                                    <table class="table table-borderless w3-card-4 ">
                                      <tr>
                                        <td ><a href="play_video.jsp?code=<%=rs.getString("code")%>&ccode=<%=rs.getString("ccode")%>"><img src="profile/<%=rs.getString("code")%>.jpg" class="img-fluid" style="width:100%"></a></td>
                                       </tr>
                                       <tr>
                                            <td><h5 ><strong><%=rs.getString("vtitle")%></strong></h5></td>
                                       </tr>
                                    </table>
                         </div>
                     <%
                 }
                 if(flag==4){
                     %>
           <div class="col-sm-12"><center><button class="w3-button w3-green" id="<%=(id+1)%>">Load More</button></center><br></div>

                     <%
                 }
                 
             }
             catch(Exception er){
                 out.print(er.getMessage());
             }
       
            
            
              
           
  }
 %>