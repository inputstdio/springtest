<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>거래 현황</title>
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/js/parsley.ko.js"></script>
	<link rel="stylesheet" href="resources/css/balance_detail.css">
</head>
<body>
	<form name="balanceDetailChange" id="balanceDetailChange" method="post" action="balanceDetailChange" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 2%; margin-bottom: 2%;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<span class="title"><i class="fas fa-edit"> ${balance.vendname} 거래 현황</i></span>
					<input type="hidden" id="yyyy" name="yyyy" value="${balance.yyyy}">
					<input type="hidden" id="vendcode" name="vendcode" value="${balance.vendcode}">
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-12" style="padding-top: 2%; padding-bottom: 2%; border: 3px solid white; border-radius: 7px;">
					<div class="input-group">
						<span class="input-group-addon addontitle" style="width: 105px;">월</span>
						<span class="input-group-addon addon2"></span>
						<span class="input-group-addon addontitle">전월이월</span>
						<span class="input-group-addon addon2"></span>
						<span class="input-group-addon addontitle">거래금액</span>
						<span class="input-group-addon addon2"></span>
						<span class="input-group-addon addontitle">현금</span>
						<span class="input-group-addon addon2"></span>
						<span class="input-group-addon addontitle">어음</span>
						<span class="input-group-addon addon2"></span>
						<span class="input-group-addon addontitle">카드</span>
						<span class="input-group-addon addon2"></span>
						<span class="input-group-addon addontitle">기타</span>
						<span class="input-group-addon addon2"></span>
						<span class="input-group-addon addontitle">잔액</span>
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">01월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance01" type="number" class="form-control" name="prebalance01" value="${balance.prebalance01}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal01" type="number" class="form-control" name="deal01" value="${balance.deal01}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash01" type="number" class="form-control" name="cash01" value="${balance.cash01}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check01" type="number" class="form-control" name="check01" value="${balance.check01}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card01" type="number" class="form-control" name="card01" value="${balance.card01}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc01" type="number" class="form-control" name="etc01" value="${balance.etc01}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance01" type="number" class="form-control" name="balance01" value="${balance.balance01}">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">02월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance02" type="number" class="form-control" name="prebalance02" value="${balance.prebalance02}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal02" type="number" class="form-control" name="deal02" value="${balance.deal02}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash02" type="number" class="form-control" name="cash02" value="${balance.cash02}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check02" type="number" class="form-control" name="check02" value="${balance.check02}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card02" type="number" class="form-control" name="card02" value="${balance.card02}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc02" type="number" class="form-control" name="etc02" value="${balance.etc02}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance02" type="number" class="form-control" name="balance02" value="${balance.balance02}">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">03월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance03" type="number" class="form-control" name="prebalance03" value="${balance.prebalance03}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal03" type="number" class="form-control" name="deal03" value="${balance.deal03}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash03" type="number" class="form-control" name="cash03" value="${balance.cash03}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check03" type="number" class="form-control" name="check03" value="${balance.check03}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card03" type="number" class="form-control" name="card03" value="${balance.card03}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc03" type="number" class="form-control" name="etc03" value="${balance.etc03}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance03" type="number" class="form-control" name="balance03" value="${balance.balance03}">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">04월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance04" type="number" class="form-control" name="prebalance04" value="${balance.prebalance04}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal04" type="number" class="form-control" name="deal04" value="${balance.deal04}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash04" type="number" class="form-control" name="cash04" value="${balance.cash04}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check04" type="number" class="form-control" name="check04" value="${balance.check04}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card04" type="number" class="form-control" name="card04" value="${balance.card04}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc04" type="number" class="form-control" name="etc04" value="${balance.etc04}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance04" type="number" class="form-control" name="balance04" value="${balance.balance04}">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">05월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance05" type="number" class="form-control" name="prebalance05" value="${balance.prebalance05}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal05" type="number" class="form-control" name="deal05" value="${balance.deal05}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash05" type="number" class="form-control" name="cash05" value="${balance.cash05}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check05" type="number" class="form-control" name="check05" value="${balance.check05}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card05" type="number" class="form-control" name="card05" value="${balance.card05}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc05" type="number" class="form-control" name="etc05" value="${balance.etc05}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance05" type="number" class="form-control" name="balance05" value="${balance.balance05}">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">06월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance06" type="number" class="form-control" name="prebalance06" value="${balance.prebalance06}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal06" type="number" class="form-control" name="deal06" value="${balance.deal06}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash06" type="number" class="form-control" name="cash06" value="${balance.cash06}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check06" type="number" class="form-control" name="check06" value="${balance.check06}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card06" type="number" class="form-control" name="card06" value="${balance.card06}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc06" type="number" class="form-control" name="etc06" value="${balance.etc06}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance06" type="number" class="form-control" name="balance06" value="${balance.balance06}">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">07월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance07" type="number" class="form-control" name="prebalance07" value="${balance.prebalance07}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal07" type="number" class="form-control" name="deal07" value="${balance.deal07}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash07" type="number" class="form-control" name="cash07" value="${balance.cash07}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check07" type="number" class="form-control" name="check07" value="${balance.check07}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card07" type="number" class="form-control" name="card07" value="${balance.card07}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc07" type="number" class="form-control" name="etc07" value="${balance.etc07}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance07" type="number" class="form-control" name="balance07" value="${balance.balance07}">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">08월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance08" type="number" class="form-control" name="prebalance08" value="${balance.prebalance08}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal08" type="number" class="form-control" name="deal08" value="${balance.deal08}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash08" type="number" class="form-control" name="cash08" value="${balance.cash08}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check08" type="number" class="form-control" name="check08" value="${balance.check08}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card08" type="number" class="form-control" name="card08" value="${balance.card08}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc08" type="number" class="form-control" name="etc08" value="${balance.etc08}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance08" type="number" class="form-control" name="balance08" value="${balance.balance08}">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">09월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance09" type="number" class="form-control" name="prebalance09" value="${balance.prebalance09}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal09" type="number" class="form-control" name="deal09" value="${balance.deal09}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash09" type="number" class="form-control" name="cash09" value="${balance.cash09}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check09" type="number" class="form-control" name="check09" value="${balance.check09}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card09" type="number" class="form-control" name="card09" value="${balance.card09}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc09" type="number" class="form-control" name="etc09" value="${balance.etc09}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance09" type="number" class="form-control" name="balance09" value="${balance.balance09}">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">10월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance10" type="number" class="form-control" name="prebalance10" value="${balance.prebalance10}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal10" type="number" class="form-control" name="deal10" value="${balance.deal10}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash10" type="number" class="form-control" name="cash10" value="${balance.cash10}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check10" type="number" class="form-control" name="check10" value="${balance.check10}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card10" type="number" class="form-control" name="card10" value="${balance.card10}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc10" type="number" class="form-control" name="etc10" value="${balance.etc10}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance10" type="number" class="form-control" name="balance10" value="${balance.balance10}">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">11월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance11" type="number" class="form-control" name="prebalance11" value="${balance.prebalance11}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal11" type="number" class="form-control" name="deal11" value="${balance.deal11}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash11" type="number" class="form-control" name="cash11" value="${balance.cash11}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check11" type="number" class="form-control" name="check11" value="${balance.check11}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card11" type="number" class="form-control" name="card11" value="${balance.card11}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc11" type="number" class="form-control" name="etc11" value="${balance.etc11}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance11" type="number" class="form-control" name="balance11" value="${balance.balance11}">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: center;">12월</span>
						<span class="input-group-addon addon2"></span>
						<input id="balance_prebalance12" type="number" class="form-control" name="prebalance12" value="${balance.prebalance12}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_deal12" type="number" class="form-control" name="deal12" value="${balance.deal12}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_cash12" type="number" class="form-control" name="cash12" value="${balance.cash12}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_check12" type="number" class="form-control" name="check12" value="${balance.check12}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_card12" type="number" class="form-control" name="card12" value="${balance.card12}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_etc12" type="number" class="form-control" name="etc12" value="${balance.etc12}">
						<span class="input-group-addon addon2"></span>
						<input id="balance_balance12" type="number" class="form-control" name="balance12" value="${balance.balance12}">
					</div>
					<div class="row" style="margin-top: 3px;">
						<div class="col-md-4">
							<button id="balance_save" type="submit" class="btn btn-success btn_sty5">
								<i class="fas fa-save"></i> 저장
							</button>
						</div>
						<div class="col-md-4">
							<button id="balance_reset" type="reset" class="btn btn-warning btn_sty5">
								<i class="fas fa-redo-alt"></i> 초기화
							</button>
						</div>
						<div class="col-md-4">
							<button id="balance_delete" type="button" class="btn btn-default btn-danger btn_sty5">
								<i class="fas fa-ban"></i> 삭제
							</button>
						</div>
					</div>
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
</body>
</html>