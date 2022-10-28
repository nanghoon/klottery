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
				<div class="text-block-13 _1">자주묻는질문</div>
			</div>
		</div>
		<div class="selectgame">
			<div class="selectcontactwrap">
				<a href="javascript:void(0)" class="link l">자주묻는질문</a> 
				<a href="/klottery/qnaList.do" class="link">1:1 상담</a> 
				<a href="/klottery/buyGuide.do" class="link">구매가이드</a> 
				<a href="/klottery/hitGuide.do" class="link">당첨가이드</a>
			</div>
		</div>
		<div class="hit_content">
			<div class="hit_content_wrap">
				<div class="w-form">
					<form id="listForm" name="listForm" method="get">
						<input type="hidden" name="pageIndex"/>
						<div class="div-block-16">
							<input type="text" class="text-field-2 w-input" onkeypress="if(event.keyCode==13) {javascript:checkForm(); return false;}" maxlength="50" name="search" placeholder="제목" value="${search}"> 
							<a href="javascript:checkForm()" class="button-3 _1 w-button">조회</a>
						</div>
					</form>
				</div>
				<div class="qnalistbox">
					<!-- _1 -->
					<c:forEach var="item" items="${list}">
						<div class="qnalist">
							<div class="qbox"  onclick="$('.answer_'+${item.idx}).slideToggle()" style="cursor:pointer;">
								<div class="div-block-17">
									<img src="/klottery/webflow/images/question.png" loading="lazy" width="28" alt="">
								</div>
								<div class="text-block-38">${item.title}</div>
							</div>
							<div class="abox answer_${item.idx}">
								<div class="div-block-47">
									<div class="text-block-41">A.</div>
									<div class="paragraph-2">${item.text}</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="pagingbox">
					<div class="pagingboxwrap">
						<ui:pagination paginationInfo="${pi}" jsFunction="page" type="user"/>
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
function checkForm() {
	$("#listForm").submit();
}
</script>

</html>