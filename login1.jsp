<%-- 
    Document   : login1
    Created on : Mar 8, 2022, 2:20:23 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <html>
 <title>Login</title>

<head>
<script src="https://cdn.jsdellivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="jquery-3.6.0.min.js"></script>
<script>
         $(document).on("click","#logindiv",function(){
		    $("#logindiv").modal();
                    var email=$("#email").val();
		   var pass=$("#pass").val();
                    $.post(
		        "check.jsp",{email:email,pass:pass},function(data){
					if(data==="success"){
						$("#alert-msg").attr("class","alert alert-success");
						$("#alert-msg").fadeIn(1000);
						$("#alert-msg").html("Login Successfully");
					}
					else{
						$("#alert-msg").attr("class","alert alert-danger");
						$("#alert-msg").fadeIn(1000);
						$("#alert-msg").html("Try Again");
					}
				}
		); 
                
			
    });
                        
		$(documnet).on("click",".btn.btn-success",function(){
		   $("#signupdiv").modal();
		   });
		   </script>
		   

</head>


<body>
 <div class="modal" id="logindiv">
  <div class="modal-dialog">
    <div class="modal-content">
	
	
	<!-- Modal Footer-->
	 <div class="modal-header" style="background-color:#0968DE;color:white">
	 <h4 class="modal-title">Login</h4>
	 <button type="button" class="close" data-dismiss="modal">&times;</button>
	 </div>
	 
	 <!-- Modal body-->
	 <div class="modal-body">
	   <form>
	         <label>Email</label>
			 <input type="email" name="email" class="form-control" required>
			 <label>Password</label>
			 <input type="password" name="pass" class="form-control" required><br>
			 <input type="submit" class="btn btn-danger" value="Login">
			 </form>
			 
			 </div>
			 
			 <!-- Modal footer-->
			   <div class="modal-footer">
			    <button class="btn btn-success" data-dismiss="modal">Not a member ? signup </button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>
				</div>
				</div>
	 </div>
	 
</body>
 </html>