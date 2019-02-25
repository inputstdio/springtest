<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>Member Insert Form</title>
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/js/parsley.en.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- <script src="resources/js/parsley.ko.js"></script> -->
	<link rel="stylesheet" href="resources/css/member_insert_form.css">
</head>
<body>
	<form name="member_insert_form" id="member_insert_form" method="post" action="memberInsert" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
				<div class="col-sm-2"></div>
				<div class="col-sm-8"><span class="title" style="font-size: 45px; font-weight: bold; color: white; text-shadow: 2px 2px 2px black;"><i class="fas fa-user-plus"> Member Register</i></span></div>
				<div class="col-sm-2"></div>
			</div>
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<a href="">
					<img src="resources/img/noImage_240.png" id="image" class="img-circle" title="Search Image">
					<input type="file" id="photo" name="imgfile" accept="image/*" style="visibility: hidden;">
					<input type="hidden" id="confirm_yn" value="n">
					</a>
				</div>
				<div class="col-sm-3"></div>
			</div>
			<div class="row" style="margin-top: 2%; margin-bottom: 2%;">
				<div class="col-sm-4"></div>
				<div class="col-sm-4">
		      		<button type="button" id="emailAuth" class="btn btn-danger btn-lg btn_sty1">E-mail Authentication</button>
		      	</div>
				<div class="col-sm-4"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label">E-mail</label>
				<div class="col-sm-4">
		        	<input class="form-control input-lg" id="email" name="email" type="email" placeholder="Enter Your E-mail ID" required="required" data-parsley-trigger="change">
		      	</div>
		      	<div class="col-sm-2">
		      		<button type="button" id="check" class="btn btn-warning btn-lg btn_sty1">Check</button>
		      	</div>
		      	<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label">Password</label>
				<div class="col-sm-6">
		        	<input class="form-control input-lg" id="password" name="password" type="password" placeholder="Enter Your Password" required="required" data-parsley-minlength="6" data-parsley-trigger="change">
		      	</div>
		      	<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label">Confirm</label>
				<div class="col-sm-6">
		        	<input class="form-control input-lg" id="confirm_password" type="password" placeholder="Confirm Your Password" required="required" data-parsley-equalto="#password" data-parsley-trigger="change">
		      	</div>
		      	<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label">Name</label>
				<div class="col-sm-6">
		        	<input class="form-control input-lg" id="name" name="name" type="text" placeholder="Enter Your Name" required="required" data-parsley-trigger="change">
		      	</div>
		      	<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label">Phone</label>
				<div class="col-sm-6">
		        	<input class="form-control input-lg" id="phone" name="phone" type="tel" placeholder="Enter Your Phone Number" onkeyup="autoHypen()" maxlength="13">
		      	</div>
		      	<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label">Zip code</label>
				<div class="col-sm-3">
		        	<input class="form-control input-lg" id="zipcode" name="zipcode" type="text" placeholder="Zip code" maxlength="5" data-parsley-maxlength="5" data-parsley-trigger="change">
		      	</div>
		      	<div class="col-sm-2">
		      		<button type="button" id="find" class="btn btn-warning btn-lg btn_sty1">Find</button>
		      	</div>
		      	<div class="col-sm-3"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label">Address1</label>
				<div class="col-sm-6">
		        	<input class="form-control input-lg" id="address1" name="address1" type="text" placeholder="Enter Your Address">
		      	</div>
		      	<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-2"></div>
				<label class="col-sm-2 control-label">Address2</label>
				<div class="col-sm-6">
		        	<input class="form-control input-lg" id="address2" name="address2" type="text" placeholder="Enter Your Address">
		      	</div>
		      	<div class="col-sm-2"></div>
			</div>
			<div class="row form-group">
				<div class="col-sm-4"></div>
				<div class="col-sm-2">
		      		<button type="button" id="save" class="btn btn-success btn-lg btn_sty1">Save</button>
		      	</div>
		      	<div class="col-sm-2">
		      		<button type="button" onclick="location.href='login'" class="btn btn-success btn-lg btn_sty1">Cancel</button>
		      	</div>
		      	<div class="col-sm-4"></div>
			</div>
		</div>
	</form>
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title">Notification</h2>
				</div>
				<div class="modal-body" style="text-align: center; font-size: 20px;">
				<p></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success modal_btn1" data-miss="modal">OK</button>
					<button type="button" class="btn btn-danger modal_btn2" data-miss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>