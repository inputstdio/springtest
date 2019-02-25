<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<div class="container" style="text-align: center;">
		<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
			<div class="col-sm-2"></div>
			<div class="col-sm-8"><span class="title" style="font-size: 45px; font-weight: bold; color: white; text-shadow: 2px 2px 2px black;"><i class="fas fa-bell"> Member Result</i></span></div>
			<div class="col-sm-2"></div>
		</div>
		<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
			<div class="col-sm-3"></div>
			<div class="col-sm-6"><span class="msg_box" style="font-align: center; color: white; border: 2px solid white; padding: 20px;">${msg}</span></div>
			<div class="col-sm-3"></div>
		</div>
		<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
			<div class="col-sm-3"></div>
			<div class="col-sm-6"><button type="button" id="save" onclick="location.href='index'" class="btn btn-success btn-lg btn_sty1">OK</button></div>
			<div class="col-sm-3"></div>
		</div>
	</div>
</body>
</html>