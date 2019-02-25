<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>Salary Insert Form</title>
	<script src="resources/js/parsley.min.js"></script>
	<script src="resources/js/parsley.en.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="resources/css/salary_insert_form.css">
</head>
<body>
	<form name="salaryInsert" id="salaryInsert" method="post" action="salaryInsert" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 2%; margin-bottom: 2%;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<span class="title"><i class="fas fa-edit"> Salary Register Page</i></span>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="padding-top: 2%; padding-bottom: 2%; border: 3px solid white; border-radius: 7px;">
					<div class="input-group">
						<span class="input-group-addon" style="text-align: left;"><i class="fas fa-address-card"> Empno</i></span>
						<input id="empno" type="number" class="form-control" name="empno" placeholder="Enter Employee number" required="required">
						<button id="empno_check" class="btn btn-primary form-control" type="button"> Check</button>
						<input type="hidden" id="empno_available" value="false">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="text-align: left;"><i class="fas fa-user-tie"> Name</i></span>
						<input id="name" type="text" class="form-control" name="name" placeholder="Enter Name">
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="text-align: left;"><i class="fas fa-dice-d6"> Dept</i></span>
						<select name="dept" class="form-control">
	                    <c:forEach var="dept" items="${depts}">
	                        <option value="${dept.code}">${dept.name}</option>
	                    </c:forEach>
                        </select> 
					</div>
					<div class="input-group">
						<span class="input-group-addon" style="text-align: left;"><i class="fas fa-calendar-alt"> Date</i></span>
						<input id="birth_date" type="text" class="form-control" name="birth_date" placeholder="Enter Employment date">
					</div>
					<hr style="border:none; border:2px solid white; width: 100%;">
					<div class="input-group">
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-money-check-alt"> Pay</i></span>
						<input id="pay" type="number" class="form-control" name="pay">
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-hand-holding-usd"> Extra</i></span>
						<input id="extra" type="number" class="form-control" name="extra">
					</div>
					<hr style="border:none; border:2px solid white; width: 100%;">
					<div class="input-group">
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-venus-mars"> Spouse</i></span>
						<select name="partner" class="form-control">
							<option value="0">0</option>
							<option value="1">1</option>
						</select>
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-wheelchair"> Disabled</i></span>
						<select name="disabled" class="form-control">
							<option value="0">0</option>
							<option value="1">1</option>
						</select>
					</div>
					
					<div class="input-group">
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-blind"> Dependent20</i></span>
						<select name="dependent20" class="form-control">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
						</select>
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-blind"> Dependent60</i></span>
						<select name="dependent60" class="form-control">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
						</select>
					</div>
					
					<div class="input-group">
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-female"> Womanpower</i></span>
						<select name="womanpower" class="form-control">
							<option value="0">0</option>
							<option value="1">1</option>
						</select>
						<span class="input-group-addon addon2" style="text-align: left;"><i class="fas fa-calculator"> Calculation</i></span>
						<select name="yn" class="form-control">
							<option value="y">0</option>
							<option value="n">1</option>
						</select>
					</div>
					
					<div class="row" style="margin-top: 3px;">
						<div class="col-md-4">
							<button id="salary_save" type="submit" class="btn btn-success btn_sty5">
								<i class="fas fa-save"></i> Save
							</button>
						</div>
						<div class="col-md-4">
							<button id="salary_reset" type="reset" class="btn btn-warning btn_sty5">
								<i class="fas fa-redo-alt"></i> Reset
							</button>
						</div>
						<div class="col-md-4">
							<button id="salary_cancel" type="button" onclick="location.href='index'" class="btn btn-default btn-danger btn_sty5">
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
	<script type="text/javascript">
		$("#birth_date").datepicker({
	    	dateFormat: "yy/mm/dd"
	    });
	</script>
</body>
</html>