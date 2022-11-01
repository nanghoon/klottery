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
		<div class="banner2 m">
			<div class="bannerwrap2">
				<img src="/klottery/webflow/images/mega_logo.png" loading="lazy" width="237"
					srcset="/klottery/webflow/images/메가밀리언-로고-p-500.png 500w, /klottery/webflow/images/메가밀리언-로고-p-800.png 800w, /klottery/webflow/images/메가밀리언-로고-p-1080.png 1080w, /klottery/webflow/images/mega_logo.png 1200w"
					sizes="(max-width: 479px) 92vw, 237px" alt="" class="image-13 m">
				<div class="text-block-13">메가밀리언 구매하기</div>
				<div class="text-block-13-copy"><fmt:formatNumber value="${mMoney}"/> $</div>
			</div>
		</div>
		<div class="selectgame">
			<div class="selectgamewrap">
				<a href="javascript:changeSelectGame(1)" class="link m">1게임</a> 
				<a href="javascript:changeSelectGame(2)" class="link">2게임</a>
				<a href="javascript:changeSelectGame(3)" class="link">3게임</a> 
				<a href="javascript:changeSelectGame(4)" class="link">4게임</a> 
				<a href="javascript:changeSelectGame(5)" class="link">5게임</a>
			</div>
		</div>
		<div class="buy_content">
			<div class="buy_contentwrap">
				<div class="buy_left">
					<div class="text-block-14">게임방식선택</div>
					<div class="game_type_box">
						<div class="game_type click" onclick="changeGameType(0,this)">
							<div class="text-block-17">수동선택</div>
							<div class="text-block-16">
								원하시는 번호를 <br>직접입력또는 자동으로<br>구매할 수 있습니다.
							</div>
						</div>
						<div class="game_type" onclick="changeGameType(1,this)">
							<div class="text-block-17">
								전체게임<br>자동선택
							</div>
							<div class="text-block-16">
								구매하려는 전체게임<br>번호를 자동으로<br>구매할 수 있습니다.
							</div>
						</div>
						<div class="game_type" onclick="changeGameType(2,this)">
							<div class="text-block-17">
								나의 로또볼<br>불러오기
							</div>
							<div class="text-block-16">
								저장한 나의 로또볼에서<br>선택해서 구매할 수<br>있습니다.
							</div>
						</div>
					</div>
				</div>
				<div class="buy_right">
					<div class="buy_left1">
						<div class="playbox">
							<div class="text-block-14">Play</div>
							<a href="javascript:autoClick()" class="link-2">1Game 자동선택</a>
						</div>
						<div class="div-block-3">
							<div class="text-block-18">5개의 화이트볼 선택</div>
							<a href="javascript:resetClick()" class="w-inline-block">
								<img src="/klottery/webflow/images/recycle_bin.png" loading="lazy" width="31" alt="">
							</a>
						</div>
						<div class="wballbox">
							<c:forEach var="i" begin="1" end="70">
								<a href="#" onclick="clickWball(this)" class="wball w-button" id="wb_${i}">${i}</a> 
							</c:forEach>
						</div>
						<div class="div-block-3">
							<div class="text-block-18">1개의 메가볼 선택</div>
						</div>
						<div class="bballbox">
							<c:forEach var="i" begin="1" end="25">
								<a href="#" onclick="clickBball(this)" class="bball w-button" id="bb_${i}">${i}</a>
							</c:forEach> 
						</div>
						<div class="div-block-7-copy">
							<a href="javascript:getClickNum(99)" class="link-3" id="selectNumBtn">선택한 번호 리스트에 담기</a>
						</div>
					</div>
					<div class="buy_right1">
						<div class="playbox">
							<div class="text-block-14">선택번호 확인</div>
						</div>
						<div class="playbox">
							<a href="javascript:saveMyBall()" class="link-2 _1" id="saveMyLottoBtn">나의 로또볼 저장하기</a> 
							<a href="javascript:resetSelectNum()" class="link-2">초기화</a>
						</div>
						<div class="select_num_box">
							<div class="selet_num" id="selectNum0">
								<div class="text-block-19">01</div>
								<div class="numlist">
									<a href="#" class="wball_pick w-button"></a> 
									<a href="#" class="wball_pick w-button"></a> 
									<a href="#" class="wball_pick w-button"></a> 
									<a href="#" class="wball_pick w-button"></a> 
									<a href="#" class="wball_pick w-button"></a> 
									<a href="#" class="wball_pick w-button"></a> 
									<a href="#" class="bball_pick w-button"></a>
								</div>
								<div class="num_change">
									<a href="javascript:udtSelectNum(0)" class="link-block-3 w-inline-block">
										<div class="text-block-20">수정</div>
										<img src="/klottery/webflow/images/pencil.png" loading="lazy" width="28" alt="">
									</a> 
									<a href="javascript:delSelectNum(0)" class="link-block-3 w-inline-block">
										<div class="text-block-20">삭제</div>
										<img src="/klottery/webflow/images/recycle_bin.png" loading="lazy" width="28" alt="">
									</a> 
									<a href="javascript:getMyLotto(0)" class="link-block-3 w-inline-block">
										<div class="text-block-20">불러오기</div>
										<img src="/klottery/webflow/images/arrow.png" loading="lazy" width="28" alt="">
									</a>
								</div>
							</div>
						</div>
						<div class="buy_box">
							<div class="buy_llist">
								<div class="text-block-21 r">티켓가격(<span id="gameNum"></span>GAME)</div>
								<div class="div-block-5"></div>
								<div class="text-block-21 l">5,000 포인트</div>
							</div>
							<div class="buy_llist">
								<div class="text-block-21 r">결제하실 금액</div>
								<div class="div-block-5"></div>
								<div class="text-block-21-copy l" id="price">0포인트</div>
							</div>
							<div class="buy_llist">
								<div class="text-block-21 r">나의 포인트 잔액</div>
								<div class="div-block-5"></div>
								<div class="div-block-6">
									<div class="text-block-21 l"><fmt:formatNumber value="${userPoint}"/>포인트</div>
									<a href="#" class="link-2-copy">충전하기</a>
								</div>
							</div>
						</div>
						<div class="div-block-7">
							<a href="javascript:buy()" class="button-2 w-button" id="buyBtn">구매하기</a>
						</div>
						<div class="etcbtnbox">
							<a href="/klottery/faqList.do" class="etcbtn w-button">FAQ</a> 
							<a href="/klottery/result.do?type=1" class="etcbtn w-button">당첨결과</a> 
							<a href="#" class="etcbtn w-button">구매내역</a>
						</div>
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
var randArr = []; // 랜덤번호배열 (랜덤 시 한줄에 같은번호 안나오게)
var numlist = []; // 선택번호 리스트
var gameType = 0; // 현재 선택한 게임 방식 : 0 수동 1 자동 2 나의 로또볼 
var selectGame = 1; // 현재 선택한 게임수
function changeSelectGame(num){
	$(".selectgamewrap .link").removeClass('m');
	$(".selectgamewrap .link").eq(Number(num)-1).addClass('m');
	$("#gameNum").text(num);
	selectGame = num;
	numlist.splice(selectGame-1,numlist.lengh-selectGame);
	setSelectNumList();
	setGamePrice();
}
function changeGameType(num , self){
	$(".game_type").removeClass('click');
	$(self).addClass('click');
	if(num == 1){ // 자동 선택
		resetSelectNum(); // 선택한 볼 초기화
		for(var i=0; i<selectGame; i++){
			autoClick();
			getClickNum(99);
		}
	}else if(num == 2){ // 내 로또볼 가져오기
		if(selectGame == numlist.length){
			alert("이미 "+selectGame+"게임을 선택하셨습니다");
			return;
		}else{
			getMyLotto(numlist.length);
		}
	}
	
}
function setGamePrice(){
	let gameMoney = 5000;
	$("#price").text(comma(gameMoney*selectGame)+"포인트");
}
function clickWball(self){
	if($(self).hasClass('click')){ // 이미 클릭 되어있을땐 클릭 해제
		$(self).removeClass('click');
	}else{ // 클릭 안되어있으면 클릭
		if($(".wball.click").length > 4)
			alert("화이트볼은 5개까지만 선택하실 수 있습니다.")
		else
			$(self).addClass('click');
	}
}
function clickBball(self){
	if($(self).hasClass('click')){ // 이미 클릭 되어있을땐 클릭 해제
		$(self).removeClass('click');
	}else{ // 클릭 안되어있으면 클릭 
		if($(".bball.click").length > 0)
			alert("메가볼은 1개까지만 선택하실 수 있습니다.")
		else
			$(self).addClass('click');
	}
}
function resetClick(){ // 클릭된 볼 초기화
	$(".wball").removeClass('click');
	$(".bball").removeClass('click');
}
function autoClick(){ // 볼 자동 선택
	resetClick();
	for(var i=0; i<6; i++){
		let randKind = 0;
		if(i == 5) randKind = 1;
		let num = getRandom(randKind);
		if(i == 5) $("#bb_"+num).addClass('click');
		else  $("#wb_"+num).addClass('click');
	}
}
function getRandom(kind){ // 0 화이트볼 , 1 메가볼 
	let min = 1;
	let max = 70;
	if(kind == 1) max = 25;
	let rank = 0;
	while(1){
		rand = Math.floor(Math.random()*(max-min+1)) + min;
		if(randArr.indexOf(rand) > -1){ // 같은게있으면 그 자리를 뱉어냄 
			continue;
		}else{
			break;
		}
	}
	randArr.push(rand);
	if(kind == 1)randArr = []; // 메가볼까지 자동했음 초기화
	return rand;
}
function getClickNum(n){ // 선택한 번호 리스트에 담기 : n - 99 (신규) 외  수정
	let wlen = $(".wball.click").length;
	let blen = $(".bball.click").length;
	if(wlen != 5){
		alert("화이트볼을 5개 선택해주세요");
		return;
	}
	if(blen != 1){
		alert("메가볼을 1개 선택해주세요");
		return;
	}
	if(n == 99){
		if(selectGame == numlist.length){
			alert("이미 "+selectGame+"게임을 선택하셨습니다");
			return;
		}
		let num = '';
		for(var i=0; i<wlen; i++)
			num += $(".wball.click").eq(i).text()+',';
		num += $(".bball.click").eq(0).text();
		numlist.push(num);
		setSelectNumList()
	}else{
		let num = '';
		for(var i=0; i<5; i++)
			num += $(".wball.click").eq(i).text()+',';
		num += $(".bball.click").eq(0).text();
		numlist.splice(n , 1 , num);
		setSelectNumList();
	}
	$("#selectNumBtn").attr("href","javascript:getClickNum(99)");
	resetClick();
}
function udtSelectNum(id){ // 선택한 볼 수정
	resetClick();
	for(var i=0; i<5; i++){
		let wball = $(".wball_pick").eq(i).text();
		$("#wb_"+wball).addClass('click');
	}
	$("#bb_"+($(".bball_pick").eq(0).text())).addClass('click');
	$("#selectNumBtn").attr("href","javascript:getClickNum("+id+")");
}
function delSelectNum(id){ // 선택한 볼 삭제
	numlist.splice(Number(id),1);
	setSelectNumList();
}
function resetSelectNum(){ // 선택한 볼 초기화
	numlist = [];
	setSelectNumList()
}
function setSelectNumList(){ // 선택번호 리스트 세팅
	$(".select_num_box").html("");
	for(var i=0; i<selectGame; i++){
		let txt = '';
		txt += '<div class="selet_num" id="selectNum'+i+'"><div class="text-block-19">0'+(i+1)+'</div>';
		txt += '<div class="numlist">';
		if(numlist[i] != null){
			let numbers = numlist[i].split(',');
			for(var j=0; j<5; j++){
				txt +='<a href="#" class="wball_pick w-button">'+numbers[j]+'</a>';
			}
			txt +='<a href="#" class="bball_pick w-button">'+numbers[5]+'</a></div>';
		}else{
			for(var j=0; j<5; j++){
				txt +='<a href="#" class="wball_pick w-button"></a>';
			}
			txt +='<a href="#" class="bball_pick w-button"></a></div>';
		}
		txt +='<div class="num_change">';
		txt +='<a href="javascript:udtSelectNum('+i+')" class="link-block-3 w-inline-block">';
		txt +='<div class="text-block-20">수정</div><img src="/klottery/webflow/images/pencil.png" loading="lazy" width="28" alt=""></a>';
		txt +='<a href="javascript:delSelectNum('+i+')" class="link-block-3 w-inline-block">';
		txt +='<div class="text-block-20">삭제</div><img src="/klottery/webflow/images/recycle_bin.png" loading="lazy" width="28" alt=""></a>';
		txt +='<a href="javascript:getMyLotto('+i+')" class="link-block-3 w-inline-block">';
		txt +='<div class="text-block-20">불러오기</div><img src="/klottery/webflow/images/arrow.png" loading="lazy" width="28" alt=""></a>';
		txt +='</div></div>';
		$(".select_num_box").append(txt);
	}
}
function getMyLottoSelectNum(idx,id){
	$.ajax({
		type : 'get',
		url : '/klottery/user/getMyLottoBallDetail.do',
		data : {'idx' : idx},
		success:function(data){
			let num = '';
			num += data.data.num1+',';
			num += data.data.num2+',';
			num += data.data.num3+',';
			num += data.data.num4+',';
			num += data.data.num5+',';
			//num += data.data.num6+',';
			num += data.data.bnum;
			numlist.splice(Number(id) , 1 , num);
			setSelectNumList();
			$('._popMyBall').css('display','none');
		}
	})
}

function saveMyBall(){ // 로또볼 저장 
	$("#saveMyLottoBtn").attr("href" , "javascript:void(0)");
	if(numlist.length == 0){
		alert("저장할 로또볼을 선택해주세요");
		return;
	}
	$.ajax({
		type : 'post',
		url : '/klottery/user/saveMyLottoBall.do',
		data : {'numlist':numlist , 'type' : 1},
		traditional : true,
		success:function(data){
			alert(data.msg);
			$("#saveMyLottoBtn").attr("href" , "javascript:saveMyBall()");
		}
	})
}
function getMyLotto(id){ // 로또볼 불러오기
	$.ajax({
		type : 'get',
		url : '/klottery/user/getMyLottoBall.do',
		data : {'type' : 1},
		success:function(data){
			if(data.data.length == 0){
				$("._popMsg").css('display',"flex");
			}else{
				let txt = '';
				for(var i=0; i< data.data.length; i++){
					txt += '<div class="myball_list">';
					txt += '<div class="text-block-25">'+(i+1)+'</div>';
					txt += '<div class="myball">';
					txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num1+'</a>';
					txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num2+'</a>';
					txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num3+'</a>';
					txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num4+'</a>';
					txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num5+'</a>';
					//txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num6+'</a>';
					txt += '<a href="#" class="bball_pick w-button">'+data.data[i].bnum+'</a>';
					txt += '</div>';
					txt += '<a href="javascript:delMyLotto('+data.data[i].idx+','+id+')" class="link-4">삭제</a>';
					txt += '<a href="javascript:getMyLottoSelectNum('+data.data[i].idx+','+id+')" class="link-4">불러오기</a>';
					txt += '</div>';
				}
				$("._popMyBall .myball_list_box").html(txt);
				$("._popMyBall").css('display',"flex");
			}
		}
	})
}
function delMyLotto(idx,id){
	$.ajax({
		type : 'get',
		url : '/klottery/user/delMyLottoBall.do',
		data : {'idx' : idx , 'type' : 1},
		success:function(data){
			if(data.data.length == 0){
				$("._popMsg").css('display',"flex");
			}else{
				let txt = '';
				for(var i=0; i< data.data.length; i++){
					txt += '<div class="myball_list">';
					txt += '<div class="text-block-25">'+(i+1)+'</div>';
					txt += '<div class="myball">';
					txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num1+'</a>';
					txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num2+'</a>';
					txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num3+'</a>';
					txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num4+'</a>';
					txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num5+'</a>';
					//txt += '<a href="#" class="wball_pick w-button">'+data.data[i].num6+'</a>';
					txt += '<a href="#" class="bball_pick w-button">'+data.data[i].bnum+'</a>';
					txt += '</div>';
					txt += '<a href="javascript:delMyLotto('+data.data[i].idx+')" class="link-4">삭제</a>';
					txt += '<a href="#" class="link-4">불러오기</a>';
					txt += '</div>';
				}
				$("._popMyBall .myball_list_box").html(txt);
				$("._popMyBall").css('display',"flex");
			}
		}
	})
}
function buy(){
	$("#buyBtn").attr("href" , "javascript:void(0)");
	if(selectGame != numlist.length){
		alert(selectGame+"을 선택해주세요");
		$("#buyBtn").attr("href" , "javascript:buy()");
		return;
	}	
	let data = {'gameType:':gameType , 'numlist':numlist , 'selectGame':selectGame , 'type':1};	
	$.ajax({
		type : 'post',
		data : data,
		url : '/klottery/user/buyLottoProcess.do',
		traditional : true,
		success:function(data){
			console.log(data);
		}
	})	
}
</script>

</html>