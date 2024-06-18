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
				<div class="text-block-13 _1">회사소개</div>
			</div>
		</div>
		<div class="selectgame">
			<div class="selectcontactwrap">
				<a href="javascript:void(0)" class="link l">회사소개</a> 
				<a href="/klottery/terms.do" class="link">이용약관</a>
				<a href="/klottery/privacy.do" class="link">개인정보처리방침</a>
			</div>
		</div>
		<div class="hit_content">
			<div class="ghltkthro">
				<img src="/klottery/webflow/images/logo.png" loading="lazy"
					width="558"
					sizes="(max-width: 767px) 100vw, 558px" alt="" class="image-18">
				<div class="text-block-49-copy">K LOTTEY는 인터넷을 통해 미국,유럽,한국의
					해외복권구매서비스를 제공하고 있습니다.</div>
				<div class="text-block-49-copy">접속한 지역에 상관없이 인터넷으로 원하시는 서비스를
					제공받으실 수 있습니다.</div>
				<div class="text-block-49-copy">구매하신 품목은 K LOTTERY 직원이 직접 구매하여
					각 회원 계정에서 확인할 수 있도록 실물 품목을 스캔하여 보관합니다.</div>
				<div class="text-block-49-copy">당첨 및 미당첨의 모든 권리는 고객님의 소유물이며,
					저희 K LOTTERY는 고객님의 서비스를 편리하게 할 수 있도록 대행구매 서비스를 제공하고 있습니다.</div>
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