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
				<a href="javascript:void(0)" class="link l">출금하기</a> 
				<a href="/klottery/myinfo.do" class="link">개인정보</a>
			</div>
		</div>
		<div class="info_content-copy-copy">
			<div class="hit_content_wrap">
				<div class="hit_list_title-copy-copy">
					<div class="div-block-25 _1">
						<a href="#" class="myinfobtn-copy w-button">출금신청 접수하기</a>
					</div>
					<div class="text-block-49-copy">- 출금신청하신 포인트는 본인명의의 계좌번호로
						이체됩니다.</div>
					<div class="text-block-49-copy">- 환급 및 환불시 타 계좌이체시에 발생되는 이체
						수수료 500원은 고객님 부담으로 처리됩니다.</div>
					<div class="text-block-49-copy">- 계좌번호가 정확해야 이체되므로 계좌번호 확인 후
						신청해주시기 바랍니다.</div>
				</div>
				<div class="info_content">
					<div class="w-form">
						<form id="email-form" name="email-form" data-name="Email Form"
							method="get">
							<div class="info _2">
								<div class="info-box">
									<div class="text-block-37-copy-copy _1">· 은행명</div>
									<select id="field-4" name="field-4" data-name="Field 4"
										class="select-field-2-copy w-select">
										<option value="">Select one...</option>
										<option value="First">First choice</option>
										<option value="Second">Second choice</option>
										<option value="Third">Third choice</option>
									</select>
								</div>
							</div>
							<div class="info _4">
								<div class="info-box">
									<div class="text-block-37-copy-copy">· 계좌번호</div>
									<input type="text" class="text-field-3 _1 w-input"
										maxlength="256" name="field-3" data-name="Field 3"
										placeholder="Example Text" id="field-3" required="">
								</div>
								<div class="info-box">
									<div class="text-block-37-copy-copy">· 예금주명</div>
									<div class="text-block-49">ID</div>
								</div>
							</div>
							<div class="info _4">
								<div class="info-box">
									<div class="text-block-37-copy-copy">· 출금신청액</div>
									<input type="text" class="text-field-3 _1 w-input"
										maxlength="256" name="field-3" data-name="Field 3"
										placeholder="Example Text" id="field-3" required="">
								</div>
								<div class="info-box">
									<div class="text-block-37-copy-copy">· 실제출금액</div>
									<div class="text-block-49">
										<span class="text-span-3">0</span>원
									</div>
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
					<a href="#" class="button-2-copy w-button">접수</a>
				</div>
			</div>
			<div class="div-block-31">
				<div class="div-block-44">
					<div class="withdrawtxxtball">신청중</div>
					<div class="div-block-32">
						<div class="text-block-53">01</div>
						<div class="text-block-53 _1">
							계좌 출금신청 완료<br>‍
						</div>
					</div>
				</div>
				<div class="div-block-44">
					<div class="withdrawtxxtball">처리중</div>
					<div class="div-block-32">
						<div class="text-block-53">02</div>
						<div class="text-block-53 _1">
							관리자 접수 완료<br>‍
						</div>
					</div>
				</div>
				<div class="div-block-44">
					<div class="withdrawtxxtball">캐쉬조정</div>
					<div class="div-block-32">
						<div class="text-block-53">03</div>
						<div class="text-block-53 _1">
							사용불가설정<br>
							<span class="text-span-4">(출금신청액,수수료)</span>
						</div>
					</div>
				</div>
				<div class="div-block-44">
					<div class="withdrawtxxtball">신청중</div>
					<div class="div-block-32">
						<div class="text-block-53">04</div>
						<div class="text-block-53 _1">
							출금완료<br>‍
						</div>
					</div>
				</div>
			</div>
			<div class="hit_content_wrap-copy">
				<div class="hit_list_title-copy">
					<a href="#" class="myinfobtn-copy w-button">출금신청 내역 조회</a>
				</div>
				<div class="hit_content_wrap">
					<div class="hit_list_title _1"></div>
					<div class="w-form">
						<form id="email-form" name="email-form" data-name="Email Form"
							method="get">
							<div class="info _4">
								<div class="text-block-37-copy-copy-copy _1">· 조회기간</div>
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
					<a href="#" class="button-2-copy w-button">조회</a>
				</div>
			</div>
			<div class="hit_content_wrap-copy">
				<div class="hit_list_title-copy"></div>
				<div class="hit_content_wrap">
					<div class="hit_list_content">
						<div class="hit_list_title _1">
							<div class="hit_list_title_text">출금요청일</div>
							<div class="hit_list_title_text _3">은행</div>
							<div class="hit_list_title_text _2">출금계좌번호</div>
							<div class="hit_list_title_text _1">출금액</div>
							<div class="hit_list_title_text">상태</div>
						</div>
						<div class="empty-copy">
							<div class="text-block-35-copy">조회결과가 없습니다.</div>
						</div>
						<div class="hit_list">
							<div class="text-block-36">001</div>
							<div class="text-block-36 _1">캐쉬</div>
							<div class="text-block-36 _2">충전이 안됩니다</div>
							<div class="text-block-36 _3">2022-09-28</div>
							<div class="text-block-36 _5">처리 완료</div>
						</div>
						<div class="hit_list">
							<div class="text-block-36">001</div>
							<div class="text-block-36 _1">캐쉬</div>
							<div class="text-block-36 _2">충전이 안됩니다</div>
							<div class="text-block-36 _3">2022-09-28</div>
							<div class="text-block-36 _4">처리 전</div>
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
			<div class="div-block-33">
				<div class="div-block-34">
					<div class="text-block-54">O 출금신청</div>
					<div class="text-block-49-copy">- 출금 신청하신 포인트는 본인명의의 계좌번호로
						이체됩니다.</div>
					<div class="text-block-49-copy">- 회원명과 예금주명이 반드시 같아야합니다.</div>
					<div class="text-block-49-copy">- 보유포인트 50,000 이상부터 출금이
						가능합니다.</div>
					<div class="text-block-49-copy">- 오전 10시 접수마감후 오후 4시경 일괄
						처리됩니다.</div>
					<div class="text-block-49-copy">- 주말과 공휴일을 제외하고 출금이체는 1일 1회
						처리됩니다.</div>
				</div>
				<div class="div-block-34">
					<div class="text-block-54">X 출금이 안되는경우</div>
					<div class="text-block-49-copy">- 출금계좌의 예금주가 회원명과 다른 경우</div>
					<div class="text-block-49-copy">- 무료충전으로 받으신 보너스 포인트와 1개월 이내의
						신용카드로 결제한 포인트</div>
					<div class="text-block-49-copy">- 신청내역을 취소한 경우</div>
					<div class="text-block-49-copy">- 50,000포인트 이하는
						&#x27;회원탈퇴&#x27;를 하실 경우에만 1:1문의를 통해 가능합니다.</div>
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