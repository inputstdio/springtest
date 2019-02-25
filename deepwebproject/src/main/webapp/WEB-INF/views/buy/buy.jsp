<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>매입</title>
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/js/parsley.ko.js"></script>
	<link rel="stylesheet" href="resources/css/buy.css">
</head>
<body>
	<div class="container" style="text-align: center;">
		<div class="row" style="margin-top: 2%; margin-bottom: 2%;">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<span class="title"><i class="fas fa-cash-register"> 매입</i></span>
			</div>
			<div class="col-md-2"></div>
		</div>
		<div class="row" style="padding-top: 2%; padding-bottom: 2%; border: 3px solid white; border-radius: 7px;">
			<div class="col-md-6">
				<form name="buyInsert" id="buyInsert" method="post" action="buyInsert" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-building"> 거래처</i></span>
						<select id="buy_vendcode" class="form-control" name="vendcode" required="required">
							<option value="" disabled selected>:: 거래처 선택 ::</option>
							<c:forEach items="${venders}" var="vender" varStatus="status">
								<option value="${vender.code}">${vender.name}</option>
							</c:forEach>
						</select>
						<input type="hidden" id="buy_vendname" name="vendname" value="">
						<input type="hidden" id="buy_seq" name="seq" value="">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-dice-d6"> 매입번호</i></span>
						<input id="buy_yyyy" type="text" class="form-control" name="yyyy" maxlength="4" readonly="readonly">
						<span class="input-group-addon" style="text-align: center;">-</span>
						<input id="buy_mm" type="text" class="form-control" name="mm" maxlength="2" readonly="readonly" value="">
						<span class="input-group-addon" style="text-align: center;">-</span>
						<input id="buy_dd" type="text" class="form-control" name="dd" maxlength="2" readonly="readonly" value="">
						<span class="input-group-addon" style="text-align: center;">-</span>
						<input id="buy_no" type="text" class="form-control" name="no" maxlength="3" readonly="readonly" value="">
						<span class="input-group-addon" style="text-align: center;">-</span>
						<input id="buy_hanf" type="text" class="form-control" name="hanf" maxlength="3" readonly="readonly" value="">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-box-open"> 상품명</i></span>
						<select id="buy_procodes" class="form-control" required="required">
							<option value="" disabled selected>:: 상품 선택 ::</option>
							<c:forEach items="${products}" var="product" varStatus="status">
								<option value="${product.code}">${product.name}</option>
							</c:forEach>
						</select>
						<input type="hidden" id="buy_proname" name="proname" value="">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-barcode"> 상품코드</i></span>
						<input id="buy_procode" type="text" class="form-control" name="procode" readonly="readonly" value="">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-boxes"> 현재제고</i></span>
						<input id="buy_stock" type="text" class="form-control" name="prostock" readonly="readonly" value="">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-money-bill"> 단가</i></span>
						<input id="buy_price" type="text" class="form-control" name="price" readonly="readonly" value="">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-stream"> 수량</i></span>
						<input id="buy_qty" type="number" class="form-control" name="qty" max="" required="required" data-parsley-trigger="change"  value="">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-dollar-sign"> 금액</i></span>
						<input id="buy_total" type="text" class="form-control" name="total" readonly="readonly" value="">
					</div>
					<div class="input-group">
						<span class="input-group-addon addon1" style="text-align: left;"><i class="fas fa-sticky-note"> 비고</i></span>
						<input id="buy_memo" type="text" class="form-control" name="memo"  value="">
					</div>
					<div class="row" style="margin-top: 5px;">
						<div class="col-md-2"></div>
						<div class="col-md-10 btn-group">
							<button id="buy_update" type="button" class="btn btn-success btn_sty6" style="display: none;">
								<i class="fas fa-sync-alt"></i> 갱신
							</button>
							<button id="buy_save" type="submit" class="btn btn-success btn_sty6">
								<i class="fas fa-save"></i> 저장
							</button>
							<button id="buy_delete" type="button" class="btn btn-warning btn_sty6" style="display: none;">
								<i class="fas fa-trash-alt"></i> 삭제
							</button>
							<button id="buy_reset" type="reset" class="btn btn-warning btn_sty6">
								<i class="fas fa-redo-alt"></i> 초기화
							</button>
							<button id="buy_cancel" type="button" onclick="location.href='index'" class="btn btn-default btn-danger btn_sty6">
								<i class="fas fa-ban"></i> 취소
							</button>
							<button id="buy_new" type="button" class="btn btn-primary btn_sty6">
								<i class="fas fa-edit"></i> 신규
							</button>
						</div>
						<div class="col-md-2"></div>
					</div>
				</form>
			</div>
			<div class="col-md-6">
				<form name="buySearch" id="buySearch" method="get" action="buySearch" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
					<table style="max-height: 270px; overflow: auto;">
						<thead>
							<tr>
								<td>날짜
								<td>No
								<td>항번
								<td>품명
								<td>단가
								<td>수량
								<td>금액
							</tr>
						</thead>
						<tbody>
							<c:forEach var="buy" items="${buys}" varStatus="status">
								<tr>
									<c:choose>
										<c:when test="${buy.hanf==0 && buy.dd!=null}">
											<td colspan="3" class="total" style="border-right: 0px;">
											<td colspan="2" class="total" style="border-left: 0px;">소계
											<td class="total">${buy.qty}
											<td class="total">${buy.total}
										</c:when>
										<c:when test="${buy.hanf==0 && buy.dd==null}">
											<td colspan="3" class="total" style="border-right: 0px;">
											<td colspan="2" class="total" style="border-left: 0px;">총계
											<td class="total">${buy.qty}
											<td class="total">${buy.total}
	                        			</c:when>
                        				<c:otherwise>
                        				 	<td>
											${buy.yyyy}-${buy.mm}-${buy.dd}
										</td>
										<td>${buy.no}
										<td>${buy.hanf}
										<td>
											<a href="#" onclick="selectedSeq(${buy.seq});">
												${buy.proname}
											</a>
										</td>
										<td>${buy.price}
										<td>${buy.qty}
										<td>${buy.total}
                        				 </c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="col-md-12" style="padding-top: 5px;">
						<div class="input-group">
							<select class="form-control" style="min-width: 150px;" id="buy_search_vendcode" name="vendcode">
								<option value="" disabled selected hidden>:: 거래처 선택 ::</option>
								<c:forEach items="${venders}" var="vender" varStatus="status">
									<option value="${vender.code}">${vender.name}</option>
								</c:forEach>
							</select>
							<span class="input-group-addon addon2" style="text-align: center;"></span>
							<input type="text" class="form-control" placeholder="년도" id="buy_search_yyyy" name="yyyy">
							<span class="input-group-addon" style="text-align: center;">-</span>
							<select class="form-control" style="min-width: 70px;" id="buy_search_mm" name="mm">
								<option value="" disabled selected hidden>월</option>
								<c:forEach var="i" begin="1" end="12" step="1">
									<option value="${i}">${i}</option>								
								</c:forEach>
							</select>
							<span class="input-group-addon" style="text-align: center;">-</span>
							<select class="form-control" style="min-width: 70px;" id="buy_search_dd" name="dd">
								<option value="0" selected hidden>일</option>
								<c:forEach var="i" begin="1" end="31" step="1">
									<option value="${i}">${i}</option>						
								</c:forEach>
							</select>
							<div class="input-group-btn">
								<input type="button" id="buy_search_btn" class="btn btn-primary btn_sty1" value="검색">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
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