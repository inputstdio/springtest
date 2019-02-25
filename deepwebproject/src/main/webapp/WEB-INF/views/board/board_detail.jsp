<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
<script src="resources/js/parsley.min.js"></script>
<script src="resources/js/parsley.en.js"></script>
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
<link rel="stylesheet" href="resources/css/board_detail.css">
</head>
<body>
	<form id="boardModify" name="boardModify" action="boardModify" method="post" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 10%; margin-bottom: 2%;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<span class="title"><i class="fas fa-edit"> DataTable Page</i></span>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="padding-top: 2%; padding-bottom: 2%; border: 3px solid white; border-radius: 7px;">
					<input id="b_seq" name="b_seq" type="text" value="${board.b_seq}" style="visibility: hidden;">
					<div class="input-group">
						<span class="input-group-addon"><i class="fas fa-envelope"> E-mail</i></span><input id="b_email" type="email" class="form-control" name="b_email" value="${board.b_email}" readonly="readonly">
					</div>
					<div class="input-group">
						<span class="input-group-addon"><i class="fas fa-user-tie"> Name</i></span><input id="b_name" type="text" class="form-control" name="b_name" value="${board.b_name}" readonly="readonly">
					</div>
					<div class="input-group">
						<span class="input-group-addon"><i class="fas fa-dice-d6"> Title</i></span>
						<c:choose>
							<c:when test="${permission==true}">
								<input id="b_title" type="text" class="form-control" name="b_title" required="required" value="${board.b_title}">
							</c:when>
							<c:otherwise>
								<input id="b_title" type="text" class="form-control" name="b_title" value="${board.b_title}" readonly="readonly">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="input-group">
						<span class="input-group-addon"><i class="fas fa-file"> File</i></span> <input id="attach_name" type="text" class="form-control" value="${attach}" readonly="readonly">
						<c:if test="${permission==true}">
							<input id="attach_btn" type="button" class="form-control btn btn-default btn-primary" value="Attached file">
						</c:if>
					</div>
					<input id="b_attach" type="file" name="attach_file" style="visibility: hidden;">
					<div style="width: 100%; margin-top: 5px;">
						<c:choose>
							<c:when test="${permission==true}">
								<textarea rows="5" id="b_content" name="b_content" style="resize: none; width: 100%;">${board.b_content}</textarea>
							</c:when>
							<c:otherwise>
								<textarea rows="5" id="b_content" name="b_content" readonly="readonly" style="resize: none; width: 100%;">${board.b_content}</textarea>
							</c:otherwise>
						</c:choose>
						<script type="text/javascript">
							CKEDITOR.replace('b_content')
						</script>
					</div>
					<div class="row" style="margin-top: 3px;">
						<c:choose>
							<c:when test="${permission==true}">
								<div class="col-md-3">
									<button id="board_modify" type="button" class="btn btn-default btn-success btn_sty5">
										<i class="fas fa-edit"></i> Modify
									</button>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-md-2"></div>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${permission==true||admin==true}">
								<div class="col-md-3">
									<button id="board_save" type="button" onclick="location.href='boardBack'" class="btn btn-default btn-warning btn_sty5">
										<i class="fas fa-caret-left"></i> Back
									</button>
								</div>
								<div class="col-md-3">
									<button id="board_reply" type="button" onclick="location.href='boardReplyForm?b_title=${board.b_title}&b_seq=${board.b_seq}'" class="btn btn-default btn-warning btn_sty5">
										<i class="fas fa-reply"></i> Reply
									</button>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-md-4">
										<button id="board_save" type="button" onclick="location.href='boardBack'" class="btn btn-default btn-warning btn_sty5">
										<i class="fas fa-caret-left"></i> Back
									</button>
								</div>
								<div class="col-md-4">
									<button id="board_reply" type="button" onclick="location.href='boardReplyForm?b_title=${board.b_title}&b_seq=${board.b_seq}'" class="btn btn-default btn-warning btn_sty5">
										<i class="fas fa-reply"></i> Reply
									</button>
								</div>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${permission==true||admin==true}">
								<div class="col-md-3">
									<button id="board_delete" type="button" class="btn btn-default btn-danger btn_sty5">
										<i class="fas fa-trash-alt"></i> Delete
									</button>
								</div>
							</c:when>
							<c:otherwise>
								<div class="col-md-2"></div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
		<div id="boardModal" class="modal fade" role="dialog">
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
						<button type="button" class="btn btn-danger modal_btn1" data-miss="modal">Yes</button>
						<button type="button" class="btn btn-success modal_btn2" data-miss="modal">No</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>