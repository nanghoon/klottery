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
					<div class="text-block-32 _1">* 표시는 입력 필수</div>
				</div>
				<div class="hit_list_title"></div>
				<% pageContext.setAttribute("replaceChar", "\n"); %>
				<div class="hit_list_content">
					<div class="w-form">
						<form method="post" id="qnaInsert">
							<div class="contact">
								<div class="text-block-37">분류</div>
								<div class="text-block-60">${info.category}</div>
							</div>
							<div class="contact">
								<div class="text-block-37">제목</div>
								<div class="text-block-60">${info.title}</div>
							</div>
							<div class="contact">
								<div class="text-block-37">내용</div>
								<div class="div-block-14">${fn:replace(info.text, replaceChar, "<br/>")}</div>
							</div>
							<div class="contact _1">
								<div class="text-block-37">답변</div>
								<c:if test="${info.answerYn == 'Y'}">
									<div class="div-block-14">${answer}</div>
								</c:if>
								<c:if test="${info.answerYn != 'Y'}">
									<div class="div-block-14">답변 대기중입니다.</div>
								</c:if>
							</div>
						</form>
					</div>
				</div>
				<div class="div-block-15">
					<a href="/klottery/user/qnaList.do" class="button-2-copy w-button">목록으로</a> 
				</div>
			</div>
		</div>
		<jsp:include page="../userFrame/bottom.jsp"></jsp:include>
	</div>
	<jsp:include page="../userFrame/popup.jsp"></jsp:include>
	<jsp:include page="../userFrame/footer.jsp"></jsp:include>
</body>
</html>