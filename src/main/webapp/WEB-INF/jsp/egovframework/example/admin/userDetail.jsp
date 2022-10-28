<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
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
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">회원 정보</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
						${info.name}님의	회원 정보 &nbsp; (가입 일 : <fmt:formatDate value="${info.jdate}" type="date"></fmt:formatDate>)
						</div>
						<div class="panel-body">
							<form name="updateForm" id="updateForm" method="post">
								<input type="hidden" value="${info.idx}" name="idx"/>
									<div class="row">
										<div class="col-lg-4">
											<div class="form-group">
												<label>아이디</label> 
												<pre>${info.id}</pre>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="form-group">
												<label>이름</label> 
												<pre>${info.name}</pre>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="form-group">
												<label>포인트</label> 
												<pre><fmt:formatNumber value="${info.point}"/></pre>
											</div>
										</div>
										<%-- <div class="col-lg-4">
											<div class="form-group">
												<label>회원코드</label> 
												<pre>${info.code}</pre>
											</div>
										</div> --%>
										</div>
										<div class="row">
											<div class="col-lg-4">
												<div class="form-group">
													<label>생년월일</label> 
													<pre>${info.birth}</pre>
												</div>
											</div>
											<div class="col-lg-4">
											<div class="form-group">
												<label>연락처</label>
													<pre>${info.phone}</pre>												
												</div>
											</div>
											<div class="col-lg-4">
												<div class="form-group">
													<label>이메일</label> 
													<pre>${info.email}</pre>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4">
												<div class="form-group">
													<label>SMS 수신여부</label> 
													<pre>${info.sms == 1 ? 'Y' : 'N'}</pre>
												</div>
											</div>
											<div class="col-lg-4">
												<div class="form-group">
													<label>email 수신여부</label> 
													<pre>${info.mail == 1 ? 'Y' : 'N'}</pre>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				<button type="button" onclick="location.href='/klottery/admin/user/userList.do'" class="btn btn-default">회원 목록</button>
			</div>
		</div>
	<jsp:include page="../adminFrame/footer.jsp"></jsp:include>
	<script>
	</script>
</body>
</html>