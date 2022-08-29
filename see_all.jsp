 <%-- 
    Document   : see_all
    Created on : 4 Mar, 2022, 8:48:44 AM
    Author     : user
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
 
     String ccode="";
        if(request.getParameter("code")==null){
            response.sendRedirect("index.jsp?code_errr=1");
        }
        else{
            String code=request.getParameter("code");
    %>
    <html>
      <head>
          <title>SMplayer</title>
	  </head>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://use.fontawesome.com/09901d9403.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"> 
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
    <link rel='stylesheet' href='https://unpkg.com/aos@2.3.0/dist/aos.css'>
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
	      $(document).ready(function(){
                  var code = "<%=code%>";
                   var num=0;
                   $.post(
                       "load_more.jsp",{code:code,num:num},function(data){
                          $("#record").html(data);
                       }
                   );
              });
              $(document).on("click",".w3-button.w3-green",function(){
                 var num = $(this).attr("id");
                 var code = "<%=code%>";
                 $(this).fadeOut(1000);
                 $.post(
                    "load_more.jsp",{code:code,num:num},function(data){
                       $("#record").append(data);
                    }
                 );
              });
              $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
	  
	  
	  </script>
	  <style>
	   .col-sm-3.video-block{
            transform: scale(.99);
            transition: .33s;
        }
         .col-sm-3.video-block:hover{
            transform: scale(1.1);
            z-index: 99;
        }
	  </style>
	  <body>




<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>SMplayer</h3>
            </div>

            <ul class="list-unstyled components">
                <p> SMplayer</p>
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
                    <a href="subscribe_channel.jsp"> <i class="fa fa-envelope"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Subscriptions</strong></a>  
                </li>
                     <%
            String email=null ;
                       Cookie cp[] = request.getCookies();
                       for(int i=0;i<cp.length;i++){
                           if(cp[i].getName().equals("login")){
                               email=cp[i].getValue();
                               break;
                           }
                       }
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
                    </button>                            <li class="nav-item">


                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                             
<%
                             
                             if(email==null){
                                
                                
                            %>
                            <li class="nav-item active">
                                <button class="btn btn-success" href="#" data-toggle="modal" data-target="#myModal"><strong>Login</strong></button>
                            </li>&nbsp;&nbsp;
                            <li class="nav-item">
                                <button class="btn btn-success" href="#" data-toggle="modal" data-target="#register"><strong>Registration</strong></button>
                            </li>
                            <%
                             }
                             else{
                                 %>
                                 <li class="nav-item">
                                     <a class="nav-link" href="logout.jsp" ><strong><i class="fa fa-sign-out"></i>Logout</strong></a>
                            </li>
                                 <%
                             }
                            %>                        </ul>
                    </div>
                </div>
            </nav>
<div class="container-fluid">
    <%
       try{
           Class.forName("com.mysql.jdbc.Driver");
           Connection cb = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
           Statement sb = cb.createStatement();
           ResultSet rb = sb.executeQuery("select * from channel where code='"+code+"' AND status=0");
           if(rb.next()){
               ccode = rb.getString("code");
               %>
                
                  <div class="col-sm-12" style="background-color:white;">
                     <table class="table table-borderless w3-card" >
                         <tr ><td><%out.print(rb.getString("cname"));%></td></tr>
                     </table>
                 </div>
                     <div class="col-sm-12"></div>
               
             
               <%
           }
       }
       catch(Exception ec){
           out.print(ec.getMessage());
       }
      %>
   <div class="row" id="record" >
        
  </div>
</div>
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
                  <label>Email  :</label>
		  <input type="email" name="email" class="form-control"><br>
		  <label>Password:</label>
		  <input type="password" name="pass" class="form-control"><br>
                  <label>Gender :</label>
                  <input type="radio" name="gender"  value="Male"required>Male <input  type="radio" name="gender" value="Female"required>Female<br>
                  <label>Date Of Birth:</label>
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
</div><br><br><br><br>

 <footer class="footer">
            <div class="container-fluid" style="background-color:#f2f2f2;">
                        <div>
	         	<div class="row"><div class="col-sm-12" style="color:black;">
          <center><br><a href="#" target="_blank" style="color:black">Terms And Condition</a> &nbsp;<a href="#" target="_blank" style="color:black;">Privacy Policy</a></center>
         <center><br><h3>SMplayer © 2022</h3></center><br></div></div>
		               

  
  
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