<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Reply</title>
<script src="resources/js/parsley.min.js"></script>
<script src="resources/js/parsley.en.js"></script>
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
<link rel="stylesheet" href="resources/css/board_reply_form.css">
</head>
<body>
	<form id="boardReply" name="boardReply" action="boardReply" method="post" enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 10%; margin-bottom: 2%;">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<span class="title"><i class="fas fa-edit"> Board Reply Page</i></span>
					<input id="b_ref" name="b_ref" type="text" value="${board.b_ref}" style="visibility: hidden;">
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="padding-top: 2%; padding-bottom: 2%; border: 3px solid white; border-radius: 7px;">
					<div class="input-group">
						<span class="input-group-addon"><i class="fas fa-envelope"> E-mail</i></span><input id="b_email" type="email" class="form-control" name="b_email" value="${session_email}" readonly="readonly">
					</div>
					<div class="input-group">
						<span class="input-group-addon"><i class="fas fa-user-tie"> Name</i></span><input id="b_name" type="text" class="form-control" name="b_name" value="${session_name}" readonly="readonly">
					</div>
					<div class="input-group">
						<span class="input-group-addon"><i class="fas fa-dice-d6"> Title</i></span><input id="b_title" type="text" class="form-control" name="b_title" value="${board.b_title}" readonly="readonly">
					</div>
					<div class="input-group">
						<span class="input-group-addon"><i class="fas fa-file"> File</i></span> <input id="attach_name" type="text" class="form-control" value="no attached files" readonly="readonly">
						<input id="attach_btn" type="button" class="form-control btn btn-default btn-primary" value="Attached file">
					</div>
					<input id="b_attach" type="file" name="attach_file" style="visibility: hidden;">
					<div style="width: 100%; margin-top: 5px;">
						<textarea rows="5" id="b_content" name="b_content" style="resize: none; width: 100%;"></textarea>
						<script type="text/javascript">CKEDITOR.replace('b_content')</script>
					</div>
					<div class="row" style="margin-top: 3px;">

						<div class="col-md-4">
							<button id="board_save" type="submit" class="btn btn-default btn-success btn_sty5">
								<i class="fas fa-save"></i> Save
							</button>
						</div>
						<div class="col-md-4">
							<button id="board_reset" type="reset" class="btn btn-default btn-warning btn_sty5">
								<i class="fas fa-redo-alt"></i> Reset
							</button>
						</div>
						<div class="col-md-4">
							<button id="board_cancel" type="button" onclick="location.href='boardList?search='" class="btn btn-default btn-danger btn_sty5">
								<i class="fas fa-ban"></i> Cancel
							</button>
						</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</form>
</body>
</html>