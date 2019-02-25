<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>거래처 등록</title>
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/js/parsley.ko.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<link rel="stylesheet" href="resources/css/vender_insert_form.css">
</head>
<body>
	<form name="venderInsert" id="venderInsert" method="post" action="venderInsert" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 2%; margin-bottom: 2%;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<span class="title"><i class="fas fa-edit"> 거래처 등록</i></span>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="padding-top: 2%; padding-bottom: 2%; border: 3px solid white; border-radius: 7px;">
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-barcode"> 코드</i></span>
						<input id="vender_code" type="text" class="form-control" name="code" placeholder="4자리" required="required" maxlength="4">
						<button id="vender_code_check" class="btn btn-primary form-control" type="button"><i class="fas fa-check"> 중복검사</i></button>
						<input type="hidden" id="vender_code_available" value="false">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-building"> 상호</i></span>
						<input id="vender_name" type="text" class="form-control" name="name" placeholder="">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-user-tie"> 대표자명</i></span>
						<input id="vender_ceoname" type="text" class="form-control" name="ceoname" placeholder="">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="text-align: left;"><i class="fas fa-dice-d6"> 사업자번호</i></span>
						<input id="vender_busno1" type="text" class="form-control" name="busno1" maxlength="3">
						<span class="input-group-addon" style="text-align: center;">-</span>
						<input id="vender_busno2" type="text" class="form-control" name="busno2" maxlength="2">
						<span class="input-group-addon" style="text-align: center;">-</span>
						<input id="vender_busno3" type="text" class="form-control" name="busno3" maxlength="5">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-exclamation-circle"> 업태</i></span>
						<input id="vender_busconditions" type="text" class="form-control" name="busconditions" placeholder="">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-clipboard-list"> 종목</i></span>
						<input id="vender_bustype" type="text" class="form-control" name="bustype" placeholder="">
					</div>
					<hr style="border:none; border:2px solid white; width: 100%;">
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-home"> 우편번호</i></span>
						<input id="vender_zipcode" type="number" class="form-control" name="zipcode" readonly="readonly">
						<button id="vender_zipcode_find" class="btn btn-primary form-control" type="button"><i class="fas fa-search"> 찾기</i></button>
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-map-marker"> 신주소</i></span>
						<input id="vender_newaddr" type="text" class="form-control" name="newaddr" readonly="readonly">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-map-marker"> 구주소</i></span>
						<input id="vender_oldaddr" type="text" class="form-control" name="oldaddr" readonly="readonly">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-map-marker"> 상세주소</i></span>
						<input id="vender_detailaddr" type="text" class="form-control" name="detailaddr" placeholder="">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="text-align: left;"><i class="fas fa-phone"> 전화번호</i></span>
						<input id="vender_officeno1" type="number" class="form-control" name="officeno1" maxlength="4">
						<span class="input-group-addon" style="text-align: center;">-</span>
						<input id="vender_officeno2" type="number" class="form-control" name="officeno2" maxlength="4">
						<span class="input-group-addon" style="text-align: center;">-</span>
						<input id="vender_officeno3" type="number" class="form-control" name="officeno3" maxlength="4">
					</div>
					
					<div class="row" style="margin-top: 3px;">
						<div class="col-md-4">
							<button id="vender_save" type="submit" class="btn btn-success btn_sty5">
								<i class="fas fa-save"></i> 저장
							</button>
						</div>
						<div class="col-md-4">
							<button id="vender_reset" type="reset" class="btn btn-warning btn_sty5">
								<i class="fas fa-redo-alt"></i> 초기화
							</button>
						</div>
						<div class="col-md-4">
							<button id="vender_cancel" type="button" onclick="location.href='index'" class="btn btn-default btn-danger btn_sty5">
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