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
		<div class="info_content-copy">
			<div class="hit_content_wrap">
				<div class="hit_list_title-copy">
					<div class="div-block-25">
						<a href="javascript:void(0)" class="myinfobtn click w-button">개인정보</a> 
						<a href="/klottery/delete.do" class="myinfobtn w-button">회원탈퇴</a>
					</div>
					<div class="div-block-13">
						<div class="text-block-32 _1">* 표시는 입력 필수</div>
					</div>
				</div>
				<div class="info_content">
					<div class="w-form">
						<form id="email-form" name="email-form" data-name="Email Form"
							method="get">
							<div class="info _4">
								<div class="info-box">
									<div class="text-block-37-copy">
										<span class="text-span-2">*</span> 이름
									</div>
									<div class="text-block-49">ID</div>
								</div>
								<div class="info-box">
									<div class="text-block-37-copy">
										<span class="text-span-2">*</span> ID
									</div>
									<div class="text-block-51">ID</div>
								</div>
							</div>
							<div class="info _4">
								<div class="info-box">
									<div class="text-block-37-copy">
										<span class="text-span-2">*</span> 고유번호
									</div>
									<div class="text-block-50">ID</div>
								</div>
								<div class="info-box">
									<div class="text-block-37-copy">
										<span class="text-span-2">*</span> 생년월일
									</div>
									<div class="text-block-52">ID</div>
								</div>
							</div>
							<div class="info">
								<div class="text-block-37-copy">
									<span class="text-span-2">*</span> 비밀번호 변경
								</div>
								<div class="div-block-29">
									<div class="div-block-30">
										<div class="text-block-37-copy-copy-copy">현재 비밀번호</div>
										<input type="text" class="text-field-3 w-input"
											maxlength="256" name="field" data-name="Field"
											placeholder="Example Text" id="field" required="">
									</div>
									<div class="div-block-30">
										<div class="text-block-37-copy-copy-copy">신규 비밀번호</div>
										<input type="text" class="text-field-3 w-input"
											maxlength="256" name="field-2" data-name="Field 2"
											placeholder="Example Text" id="field-2" required="">
									</div>
									<div class="div-block-30 _1">
										<div class="text-block-37-copy-copy-copy _2">신규 비밀번호 확인</div>
										<div class="div-block-43 _1">
											<input type="text" class="text-field-3 _2 w-input"
												maxlength="256" name="field-3" data-name="Field 3"
												placeholder="Example Text" id="field-3" required="">
											<a href="#" class="button-3 _1 w-button">비밀번호 변경</a>
										</div>
									</div>
								</div>
							</div>
							<div class="info">
								<div class="text-block-37-copy">
									<span class="text-span-2">*</span> 연락처
								</div>
								<div class="div-block-29">
									<div class="div-block-43">
										<input type="text" class="text-field-3-copy _1 w-input"
											maxlength="256" name="field-3" data-name="Field 3"
											placeholder="Example Text" id="field-3" required=""><input
											type="text" class="text-field-3-copy _1 w-input"
											maxlength="256" name="field-3" data-name="Field 3"
											placeholder="Example Text" id="field-3" required=""><input
											type="text" class="text-field-3-copy _1 w-input"
											maxlength="256" name="field-3" data-name="Field 3"
											placeholder="Example Text" id="field-3" required="">
										<a href="#" class="button-3 _1 w-button">본인인증</a>
									</div>
									<div class="div-block-43">
										<input type="text" class="text-field-3 _2 w-input"
											maxlength="256" name="field-3" data-name="Field 3"
											placeholder="Example Text" id="field-3" required="">
										<a href="#" class="button-3 _2 w-button">인증번호 확인</a>
									</div>
									<div class="text-block-48">* 본인인증 후 수정가능합니다.</div>
								</div>
							</div>
							<div class="info">
								<div class="text-block-37-copy">
									<span class="text-span-2">*</span> 이메일주소
								</div>
								<div class="div-block-29">
									<div class="div-block-43">
										<input type="text" class="text-field-3-copy-copy w-input"
											maxlength="256" name="field-3" data-name="Field 3"
											placeholder="Example Text" id="field-3" required="">
										<div class="text-block-48">@</div>
										<input type="text" class="text-field-3-copy-copy _1 w-input"
											maxlength="256" name="field-3" data-name="Field 3"
											placeholder="Example Text" id="field-3" required=""><select
											id="field-4" name="field-4" data-name="Field 4"
											class="select-field-2 w-select">
											<option value="">Select one...</option>
											<option value="First">First choice</option>
											<option value="Second">Second choice</option>
											<option value="Third">Third choice</option>
										</select> <a href="#" class="button-3 _1 w-button">중복체크</a>
									</div>
								</div>
							</div>
							<div class="info">
								<div class="text-block-37-copy">· 주소</div>
								<div class="div-block-29">
									<div class="div-block-43">
										<input type="text" class="text-field-3 _2 w-input"
											maxlength="256" name="field-3" data-name="Field 3"
											placeholder="Example Text" id="field-3" required="">
										<a href="#" class="button-3 _1 w-button">우편번호찾기</a>
									</div>
									<div class="div-block-30">
										<input type="text" class="text-field-3 _3 w-input"
											maxlength="256" name="field-3" data-name="Field 3"
											placeholder="Example Text" id="field-3" required="">
									</div>
									<div class="div-block-30">
										<input type="text" class="text-field-3 _3 w-input"
											maxlength="256" name="field-3" data-name="Field 3"
											placeholder="Example Text" id="field-3" required="">
									</div>
									<div class="text-block-48">*이벤트 당첨 시 경품제공을 위한 주소정보입니다.</div>
								</div>
							</div>
							<div class="info _1">
								<div class="text-block-37-copy">
									<span class="text-span-2">*</span> 수신여부
								</div>
								<div class="div-block-29-copy">
									<div class="div-block-30-copy">
										<div class="info-box _2">
											<div class="text-block-37-copy _1">·SMS 수신여부</div>
											<label class="radio-button-field w-radio"><input
												type="radio" data-name="Radio" id="radio" name="radio"
												value="Radio"
												class="w-form-formradioinput radio-button w-radio-input"><span
												class="radio-button-label w-form-label" for="radio">Y</span></label><label
												class="radio-button-field w-radio"><input
												type="radio" data-name="Radio 2" id="radio-2" name="radio"
												value="Radio"
												class="w-form-formradioinput radio-button w-radio-input"><span
												class="radio-button-label w-form-label" for="radio-2">N</span></label>
										</div>
										<div class="info-box _2">
											<div class="text-block-37-copy _1">· 이메일 수신여부</div>
											<label class="radio-button-field w-radio"><input
												type="radio" data-name="Radio 3" id="radio-3" name="radio"
												value="Radio"
												class="w-form-formradioinput radio-button w-radio-input"><span
												class="radio-button-label w-form-label" for="radio-3">Y</span></label><label
												class="radio-button-field w-radio"><input
												type="radio" data-name="Radio 3" id="radio-3" name="radio"
												value="Radio"
												class="w-form-formradioinput radio-button w-radio-input"><span
												class="radio-button-label w-form-label" for="radio-3">N</span></label>
										</div>
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
					<a href="#" class="button-2-copy _2 w-button">취소</a> <a href="#"
						class="button-2-copy w-button">변경</a>
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