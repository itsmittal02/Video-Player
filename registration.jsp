<%-- 
    Document   : registration
    Created on : Mar 6, 2022, 4:03:32 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="zxx">
 <head>
  <title>Registration </title>
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
			    <a class="navbar-brand ps-3" href="index.jsp"> <h2 style="color:white">Video Player</h2></a> 
                            <table class="table table-borderless"> 
			   <tr><td><a href="login.jsp"><img src="pictures/login1.jpg" class="img-fluid rounded-circle"></a></td></tr>
			   <tr><td align=center><a href="login1.jsp"><b style="color:white">User</b></a></td></tr>
			   </table>
			    
			   <table class="table table-borderless">
			   <tr><td> <a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i>Home</a></td></tr> 
			   <tr><td><a href="#">Your Liberary</a></td></tr><br>
			   <tr><td><a href="#"><i class="fa fa-plus-square" aria-hidden="true"></i> Create Playlist</a></td></tr> 
			   
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
                                                                
                                                                 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                                                  &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                                                  &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                                                  &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                                                  &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                                                  &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
                                                                  &nbsp; &nbsp;
							
                                                                  <li class="nav-item">
								<a class="nav-link" href="login.jsp" style="float:right">Login</a> 
								</li> 
                    	   
                                                                <li class="nav-item">
								<a class="nav-link" href="registration.jsp" style="float:right">Registration</a> 
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
		 <!--channel-->
         <div class="container-fluid">
                    <div class="row" style="background-color:#f1f1f1">
                    <div class="col-sm-12"> 
                        <div class="col-sm-3"></div>
                         
                            <center>   <h1 class="h3 mb-4 text-gray-800">Registration :   </h1></center>
                                   
                       <form method="post"  action="insert_reg.jsp">
	  	    <div class="form-group">
		      <label for="edit-name"> First Name :  * </label>
		      <input type="text"   name="fname"  class="form-control">
		    </div>
			<div class="form-group">
		     <label for="edit-name"> Last Name: * </label>
		      <input type="text"   name="lname"    class="form-control">
		    </div>
		   
		    <div class="form-group">
		      <label for="edit-name"> Email :  * </label>
		      <input type="email"    name="email"    class="form-control">
		    </div>
			 <div class="form-group">
		      <label for="edit-pass"> Password :  * </label>
		      <input type="password"   name="pass"  class="form-control">
		    </div>
		    <div class="age_select">
		      <label for="edit-pass"> Date Of Birth : * </label>
		        <div class="age_grid">
		         <div class="col-sm-12 form_box">
                  <div class="select-block1">
					<input type="date" name="dob" class="form-control">
                   </div>
                  </div>
                  <div class="clearfix"> </div>
                 </div>
              </div> 
                           <br><br> 
              <div class="form-group form-group1">
                <label class="col-sm-2 control-lable" for="sex"> Gender : * </label>
                <div class="col-sm-10">
                    <div class="radios-form-control">
				        <label for="radio-01" class="label_radio">
				            <input type="radio" name="gender" value="male"> Male
				        </label>
				        <label for="radio-02" class="label_radio">
				            <input type="radio" name="gender" value="female"> Female
				        </label>
	                </div>
                </div>
                <div class="clearfix"> </div>
             </div>
			 
		     
		       <div class="city_select">
		      <label for="edit-pass">City :* </label>
		        <div class="city_grid">
		         <div class="col-sm-12 form_box">
                  <div class="select-block1">
	           <select name="city" class="form-control">
                                    <option value="Ajmer">Ajmer</option>
                                    <option value="Alwar">Alwar</option>
                                    <option value="Surat">Surat</option>
                                    <option value="Jaipur">Jaipur</option>
                                    <option value="Mathura">Mathura</option>
                                    <option value="Kota">Kota</option>
                                    <option value="Mumbai">Mumbai</option>
				 
               </select> 
			    </div>
			   </div>
			   </div>
			   </div><br>  
			   
				 
			 <div class="form-actions">
                             <center><button type="submit" class="btn btn-primary">Submit</button> </center>   
			  </div>
		 </form>
                                     
                               </div>
                        <br><br>
                  
                     
                             
                    <div class="col-sm-4"></div>
                  </div>
         </div>
        
        <!--//channel--> 
         
			  <!--footer-->
			  
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
 
