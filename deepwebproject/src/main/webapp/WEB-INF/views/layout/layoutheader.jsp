<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring 테스트</title>
</head>
<style type="text/css">
body {
	background-color: #3399ff;
}
img {
	border: 1.5px solid white;
	height: 21px;
}

.dropdown-menu {
	background-color: #5cb85c;
	text-align: right;
}

.dropdown-menu>li>a {
	color: white;
	font-size: 16px;
	font-weight: bold;
}

.dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover {
	background-color: #449d44;
	color: white;
}
</style>
<body>
	<form action="">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
				<div class="col-md-6 btn-group">
					<button type="button" id="home" onclick="location.href='index'" class="btn btn-success btn-lg btn_sty3">Home</button>
					<button type="button" id="datatable" onclick="location.href='boardDatatable?search='" class="btn btn-success btn-lg btn_sty3">Datatable</button>
					<button type="button" id="board" onclick="location.href='boardList?search='" class="btn btn-success btn-lg btn_sty3">Board</button>
					<c:choose>
						<c:when test="${session_level<4}">
							<button type="button" id="search" onclick="location.href='memberSearch'" class="btn btn-success btn-lg btn_sty3">Member</button>
						</c:when>
						<c:otherwise>
							<button type="button" id="search" onclick="homeModal('permission')" class="btn btn-success btn-lg btn_sty3">Member</button>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-md-2">
					<button type="button" id="vender" class="btn btn-success btn-lg btn_sty4 dropdown-toggle" data-toggle="dropdown">물류</button>
					<ul class="dropdown-menu">
						<li><a href="venderInsertForm">거래처 등록</a>
						<li><a href="venderList">거래처 조회</a>
						<li><a href="productInsertForm">물품 등록</a>
						<li><a href="productList">물품 조회</a>
						<li><a href="balanceList">거래 현황</a>
						<li><a href="buy">매입</a>
					</ul>
				</div>
				<div class="col-md-2">
					<button type="button" id="salary" class="btn btn-success btn-lg btn_sty4 dropdown-toggle" data-toggle="dropdown">Salary</button>
					<ul class="dropdown-menu">
						<li><a href="salaryInsertForm">Salary Register</a>
						<li><a href="salaryCalculation">Salary Calculation</a>
						<li><a href="">Salary Management</a>
						<li><a href="salaryRoll">Salary Roll</a>
					</ul>
				</div>
				<div class="col-md-2">
					<c:choose>
						<c:when test="${session_email==null}">
							<button type="button" id="login" class="btn btn-success btn-lg btn_sty4">Login</button>
						</c:when>
						<c:otherwise>
							<div class="dropdown">
								<button type="button" class="btn btn-success btn-lg btn_sty4 dropdown-toggle" data-toggle="dropdown">
									<img src="${session_photo}" class="img-circle">&nbsp;${session_name} <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="memberModify">Modify</a>
									<li><a href="logout">Logout</a>
								</ul>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
		<div id="homeModal" class="modal fade" role="dialog">
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
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>