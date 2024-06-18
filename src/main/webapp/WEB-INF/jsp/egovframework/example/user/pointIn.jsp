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
				<a href="javascript:void(0)" class="link l">포인트충전</a>
				<a href="/klottery/pointOut.do" class="link">출금하기</a> 
				<a href="/klottery/myinfo.do" class="link">개인정보</a>
			</div>
		</div>
		<div class="info_content-copy-copy">
			<div class="hit_content_wrap">
				<div class="hit_list_title-copy-copy">
					<a href="#" class="myinfobtn-copy _3 w-button">보유금액 0원</a>
				</div>
				<div class="info_content">
					<div class="w-form">
						<form id="email-form" name="email-form" data-name="Email Form"
							method="get">
							<div class="info _3">
								<div class="info-box">
									<a href="#" class="myinfobtn-copy w-button">계좌이체</a>
								</div>
							</div>
							<div class="info _4">
								<div class="info-box _1">
									<div class="text-block-49-copy">- 입금 계좌를 꼭 확인하시고 진행하시길
										바랍니다.</div>
									<div class="text-block-49-copy">- 이용자와 입금자명이 동일해야 정상적으로
										처리됩니다.</div>
								</div>
								<div class="info-box _1">
									<div class="info-box-copy">
										<div class="text-block-37-copy-copy">· 은행명</div>
										<div class="text-block-49">ID</div>
									</div>
									<div class="info-box-copy">
										<div class="text-block-37-copy-copy">· 계좌명</div>
										<div class="text-block-49">ID</div>
									</div>
									<div class="info-box-copy">
										<div class="text-block-37-copy-copy">· 계좌번호</div>
										<div class="text-block-49">ID</div>
									</div>
									<div class="info-box-copy">
										<div class="text-block-37-copy-copy">· 이체금액</div>
										<select id="field-4" name="field-4" data-name="Field 4"
											class="select-field-2-copy w-select">
											<option value="">Select one...</option>
											<option value="First">First choice</option>
											<option value="Second">Second choice</option>
											<option value="Third">Third choice</option>
										</select>
									</div>
									<div class="text-block-49-copy">원하는 이체금액을 선택하세요.</div>
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
					<a href="#" class="button-2-copy w-button">결제하기</a>
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