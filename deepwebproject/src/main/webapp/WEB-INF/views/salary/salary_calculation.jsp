<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>Salary Calculation</title>
	<link rel="stylesheet" href="resources/css/salary_calculation.css">
</head>
<body>
	<form name="salaryCalc" id="salaryCalc" method="post" action="salaryCalc" class="form-horizontal" enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 2%; margin-bottom: 2%;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<span class="title"><i class="fas fa-calculator"> Salary Calculation</i></span>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="padding-top: 2%; padding-bottom: 2%; border: 3px solid white; border-radius: 7px;">
					<div class="input-group">
						<span class="input-group-addon" style="text-align: left;"><i class="far fa-calendar-alt"></i> Year</span>
						<input id="calc_year" type="number" class="form-control" name="calc_year" value="${year}">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="text-align: left;"><i class="far fa-calendar-alt"></i> Month</span>
						<select name="calc_month" id="calc_month" class= "form-control">
                        	<c:forEach var="i" begin="1" end="12" step="1" >
                        		<option value="${i}">${i}</option>
                       		</c:forEach>
                        </select> 
					</div>
					
					<div class="row" style="margin-top: 3px;">
						<div class="col-md-4">
							<button id="calc_create" type="button" class="btn btn-success btn_sty5">
								<i class="far fa-plus-square"></i> Create
							</button>
						</div>
						<div class="col-md-4">
							<button id="calc_delete" type="button" class="btn btn-warning btn_sty5">
								<i class="far fa-trash-alt"></i> Delete
							</button>
						</div>
						<div class="col-md-4">
							<button id="calc_cancel" type="button" onclick="location.href='index'" class="btn btn-default btn-danger btn_sty5">
								<i class="fas fa-ban"></i> Cancel
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
					<h2 class="modal-title">Notification</h2>
				</div>
				<div class="modal-body" style="text-align: center; font-size: 20px;">
				<p></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success modal_btn1" data-miss="modal">OK</button>
					<button type="button" class="btn btn-danger modal_btn2" data-miss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>