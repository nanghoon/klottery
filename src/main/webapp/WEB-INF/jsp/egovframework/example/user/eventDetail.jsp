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
			<div class="event_content_wrap2">
				<div class="div-block-24">
					<div class="hit_list_title_text _3">제목</div>
					<div class="text-block-43">${info.title }</div>
				</div>
				<jsp:useBean id="date" class="java.util.Date" />
				<fmt:formatDate value="${date}" pattern='yyyy-MM-dd' var="today"/>
				<div class="div-block-24 _1">
					<div class="div-block-42">
						<div class="hit_list_title_text _3">진행여부</div>
						<div class="text-block-43 _1">
							<c:choose>
								<c:when test="${info.sdate > today}">예정</c:when>
								<c:when test="${info.sdate <= today && today <= info.edate}">
									진행중
								</c:when>
								<c:otherwise>종료</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="div-block-42">
						<div class="hit_list_title_text _3">이벤트기간</div>
						<div class="text-block-43 _1">${info.sdate} ~ ${info.edate}</div>
					</div>
				</div>
				<div class="text-block-44">${text}</div>
				<div class="div-block-15">
					<a href="/klottery/eventList.do" class="button-2-copy w-button">목록으로</a>
				</div>
			</div>
		</div>
		<jsp:include page="../userFrame/bottom.jsp"></jsp:include>
	</div>
	<jsp:include page="../userFrame/popup.jsp"></jsp:include>
	<jsp:include page="../userFrame/footer.jsp"></jsp:include>
</body>
</html>