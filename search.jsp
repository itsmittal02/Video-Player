 <%-- 
    Document   :search_video
    Created on : Mar 5, 2022, 3:35:12 PM
    Author     : user
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
  if(request.getParameter("txt")!=null){
      String txt = request.getParameter("txt");
      try{
          Class.forName("com.mysql.jdbc.Driver");
          Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
          Statement st = cn.createStatement();
          String arr[] = txt.split(" ");
          String sql =  "select * from video where vtitle like '%"+txt+"%' ";
          for(int i=0;i<arr.length;i++){
              sql = sql+" OR vtitle like '%"+arr[i]+"%' AND status=0";
          }
          %>
           <div class="col-sm-12" style="background-color:white;">
                     <table class="table table-borderless w3-card" >
                         <tr ><td> <h3   style="color:green"><strong ><center>Search Result</center></strong></h3> </td></tr>
                     </table>
                 </div>
                     <div class="col-sm-12"></div>
          
          <%
           ResultSet rs = st.executeQuery(sql);
           while(rs.next()){
          
          %>
          <div class="col-sm-3 video-block" >	
                                    <table class="table table-borderless w3-card-4 ">
                                      <tr >
                                        <td><a href="play_video.jsp?code=<%=rs.getString("code")%>&ccode=<%=rs.getString("ccode")%>"><img src="profile/<%=rs.getString("code")%>.jpg" class="img-fluid" style="width:100%"></a></td>
                                       </tr>
                                       <tr>
                                           <td><h5><strong><%=rs.getString("vtitle")%></strong></h5></td> 
                                       </tr>
                                    </table>
                         </div>
          
          <%
           }
      }
      catch(Exception er){
          out.print(er.getMessage());
      }
  } 
%>






















 