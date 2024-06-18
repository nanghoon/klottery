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
				<a href="javascript:void(0)" class="link l">포인트내역</a> 
				<a href="/klottery/pointIn.do" class="link">포인트충전</a>
				<a href="/klottery/pointOut.do" class="link">출금하기</a> 
				<a href="/klottery/myinfo.do" class="link">개인정보</a>
			</div>
		</div>
		<div class="info_content-copy-copy">
			<div class="hit_content_wrap"></div>
			<div class="hit_content_wrap-copy">
				<div class="hit_list_title-copy">
					<a href="#" class="myinfobtn-copy w-button">포인트 내역</a>
				</div>
				<div class="hit_content_wrap">
					<div class="hit_list_title _1"></div>
					<div class="w-form">
						<form id="email-form" name="email-form" data-name="Email Form"
							method="get">
							<div class="info _2">
								<div class="text-block-37-copy-copy-copy-copy">· 조회기간</div>
								<div class="div-block-43">
									<div class="div-block-45">
										<input type="text" class="text-field-3-copy-copy _2 w-input"
											maxlength="256" name="field-3" data-name="Field 3"
											placeholder="Example Text" id="field-3" required="">
										<div class="text-block-48">-</div>
										<input type="text" class="text-field-3-copy-copy _2 w-input"
											maxlength="256" name="field-3" data-name="Field 3"
											placeholder="Example Text" id="field-3" required="">
									</div>
									<a href="#" class="button-3 _1-copy w-button">당일</a> <a
										href="#" class="button-3 _1 w-button">1주일</a> <a href="#"
										class="button-3 _1 w-button">1개월</a> <a href="#"
										class="button-3 _1 w-button">3개월</a>
								</div>
							</div>
							<div class="info _1">
								<div class="info-box _3">
									<div class="text-block-37-copy-copy">· 조회결과 순서</div>
									<label class="radio-button-field w-radio"><input
										type="radio" data-name="Radio 4" id="radio-4" name="radio"
										value="Radio"
										class="w-form-formradioinput radio-button w-radio-input"><span
										class="radio-button-label w-form-label" for="radio-4">최근
											내역이  위로 </span></label><label class="radio-button-field w-radio"><input
										type="radio" data-name="Radio 5" id="radio-5" name="radio"
										value="Radio"
										class="w-form-formradioinput radio-button w-radio-input"><span
										class="radio-button-label w-form-label" for="radio-5">과거
											내역이 위로</span></label>
								</div>
							</div>
							<div class="hit_list_content"></div>
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
					<a href="#" class="button-2-copy _1 w-button">조회</a>
				</div>
			</div>
			<div class="hit_content_wrap-copy">
				<div class="hit_list_title-copy">
					<div class="div-block-25">
						<a href="#" class="myinfobtn w-button">구매내역</a> <a href="#"
							class="myinfobtn click w-button">사용내역</a> <a href="#"
							class="myinfobtn w-button">출금내역</a>
					</div>
				</div>
				<div class="hit_content_wrap">
					<div class="hit_list_content">
						<div class="hit_list_title _1">
							<div class="hit_list_title_text">NO.</div>
							<div class="hit_list_title_text _1">충전일시</div>
							<div class="hit_list_title_text _1">내용</div>
							<div class="hit_list_title_text">충전금액</div>
							<div class="hit_list_title_text">적용포인트</div>
							<div class="hit_list_title_text _1">추가적립</div>
							<div class="hit_list_title_text">상태</div>
						</div>
						<div class="hit_list">
							<div class="hit_list_title_text">1320.</div>
							<div class="hit_list_title_text2 _1">2022.09.24 토 12:00</div>
							<div class="hit_list_title_text2 _1">2022.09.24 토 12:00</div>
							<div class="hit_list_title_text2">이월</div>
							<div class="hit_list_title_text2">스캔</div>
							<div class="hit_list_title_text2 _1">$ 301,000,000 4,273억원</div>
							<div class="hit_list_title_text2">2021-10-19</div>
						</div>
						<div class="empty-copy">
							<div class="text-block-35-copy">조회 결과가 없습니다.</div>
						</div>
					</div>
					<div class="pagingbox">
						<div class="pagingboxwrap">
							<a href="#" class="paging prev">&lt;</a> <a href="#"
								class="paging">2</a> <a href="#" class="paging">2</a> <a
								href="#" class="paging">2</a> <a href="#" class="paging">2</a> <a
								href="#" class="paging click">2</a> <a href="#"
								class="paging prev">&gt;</a>
						</div>
					</div>
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