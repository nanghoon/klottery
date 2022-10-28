<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../adminFrame/header.jsp"></jsp:include>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../adminFrame/top.jsp"></jsp:include>
		<jsp:include page="../adminFrame/left.jsp"></jsp:include>
		<div id="page-wrapper">
			<form action="/klottery/admin/user/userList.do" name="listForm" id="listForm">
				<input type="hidden" name="pageIndex" id="pageIndex" value="1" />
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">회원관리</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading"></div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-4">
										<div class="form-group ">
											<label>회원검색 (아이디/이름)</label>
											<div class="form-group input-group">
												<input type="text" name="search" onkeypress="if(event.keyCode==13) {javascript:checkForm(); return false;}" class="form-control" value="${search}" placeholder="아이디 / 이름 "> 
												<span class="input-group-btn">
													<button class="btn btn-default" onclick="checkForm()" type="button" style="padding:9px 12px;">
														<i class="fa fa-search"></i>
													</button>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>아이디</th>
												<th>이름</th>
												<th>생년월일</th>
												<th>이메일</th>
												<th>휴대폰</th>
												<th>포인트</th>
												<th>가입일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${list}" varStatus="i">
												<tr onclick="location.href='/klottery/admin/user/userDetail.do?idx=${item.idx}'" style="cursor: pointer">
													<td>${item.id}</td>
													<td>${item.name}</td>
													<td>${item.birth}</td>
													<td>${item.email}</td>
													<td>${item.phone}</td>
													<td><fmt:formatNumber value="${item.point}"/></td>
													<td><fmt:formatDate value="${item.jdate}" type="date" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="row">
									<div class="col-sm-12" style="text-align: center;">
										<ul class="pagination">
											<ui:pagination paginationInfo="${pi}" type="admin" jsFunction="page" />
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<jsp:include page="../adminFrame/footer.jsp"></jsp:include>
	<script>
		function page(num) {
			$("#pageIndex").val(num);
			$("#listForm").submit();
		}
		function checkForm() {
			$("#listForm").submit();
		}
	</script>
</body>
</html>