<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
	<title>Member Search</title>
	<link rel="stylesheet" href="resources/css/member_search.css">
</head>
<body>
	<form name="member_insert_form" id="member_insert_from" method="post" action="memberInsert" class="form-horizontal" data-parsley-validate enctype="multipart/form-data">
		<div class="container" style="text-align: center;">
			<div class="row" style="margin-top: 5%; margin-bottom: 2%;">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<span class="title" style="font-size: 45px; font-weight: bold; color: white; text-shadow: 2px 2px 2px black;"><i class="fas fa-search"> Member Search</i></span>
				</div>
				<div class="col-sm-2"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-2"></div>
				<div class="col-sm-3">
					<c:choose>
			      		<c:when test="${session_level==1}">
							<button type="button" id="selected_delete" class="btn btn-danger btn_sty1" value="${member.email}">Selected Delete</button>
						</c:when>
					</c:choose>
				</div>
				<div class="col-sm-3">
					<c:choose>
			      		<c:when test="${session_level==1}">
							<button type="button" name="fix_all" id="fix_all" class="btn btn-warning btn_sty1"> Level All Fix</button>
						</c:when>
					</c:choose>
				</div>
				<div class="col-sm-2"><button type="button" onclick="location.href='index'" class="btn btn-success btn_sty1"><i class="fas fa-home"></i> Home</button></div>
				<div class="col-sm-2"></div>
			</div>
			<div class="form-group">
				<div class="col-sm-2"></div>
				<div class="col-sm-8">
					<table>
						<thead>
							<tr>
								<c:choose>
			      					<c:when test="${session_level==1}">
										<td><input type="checkbox" name="all" class="check-all"></td>
									</c:when>
								</c:choose>
								<td>Image
								<td>E-mail
								<td>Name
								<td>Phone
								<td>Level
								<c:choose>
			      					<c:when test="${session_level==1}">
										<td>Delete</td>
									</c:when>
								</c:choose>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="member" items="${members}" varStatus="status">
								<tr>
									<c:choose>
			      						<c:when test="${session_level==1}">
											<td class="check"><input type="checkbox" name="check-one" id="check-one" class="check-one" value="${member.email}"></td>
										</c:when>
									</c:choose>
									<td class="img"><img src="${member.photo}" class="serach_photo" alt="Click to expand" title="Click to expand" style="width: 100%; height: 100%;">
									<c:choose>
			      						<c:when test="${session_level==1}">
											<td><a href="memberUpdateForm?email=${member.email}"><span id="email">${member.email}</span></a></td>
										</c:when>
										<c:otherwise>
											<td>
												<c:if test="${session_email==member.email}">
													<a href="memberUpdateForm?email=${member.email}">
												</c:if>
													${member.email}
												<c:if test="${session_email==member.email}">
													</a>
												</c:if>
											</td>
										</c:otherwise>
									</c:choose>
									<td>${member.name}
									<td>${member.phone}
									<td>
									<c:choose>
			      						<c:when test="${session_level==1}">
			      							<select class="form-control level" id="level" name="level" value="${member.level}">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
											</select>
			      						</c:when>
			      						<c:otherwise>
			      							${member.level}
			      						</c:otherwise>
			      					</c:choose>
									</td>
									<c:choose>
			      						<c:when test="${session_level==1}">
											<td><button type="button" id="delete" onclick="memberDeleteFunction(this.value)" class="btn btn-primary btn_sty1" value="${member.email}">Delete</button></td>
										</c:when>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>	
				</div>
				<div class="col-sm-2"></div>
			</div>
		</div>
	</form>
	<div id="member_serach_modal" class="modal fade" role="dialog">
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
	<div id="member_image_modal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="image-modal-header">
				</div>
				<div class="image-modal-body" style="text-align: center;">
					<img class="image-modal-body-img" src="" style="width: 100%; height: 100%;">
				</div>
				<div class="image-modal-footer">
				</div>
			</div>
		</div>
	</div>
</body>
</html>