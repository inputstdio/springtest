<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>물품 등록</title>
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/js/parsley.ko.js"></script>
	<link rel="stylesheet" href="resources/css/product_insert_form.css">
</head>
<body>
	<form name="productInsert" id="productInsert" method="post" action="productInsert" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 2%; margin-bottom: 2%;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<span class="title"><i class="fas fa-edit"> 물품 등록</i></span>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="padding-top: 2%; padding-bottom: 2%; border: 3px solid white; border-radius: 7px;">
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-barcode"> 상품코드</i></span>
						<input id="product_code" type="text" class="form-control" name="code" placeholder="바코드(13자리)" required="required" maxlength="13">
						<button id="product_code_check" class="btn btn-primary form-control" type="button"><i class="fas fa-check"> 중복검사</i></button>
						<input type="hidden" id="vender_code_available" value="false">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-archive"> 상품명</i></span>
						<input id="product_name" type="text" class="form-control" name="name" placeholder="">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-boxes"> 상품규격</i></span>
						<input id="product_capacity" type="text" class="form-control" name="capacity" placeholder="">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-money-check-alt"> 매입단가</i></span>
						<input id="product_buyprice" type="number" class="form-control" name="buyprice" placeholder="">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-money-check-alt"> 매출단가</i></span>
						<input id="product_saleprice" type="number" class="form-control" name="saleprice" placeholder="">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-info"> 상품설명</i></span>
						<input id="product_explanation" type="text" class="form-control" name="explanation" placeholder="">
					</div>
					<hr style="border:none; border:2px solid white; width: 100%;">
					<div class="input-group">
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-dice-d6"> 전년말재고</i></span>
						<input id="product_preyystock" type="number" class="form-control" name="preyystock">
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-dice-d6"> 전월말재고</i></span>
						<input id="product_premmstock" type="number" class="form-control" name="premmstock">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-dice-d6"> 전일재고</i></span>
						<input id="product_preddstock" type="number" class="form-control" name="preddstock">
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-dice-d6"> 현재재고</i></span>
						<input id="product_stock" type="number" class="form-control" name="stock">
					</div>
					<hr style="border:none; border:2px solid white; width: 100%;">
					<div class="input-group">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 01월 매입</i></span>
						<input id="product_buy01" type="number" class="form-control" name="buy01">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 01월 매출</i></span>
						<input id="product_sale01" type="number" class="form-control" name="sale01">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 07월 매입</i></span>
						<input id="product_buy07" type="number" class="form-control" name="buy07">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 07월 매출</i></span>
						<input id="product_sale07" type="number" class="form-control" name="sale07">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 02월 매입</i></span>
						<input id="product_buy02" type="number" class="form-control" name="buy02">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 02월 매출</i></span>
						<input id="product_sale02" type="number" class="form-control" name="sale02">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 08월 매입</i></span>
						<input id="product_buy08" type="number" class="form-control" name="buy08">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 08월 매출</i></span>
						<input id="product_sale08" type="number" class="form-control" name="sale08">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 03월 매입</i></span>
						<input id="product_buy03" type="number" class="form-control" name="buy03">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 03월 매출</i></span>
						<input id="product_sale03" type="number" class="form-control" name="sale03">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 09월 매입</i></span>
						<input id="product_buy09" type="number" class="form-control" name="buy09">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 09월 매출</i></span>
						<input id="product_sale09" type="number" class="form-control" name="sale09">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 04월 매입</i></span>
						<input id="product_buy04" type="number" class="form-control" name="buy04">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 04월 매출</i></span>
						<input id="product_sale04" type="number" class="form-control" name="sale04">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 10월 매입</i></span>
						<input id="product_buy10" type="number" class="form-control" name="buy10">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 10월 매출</i></span>
						<input id="product_sale10" type="number" class="form-control" name="sale10">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 05월 매입</i></span>
						<input id="product_buy05" type="number" class="form-control" name="buy05">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 05월 매출</i></span>
						<input id="product_sale05" type="number" class="form-control" name="sale05">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 11월 매입</i></span>
						<input id="product_buy11" type="number" class="form-control" name="buy11">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 11월 매출</i></span>
						<input id="product_sale11" type="number" class="form-control" name="sale11">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 06월 매입</i></span>
						<input id="product_buy06" type="number" class="form-control" name="buy06">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 06월 매출</i></span>
						<input id="product_sale06" type="number" class="form-control" name="sale06">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-right"> 12월 매입</i></span>
						<input id="product_buy12" type="number" class="form-control" name="buy12">
						<span class="input-group-addon" style="text-align: center;"><i class="far fa-arrow-alt-circle-left"> 12월 매출</i></span>
						<input id="product_sale12" type="number" class="form-control" name="sale12">
					</div>
					<div class="row" style="margin-top: 3px;">
						<div class="col-md-4">
							<button id="product_save" type="submit" class="btn btn-success btn_sty5">
								<i class="fas fa-save"></i> 저장
							</button>
						</div>
						<div class="col-md-4">
							<button id="product_reset" type="reset" class="btn btn-warning btn_sty5">
								<i class="fas fa-redo-alt"></i> 초기화
							</button>
						</div>
						<div class="col-md-4">
							<button id="product_cancel" type="button" onclick="location.href='index'" class="btn btn-default btn-danger btn_sty5">
								<i class="fas fa-ban"></i> 취소
							</button>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
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
</body>
</html>