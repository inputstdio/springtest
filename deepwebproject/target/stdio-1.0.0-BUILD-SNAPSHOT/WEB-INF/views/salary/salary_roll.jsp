<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salary Roll</title>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="resources/css/salary_roll.css">
</head>
<body>
	<form name="salaryRollForm" id="salaryRollForm" method="get" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<span class="title" style="font-size: 45px; font-weight: bold; color: white; text-shadow: 2px 2px 2px black;"><i class="fas fa-chalkboard"> Salary Roll</i></span>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-12" style="font-size: 13px;">
					<table id="salaryRollDatatable" class="table table-striped table-boredred">
						<thead>
							<tr>
								<th>사원번호
								<th>부서
								<th>이름
								<th>연간 총급여액
								<th>근로소득공제
								<th>근로소득금액
								<th>연금보험료공제
								<th>인적공제
								<th>특별소득공제
								<th>과세표준
								<th>산출세액
								<th>근로소득세액공제
								<th>결정세액
								<th>간이세액
							</tr>
						</thead>
						<tbody>
							<c:forEach var="salaryroll" items="${salaryrolls}" varStatus="status">
								<tr>
									<td>${salaryroll.empno}
									<td>${salaryroll.dept}
									<td>${salaryroll.name}
									<td><fmt:formatNumber value="${salaryroll.pay12}" type="number"/>
									<td><fmt:formatNumber value="${salaryroll.incomededuction}" type="number"/>
									<td><fmt:formatNumber value="${salaryroll.incomeamount}" type="number"/>
									<td><fmt:formatNumber value="${salaryroll.annuityinsurance}" type="number"/>
									<td><fmt:formatNumber value="${salaryroll.personaldeduction}" type="number"/>
									<td><fmt:formatNumber value="${salaryroll.specialdeduction}" type="number"/>
									<td><fmt:formatNumber value="${salaryroll.standardamount}" type="number"/>
									<td><fmt:formatNumber value="${salaryroll.calculatedtax}" type="number"/>
									<td><fmt:formatNumber value="${salaryroll.incometax}" type="number"/>
									<td><fmt:formatNumber value="${salaryroll.decidedtax}" type="number"/>
									<td><fmt:formatNumber value="${salaryroll.simpletax}" type="number"/>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$('#salaryRollDatatable').DataTable();
	</script>
</body>
</html>