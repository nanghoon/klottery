<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html data-wf-page="634f95d53807ee086a4395da" data-wf-site="6344daf512b57b20012a8255">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../userFrame/header.jsp"></jsp:include>
</head>
<body>
	<div class="frame">
		<jsp:include page="../userFrame/top.jsp"></jsp:include>
		<div class="login-content">
			<div class="login-contentwrap">
				<div class="myinfotxt _1">로그인</div>
				<div class="form-block w-form">
					<form id="loginForm" method="post" class="form">
						<input type="text" class="text-field-5 w-input" maxlength="20" name="id" placeholder="아이디 입력" value="${cookieId }">
						<input type="password" class="text-field-5 w-input" maxlength="20" name="pw" placeholder="비밀번호 입력">
						<label class="w-checkbox">
							<input type="checkbox" name="saveId" id="saveId" class="w-checkbox-input" ${cookieId != null ? 'checked' : '' }>
							<span class="checkbox-label w-form-label" for="saveId">아이디 저장</span>
						</label>
					</form>
				</div>
				<a href="javascript:login()" class="loginbtn w-button">로그인</a>
				<div class="div-block-35">
					<div class="text-block-55" onclick="location.href='/klottery/join.do'">회원가입</div>
					<div class="text-block-55" onclick="location.href='/klottery/findId.do'">아이디찾기</div>
					<div class="text-block-55 _1" onclick="location.href='/klottery/findPw.do'">비밀번호찾기</div>
				</div>
			</div>
		</div>		
		<jsp:include page="../userFrame/bottom.jsp"></jsp:include>
	</div>
	<jsp:include page="../userFrame/footer.jsp"></jsp:include>
</body>
<script>
function login(){
	let formdata = $("#loginForm").serialize();
	$.ajax({
		type :'post',
		data : formdata,
		url : '/klottery/loginProcess.do',
		success:function(data){
			alert(data.msg);
			if(data.result == 'suc') location.href='/klottery/main.do';
		},error:function(e){
			console.log(e);
		}
	})
}
</script>
</html>