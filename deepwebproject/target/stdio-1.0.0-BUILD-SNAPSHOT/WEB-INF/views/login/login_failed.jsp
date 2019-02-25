<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>Login</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/js/parsley.ko.js"></script>
	<script src="resources/js/myQuery.js"></script>
	<link rel="stylesheet" href="resources/css/my_css.css">
<style type="text/css">
	body {
		background-color: #3399ff;
	}
	.title {
		font-size: 40px;
		font-weight: bold;
		color: white;
		text-shadow: 2px 2px 2px gray;
	}
	ul.parsley-errors-list {
		margin-top: 3px;
		margin-bottom: 3px;
		padding-left: 2px;
		background-color: white;
		border: 1px solid #CCCCCC;
		border-top: 0px;
	}
	li.parsley-required, li.parsley-type, li.parsley-minlength{
		text-align: left;
		color: #999999;
		list-style: none;
	}
	.msg_box {
		font-align: center;
		color: white;
		font-size: 17px;
		font-weight: bold;
		font-style: italic;
	}
	button.btn_style {
		margin-top: 2%;
		margin-bottom: 2%;
		font-weight: bold;
		width: 50%;
		color: white;
		font-weight: bold;
	}

	a:link {text-decoration: none; color: white;}
	a:visited {text-decoration: none; color: white;}
	a:active {text-decoration: none; color: white;}
	a:hover {text-decoration: underline; color: #333333;}
</style>
<body>
<form id="login_form" name="login_form" action="memberLogin" method="post" data-parsley-validate>
	<div class="container" style="text-align: center;">
		<div class="row" style="margin-top: 10%; margin-bottom: 2%;">
			<div class="col-md-2"></div>
			<div class="col-md-8"><span class="title"><i class="fas fa-check-circle"> Login Failed!</i></span></div>
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
			    <div><button id="login_btn" type="button" class="btn btn-success btn_style">Login</button></div>
		    	<div class="row">
		    		<div class="col-md-1"></div>
		    		<div class="col-md-3"><a href="memberInsertForm">
		    			<i class="fas fa-user-plus"> SignUp</i></a>
		    		</div>
		    		<div class="col-md-4"><a href="">
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
	</div>
</form>
</body>
</html>