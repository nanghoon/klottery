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
				<div class="text-block-13 _1">1:1 상담</div>
			</div>
		</div>
		<div class="selectgame">
			<div class="selectcontactwrap">
				<a href="/klottery/faqList.do" class="link">자주묻는질문</a> 
				<a href="javascript:void(0)" class="link l">1:1 상담</a> 
				<a href="/klottery/buyGuide.do" class="link">구매가이드</a> 
				<a href="/klottery/hitGuide.do" class="link">당첨가이드</a>
			</div>
		</div>
		<div class="hit_content">
			<div class="hit_content_wrap">
				<div class="text-block-30">1:1 상담</div>
				<div class="text-block-32">상담시간</div>
				<div class="text-block-34">
					평일(월~금) 10:00 ~ 18:00<br>(토/일/공휴일 휴무)
				</div>
				<div class="div-block-13">
					<a href="/klottery/user/qnaInsert.do" class="button-3 w-button">1:1 문의 쓰기</a>
				</div>
				<div class="hit_list_content">
					<div class="hit_list_title">
						<div class="hit_list_title_text">NO.</div>
						<div class="hit_list_title_text _3">분류</div>
						<div class="hit_list_title_text _2">제목</div>
						<div class="hit_list_title_text _1">등록일자</div>
						<div class="hit_list_title_text">처리현황</div>
					</div>
					<c:set var="number" value="${pi.totalRecordCount -pi.recordCountPerPage*(pi.currentPageNo-1) }"/>
					<c:forEach var="item" items="${list}" varStatus="i">
						<div class="hit_list" style="cursor:pointer;" onclick="location.href='/klottery/user/qnaDetail.do?idx=${item.idx}'">
							<div class="text-block-36">${number}<c:set var="number" value="${number - 1}" /></div>
							<div class="text-block-36 _1">${item.category}</div>
							<div class="text-block-36 _2">${item.title}</div>
							<div class="text-block-36 _3"><fmt:formatDate value="${item.qdate}" pattern="yyyy-MM-dd"/></div>
							<c:if test="${item.answerYn == 'Y'}">
								<div class="text-block-36 _5">처리 완료</div>
							</c:if>
							<c:if test="${item.answerYn == 'N'}">
								<div class="text-block-36 _4">처리 전</div>
							</c:if>							
						</div>
					</c:forEach>
					<c:if test="${fn:length(list) == 0}">
						<div class="empty">
							<div class="text-block-35">1:1 문의 내역이 없습니다.</div>
						</div>
					</c:if>
				</div>
				<div class="pagingbox">
					<div class="pagingboxwrap">
						<ui:pagination paginationInfo="${pi}" jsFunction="page" type="user"/>
					</div>
				</div>
				<form id="listForm" name="listForm" action="/klottery/user/qnaList.do">
					<input type="hidden" name="pageIndex"/>
				</form>
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