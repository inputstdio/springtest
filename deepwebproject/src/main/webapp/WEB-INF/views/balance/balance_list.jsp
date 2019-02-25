<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래 현황</title>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="resources/css/balance_list.css">
</head>
<body>
	<form name="balanceList" id="balanceList" method="get" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<span class="title" style="font-size: 45px; font-weight: bold; color: white; text-shadow: 2px 2px 2px black;"><i class="fas fa-chalkboard"> 거래 현황</i></span>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<table id="balance_list" class="table table-striped table-boredred">
						<thead>
							<tr>
								<td>년도
								<td>거래처명
								<td>전년이월
								<td>거래금액
								<td>현금지불
								<td>어음지불
								<td>카드지불
								<td>기타지불
								<td>현재잔액
							</tr>
						</thead>
						<tbody>
							<c:forEach var="balance" items="${balances}" varStatus="status">
								<tr>
									<td>${balance.yyyy}
									<td><b><a href="balanceDetail?yyyy=${balance.yyyy}&vendcode=${balance.vendcode}">${balance.vendname}</a></b>
									<td>${balance.preyybalance}
									<td>${balance.dealtot}
									<td>${balance.cashtot}
									<td>${balance.checktot}
									<td>${balance.cardtot}
									<td>${balance.etctot}
									<td>${balance.balance}
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="modal-title">알림</h2>
				</div>
				<div class="modal-body" style="text-align: center; font-size: 20px;">
				<p></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success modal_btn1" data-miss="modal">확인</button>
					<button type="button" class="btn btn-danger modal_btn2" data-miss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$('#balance_list').DataTable({
			language: {
		        url: '//cdn.datatables.net/plug-ins/1.10.15/i18n/Korean.json'
		    }
		});
	</script>
</body>
</html>