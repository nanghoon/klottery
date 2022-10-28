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
				<div class="text-block-13 _1">이벤트</div>
			</div>
		</div>
		<div class="hit_content">
			<div class="hit_content_wrap">
				<div class="hit_list_content">
					<div class="hit_list_title">
						<div class="hit_list_title_text _1">진행여부</div>
						<div class="hit_list_title_text _4">이벤트내용</div>
						<div class="hit_list_title_text _1">이벤트기간</div>
					</div>
					<jsp:useBean id="date" class="java.util.Date" />
					<fmt:formatDate value="${date}" pattern='yyyy-MM-dd' var="today"/>
					<c:forEach var="item" items="${list}" varStatus="i">
						<div class="event_list" style="cursor:pointer;" onclick="location.href='/klottery/eventDetail.do?idx=${item.idx}'">
							<div class="event_list_text _1">
								<c:choose>
									<c:when test="${item.sdate > today}">예정</c:when>
									<c:when test="${item.sdate <= today && today <= item.edate}">
										진행중
									</c:when>
									<c:otherwise>종료</c:otherwise>
								</c:choose>
							</div>
							<div class="div-block-23">
								<img src="/filePath/klottery/editor/${item.img}" loading="lazy" width="173" style="max-height:200px;" alt="">
								<div class="event_list_text _5">${item.title}</div>
							</div>
							<div class="event_list_text _1">${item.sdate} ~ ${item.edate}</div>
						</div>
					</c:forEach>
				</div>
				<div class="pagingbox">
					<div class="pagingboxwrap">
						<ui:pagination paginationInfo="${pi}" jsFunction="page" type="user"/>
					</div>
				</div>
				<form id="listForm" name="listForm" action="/klottery/user/eventList.do">
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