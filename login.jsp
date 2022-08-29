<%-- 
    Document   : login
    Created on : Mar 6, 2022, 3:54:55 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html lang="zxx">

 <head>
	       <title>Login</title>
        <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
		 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> 
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
          <link href="css/styles.css" rel="stylesheet" />
          <script src="https://use.fontawesome.com/09901d9403.js"></script>
  	   
	</head>
        
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


<body>
	<div class="container-fluid">
	     <div class="row">
		   
		<!-- main block-->
			  <div class="col-sm-10" id="main-block" >
    
                                 <div class="row">
				   <div class="col-sm-12">
					 <nav class="navbar navbar-expand-md " style="background-color:skyblue; color:white"> 
						  <!-- Toggler/collapsibe Button -->
						 <button class="navbar-toggler" type="button" data-toggle="collapse" style="background-color:white" data-target="#collapsibleNavbar">
							<span class="navbar-toggler-icon" style="color:white"></span>
						  </button>

						  <!-- Navbar links -->
						  <div class="collapse navbar-collapse" id="collapsibleNavbar" style="background-color:skyblue;color:white">
							<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
							  <li class="nav-item">
								<a class="nav-link" href="#">All</a>
							  </li> &nbsp &nbsp &nbsp;
							  
								<li class="nav-item">
								<a class="nav-link" href="#">My Video</a> 
								</li>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp;
							 <!-- navbar search--> 
								 <li class="nav-item" id="search-field">
								<input class="form-control"  placeholder="Search Songs, Artists..."> 
								</li>  &nbsp &nbsp &nbsp &nbsp; 
  
						</ul>
						</div>
						 </nav>
			    </div> 
		</div>
	 <div class="col-sm-2" id="sidenav" style="height:100vh ; background-color:black">
			  <a class="navbar-brand ps-3" href="index.jsp"> <h2 style="color:white">Video Player</h2></a> 
                           
                           
                            <table class="table table-borderless"> 
			   <tr><td><a href="#"><img src="pictures/login1.png" class="img-fluid rounded-circle"></a></td></tr>
			   <tr><td align=center><a href="#"><b style="color:white">User</b></a></td></tr>
			   </table>
			   <table class="table table-borderless">
			   <tr ><td> <a href="index.jsp"><i class="fa fa-home" aria-hidden="true" style="color:white"></i><b style="color:white"> Home</b></a></td></tr>&nbsp &nbsp ;
			    <tr><td><a href="#"><i class="fa fa-gratipay" aria-hidden="true" style="color:white"></i><b style="color:white"> Liked Songs</b></a></td></tr> 
			 
			     
			   </table>  
			  </div> 
                               <!-- End left sidebar-->
	 
		<h1><center>Login:</center></h1><br><br><br>
                        <div class="container-fluid">
			<div class="row" style="background-color:skyblue">
                            <div class="col-sm-12">
                                <div class="col-sm-3"></div>
                                 
                                  
                                 <form method="post" action="check.jsp">
							<label><h2>Email: </h2></label><br>
                                                            <input class="form-control" style="width:700px" type="email" name="email">

                                                            <br>
                                                                <label><h2>Password: </h2></label><br>

                                                                <input class="form-control" style="width:700px" type="password" name="pass"> 
                                                            <br><br>
                                                            <center><button class="button" style="background-color:pink">Submit</button></center>
                                                                       <br> 
                                                               <div class="clearfix"> </div>
                                                   
                                                     </form>
                              
                            </div>
			</div>

		</div>
                <br><br>
                
                <div class="row"  >
			     <div class="col-sm-12" >
				    <div class="row" style="background-color:#f2f2f2">
                   
                     
                  <div class="container-fluid px-4">
                        <div>
	      <center><h3 style="color:black">Follow Us :  <a href="https://www.facebook.com/sharad.mittal.908" target="_blank"><i class="fa fa-facebook"></i></a> &nbsp;<a href="https://twitter.com/SharadM97724882" target="_blank"><i class="fa fa-twitter"></i></a> &nbsp; <a href="https://www.linkedin.com/in/sharad-mittal-0376b61b5/" target="_blank"><i class="fa fa-linkedin"></i></a>&nbsp; <a href="https://www.instagram.com/mittalsharad02/" target="_blank"><i class="fa fa-instagram"></i></a></h3></center> 
	    </div>
	</div>    
	
	
	<div class="col-sm-12" style="color:black;">
          <center><a href="#" target="_blank" style="color:black">Terms And Condition</a> &nbsp;<a href="#" target="_blank" style="color:black">Privacy Policy</a></center>
         <center><h3> YouTube © 2021</h3></center></div> </div>
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

