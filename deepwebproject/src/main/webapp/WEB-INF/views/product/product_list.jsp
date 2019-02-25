<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 조회</title>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="resources/css/product_list.css">
</head>
<body>
	<form name="productList" id="productList" method="get" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<span class="title" style="font-size: 45px; font-weight: bold; color: white; text-shadow: 2px 2px 2px black;"><i class="fas fa-chalkboard"> 물품 조회</i></span>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<table id="product_list" class="table table-striped table-boredred">
						<thead>
							<tr>
								<td rowspan="2" style="vertical-align: middle;"><input type="checkbox" name="product_check_all" class="product_check_all"></td>
								<td rowspan="2" style="vertical-align: middle;">바코드
								<td rowspan="2" style="vertical-align: middle;">품명
								<td rowspan="2" style="vertical-align: middle; min-width: 48px;">구분
								<td rowspan="2" style="vertical-align: middle;">01월
								<td rowspan="2" style="vertical-align: middle;">02월
								<td rowspan="2" style="vertical-align: middle;">03월
								<td rowspan="2" style="vertical-align: middle;">04월
								<td rowspan="2" style="vertical-align: middle;">05월
								<td rowspan="2" style="vertical-align: middle;">06월
								<td rowspan="2" style="vertical-align: middle;">07월
								<td rowspan="2" style="vertical-align: middle;">08월
								<td rowspan="2" style="vertical-align: middle;">09월
								<td rowspan="2" style="vertical-align: middle;">10월
								<td rowspan="2" style="vertical-align: middle;">11월
								<td rowspan="2" style="vertical-align: middle;">12월
								<td colspan="4">재고
							</tr>
							<tr>
								<td>전년
								<td>전월
								<td>전일
								<td>현재
							</tr>
						</thead>
						<tbody>
							<c:forEach var="product" items="${products}" varStatus="status">
								<tr>
									<td class="check"><input type="checkbox" name="product_check_one" id="product_check_one" class="product_check_one" value="${product.code}"></td>
									<td>${product.code}
									<td>${product.name}
									<td>
										매입<br/>매출
									</td>
									<td><fmt:formatNumber value="${product.buy01}" type="number"/><br/><fmt:formatNumber value="${product.sale01}" type="number"/>
									<td><fmt:formatNumber value="${product.buy02}" type="number"/><br/><fmt:formatNumber value="${product.sale02}" type="number"/>
									<td><fmt:formatNumber value="${product.buy03}" type="number"/><br/><fmt:formatNumber value="${product.sale03}" type="number"/>
									<td><fmt:formatNumber value="${product.buy04}" type="number"/><br/><fmt:formatNumber value="${product.sale04}" type="number"/>
									<td><fmt:formatNumber value="${product.buy05}" type="number"/><br/><fmt:formatNumber value="${product.sale05}" type="number"/>
									<td><fmt:formatNumber value="${product.buy06}" type="number"/><br/><fmt:formatNumber value="${product.sale06}" type="number"/>
									<td><fmt:formatNumber value="${product.buy07}" type="number"/><br/><fmt:formatNumber value="${product.sale07}" type="number"/>
									<td><fmt:formatNumber value="${product.buy08}" type="number"/><br/><fmt:formatNumber value="${product.sale08}" type="number"/>
									<td><fmt:formatNumber value="${product.buy09}" type="number"/><br/><fmt:formatNumber value="${product.sale09}" type="number"/>
									<td><fmt:formatNumber value="${product.buy10}" type="number"/><br/><fmt:formatNumber value="${product.sale10}" type="number"/>
									<td><fmt:formatNumber value="${product.buy11}" type="number"/><br/><fmt:formatNumber value="${product.sale11}" type="number"/>
									<td><fmt:formatNumber value="${product.buy12}" type="number"/><br/><fmt:formatNumber value="${product.sale12}" type="number"/>
									<td><fmt:formatNumber value="${product.preyystock}" type="number"/>
									<td><fmt:formatNumber value="${product.premmstock}" type="number"/>
									<td><fmt:formatNumber value="${product.preddstock}" type="number"/>
									<td><fmt:formatNumber value="${product.stock}" type="number"/>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="20" style="text-align: center;">
									<input type=button value="선택 항목 삭제" id="product_selected_delete" name="product_selected_delete" class="btn btn-warning" style="font-weight: bold; width: 30%;">
								</th>
							</tr>
						</tfoot>
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
		$('#product_list').DataTable({
			language: {
		        url: '//cdn.datatables.net/plug-ins/1.10.15/i18n/Korean.json'
		    }
		});
	</script>
</body>
</html>