<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="navbar-default sidebar" role="navigation"  style="margin:0px;">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li><a href="/klottery/admin/user/userList.do"><i class="fa fa-user fa-fw"></i> 회원 목록</a></li>
				<!-- <li>
					<a href="javascript:void(0)"><i class="fa fa-user fa-fw"></i> 회원 관리<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/klottery/admin/user/userList.do">회원 목록</a></li>
						<li><a href="/klottery/admin/user/ulist.do?grade=3">총판 목록</a></li>
						<li><a href="/klottery/admin/user/ulist.do?grade=2">지사 목록</a></li>
						<li><a href="/klottery/admin/user/ulist.do?grade=1">지점 목록</a></li>
						<li><a href="/klottery/admin/user/delUserList.do">회원 탈퇴 내역</a></li>
					</ul>
				</li>
				<li><a href="/klottery/admin/user/alarmList.do"><i class="fa fa-bullhorn fa-fw"></i> 회원 알림내역</a></li>
				<li>
					<a href="javascript:void(0)"><i class="fa fa-trophy fa-fw"></i> 로또 구매 관리<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/klottery/admin/lotto/buyLotto.do?type=1">메가밀리언 구매 목록</a></li>
						<li><a href="/klottery/admin/lotto/buyLotto.do?type=2">파워볼 구매 목록</a></li>
					</ul>
				</li>
				<li><a href="/klottery/admin/lotto/hitList.do"><i class="fa fa-trophy fa-fw"></i> 로또 당첨내역</a></li>
				<li>
					<a href="javascript:void(0)"><i class="fa fa-plane fa-fw"></i> 낙첨배송관리<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/klottery/admin/lotto/deliveryList.do">배송예정목록</a></li>
						<li><a href="/klottery/admin/lotto/deliveredList.do">배송완료목록</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)"><i class="fa fa-won fa-fw"></i> 캐시 관리<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/klottery/admin/cash/deposit.do">캐시 충전신청</a></li>
						<li><a href="/klottery/admin/cash/withdraw.do">캐시 출금신청</a></li>
						<li><a href="/klottery/admin/cash/depositList.do">캐시 지급내역</a></li>
						<li><a href="/klottery/admin/cash/withdrawList.do">캐시 사용내역</a></li>
					</ul>
				</li>
				<li><a href="/klottery/admin/cash/promotion.do"><i class="fa fa-won fa-fw"></i> 유저 프로모션 지급 캐시 설정</a></li>
				<li><a href="/klottery/admin/cash/hit.do"><i class="fa fa-won fa-fw"></i> 당첨금 세금 /수수료 설정</a></li> -->
				<li>
					<a href="javascript:void(0)"><i class="fa fa-trophy fa-fw"></i> 로또 구매 관리<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/klottery/admin/lotto/buyLotto.do?type=1">메가밀리언 구매 목록</a></li>
						<li><a href="/klottery/admin/lotto/buyLotto.do?type=2">동행복권 구매 목록</a></li>
						<li><a href="/klottery/admin/lotto/buyLotto.do?type=3">파워볼 구매 목록</a></li>
					</ul>
				</li>
				<li>
					<a href="javascript:void(0)"><i class="fa fa-question-circle fa-fw"></i> 고객센터<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/klottery/admin/board/qnaList.do">1:1문의</a></li>
						<li><a href="/klottery/admin/board/faqList.do">자주묻는질문</a></li>
						<li><a href="/klottery/admin/board/eventList.do">이벤트</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>