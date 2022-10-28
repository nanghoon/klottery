<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/klottery/admin/user/userList.do">K-Lottery Admin</a>
	</div>

	<ul class="nav navbar-top-links navbar-right">
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">
			    <i class="fa fa-bell fa-fw"></i> <span id="alarm_all">0</span>&nbsp;<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-alerts" id="alarm_list">
			</ul>
		</li>
		<li class="dropdown">
			<li><a href="/klottery/admin/logout.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
		</li>
	</ul>
	</nav>
</body>
<script>
//init();
function init(){
	callAjax();
	setInterval(callAjax , 5000);
}
function callAjax(){
	$.ajax({
		type: 'get',
		url : '/klottery/admin/alarm.do',
		success:function(data){
			let text = '';
			if(data.qna > 0){
				text += '<li><a href="/klottery/admin/board/qnaList.do">';
				text += '<div><i class="fa fa-wrench fa-fw"></i> 1:1 문의 미답변';
				text += '<span class="pull-right text-muted small">'+data.qna+'건</span></div>';
				text += '</a></li>';
			}
			if(data.cashD > 0){
				text += '<li><a href="/klottery/admin/cash/deposit.do">';
				text += '<div><i class="fa fa-money fa-fw"></i> 캐쉬 충전신청';
				text += '<span class="pull-right text-muted small">'+data.cashD+'건</span></div>';
				text += '</a></li>';
			}
			if(data.cashW > 0){
				text += '<li><a href="/klottery/admin/cash/withdraw.do">';
				text += '<div><i class="fa fa-money fa-fw"></i> 캐쉬 출금신청';
				text += '<span class="pull-right text-muted small">'+data.cashW+'건</span></div>';
				text += '</a></li>';
			}
			let allCnt = data.qna+data.cashD+data.cashW;
			$("#alarm_all").text(allCnt);
			if(allCnt < 1){
				text += '<li><a href="javascript:void(0)">';
				text += '<div><i class="fa fa-times fa-fw"></i> 미확인 알람이 없습니다.</div>';
				text += '</a></li>';
			}
			$("#alarm_list").html(text); 
		}
	})
}
</script>
</html>