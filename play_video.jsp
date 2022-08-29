 <%-- 
    Document   : play_video
    Created on : 4 Mar, 2022, 3:15:29 PM
    Author     : Genius
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.Date,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>
<%
  
   Cookie c[]=request.getCookies();
                                String email=null;
                                for(int i=0;i<c.length ;i++){
                                    if(c[i].getName().equals("login")){
                                        email = c[i].getValue();
                                        break;
                                    }
                                }
if(request.getParameter("code")==null&&request.getParameter("ccode")==null){
    response.sendRedirect("index.jsp?code_err=1&ccode_err=1");
}
else{  
    String code=request.getParameter("code");
    String ccode=request.getParameter("ccode");
    
    %>
    <html>
      <head>
          <title>SMplayer</title>
	  </head>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' href='https://unpkg.com/aos@2.3.0/dist/aos.css'>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
     <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

     
    <script src="script.js"></script>
    
    <style>
         @import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";
body {
    font-family: 'Poppins', sans-serif;
    background: #fafafa;
}
p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}
a,
a:hover,
a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}
.navbar {
    padding: 15px 10px;
    background: #fff;
    border: none;
    border-radius: 0;
    margin-bottom: 40px;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
}
.navbar-btn {
    box-shadow: none;
    outline: none !important;
    border: none;
}
.line {
    width: 100%;
    height: 1px;
    border-bottom: 1px dashed #ddd;
    margin: 40px 0;
}
/* ---------------------------------------------------
    SIDEBAR STYLE
----------------------------------------------------- */
.wrapper {
    display: flex;
    width: 100%;
    align-items: stretch;
}
#sidebar {
    min-width: 250px;
    max-width: 250px;
    background: #7386D5;
    color: #fff;
    transition: all 0.3s;
}
#sidebar.active {
    margin-left: -250px;
}
#sidebar .sidebar-header {
    padding: 20px;
    background: #6d7fcc;
}
#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
}
#sidebar ul p {
    color: #fff;
    padding: 10px;
}
#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}
#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}
#sidebar ul li.active>a,
a[aria-expanded="true"] {
    color: #fff;
    background: #6d7fcc;
}
a[data-toggle="collapse"] {
    position: relative;
}
.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}
ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}
ul.CTAs {
    padding: 20px;
}
ul.CTAs a {
    text-align: center;
    font-size: 0.9em !important;
    display: block;
    border-radius: 5px;
    margin-bottom: 5px;
}
a.download {
    background: #fff;
    color: #7386D5;
}
a.article,
a.article:hover {
    background: #6d7fcc !important;
    color: #fff !important;
}
/* ---------------------------------------------------
    CONTENT STYLE
----------------------------------------------------- */
#content {
    width: 100%;
    padding: 20px;
    min-height: 100vh;
    transition: all 0.3s;
}
/* ---------------------------------------------------
    MEDIAQUERIES
----------------------------------------------------- */
@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
    #sidebarCollapse span {
        display: none;
    }
}
.fa.fa-heart{
    font-size:20px;
	cursor:pointer;
}
         
      </style>
	  <script>
         
       $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
        
           $(document).ready(function(){
               $(".btn.btn-success").click(function(){
                   var vcode=$(this).attr("rel");
                   var msg = $("#msg").val();
                    $("#msg").val("");
                   $.post(
                       "comment.jsp",{msg:msg,vcode:vcode},function(data){
                         $("#comment").prepend(data);
                         
                       }
                   );
               });
                
                $(".like").click(function(){
                    var code=$(this).attr("rel");
                    var ptr = $(this).attr("pid");
                     
                    $.post(
                        "like.jsp",{code:code,ptr:ptr},function(data){
                    
                             var dt = data.split("-");
                              if(data.trim()=="Login"){
                                 $('#myModal').modal('show'); 
                              }
                              else{
                              
                                $("#like-"+code).css("color",dt[0]);
                                $("#dislike-"+code).css("color","black");
                                $("#likecount-"+code).text(dt[1]);
                                $("#dislikecount-"+code).text(dt[2]);
                              }
                         }
                     );  
                      
                });
                $(".dislike").click(function(){
                    var code=$(this).attr("rel");
                    var ptr = $(this).attr("pid");
                    $.post(
                        "dislike.jsp",{code:code,ptr:ptr},function(data){
                              var dt = data.split("-");
                                
                                    $("#dislike-"+code).css("color",dt[0]);
                                    $("#like-"+code).css("color","black");
                                    $("#likecount-"+code).text(dt[1]);
                                    $("#dislikecount-"+code).text(dt[2]);
                              
                         }
                     );  
                      
                });
                  $(".btn.btn-danger").click(function(){
                    var code=$(this).attr("rel");
                     $.post(
                       "subscribe.jsp",{code:code},function(data){
                         var subs= data.trim();
                          
                         if(subs.equals("green")){
                             $("#sub-"+code).css("background-color",subs);
                             $("#sub-"+code).css("color","white");
                             $("#sub-"+code).text("SUBSCRIBED");
                             
                         }
                         else if(subs.equals("red")){
                             $("#sub-"+code).css("background-color",subs);
                             $("#sub-"+code).css("color","white");
                             $("#sub-"+code).text("SUBSCRIBE");
                         }
                         
                       }
                   );
                      
                     
                });
                $(".fa.fa-star").click(function(){
                    var code=$(this).attr("rel");
                     $.post(
                         "favourite.jsp",{code:code},function(data){
                            var fav = data.trim();
                             
                            if(fav=="red"){
                                $("#fav-"+code).css("color","red");
                            }
                            else if(fav=="black"){
                                $("#fav-"+code).css("color","black");
                            }
                         }
                    );
                    
                    
                    
                });
                 
           });
           $(document).on("click",".cmt1",function(){
             var code=$(this).attr("rel");
             var ptr = $(this).attr("ptr");
             $.post(
                 "cuserlike.jsp",{code:code,ptr:ptr},function(data){
                           var dt = data.split("-");
                              
                             $("#like-"+code).css("color",dt[0]);
                             $("#dislike-"+code).css("color","black");
                             $("#likecount-"+code).text(dt[1]);
                             $("#dislikecount-"+code).text(dt[2]);
                 }
                )
            });
            $(document).on("click",".cmt2",function(){
             var code=$(this).attr("rel");
             var ptr = $(this).attr("ptr");
             $.post(
                 "cuserdislike.jsp",{code:code,ptr:ptr},function(data){
                           var dt = data.split("-");
                               
                                    $("#dislike-"+code).css("color",dt[0]);
                                    $("#like-"+code).css("color","black");
                                    $("#likecount-"+code).text(dt[1]);
                                    $("#dislikecount-"+code).text(dt[2]);
                 }
                );
            });
            $(document).on("click",".fa.fa-edit",function(){
               var code = $(this).attr("id");
               var msg   = $("#p"+code).text();
                $("#p"+code).html("<textarea class='form-control' style='resize:none;width:555px;display:inline' id='d"+code+"' >"+msg+"</textarea>");
                $(this).attr("class","fa fa-save");
                $(this).css("color","#363430");
                
                
            });
             $(document).on("click",".fa.fa-save",function(){
               var code = $(this).attr("id");
               var msg   = $("#d"+code).val();
                $.post(
                    "update_comment.jsp",{code:code,msg:msg},function(data){
                    
                        if(data.trim()=="success"){
                            $("#p"+code).html(msg);
                            $("#"+code).attr("class","fa fa-edit");
                             $(this).css("color","#04ddeo");
                        }
                    }
                 )
                /* 
                 */
               
             });
            $(document).on("click",".fa.fa-trash",function(){
               var code = $(this).attr("rel");
               $.post(
                   
                    "delete_comment.jsp",{code:code},function(data){
                       if(data.trim().equals("success")){
                           $("#d-"+code).fadeOut(1000);
                       }
                    }
                 )
             
                
                
            });
	  </script>
	  <style>
              i{
                  font-size: 25px;
                  cursor:pointer;
              }
               #pk{
            transform: scale(.99);
            transition: .33s;
        }
         #pk:hover{
            transform: scale(1.1);
            z-index: 99;
        }
	  </style>
	  <body>


<div class="container">
   <div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header" style="color:white;background-color:blue">
        <h4 class="modal-title">Login</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
         <form method="post" action="check.jsp">
		  <label>Email :</label>
		  <input type="email" name="email" class="form-control"><br>
		  <label>Password:</label>
		  <input type="password" name="pass" class="form-control"><br>
		  
                  <input type="submit" value="Submit" class="btn btn-success"> 
         </form> 
       </div>

      <!-- Modal footer -->
      <div class="modal-footer">
         <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
     </div>
  </div>
</div>

    
   
    <!-- Registration--->
<div class="modal" id="register">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header" style="color:white;background-color:green">
        <h4 class="modal-title">Registration</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
         <form method="post" action="insert_reg.jsp">
		  <label>First Name :</label>
		  <input type="text" name="fname" class="form-control"><br>
                  <label>Last Name :</label>
		  <input type="text" name="lname" class="form-control"><br>
                  <label>Email </label>
		  <input type="email" name="email" class="form-control"><br>
		  <label>Password:</label>
		  <input type="password" name="pass" class="form-control"><br>
                  <label>Gender :</label>
                  <input type="radio" name="gender"  value="Male"required>Male <input  type="radio" name="gender" value="Female"required>Female<br>
                  <label>Dob:</label>
                  <input type="date" name="dob" class="form-control" required><br>
                  <label>Country:</label>
                  <select name="country" class="form-control">
                      <option value="India">India</option>
                      <option value="Australia">Australia</option>
                      <option value="England">England</option>
                      <option value="Sri Lanka">Sri Lanka</option>
                      <option value="Pakisthan">Pakisthan</option>
                      <option value="Mexico"> Mexico</option>
                  </select><br>
                  <input type="submit" value="Submit" class="btn btn-warning">
         </form> 
       </div>

      <!-- Modal footer -->
      <div class="modal-footer">
          
         <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>
     </div>
  </div>
</div>

    
    
    

  
  
</div>



<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <center><h3>SMplayer</h3></center>
            </div>
             <%
                  try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                                Statement st = cn.createStatement();
                                ResultSet rs = st.executeQuery("select * from youtube where email='"+email+"'");
                                if(rs.next()){
           %>
            
<div class="sidebar-header">
                
                <img src="user/<%=rs.getString("code")%>.jpg" style="width:200px;height: 200px;"class="img-fluid rounded-circle thumbnails">
                <center> <p><strong><h3 style="color:white"><%=rs.getString("fname")%>&nbsp;&nbsp;<%=rs.getString("lname")%></h3></strong></p></center>
                
            </div>
                
                <%
                                }
                  }
                  catch(Exception er){
                      out.print(er.getMessage());
                       
                  }
                  
                           %>
            <ul class="list-unstyled components">
               <li>
                    <a href="index.jsp"> <i class="fa fa-home"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Home</strong></a>  
                </li> 
                <li>
                    <a href="dashboard.jsp"> <i class="fa fa-dashboard"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Dashboard</strong></a>  
                </li> 
                  <li>
                    <a href="history.jsp"> <i class="fa fa-history"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;History</strong></a>  
                </li>
                <li>
                    <a href="your_videos.jsp"> <i class="fa fa-video-camera"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Your Videos</strong></a>  
                </li>
                 
                <li>
                    <a href="liked_video.jsp"> <i class="fa fa-thumbs-up"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Liked Videos</strong></a>
                </li>
                <li>
                    <a href="fav_video.jsp"> <i class="fa fa-heart"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Favorite Videos</strong></a>  
                </li>
                 
                <li>
                    <a href="subscribe_channel.jsp"><i   class="fa fa-envelope"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subscriptions</strong></a> 
                </li>
                <%
                  if(email!=null){
                          %>
                          <li>
                             <a href="user_profile.jsp"> <i class="fa fa-user"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View Profile</strong></a>  
                         </li>
                          <%
                      }  
                        
                    
                    %>
                 
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                 </li>
                <li>
                 </li>
            </ul>
        </nav>

		
		<!-- Model -->
		
		 


 
                
<!-- Registration--->
 

<! End Registration-->
        <!-- Page Content  -->
        <div id="content" style="background-color:white;">

            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-info">
                        <i class="fa fa-align-left"></i>
                         
                    </button>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>
                     
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                             <%
                              
                             if(email==null){
                                
                                
                            %>
                            <li class="nav-item active">
                                <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal"><strong>Login</strong></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="modal" data-target="#register"><strong>Registration</strong></a>
                            </li>
                            <%
                             }
                             else{
                                 %>
                                 <li class="nav-item">
                                     <a class="nav-link" href="logout.jsp"><i class="fa fa-sign-out"></i><strong>Logout</strong></a>
                            </li>
                                 <%
                             }
                            %>
                             
                        </ul>
                    </div>
                </div>
            </nav>
<div class="container-fluid">
  <div class="row" >
      <div class="col-sm-8 w3-card" id="fav">
           <%
             try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                 Statement st = cn.createStatement();
                 ResultSet rs = st.executeQuery("select * from video where code='"+code+"'AND ccode='"+ccode+"' AND status=0");
                 if(rs.next()){
                    
                     %>
                     <video class="card-img-top" controls="controls"   style="max-width: 100%; height: auto;" poster="profile/<%out.print(rs.getString("code"));%>.jpg"  class="img-fluid"  >
                             <source src="profile/<%out.print(rs.getString("code"));%>.mp4" type="video/mp4" class="img-fluid">           
                      </video>
                      <div class="col-sm-12">
                         <%
                          String cv="black";
                          String cv1="black" ;
                          String fv="black" ;
                          String like="";
                                Statement st3 =cn.createStatement(); 
                                ResultSet rs3 = st3.executeQuery("select  count(*) from userlike where code='"+code+"' AND ptr='like'");
                                if(rs3.next()){
                                    like=rs3.getString(1);
                                } 
                                 
                                String dislike="";
                                Statement st2 =cn.createStatement(); 
                                ResultSet rs2 = st2.executeQuery("select  count(*) from userlike where code='"+code+"' AND ptr='dislike'");
                                if(rs2.next()){
                                    dislike=rs2.getString(1);
                                } 
                                String vi="";
                                 Statement st9 =cn.createStatement(); 
                                ResultSet rs9 = st9.executeQuery("select  count(*) from history where vcode='"+code+"' AND email='"+email+"'");
                                
                                if(rs9.next()){
                                    vi=rs9.getString(1);
                                } 
                                 String ptr="";
                                 Statement st4 =cn.createStatement(); 
                                ResultSet rs4 = st4.executeQuery("select  * from userlike where email='"+email+"' AND code='"+code+"'");
                                if(rs4.next()){
                                    ptr=rs4.getString("ptr");
                                }
                                String pt="";
                                 Statement st10 =cn.createStatement(); 
                                ResultSet rs10 = st10.executeQuery("select  * from favourite where email='"+email+"' AND code='"+code+"'");
                                if(rs10.next()){
                                    pt=rs10.getString("color");
                                }
                               Statement stv =cn.createStatement(); 
                                ResultSet rsv = stv.executeQuery("select  * from userlike where email='"+email+"' AND code='"+code+"' AND ptr='like'");
                                if(rsv.next()){
                                    cv="blue" ;
                                }
                                 Statement stv1 =cn.createStatement(); 
                                ResultSet rsv1 = stv1.executeQuery("select  * from userlike where email='"+email+"' AND code='"+code+"' AND ptr='dislike'");
                                if(rsv1.next()){
                                    cv1="blue" ;
                                }
                                Statement stv2 =cn.createStatement(); 
                                ResultSet rsv2 = stv2.executeQuery("select  * from favourite where email='"+email+"' AND code='"+code+"' AND color='red'");
                                if(rsv2.next()){
                                    fv="red" ;
                                }
                          
                          
                          %>
                          <table class="table table-borderless">
                              <tr>
                                  <td ><h3><strong><%=rs.getString("vtitle")%></strong></h3></td> <td  style="float:right;"><i  id="fav-<%=rs.getString("code")%>" rel="<%=rs.getString("code")%>" class="fa fa-star"  style="font-size:24px;color:<%=fv%>;"></i></td>
                              </tr>
                              <tr>
                                  <td ><h5><strong><%=rs.getString("vdate")%></strong></h5></td> <td  style="float:right;"> <i class="fa fa-thumbs-up like" style="color:<%=cv%>;cursor:pointer;" pid="like" id="like-<%=code%>"  rel="<%=code%>"></i><span id="likecount-<%=code%>"><%=like%></span>
                                  </td><td><i class="fa fa-thumbs-down dislike" style="color:<%=cv1%>;cursor:pointer;" pid="dislike" id="dislike-<%=rs.getString("code")%>" rel="<%=rs.getString("code")%>"> </i><span id="dislikecount-<%=code%>"><%=dislike%></span></td><td ><i class="fa fa-eye"><%=vi%></i></td>
                              </tr>
                          </table> 
                                <hr style="height:2px;border-width:0;color:gray;background-color:gray">
                                <script>
                                   $(document).ready(function(){
                                     var ucode=<%=code%>;
                                     var ptr=<%=ptr%>;
                                     if(ptr=="like"){
                                        $("#like-"+ucode).css("color","blue");
                                        $("#dislike-"+ucode).css("color","black");
                                         
                                     }
                                     else if(ptr="dislike"){
                                         $("#dislike-"+ucode).css("color","blue");
                                        $("#like-"+ucode).css("color","black");
                                     }
                                     
                                        
                                   }); 
                                    
                                    
                                    
                                 </script>
                                 <script>
                                  $(document).ready(function(){
                                    var cl=<%=pt%>;
                                    var uscode = <%=code%>;
                                    if(cl=="red"){
                                      $("#fav-"+uscode).css("color","red");  
                                    }
                                    else if(cl=="black"){
                                        $("#fav-"+uscode).css("color","black");
                                    }
                                      
                                      
                                  });   
                                     
                                     
                                  </script>
                      </div>
                      <div class="col-sm-12">
                          <%
                      
                            try{
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cnm=DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                                Statement stm = cnm.createStatement();
                                ResultSet rsm = stm.executeQuery("select * from channel where code='"+ccode+"' AND status=0");
                                if(rsm.next()){
                                    
                                    
                                    String clr="";
                                    String ch="red";
                                    String cb="SUBSCRIBE";
                                     
                                    Statement st1 = cn.createStatement();
                                    ResultSet rs1 = st1.executeQuery("select * from subscribe where email='"+email+"'AND ccode='"+ccode+"'");
                                    if(rs1.next()){
                                           clr=rs1.getString("color");
                                           
                                    }
                                    Statement sp = cn.createStatement();
                                    ResultSet rx = sp.executeQuery("select * from subscribe where email='"+email+"'AND ccode='"+ccode+"' AND color='green'");
                                    if(rx.next()){
                                            ch="green";
                                            cb="SUBSCRIBED";
                                                          }
                                    
                                        
                                        
                                    
                                    
                                    %>
                                    
                                    <table class="table table-borderless">
                                        <tr>
                                            <td><img style="height:50px;height:50px;" src="profile/<%=rsm.getString("code")%>.jpg" class="img-fluid"></td><td ><h3><strong><%=rsm.getString("cname")%></strong></h3></td><td ><strong>(<%=rsm.getString("category")%>)</strong></td><td  style="float:right;"> <button  class="btn btn-danger" style="background-color:<%=ch%>;color:white;" id="sub-<%=rsm.getString("code")%>" rel="<%=rsm.getString("code")%>"><%=cb%></button><i style="font-size: 25px;color:black;" id="bell-<%=rsm.getString("code")%>" class="fa fa-bell" ></i></td>
                                        </tr>
                                          
                                    </table>
                                        <table class="table table-borderless">
                                         <tr>
                                            <td ><h5><strong><%=rs.getString("description")%></strong></h5></td>
                                        </tr>
                                         </table>
                                         <script>
                                            $(document).ready(function(){
                                               var cc=<%=ccode%>;
                                               var color = <%=clr%>;
                                                
                                               if(color.equals("green")){
                                                    $("#sub-"+cc).css("background-color","green");
                                                    $("#sub-"+cc).css("color","white");
                                                    $("#sub-"+cc).text("SUBSCRIBED");
                                                }
                                                else if(color.equals("red")){
                                                    $("#sub-"+cc).css("background-color","green");
                                                    $("#sub-"+cc).css("color","white");
                                                    $("#sub-"+cc).text("SUBSCRIBE");
                                                }
                                                
                                                
                                            });
                                            
                                            
                                            
                                          </script>
                                    <%
                                }
                            }
                            catch(Exception cm){
                                out.print(cm.getMessage());
                            }
                                  
                                  
                          %>         
                      </div>
                      <div class="col-sm-12">
                          <h3 class="w3-card w3-green"><strong><center>Comment</center></strong></h3>
                          <textarea id="msg" class="form-control" row="6"cols="6" style="resize:none;" placeholder="Enter Your Message" ></textarea><br>
                          <button class="btn btn-success" rel="<%=code%>">Submit</button><br><br>
                          <div class="row" id="comment">
                              <br><br>
                              <%
                               try{
                                   Statement st12=cn.createStatement();
                                   ResultSet rs12 = st12.executeQuery("select * from comment where vcode='"+code+"' order by sn DESC");
                                   while(rs12.next()){
                                        String ema=rs12.getString("email");
                                        String cmt_code=rs12.getString("code");
                                        
                                         
                                             String cmt_like="";
                                            Statement st14 =cn.createStatement(); 
                                            ResultSet rs14 = st14.executeQuery("select  count(*) from cuserlike where code='"+cmt_code+"' AND ptr='like'");
                                            if(rs14.next()){
                                                cmt_like =rs14.getString(1);
                                            }
                                            String cmt_dislike="";
                                            Statement st16 =cn.createStatement(); 
                                            ResultSet rs16 = st16.executeQuery("select  count(*) from cuserlike where code='"+cmt_code+"' AND ptr='dislike'");
                                            if(rs16.next()){
                                                cmt_dislike =rs16.getString(1);
                                            }
                                              String col="";
                                     
                                             Statement st17 =cn.createStatement(); 
                                            ResultSet rs17 = st17.executeQuery("select * from cuserlike where code='"+cmt_code+"' AND email='"+email+"'");
                                            if(rs17.next()){
                                                 col =rs17.getString("ptr");
                                            }
                                            String pp="black";
                                     
                                             Statement sts =cn.createStatement(); 
                                            ResultSet rss = sts.executeQuery("select * from cuserlike where code='"+cmt_code+"' AND email='"+email+"' AND ptr='like'");
                                            if(rss.next()){
                                                 pp ="blue";
                                            }
                                            String pp1="black";
                                     
                                             Statement sts1 =cn.createStatement(); 
                                            ResultSet rss1 = sts1.executeQuery("select * from cuserlike where code='"+cmt_code+"' AND email='"+email+"' AND ptr='dislike'");
                                            if(rss1.next()){
                                                 pp1 ="blue";
                                            }
                                            SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy");
                                            String date=sdf.format(new Date());
                                            Statement st20 = cn.createStatement();
                                            ResultSet rs20 = st20.executeQuery("select * from history where email='"+email+"' AND vcode='"+code+"'");
                                            if(rs20.next()){
                                                      
                                            }
                                            else{
                                                PreparedStatement pm= cn.prepareStatement("insert into history values(?,?,?)");
                                                    pm.setString(1,email);
                                                    pm.setString(2,code);
                                                    pm.setString(3, date);
                                                    if(pm.executeUpdate()>0){
                                                    }
                                            }
                                           String cpp="";
                                            Statement st13=cn.createStatement();
                                        ResultSet rs13 = st13.executeQuery("select * from youtube where email='"+ema+"'");
                                        if(rs13.next()){
                                            cpp=rs13.getString("code");
                                        }
                                        String cpp1="";
                                        String cpp2="";
                                            Statement spp=cn.createStatement();
                                        ResultSet rpp = spp.executeQuery("select * from youtube where email='"+ema+"'");
                                        if(rpp.next()){
                                            cpp1=rpp.getString("fname");
                                            cpp2=rpp.getString("lname");
                                        }
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            %>
                                            <div class="col-sm-12" id="d-<%=rs12.getString("code")%>">
                                                <div class="card">
                                                    <div clas="card-header"><img src="profile/<%=cpp%>.jpg" style="widht:30px;height:50px;" class="img-fluid rounded-circle"><strong><%=cpp1%><%=cpp2%></strong><i style="float:right;font-size: 25px;"  ></i> </div>
                                                    <div class="card-body"  >
                                                         <p class="w3-xlarge w3-serif" id="p<%=rs12.getString("code")%>"><%=rs12.getString("msg")%></p>
                                                         <i rel="<%=rs12.getString("code")%>" ptr="like" id="like-<%=rs12.getString("code")%>"  class="fa fa-thumbs-up cmt1" style="color:<%=pp%>;font-size:20px;"></i><span id="likecount-<%=rs12.getString("code")%>"><%=cmt_like%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i rel="<%=rs12.getString("code")%>" ptr="dislike" id="dislike-<%=rs12.getString("code")%>"  class="fa fa-thumbs-down cmt2" style="color:<%=pp1%>;font-size:20px;"></i><span id="dislikecount-<%=rs12.getString("code")%>"><%=cmt_dislike%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                         <%
                                                         Statement st18 = cn.createStatement();
                                                         ResultSet rs18 = st18.executeQuery("select * from comment where email='"+email+"' AND code='"+cmt_code+"' AND vcode='"+code+"'");
                                                         if(rs18.next()){
                                                       
                                                         %>
                                                         <i style="color:blue;font-size:20px;" class="fa fa-edit" id="<%=rs12.getString("code")%>"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                          <i style="color:red;font-size:20px;"class="fa fa-trash" rel="<%=rs12.getString("code")%>"></i>
                                                          <%
                                                         } 
                                                             %>
                                                          
                                                    </div><br>
                                                </div>
                                            </div>
                                                          <script>
                                                            $(document).ready(function(){
                                                                var co=<%=cmt_code%>;
                                                                var pp=<%=col%>;
                                                                if(pp=="like"){
                                                                    $("#like-"+ucode).css("color","blue");
                                                                    $("#dislike-"+ucode).css("color","black");
                                                                 }
                                                                 else if(pp=="dislike"){
                                                                     $("#dislike-"+ucode).css("color","blue");
                                                                    $("#like-"+ucode).css("color","black");
                                                                 }
                                                                
                                                                
                                                            });  
                                                              
                                                          </script>
                                            <%
                                        
                                   }
                                   
                               }
                               catch(Exception pm){
                                   out.print(pm.getMessage());
                               }
                             %> 
                          </div>
                      </div><br><br>
                      
                      
                     <%
                 }
             
                 cn.close();
             }
             catch(Exception er){
                 out.print(er.getMessage());
             }
    
          %>
           
      </div>
           
           
       <div class="col-sm-4 w3-card">
             <div class="col-sm-12" style="background-color:white;">
                     <table class="table table-borderless w3-card" >
                         <tr ><td> <h3   style="color:green"><strong ><center>Related Videos</center></strong></h3> </td></tr>
                     </table>
                 </div>
                     <div class="col-sm-12"></div>
            
           <%
              
               try{
                   Class.forName("com.mysql.jdbc.Driver");
                   Connection cn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                   Statement st1 = cn1.createStatement();
                   ResultSet rs1 =st1.executeQuery("select * from video where status=0 order by rand()");
                   while(rs1.next()){
                       String lik="";
                       Statement st6 =cn1.createStatement(); 
                        ResultSet rs6 = st6.executeQuery("select  count(*) from userlike where code='"+rs1.getString("code")+"' AND ptr='like'");
                        if(rs6.next()){
                            lik=rs6.getString(1);
                        } 
                         String dis="";
                       Statement st7 =cn1.createStatement(); 
                        ResultSet rs7 = st7.executeQuery("select  count(*) from userlike where code='"+rs1.getString("code")+"' AND ptr='dislike'");
                        if(rs7.next()){
                            dis=rs7.getString(1);
                        }
                        
                        String vie="";
                       Statement st8 =cn1.createStatement(); 
                        ResultSet rs8 = st8.executeQuery("select  count(*) from history where vcode='"+rs1.getString("code")+"' AND email='"+email+"'");
                        if(rs8.next()){
                            vie=rs8.getString(1);
                        }
                         String nn="black" ;
                         Statement sa =cn1.createStatement(); 
                                ResultSet ra = sa.executeQuery("select  * from userlike where email='"+email+"' AND code='"+code+"' AND ptr='like'");
                                if(ra.next()){
                                    nn="blue" ;
                                    
                                } 
                                String mm="black" ;
                         Statement sa1 =cn1.createStatement(); 
                                ResultSet ra1 = sa1.executeQuery("select  * from userlike where email='"+email+"' AND code='"+code+"' AND ptr='dislike'");
                                
                                if(ra1.next()){
                                    mm="blue" ;
                                    
                                } 
                       
                       
                       %>
                       <table class="table table-borderless w3-card-4 " id="pk" >
                                      <tr>
                                        <td align="center"><a href="play_video.jsp?code=<%=rs1.getString("code")%>&ccode=<%=rs1.getString("ccode")%>"><img  src="profile/<%=rs1.getString("code")%>.jpg" class="img-fluid"></a></td>
                                       </tr>
                                       <tr>
                                           <td><h5 ><strong><%=rs1.getString("vtitle")%> </strong></h5></td>
                                       </tr>
                                        
                        </table>
                       
                       <%
                   }
                           
               }
               catch(Exception ep){
                   out.print(ep.getMessage());
               }
               
               %>
               
      </div>
                
		
             
  
  </div>
                
</div>
<footer class="footer">
            <div class="container-fluid" style="background-color:#f2f2f2;">
                        <div>
	        <center><h3 style="color:black">Follow Us :  <a href="https://www.facebook.com/sharad.mittal.908" target="_blank"><i class="fa fa-facebook"></i></a> &nbsp;<a href="https://twitter.com/SharadM97724882" target="_blank"><i class="fa fa-twitter"></i></a> &nbsp; <a href="https://www.linkedin.com/in/sharad-mittal-0376b61b5/" target="_blank"><i class="fa fa-linkedin"></i></a>&nbsp; <a href="https://www.instagram.com/mittalsharad02/" target="_blank"><i class="fa fa-instagram"></i></a></h3></center>      </div>
						<div class="row"><div class="col-sm-12" style="color:black;">
          <center><br><a href="#" target="_blank" style="color:black">Terms And Condition</a> &nbsp;<a href="#" target="_blank" style="color:black;">Privacy Policy</a></center>
         <center><br><h3>SMplayer © 2022</h3></center><br></div></div>
		        <center><p>Design & Developed By : <a href="https://www.linkedin.com/in/sharad-mittal-0376b61b5/" target="_blank">Sharad Mittal</a></p></center>       

  
  
                    </div>
          </footer>            
         </div>
    </div>
	</body>
	<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  <script src='https://unpkg.com/aos@2.3.0/dist/aos.js'></script>
  
      <script id="rendered-js" >
AOS.init({
  duration: 1200 });
//# sourceURL=pen.js
    </script>

  

  <script src="https://static.codepen.io/assets/editor/iframe/iframeRefreshCSS-e03f509ba0a671350b4b363ff105b2eb009850f34a2b4deaadaa63ed5d970b37.js"></script>
  
</html>

     
    
    <%
}
%> 