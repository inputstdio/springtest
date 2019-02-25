<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Spring 테스트</title>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
</head>
<body>
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6" style="font-size: 20px; font-weight: bold; color: white; text-shadow: 1px 1px 1px black;">
			<label>Hello World!</label><br /> <span style="font-size: 15px">현재 서버의 시간은 ${serverTime} 입니다.</span>
			<div class="checkbox">
				<label> <input type="checkbox" data-toggle="toggle" data-onstyle="success">
				</label>
			</div>
			<br /> ${msg}
		</div>
		<div class="col-sm-3"></div>
	</div>
</body>
</html>
