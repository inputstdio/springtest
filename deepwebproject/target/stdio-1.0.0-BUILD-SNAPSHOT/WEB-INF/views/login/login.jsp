<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>Login</title>
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/js/parsley.en.js"></script>
	<link rel="stylesheet" href="resources/css/login.css">
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="146801485469-2aha39ul2abc3t2tcggmigkceev74s85.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
<body>
<form id="login_form" name="login_form" action="memberLogin" method="post" data-parsley-validate>
	<div class="container" style="text-align: center;">
		<div class="row" style="margin-top: 2%; margin-bottom: 2%;">
			<div class="col-md-2"></div>
			<div class="col-md-8"><span class="title" style="font-size: 45px; font-weight: bold; color: white; text-shadow: 2px 2px 2px black;"><i class="fas fa-check-circle"> Login Page</i></span></div>
			<div class="col-md-2"></div>
		</div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="padding-top: 2%; padding-bottom: 2%; border: 3px solid white; border-radius: 7px;">
				<div class="input-group">
				    <span class="input-group-addon"><i class="fas fa-envelope"></i></span>
				    <input id="email" type="email" class="form-control" name="email" placeholder="Enter E-mail ID" required="required">
			    </div>
			    <div class="input-group">
				    <span class="input-group-addon"><i class="fas fa-key"></i></span>
				    <input id="password" type="password" class="form-control" name="password" placeholder="Enter Password" required="required" data-parsley-minlength="6">
			    </div>
			    <div style="margin-top: 3px;"><span class="msg_box">${msg}</span></div>
			    <div><button id="login_btn" type="button" class="btn btn-default btn-success btn_style">Login</button></div>
			    <div class="row" style="margin-top: 3px;" align="center">
			    	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
			    	<script>
				      function onSignIn(googleUser) {
				        // Useful data for your client-side scripts:
				        var profile = googleUser.getBasicProfile();
				        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
				        console.log('Full Name: ' + profile.getName());
				        console.log('Given Name: ' + profile.getGivenName());
				        console.log('Family Name: ' + profile.getFamilyName());
				        console.log("Image URL: " + profile.getImageUrl());
				        console.log("Email: " + profile.getEmail());
				
				        // The ID token you need to pass to your backend:
				        var id_token = googleUser.getAuthResponse().id_token;
				        console.log("ID Token: " + id_token);
				      }
				    </script>
			    </div>
		    	<div class="row" style="margin-top: 3px;">
		    		<div class="col-md-1"></div>
		    		<div class="col-md-3"><a href="memberInsertForm">
		    			<i class="fas fa-user-plus" id="signup"> SignUp</i></a>
		    		</div>
		    		<div class="col-md-4"><a href="#" id="findpass">
		    			<i class="fas fa-search"> Find Password</i></a>
		    		</div>
		    		<div class="col-md-3"><a href="index">
		    			<i class="fas fa-home"> Home</i></a>
		    		</div>
		    		<div class="col-md-1"></div>
		    	</div>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row">
			<div class="col-md-5"></div>
			<div class="col-md-2"><span style="color: white;"><br/>ID : test@naver.com<br/>Pass : testnaver</span></div>
			<div class="col-md-5"></div>
		</div>
	</div>
	
      <div id="emailModal" class="modal fade" role="dialog">
         <div class="modal-dialog">
            <div class="modal-content">
               <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                   <h2 class="modal-title">Password Find</h2>
               </div>
               <div class="modal-body" id="email-modal-body" style="text-align:center">
                  <i class="fa fa-envelope" style="margin-bottom: 2px"> E-mail</i>
                  <input type="email" name="findemail" id="findemail" class="form-control" placeholder="Input E-mail">
               </div>
               <div class="modal-footer">
                  <div class="text-center">
                     <button type="button" class="btn btn-success modal_findemail" data-dismiss="modal">Find</button>
                     <button type="button" class="btn btn-danger modal_findemail2" data-dismiss="modal">Cancel</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title">Notification</h2>
				</div>
				<div class="modal-body" id="login-modal-body" style="text-align: center; font-size: 20px;">
					<p>Please entered email.</p>
					</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success login_modal_btn1" data-miss="modal">OK</button>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>