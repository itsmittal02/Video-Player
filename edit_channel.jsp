<%-- 
    Document   : edit_channel
    Created on : Dec 15, 2021, 11:41:20 PM
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
                        response.sendRedirect("index.jsp");
                    }
                    else{
                       // String code=request.getParameter("code");
                         try{
                             String code=request.getParameter("code");  
                     Class.forName("com.mysql.jdbc.Driver");
                     Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                     Statement st =  cn.createStatement();
                     ResultSet rs = st.executeQuery("select * from channel where code='"+code+"' ");
                     if(rs.next()){
                        %> 
                        
                        
            <!DOCTYPE html>
<html lang="en">
<head>
  <title>Dashboard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://use.fontawesome.com/09901d9403.js"></script>
  <script src="jquery.min.3.6.0.min.css"></script>
	   
    <script>
	  $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });
	  
       
	  </script>
	 <style>
 
										

											

										#sidenav {
										  height: 100%;
										  width:200px;
										  position: fixed;
										  z-index: 1;
										  top: 0;
										  left: 0;
										  background: #111;
										  overflow-x: hidden;
										  padding-top: 20px ;
										}
										#sidenav a {
										  padding: 6px 8px 6px 16px;
										  text-decoration: none;
										  
										  color: #818181;
										  display: block;
										}
		                                  #sidenav a:hover {
										  color: #f1f1f1;
										}
										#search-field{
										   width:500px;
										   }
										#main-block{
										    margin-left:200px;
											}	
											.nav-item.dropdown{
											    display:none;
												}
							
							@media screen and (max-height: 650px) {
						   #sidenav {padding-top: 15px;}
						  #sidenav a {font-size: 18px;}
						  #sidenav {
										display: none;
									  }
									  
									  #main-block{
									     margin-left:0px;
										 width:100%;
										 
										}
										#search-field{
										   width:100%
										   }
										
										.nav-item.dropdown{
											    display:block;
												background-color:black;
												color:white;
												}
						}
						
						 
								
	</style>
 </head> 
<body>
    
	

 <div class="container-fluid">
	     <div class="row">
		 <!-- left sidebar-->
		    <div class="col-sm-2" id="sidenav" style="height:120vh ; background-color:black">
			   <table class="table table-borderless"> 
                               <tr><td><i class="fa fa-youtube-play" style="font-size:48px;background-color:white;color:red"></i></td><td><h3 style="color:white">YouTube</h3></td></tr>
			   </table>
			   <table class="table table-borderless">
			   <tr><td> <a href="dashboard.jsp"><strong><i class="fa fa-home" aria-hidden="true"></i>Home</strong></a></td></tr> 
                           <tr><td><a  href="subscribe.jsp"><strong><i class="fa fa-subscription" aria-hidden="true"></i> Subscriptions</strong></a></td></tr><br>
			   <tr><td><a  href="#"><strong><i class="fa fa-plus-square" aria-hidden="true"></i> Create Channel </strong></a></td></tr> 
			   <tr><td><a id="login" data-dismiss="modal" style="cursor:pointer"><strong><i class="fa fa-gratipay" aria-hidden="true"></i> Liked Songs</strong></a></td></tr> 
			  </table> 
                         <hr style="height:1px;border-width:1px;color:white;background-color:gray"> 
                         <table>
                           <tr><td><a  href="view_channel.jsp"><strong><i class="fa fa-library" aria-hidden="true"></i> Your Channels </strong></a></td></tr> 
			   <tr><td><a href="history.jsp"><strong><i class="fa fa-history" aria-hidden="true"></i>&nbsp;History</strong></a></td></tr>
                           <tr><td><a href="videos.jsp"><strong><i class="fa fa-caret-square-o-right" aria-hidden="true"></i>&nbsp;Your Videos</strong></a></td></tr>
                         </table>
                          <hr style="height:1px;border-width:1px;color:white;background-color:gray"> 
                         <table>
                           <tr><td><a href="setting.jsp"><strong><i class="fa fa-setting" aria-hidden="true"></i> Settings </strong></a></td></tr> 
			  <tr><td><a href="help.jsp"><strong><i class="fa fa-help" aria-hidden="true"></i>Help</strong></a></td></tr>
                           <tr><td><a href="feedback.jsp"><strong><i class="fa fa-feedback" aria-hidden="true"></i>Send Feedback</strong></a></td></tr>
                         </table>
                         
                         <hr style="height:1px;border-width:1px;color:white;background-color:gray"> 
                        <table>
                     <tr><td><br><center><p><h6 style="color:white">YouTube © 2021</h6>  <h6 style="color:white">All Rights Reserved  <br> <p>Design & Developed By : <a href="https://www.linkedin.com/in/sharad-mittal-0376b61b5/" target="_blank">Sharad Mittal</a></h6></p></center><br></td></tr>	
                        </table>
                    </div>
			  <!-- End left sidebar-->
           <!-- main block-->
			  <div class="col-sm-10" id="main-block" style="width:120vh">
                          
           <div class="row">
				   <div class="col-sm-12">
					 <nav class="navbar navbar-expand-md " style="background-color:black; color:white">
						  <!-- Brand -->
						  <!--<a class="navbar-brand" href="#">Navbar</a>-->
                        
						<!-- Sidebar/collapse Button-->
						<button type="button" id="sidebarCollapse" class="btn btn-secondary">
                        <i class="fa fa-align-left"></i>
                       </button>
		 <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>	
						
						  <!-- Toggler/collapsibe Button -->
						   <button class="navbar-toggler" type="button" data-toggle="collapse" style="background-color:black" data-target="#collapsibleNavbar">
							<span class="navbar-toggler-icon" style="color:white"></span>
						  </button>&nbsp;&nbsp;&nbsp;&nbsp;

						  <!-- Navbar links -->
						 
                       <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <form method="post" action="search_video.jsp">
                                <li class="nav-item">
                                    <div class="searchbar" style="font-size:20px ">
                                        <input type="text" style="width:200px" name="search" placeholder="Search">
                                             &nbsp;&nbsp;  <button class="fa fa-search btn btn-info" style="margin:auto"></button>&nbsp;&nbsp;
                                    </div>
                                </li>&nbsp;&nbsp; 
                            </form>
                            <li class="nav-item">
                                <a class="nav-link" href="logout.jsp" style="cursor:pointer;color:white">Logout</a>&nbsp;&nbsp;
                            </li>      
     <%
                       try{
                              
                                Statement sm =cn.createStatement();
                                ResultSet rm = sm.executeQuery("select * from youtube where email='"+email+"' ");
                                while(rm.next()){
					//String code=rm.getString("code");
                        
                    %>
    
    
                            <li class="nav-item">
                                   <div class="col-sm-6">
                                     <a class="nav-link" href="user_profile.jsp"><img src="user/<%=rm.getString("code")%>.jpg" class="img-fluid rounded-circle" style="height:10px;width:10px;background-color:white"></a>
                                       </div>
                          </li> 
                          
                          <%   
                     }
                 }
                  
                            catch(Exception ep){
                                   out.print(ep.getMessage());
                            }
                    
                       %> 
                        </ul>
                    </div>			
						 </nav>
			    </div>
                              </div>


<h1><center>Edit-Channels:</center></h1><br><br><br>
                        <div class="container-fluid">
			<div class="row" style="background-color:black">
                            <div class="col-sm-12">
                                <div class="col-sm-3"></div>
                                 
                                  
                                 <form method="post" action="update_channel.jsp?code=<%out.print(rs.getString("code"));%> ">
							<label><h2>Channel name</h2></label><br>
                                                            <input class="form-control" style="width:700px" type="text" name="cname"   value="<%out.print(rs.getString("cname"));%>">

                                                            <br>
                                                                <label><h2>Description</h2></label><br>

                                                                <input class="form-control" style="width:700px ;resize:none" type="text" name="description"   value="<%out.print(rs.getString("description"));%>"> 
                                                            <br><br>
                                                             <center><button class="button" style="background-color:blue;color:black"><h3 style="color:white">Submit</h3></button></center>
                                                                       <br> 
                                                               <div class="clearfix"> </div>
                                                
                                                
							</form>
                              
                            </div>
			</div>

		</div>
                <br><br>
               
                
	           
         </div>
         </div>           
        </div>
 
	  
              
</body>

</html>
<%
                     }        
                }
                        catch(Exception ep){
                                   out.print(ep.getMessage());
                            }
                    }
%>