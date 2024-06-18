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
				<div class="text-block-13 _1">당첨가이드</div>
			</div>
		</div>
		<div class="selectgame">
			<div class="selectcontactwrap">
				<a href="/klottery/faqList.do" class="link">자주묻는질문</a> 
				<a href="/klottery/user/qnaList.do" class="link">1:1 상담</a> 
				<a href="/klottery/buyGuide.do" class="link">구매가이드</a> 
				<a href="javascript:void(0)" class="link l">당첨가이드</a>
			</div>
		</div>
		<div class="hit_content">
			<div class="new_buy_content">
				<div class="guidbox">
					<img src="/klottery/webflow/images/01draw.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">추첨</div>
						<div class="text-block-42-copy">- 추첨 시간은 메가밀리언 수요일/토요일 낮 1시,
							파워볼은 화요일/목요일/일요일 낮 12시59분입니다.</div>
						<div class="text-block-42-copy">- 썸머타임 기간 메가밀리언 수요일/토요일 낮
							12시, 파워볼은 화요일/목요일/일요일 낮 11시59분입니다.</div>
						<div class="text-block-42-copy">
							- 해당 시간은 한국시간 기준으로 미국내 썸머타임 기간(매년 3월 둘째주~11월 첫째주 토요일 까지)에는<br>메가밀리언,파워볼
							각각 1시간씩 앞당겨집니다.
						</div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/02check.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">당첨확인</div>
						<div class="text-block-42-copy">
							- 마이페이지에서 당첨확인이 가능합니다.<br>
						</div>
						<div class="text-block-42-copy">- 메가밀리언과 파워볼 공식 사이트에도
							방문해보세요.</div>
						<div class="div-block-22">
							<a href="#" class="link-block-5 w-inline-block"><img
								src="/klottery/webflow/images/hit_mega.png" loading="lazy" alt="" class="image-17"></a><img
								src="/klottery/webflow/images/hit_power.png" loading="lazy" width="236" alt="">
						</div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/03alarm.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">당첨사실 알림</div>
						<div class="text-block-42-copy">- 저희 고객이 잭팟에 당첨되면 그 즉시 고객님이
							등록하신 전화번호로 당사 임원이 알려드립니다.</div>
						<div class="div-block-21"></div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/04document.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">공증서류 작성</div>
						<div class="text-block-42-copy">
							- 실물로또는 본사 주거래은행 금고에 안전하게 보관합니다.<br>그리고 실물로또의 소유주가 고객님임을
							증명하는 공증서류를 작성합니다.
						</div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/05schedule.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">스케줄 협의</div>
						<div class="text-block-42-copy">- 미국방문전 본사임원과 미팅 혹은 유선으로
							미국방문에 관한 스케줄을 조정합니다.</div>
						<div class="text-block-42-copy"></div>
						<div class="div-block-21"></div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/06visiting.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">미국방문</div>
						<div class="text-block-42-copy">- 미국방문시 항공원 비자 호텔 식사 관광 등 모든
							의전은 본사 담당자가 케어해드립니다.</div>
						<div class="div-block-21"></div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/07prize.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">당첨금 수령</div>
						<div class="text-block-42-copy">- 당첨금 수령은 수표로 지급되며 6~8주의 기간이
							필요합니다.</div>
						<div class="text-block-42-copy">연금으로도 수령가능하나 일시불수령을 추천드립니다.</div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/08success.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">성공투자계획</div>
						<div class="text-block-42-copy">- 성공적인 관리가 가장 중요합니다</div>
						<div class="text-block-42-copy">- 부채를 가장 먼저 정리하고 금융관련 지식을
							키웁니다.</div>
						<div class="div-block-21"></div>
						<div class="div-block-21"></div>
						<div class="div-block-21"></div>
					</div>
				</div>
				<div class="guidbox">
					<img src="/klottery/webflow/images/09bangmark.png" loading="lazy"
						sizes="(max-width: 479px) 75vw, 100px" alt="" class="guid">
					<div class="div-block-20">
						<div class="text-block-42">3-9등 당첨금 수령</div>
						<div class="text-block-42-copy">- 먼저 포인트로 충전되고 이후 출금신청을
							이용하시면 됩니다.</div>
						<div class="text-block-42-copy">- 600불 이상 당첨금은 세금을 제외한 금액이
							충전됩니다(외국인 수령기준 30%)</div>
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