<%-- 
    Document   : edit_profile
    Created on : Dec 13, 2021, 12:12:18 AM
    Author     : user
--%>

<%@page contentType="text/html"  import="java.sql.*" pageEncoding="UTF-8"%>
 
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
                            try{
                                
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection cn =DriverManager.getConnection("jdbc:mysql://localhost:3306/btu","root","");
                                Statement st =cn.createStatement();
                                ResultSet rs = st.executeQuery("select * from youtube where email='"+email+"'");
                               if(rs.next()){ 
                                 
                                %>
                                 
         <!--
	Author: W3layouts
	Author URL: http://w3layouts.com
	License: Creative Commons Attribution 3.0 Unported
	License URL: http://creativecommons.org/licenses/by/3.0/
-->

<!DOCTYPE html>
<html lang="zxx">
 <head>
  <title>Index</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script src="https://use.fontawesome.com/09901d9403.js"></script>
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
		    <div class="col-sm-2" id="sidenav" style="height:100vh ; background-color:black">
			   <a class="navbar-brand ps-3" href="dashboard.jsp"> <h2 style="color:white">SM Player</h2></a>
			   <table class="table table-borderless"> 
			   <tr><td><a href="user_profile.jsp"><img src="user/<%=rs.getString("code")%>.jpg" class="img-fluid rounded-circle"></a></td></tr>
			   <tr><td><a href="user_profile.jsp"><b style="color:white"><%out.print(rs.getString("fname"));%></b></a></td> &nbsp; 
                            <td><a href="user_profile.jsp"><b style="color:white"><%out.print(rs.getString("lname"));%></b></a></td></tr>
			   </table>
			    
			   <table class="table table-borderless">
			   <tr><td> <a href="dashboard.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></td></tr> 
			   <tr><td><a href="#">Your Liberary</a></td></tr><br>
			   <tr><td><a href="#"><i class="fa fa-plus-square" aria-hidden="true"></i> Create Playlist</a></td></tr> 
			   <tr><td><a href="#"><i class="fa fa-gratipay" aria-hidden="true"></i>    Liked Videos</a></td></tr> 
			   <tr><td><a href="#">Languages</a></td></tr>
			   <tr><td><a href="#">Night Mode <i class="fa fa-toggle-on" aria-hidden="true"></i></a></td></tr> 
			 
			  
			   </table> 
			   
			  </div>
			  <!-- End left sidebar-->
	 <div class="col-sm-10" id="main-block" >
			      <div class="row">
				   <div class="col-sm-12">
					 <nav class="navbar navbar-expand-md " style="background-color:skyblue; color:white">
						  <!-- Brand -->
						  <!--<a class="navbar-brand" href="#">Navbar</a>-->

						  <!-- Toggler/collapsibe Button -->
						  <button class="navbar-toggler" type="button" data-toggle="collapse" style="background-color:white" data-target="#collapsibleNavbar">
							<span class="navbar-toggler-icon" style="color:white"></span>
						  </button>

						  <!-- Navbar links -->
						  <div class="collapse navbar-collapse" id="collapsibleNavbar" style="background-color:skyblue;color:white">
							<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
							  <li class="nav-item">
								<a class="nav-link" href="view_video.jsp">All</a>
							  </li>
							  <li class="nav-item">
								<a class="nav-link" href="#">ABOUT</a>
							  </li>
							  <li class="nav-item">
								<a class="nav-link" href="#">FEATURES</a>
								</li>
								<li class="nav-item">
								<a class="nav-link" href="#">CONTACT</a> 
								</li> 
                                                        <li class="nav-item">
								<a class="nav-link" href="logout.jsp">Logout</a> 
								</li> 
                                                                
							  
                    	   
						
								<li class="nav-item dropdown">
								  <a class="nav-link dropdown-toggle  " href="#" id="navbardrop" data-toggle="dropdown">
									User id
								  </a>
								  <div class="dropdown-menu" style="background-color:white;color:black">
									<a class="dropdown-item" href="#">Profile </a>
									<a class="dropdown-item" href="#">Setting</a>
									<a class="dropdown-item" href="logout.jsp">Logout</a>
									 
								  </div>
								</li>  
						  
						</ul>
						</div>
						 </nav>
			    </div><br><br>
                            <br> 
		 <!--Profile-->                        
                 <div class="container-fluid">
                     <div class="row">
                         <div class="col-sm-12">
                             <div class="col-sm-3">
                         
                 
                 
                 <form method="post" action="update.jsp" >
				<table class="table table-borderless w3-card-4">
		        	<tbody>
					<td class="day_label">First Name :</td>
							<td class="day_value"><input type="text" class="form-control" name="fname" value=<%out.println(rs.getString("fname"));%>></td>
						</tr>
						<tr class="opened_1">
							<td class="day_label">Last Name :</td>
							<td class="day_value"><input type="text" class="form-control" name="lname" value=<%out.println(rs.getString("lname"));%>></td>
						</tr>
					 
					   <tr class="opened">
							<td class="day_label">Date Of Birth :</td>
							<td class="day_value"><input type="date" class="form-control" name="dob" value=<%out.println(rs.getString("dob"));%>></td>
						</tr>
						 
					    <tr class="opened">
							<td class="day_label">Gender :</td>
							<td class="day_value"><select name="gender" class="form-control">
							<option value=<%out.println(rs.getString("gender"));%>><%out.println(rs.getString("gender"));%></option>
							<option value="male">Male</option>
							<option value="female">Female</option>
							</select>
							</td>
						</tr>
					     
					    <tr class="closed">
							<td class="day_label"> City :</td>
							<td class="day_value closed"><select name="city" class="form-control">
							<option value=<%out.println(rs.getString("city"));%>><%out.println(rs.getString("city"));%></option>
							<option value="Jaipur">Jaipur</option>
                                                        <option value="Alwar">Alwar</option>
                                                        <option value="Kota">Kota</option>
                                                        <option value="Bharatpur">Bharatpur</option>
                                                        <option value="Aagra">Aagra</option>
                                                        <option value="not defien">Other</option>
                                        </select> 
			          </td>
						</tr>
						 
				    </tbody>
				</table><tr><br>
					 <td colspan="4"> <input type="submit" value="update" class="btn btn-danger"></td>
				</form><br><br>
                   </div>
                                                        
                                                          
                   </div>    
                     </div>            
                                
                 </div>  
                  
                                                        
                           <div class="col-sm-12">
				  <div class="row" style="background-image:url(pictures/s3.jpg);height:auto">
                                       
			    <div class="col-sm-4" style="color:black">
			 <h3>Company</h3> 
		     <table class="table table-hover table-borderless">
			     <tr style="color:black"><td  style="border:none ; cursor: pointer "><a href="#"> About Us</a></td></tr>
				  <tr style="color:black"><td style="border:none ; cursor: pointer "><a href="#">Video Blog</a></td></tr>
				   <tr style="color:black"><td style="border:none ; cursor: pointer "><a href="#">Careers</a></td></tr>
				    <tr style="color:black"><td style="border:none ; cursor: pointer"><a href="#">Award</a></td></tr>
					 <tr style="color:black"><td style="border:none; cursor: pointer"><a href="#">Contact Us</a></td></tr>
					  
			 </table>
		
		  </div> 
		   
		  <div class="col-sm-4" style="color:black">
		      <h3>More</h3> 
		     <table class="table table-hover table-borderless">
			    
	        <tr style="color:black"><td  style="border:none ; cursor: pointer "><a href="#">VIP Video</a></td></tr>
				  <tr style="color:black"><td style="border:none; cursor: pointer "><a href="#">Select Video</a></td></tr>
				   <tr style="color:black"><td style="border:none ; cursor: pointer "><a href="#">Sangam</a></td></tr>
				    <tr style="color:black"><td style="border:none ; cursor: pointer "><a href="#">Video Centers</a></td></tr>
					  <tr style="color:black"><td style="border:none ; cursor: pointer "><a href="#">Video</a></td></tr> 
					  
			 </table>
		
		</div> 
		 
		<div class="col-sm-4" style="color:black">
		    <h3>Privacy & You</h3> 
		     <table class="table table-hover table-borderless">
			    
					     <tr style="color:black"><td  style="border:none ; cursor: pointer "><a href="#">Terms of Use</a></td></tr>
				  <tr style="color:black"><td style="border:none ; cursor: pointer "><a href="#">Be Safe Online</a></td></tr>
				   <tr style="color:black"><td style="border:none ; cursor: pointer "><a href="#">Video Centers</a></td></tr>
				    <tr style="color:black"><td style="border:none ; cursor: pointer "><a href="#">Report Misuse</a></td></tr>
					 <tr style="color:black"><td style="border:none ; cursor: pointer "><a href="#">Events</a></td></tr>
					   
			 </table>
			 </div>
		 
		  
                    <div class="container-fluid px-4">
                        <div>
	      <center><h3 style="color:black">Follow Us :  <a href="https://www.facebook.com/sharad.mittal.908" target="_blank"><i class="fa fa-facebook"></i></a> &nbsp;<a href="https://twitter.com/SharadM97724882" target="_blank"><i class="fa fa-twitter"></i></a> &nbsp; <a href="https://www.linkedin.com/in/sharad-mittal-0376b61b5/" target="_blank"><i class="fa fa-linkedin"></i></a>&nbsp; <a href="https://www.instagram.com/mittalsharad02/" target="_blank"><i class="fa fa-instagram"></i></a></h3></center> 
	    </div>
	</div> 
		</div>
                                 <div class="col-sm-12" style="color:black;">
          <center><a href="#" target="_blank" style="color:black">Terms And Condition</a> &nbsp;<a href="#" target="_blank" style="color:black">Privacy Policy</a></center>
         <center><h3> YouTube © 2021</h3></center></div> 
                             
                             </div>
                           
		 
		 <div class="col-sm-12" style="background-color:#f2f2f2">
		       <br> 
			        <center><p>Design & Developed By : <a href="https://www.linkedin.com/in/sharad-mittal-0376b61b5/" target="_blank">Sharad Mittal</a></p></center>
			   <br>
		 </div>
                          </div>
                       </div>
               </div>
         </div>
        
</body>

</html>
                                                        
                              
                                                         <%
	                           }
	 
	                      else{
                                        response.sendRedirect("view_profile.jsp?invalid=1");
                                }
                            }

                            catch(Exception e){
                                out.println(e.getMessage());
                            }
                    }
				%>
                                
                           