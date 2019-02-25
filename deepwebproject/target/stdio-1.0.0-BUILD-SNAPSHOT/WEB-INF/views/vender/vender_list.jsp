<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처 조회</title>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="resources/css/vender_list.css">
</head>
<body>
	<form name="venderList" id="venderList" method="get" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<span class="title" style="font-size: 45px; font-weight: bold; color: white; text-shadow: 2px 2px 2px black;"><i class="fas fa-chalkboard"> 거래처 조회</i></span>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-12">
					<table id="vender_list" class="table table-striped table-boredred">
						<thead>
							<tr>
								<td><input type="checkbox" name="vender_check_all" class="vender_check_all"></td>
								<td>코드
								<td>상호
								<td>대표자명
								<td>사업자번호
								<td>업태
								<td>종목
								<td>우편번호
								<td>전화번호
								<td>주소
							</tr>
						</thead>
						<tbody>
							<c:forEach var="vender" items="${venders}" varStatus="status">
								<tr>
									<td class="check"><input type="checkbox" name="vender_check_one" id="vender_check_one" class="vender_check_one" value="${vender.code}"></td>
									<td>${vender.code}
									<td>${vender.name}
									<td>${vender.ceoname}
									<td>${vender.busno1} - ${vender.busno2} - ${vender.busno3}
									<td>${vender.busconditions}
									<td>${vender.bustype}
									<td>${vender.zipcode}
									<td>${vender.officeno1} - ${vender.officeno2} - ${vender.officeno3}
									<td>
										<c:if test="${vender.newaddr != null}">${vender.newaddr} ${vender.detailaddr}</c:if>
										<c:if test="${vender.newaddr == null}">${vender.oldaddr} ${vender.detailaddr}</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="10" style="text-align: center;">
									<input type=button value="선택 항목 삭제" id="vender_selected_delete" name="vender_selected_delete" class="btn btn-warning" style="font-weight: bold; width: 30%;">
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
		$('#vender_list').DataTable({
			language: {
		        url: '//cdn.datatables.net/plug-ins/1.10.15/i18n/Korean.json'
		    }
		});
	</script>
</body>
</html>