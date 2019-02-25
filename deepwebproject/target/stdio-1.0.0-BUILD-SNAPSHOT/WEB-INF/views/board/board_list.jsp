<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<link rel="stylesheet" href="resources/css/board_list.css">
</head>
<body>
	<form name="board_list_form" id="board_list_form" method="get" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<span class="title" style="font-size: 45px; font-weight: bold; color: white; text-shadow: 2px 2px 2px black;"><i class="fas fa-chalkboard"> Board List</i></span>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-2"></div>
				<div class="col-sm-3"></div>
				<div class="col-sm-3"></div>
				<div class="col-sm-2">
					<button type="button" onclick="location.href='index'" class="btn btn-success btn_sty1">
						<i class="fas fa-home"></i> Home
					</button>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<table>
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
									<td>
										${board.b_ref}
									</td>
									<td>${board.b_email}
									<td>${board.b_name}
									<td>
										<c:if test="${board.b_step ge 1}"><i class="fab fa-replyd" style="font-weight: bold; font-size: 18px"></i></c:if>
										<a href="boardDetail?b_seq=${board.b_seq}">
										${board.b_title}
										</a>
									</td>
									<td>${board.b_date}
									<td>${board.b_hit}
									<td>
										<c:if test="${board.b_attach!=''}">
											<a href="boardDownload?b_attach=${board.b_attach}"><i id="attach_file" class="fas fa-file-alt"></i></a>
											<%-- <a href="/resources/attach/${board.b_attach}" download></a> --%>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row" style="margin-top: 1%; font-size: 16px;">
						<div class="col-sm-2"></div>
						<div class="col-sm-8">
							<c:forEach var="page" items="${pages}">
								<c:choose>
									<c:when test="${selected_page==page}">
										<span style="font-weight: bold; color: #333333;">[${page}]</span>
									</c:when>
									<c:otherwise>
										<a href="boardPageListSelected?page=${page}">[${page}]</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</div>
						<div class="col-sm-2"></div>
					</div>
					<div class="row" style="margin-top: 2%;">
						<div class="col-sm-2"></div>
						<div class="col-sm-8">
							<div class="input-group">
								<input type="text" id="boardSearch" name="search" class="form-control" placeholder="Please enter a search&hellip;"> <span class="input-group-btn">
									<button type="button" id="board_search" class="btn btn-warning btn_sty2">
										<i class="fas fa-search"></i> Search
									</button> <c:choose>
										<c:when test="${session_email==null}">
										</c:when>
										<c:otherwise>
											<button type="button" onclick="location.href='boardInsertForm'" class="btn btn-danger btn_sty2">
												<i class="fas fa-pen"></i> Write
											</button>
										</c:otherwise>
									</c:choose>
								</span>
							</div>
						</div>
						<div class="col-sm-2"></div>
					</div>
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</form>
</body>
</html>