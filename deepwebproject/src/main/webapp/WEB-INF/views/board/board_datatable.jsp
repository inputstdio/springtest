<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Datatable</title>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="resources/css/board_datatable.css">
</head>
<body>
	<form name="member_list_form" id="member_list_form" method="get" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<span class="title" style="font-size: 45px; font-weight: bold; color: white; text-shadow: 2px 2px 2px black;"><i class="fas fa-chalkboard"> Board Datatable</i></span>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<table id="datatable_list" class="table table-striped table-boredred">
						<thead>
							<tr>
								<td>No.
								<td>E-mail
								<td>Name
								<td class="title">Title
								<td>Date
								<td class="hit">Hit
								<td>Attach
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boards}" varStatus="status">
								<tr>
									<td>${board.b_ref}</td>
									<td>${board.b_email}
									<td>${board.b_name}
									<td><c:if test="${board.b_step ge 1}">
											<i class="fab fa-replyd" style="font-weight: bold; font-size: 18px"></i>
										</c:if> <a href="boardDetail?b_seq=${board.b_seq}"> ${board.b_title} </a></td>
									<td>${board.b_date}
									<td>${board.b_hit}
									<td><c:if test="${board.b_attach!=''}">
											<a href="boardDownload?b_attach=${board.b_attach}"><i id="attach_file" class="fas fa-file-alt"></i></a>
											<%-- <a href="/resources/attach/${board.b_attach}" download></a> --%>
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="form-group" style="margin-top: 3px;">
						<div class="col-sm-3">
							<c:choose>
								<c:when test="${session_email==null}">
								</c:when>
								<c:otherwise>
									<button type="button" onclick="location.href='boardInsertForm'" class="btn btn-danger btn_sty1">
										<i class="fas fa-pen"></i> Write
									</button>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col-sm-6"></div>
						<div class="col-sm-3">
							<button type="button" onclick="location.href='index'" class="btn btn-success btn_sty1">
								<i class="fas fa-home"></i> Home
							</button>
						</div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</form>
	<script type="text/javascript">
		$('#datatable_list').DataTable();
	</script>
</body>
</html>