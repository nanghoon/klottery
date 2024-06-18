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
				<div class="text-block-13 _1">구매가이드</div>
			</div>
		</div>
		<div class="selectgame">
			<div class="selectcontactwrap">
				<a href="/klottery/faqList.do" class="link">자주묻는질문</a> 
				<a href="/klottery/user/qnaList.do" class="link">1:1 상담</a> 
				<a href="javascript:void(0)" class="link l">구매가이드</a> 
				<a href="/klottery/hitGuide.do" class="link">당첨가이드</a>
			</div>
		</div>
		<div class="hit_content">
			<div class="new_buy_content">
				<div class="guidbox">
					<img src="/klottery/webflow/images/01join.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">회원가입</div>
						<div class="text-block-42-copy">- 만 19세미만은 이용할 수 없으며, 실명인증을
							필수 사항입니다.</div>
						<div class="text-block-42-copy">- 정보변경 탈퇴 등은 마이페이지 개인정보에서
							이용가능합니다.</div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/02recharge.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">포인트 충전</div>
						<div class="text-block-42-copy">
							- 포인트는 일종의 온라인지갑입니다. 포인트충전은 미리 신용카드나 계좌이체 등을<br> 포인트로 바꾼 다음에
							이를 현금처럼 사용하여 복권 구매 결제를 할 수 있습니다<br>
						</div>
						<div class="text-block-42-copy">- 복권 구매를 위해서는 포인트 충전이 선행되어야
							합니다.</div>
						<div class="text-block-42-copy">- 최소 충전은 10,0000포인트 부터입니다.</div>
						<div class="text-block-42-copy">- 충전횟수와 금액에는 제한이 없습니다.</div>
						<div class="text-block-42-copy">- 충전할때는 반드시 본인명의의 계좌나 신용카드
							등을 이용하여야 합니다.</div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/03gameclick.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">게임주문</div>
						<div class="text-block-42-copy">- 마킹슬립에 원하는 번호를 직접 선택하거나
							자동선택을 한 후 구매하기를 클릭합니다.</div>
						<div class="div-block-21"></div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/04omr.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">omr 카드 입력</div>
						<div class="text-block-42-copy">- 실물로또를 구매하기 전, 고객님들이 선택하신
							번호를 OMR카드로 먼저 출력합니다.</div>
						<div class="div-block-21"></div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/05image-icon.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">실물로또 구매</div>
						<div class="text-block-42-copy">- 출력한 OMR카드로 미국로또 소매점에서
							실물로또를 구매합니다.</div>
						<div class="text-block-42-copy"></div>
						<div class="div-block-21"></div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/06scanner.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">스캔/업로드</div>
						<div class="text-block-42-copy">- 구매완료한 로또용지(영수증)를 스캔한 후 고객님
							마이페이지에서 볼 수 있도록 업로드합니다.</div>
						<div class="div-block-21"></div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/07numbercheck.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">번호확인</div>
						<div class="text-block-42-copy">- 스캔본 실물로또가 고객님이 구매하신 내용과
							맞는지 확인합니다.</div>
						<div class="text-block-42-copy">- 맞지 않을때는 즉시 고객센터에 연락합니다.</div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/08draw.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">추첨</div>
						<div class="div-block-21"></div>
						<div class="div-block-21"></div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/09check.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">당첨확인</div>
						<div class="text-block-42-copy">- 자 이제 추첨의 시간입니다.</div>
						<div class="text-block-42-copy">- 당첨여부는 마이페이지 구매/당첨내역에서 확인이
							가능합니다.</div>
						<div class="text-block-42-copy">- 행운이 함께 하시길 바랍니다.</div>
						<div class="div-block-21"></div>
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