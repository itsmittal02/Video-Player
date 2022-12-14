<%-- 
    Document   : all_videos
    Created on : 11 Aug, 2022, 5:56:07 PM
    Author     : Sharad Mittal
--%>
 
<%@page contentType="text/html"import="java.sql.*" pageEncoding="UTF-8"%>
<%
if(request.getParameter("code")==null){
    response.sendRedirect("dashboard.jsp?code_errrr=1");
}
else{
    String code=request.getParameter("code");
    %>
    <html>
      <head>
          <title>My Video Player</title>
	  </head>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel='stylesheet' href='https://unpkg.com/aos@2.3.0/dist/aos.css'>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
    
    
	  <script>
	   
	  
	           $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
	  
	  
	  </script>
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
	  <body>




<div class="wrapper">
        <!-- Sidebar  -->
        <nav id="sidebar">
            <div class="sidebar-header">
                <h3>Video Player</h3>
            </div>

            <ul class="list-unstyled components">
                <p> Video Player</p>
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
                <li>
                    <a href="#"> <i class="fa fa-cog"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Setting</strong></a>  
                </li>
                <li>
                    <a href="#"> <i class="fa fa-support"></i><strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Help</strong></a>  
                </li>
                 
                 
                  
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
                        <span>Toggle Sidebar</span>
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
        <div class="col-sm-12 w3-card">
           <%
             try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cs=DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                 Statement sa = cs.createStatement();
                 ResultSet ra = sa.executeQuery("select * from channel where code='"+code+"' AND status=0");
                 if(ra.next()){
                     %>
                     
                      <h3><strong><center><%=ra.getString("cname")%></center></strong></h3>
                     <%
                 }
             }
             catch(Exception ss){
                 out.print(ss.getMessage());
             }
    
    
    %>
           
           <%
             try{
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                 Statement st = cn.createStatement();
                 out.print("<table class='table table-borderless'>");
                 ResultSet rs = st.executeQuery("select * from video where ccode='"+code+"'");
                 while(rs.next()){
                     %>
           <tr>
               <td><img src="profile/<%=rs.getString("code")%>.jpg" class="img-fluid" style="width:200px;height:200px;"></td>
               <td><strong><%=rs.getString("vtitle")%></strong></td>
               <td><button class="btn btn-success"> <a href="edit_video.jsp?code=<%=rs.getString("code")%>&ccode=<%=code%>"><i class="fa fa-edit">Edit</i></a></button></td>
               <td><button class="btn btn-warning"> <a href="delete_video.jsp?code=<%=rs.getString("code")%>&ccode=<%=code%>"><i class="fa fa-trash">Delete</i></a></button></td>
           </tr>
                    <%
                 }
                 out.print("</table>");
             }
             catch(Exception er){
                 out.print(er.getMessage());
             }
    
    
           %>
        </div>	
 		
             
  
  </div>
</div>
<footer class="footer">
            <div class="container-fluid" style="background-color:#A7A2A2;">
                        <div>
	        <center> <h3 style="color:white;">Follow Us :  <a href="https://www.facebook.com/profile.php?id=100060203576938" target="_blank"><i class="fa fa-facebook"></i></a> &nbsp;<a href="https://twitter.com/PramodK82377407" target="_blank"><i class="fa fa-twitter"></i></a> &nbsp; <a href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/" target="_blank"><i class="fa fa-linkedin"></i></a>&nbsp; <a href="https://www.instagram.com/pramodkumarsaini12/" target="_blank"><i class="fa fa-instagram"></i></a></h3></center>
                            
                        </div>
						<div class="row"><div class="col-sm-12" style="color:white;">
          <center><br><a href="#" target="_blank" style="color:white">Terms And Condition</a> &nbsp;<a href="#" target="_blank" style="color:white">Privacy Policy</a></center>
         <center><br><h3>YouTube ?? 2022</h3></center><br></div></div>
		        <center> <p style="color:white;">Made with ? By <a  style="color:white;" href="https://www.linkedin.com/in/pramod-kumar-saini-98813b1b4/ " target="_blank">Pramod Kumar Saini</a></p></center>

  
  
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
