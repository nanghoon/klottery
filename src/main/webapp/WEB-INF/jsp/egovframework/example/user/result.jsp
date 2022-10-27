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
				<img src="/klottery/webflow/images/${type == 1 ? 'mega' : type == 2 ? 'lotto' : 'power' }_logo.png" loading="lazy" width="${type == 3 ? '350' : '207' }" alt="" class="image-13 l">
				<div class="text-block-13">
					${type == 1 ? '메가밀리언' : type == 2 ? '동행복권' : '파워볼' }
					당첨결과
				</div>
				<div class="hit_ball_list_box">
					<div class="hit_wball">${list[0].num1}</div>
					<div class="hit_wball">${list[0].num2}</div>
					<div class="hit_wball">${list[0].num3}</div>
					<div class="hit_wball">${list[0].num4}</div>
					<div class="hit_wball">${list[0].num5}</div>
					<c:if test="${list[0].num6 != null && list[0].num6 != ''}">
						<div class="hit_wball">${list[0].num6}</div>
					</c:if>
					<div class="hit_bball">${list[0].bnum}</div>
				</div>
			</div>
		</div>
		<div class="selectgame">
			<div class="selectgamehit">
				<a href="/klottery/result.do?type=1" class="link ${type == 1 ? 'l' : '' }">메가밀리언</a> 
				<a href="/klottery/result.do?type=2" class="link ${type == 2 ? 'l' : '' }">동행복권</a>
				<a href="/klottery/result.do?type=3" class="link ${type == 3 ? 'l' : '' }">파워볼</a>
			</div>
		</div>
		<div class="hit_content">
			<div class="hit_content_wrap">
				<div class="hit_list_content">
					<div class="hit_list_title">
						<div class="hit_list_title_text">NO.</div>
						<div class="hit_list_title_text _1">추첨일(한국시간)</div>
						<div class="hit_list_title_text _1">추첨번호</div>
						<div class="hit_list_title_text">결과</div>
						<div class="hit_list_title_text _1">1등 당첨금</div>
						<div class="hit_list_title_text">추첨방송</div>
						<div class="hit_list_title_text">상세보기</div>
					</div>
					<c:forEach var="item" items="${list}">
						<div class="hit_list">
							<div class="hit_list_title_text">${item.cnt }.</div>
							<fmt:setLocale value="ko_kr" scope="session"/>
							<c:if test="${type == 2}">
								<div class="hit_list_title_text2 _1"><fmt:formatDate value="${item.rdate}" pattern="yyyy.MM.dd E HH:mm"/></div>
							</c:if>
							<c:if test="${type != 2}">
								<jsp:useBean id="javaDate" class="java.util.Date" />
								<jsp:setProperty name="javaDate" property="time" value="${item.rdate.time + 16*60*60*1000}"/>
								<div class="hit_list_title_text2 _1"><fmt:formatDate value="${javaDate}" pattern="yyyy.MM.dd E HH:mm"/></div>
							</c:if>
							<div class="numlist _2">
								<div class="wball_pick">${item.num1}</div>
								<div class="wball_pick">${item.num2}</div>
								<div class="wball_pick">${item.num3}</div>
								<div class="wball_pick">${item.num4}</div>
								<div class="wball_pick">${item.num5}</div>
								<c:if test="${item.num6 != null && item.num6 != ''}">
									<div class="wball_pick">${item.num6}</div>
								</c:if>
								<div class="bball_pick">${item.bnum}</div>
							</div>
							<div class="hit_list_title_text2">${item.result == 1 ? '당첨' : '이월' }</div>
							<div class="hit_list_title_text2 _1">
								<c:if test="${type == 2}">
									<fmt:formatNumber value="${item.hit/100000000}" pattern="#,###"/>억원
								</c:if>
								<c:if test="${type != 2}">
									$ <fmt:formatNumber value="${item.hit}"/>
									<fmt:formatNumber value="${(item.hit*item.krate)/100000000}" pattern="#,###"/>억원
								</c:if>
							</div>
							<a href="#" class="hit_list_title_text2 w-inline-block">
								<img src="/klottery/webflow/images/play.png" loading="lazy" width="44" alt="">
							</a> 
							<a href="javascript:lottoDetailPop(${item.idx})" class="hit_list_title_text2 w-inline-block">
								<img src="/klottery/webflow/images/magnifier.png" loading="lazy" width="44" alt="">
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="pagingbox">
					<div class="pagingboxwrap">
						<ui:pagination paginationInfo="${pi}" type="user"/>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../userFrame/bottom.jsp"></jsp:include>
	</div>
	<jsp:include page="../userFrame/popup.jsp"></jsp:include>
	<jsp:include page="../userFrame/footer.jsp"></jsp:include>
</body>
</html>