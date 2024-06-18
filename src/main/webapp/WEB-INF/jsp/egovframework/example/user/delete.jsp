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
		<div class="banner2">
			<div class="bannerwrap2">
				<div class="myinfotxt">AAA님의 포인트 현황</div>
				<div class="div-block-26">
					<div class="div-block-27">
						<div class="text-block-45">보유 포인트</div>
						<div class="div-block-28">
							<div class="text-block-46">012,345</div>
							<div class="text-block-47">포인트</div>
							<a href="#" class="link-5">내역보기</a>
						</div>
					</div>
					<div class="div-block-27">
						<div class="text-block-45">구매가능게임</div>
						<div class="div-block-28">
							<div class="text-block-46">012,345</div>
							<div class="text-block-47">GAME</div>
							<a href="#" class="link-5">내역보기</a>
						</div>
					</div>
					<div class="div-block-27">
						<div class="text-block-45">출금가능포인트</div>
						<div class="div-block-28">
							<div class="text-block-46">012,345</div>
							<div class="text-block-47">원</div>
							<a href="#" class="link-5">내역보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="selectgame">
			<div class="selectcontactwrap">
				<a href="/klottery/mypage.do" class="link">마이페이지홈</a> 
				<a href="/klottery/buyhit.do" class="link">구매/당첨내역</a>
				<a href="/klottery/point.do" class="link">포인트내역</a> 
				<a href="/klottery/pointIn.do" class="link">포인트충전</a>
				<a href="/klottery/pointOut.do" class="link">출금하기</a> 
				<a href="javascript:void(0)" class="link l">개인정보</a>
			</div>
		</div>
		<div class="hit_content">
			<div class="hit_content_wrap">
				<div class="div-block-25">
					<a href="/klottery/myinfo.do" class="myinfobtn w-button">개인정보</a> 
					<a href="javascript:void(0)" class="myinfobtn click w-button">회원탈퇴</a>
				</div>
				<div class="text-block-49-copy">- 탈퇴 후, 재가입은 회원탈퇴일을 기준으로 한달
					이후부터 가능합니다.</div>
				<div class="text-block-49-copy">- 회원 탈퇴 후 재가입시에는 이전 거래내역 및 캐쉬는
					초기화 됩니다.</div>
				<div class="text-block-49-copy">- 회원을 탈퇴하고자 하시는 경우 먼저 다음 조치를
					진행하여 주시기 바랍니다.</div>
				<div class="text-block-49-copy">
					· <span class="text-span-5">추첨일 미도래 복권</span>(메가밀리언,파워볼)이 있는 경우 <span
						class="text-span-5">추첨일 이후 진행</span>하여 주십시오.
				</div>
				<div class="text-block-49-copy">
					· 복권(메가밀리언,파워볼)구매, 또는 환급을 통하여 <span class="text-span-5">캐쉬
						잔액이 0이 되도록</span> 하여 주십시오.
				</div>
				<div class="text-block-49-copy">
					(단, 잔액캐쉬가 남아있을 시 탈퇴가 불가능 하며, <span class="text-span-5">1:1문의란</span>에
					남겨주세요.)
				</div>
				<div class="hit_list_content">
					<div class="hit_list_title-copy _1">
						<a href="#" class="myinfobtn-copy w-button">회원탈퇴</a>
					</div>
					<div class="w-form">
						<form id="email-form" name="email-form" data-name="Email Form"
							method="get">
							<div class="contact">
								<div class="text-block-37">· 이름</div>
								<div class="text-block-49">ID</div>
							</div>
							<div class="contact">
								<div class="text-block-37">
									<span class="text-span-2">*</span> 탈퇴사유
								</div>
								<select id="field" name="field" data-name="Field"
									class="select-field w-select">
									<option value="Second">Second choice</option>
									<option value="Third">Third choice</option>
								</select>
							</div>
							<div class="contact _1">
								<div class="text-block-37">· 기타의견</div>
								<div class="div-block-14">
									<textarea placeholder="Example Text" maxlength="5000"
										id="field-3" name="field-3" data-name="field"
										class="textarea w-input"></textarea>
								</div>
							</div>
						</form>
						<div class="w-form-done">
							<div>Thank you! Your submission has been received!</div>
						</div>
						<div class="w-form-fail">
							<div>Oops! Something went wrong while submitting the form.</div>
						</div>
					</div>
				</div>
				<div class="div-block-15">
					<a href="#" class="button-2-copy _2 w-button">취소</a> <a href="#"
						class="button-2-copy w-button">탈퇴</a>
				</div>
			</div>
		</div>
		<jsp:include page="../userFrame/bottom.jsp"></jsp:include>
	</div>
	<jsp:include page="../userFrame/popup.jsp"></jsp:include>
	<jsp:include page="../userFrame/footer.jsp"></jsp:include>
</body>
<script>
function page(pageNo) {
	document.listForm.pageIndex.value = pageNo;
	document.listForm.submit();
}
</script>

</html>