 <%-- 
    Document   : comment
    Created on : 5 Mar, 2022, 6:34:17 PM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.Date,java.util.*" pageEncoding="UTF-8"%>
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
           Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
           Statement st = cn.createStatement();
           ResultSet rs = st.executeQuery("Select * from youtube where email='"+email+"'");
           if(rs.next()){
               if(request.getParameter("msg")!=null && request.getParameter("vcode")!=null){
                   String msg = request.getParameter("msg");
                String vcode = request.getParameter("vcode");
                
                        Date date = new Date();
                        String dt = date.toString();
                        int sn=0;
                        String code="";
                         
                            Statement st1 = cn.createStatement();
                            ResultSet rs1 = st1.executeQuery("select MAX(sn) from comment");
                            if(rs1.next()){
                                sn=rs1.getInt(1);
                            }
                            sn=sn+1;
                        
                         
                        LinkedList l = new LinkedList();
                        for(char p='A';p<='Z';p++){
                            l.add(p+"");
                        }
                        for(char p='a';p<='z';p++){
                            l.add(p+"");
                        }
                        for(char p='0';p<='9';p++){
                            l.add(p+"");
                        }
                        Collections.shuffle(l);
                        for(int i=1;i<6;i++){
                            code=code+l.get(i);
                        }
                        code=code+"_"+sn;
                        
                        PreparedStatement ps = cn.prepareStatement("insert into comment value(?,?,?,?,?,?)");
                        ps.setInt(1,sn);
                        ps.setString(2,code);
                        ps.setString(3,email);
                        ps.setString(4,msg);
                        ps.setString(5,dt);
                        ps.setString(6,vcode);
                        if(ps.executeUpdate()>0){
                            
                            
                            
                            String pp = "black";
                                Statement sts = cn.createStatement();
                                ResultSet rss = sts.executeQuery("select * from cuserlike where code='" +code+ "' AND email='" + email + "' AND ptr='like'");
                                if (rss.next()) {
                                    pp = "blue";
                                }
                                String pp1 = "black";
                                Statement sts1 = cn.createStatement();
                                ResultSet rss1 = sts1.executeQuery("select * from cuserlike where code='" +code+"' AND email='" + email + "' AND ptr='dislike'");
                                if (rss1.next()) {
                                    pp1 = "blue";
                                }
                            String col = "";
                                Statement st17 = cn.createStatement();
                                ResultSet rs17 = st17.executeQuery("select * from cuserlike where code='" +code+ "' AND email='" + email + "'");
                                if (rs17.next()) {
                                    col = rs17.getString("ptr");
                                }
                            
                            String cmt_like = "";
                                Statement st14 = cn.createStatement();
                                ResultSet rs14 = st14.executeQuery("select  count(*) from cuserlike where code='"+code+"' AND ptr='like'");
                                if (rs14.next()) {
                                    cmt_like = rs14.getString(1);
                                }
                                String cmt_dislike = "";
                                Statement st16 = cn.createStatement();
                                ResultSet rs16 = st16.executeQuery("select  count(*) from cuserlike where code='"+code+"' AND ptr='dislike'");
                                if (rs16.next()) {
                                    cmt_dislike = rs16.getString(1);
                                }
                            
                             %>
                              <div class="col-sm-12" >
                                                <div class="card">
                                                    <div clas="card-header"><img src="profile/<%out.print(rs.getString("code"));%>.jpg" style="widht:30px;height:50px;" class="img-fluid rounded-circle"><strong><%=rs.getString("fname")%>&nbsp;<%=rs.getString("lname")%></strong> </div>
                                                    <div class="card-body">
                                                         <p class="w3-xlarge w3-serif" id="p<%=code%>"><%=msg%></p>
                                                         <i rel="<%=code%>" ptr="like" id="like-<%=code%>" class="fa fa-thumbs-up cmt1" style="color:<%=pp%>;font-size:20px;"></i><span id="likecount-<%=code%>"><%=cmt_like%></span>
                                                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i rel="<%=code%>" ptr="dislike" id="dislike-<%=code%>"  class="fa fa-thumbs-down cmt2" style="color:<%=pp1%>;font-size:20px;"></i><span id="dislikecount-<%=code%>"><%=cmt_dislike%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                         <%
                                                         Statement st18 = cn.createStatement();
                                                         ResultSet rs18 = st18.executeQuery("select * from comment where email='"+email+"' AND code='"+code+"' AND vcode='"+vcode+"'");
                                                         if(rs18.next()){
                                                       
                                                         %>
                                                         <i style="color:blue;font-size:20px;" class="fa fa-edit" id="<%=code%>"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                          <i style="color:red;font-size:20px;"class="fa fa-trash" rel="<%=code%>"></i>
                                                          <%
                                                         } 
                                                             %>
                                                          
                                                    </div>
                                                </div>
                                            </div>
                                                             <script>
                                                            $(document).ready(function(){
                                                                var co=<%=code%>;
                                                                var pp=<%=col%>;
                                                                if(pp=="like"){
                                                                    $("#like-"+ucode).css("color","blue");
                                                                    $("#dislike-"+ucode).css("color","black");
                                                                 }
                                                                 else if(pp="dislike"){
                                                                     $("#dislike-"+ucode).css("color","blue");
                                                                    $("#like-"+ucode).css("color","black");
                                                                 }
                                                                
                                                                
                                                            });  
                                                              
                                                          </script>
                             <%
                        }
                         
               }
                  
           }
       }
       catch(Exception er){
           out.print(er.getMessage());
       }
  }
%> 