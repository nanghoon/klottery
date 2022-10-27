<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="popframe balldetail">
	<div class="popup balldetail">
		<a href="javascript:$('.balldetail').css('display','none')" class="link-block-4 w-inline-block">
			<img src="/klottery/webflow/images/x.png" loading="lazy" width="38" alt="">
		</a>
		<div class="div-block-9">
			<h3 class="heading-4">추첨번호</h3>
			<img src="/klottery/webflow/images/over.png" loading="lazy" width="50" alt="" id="balldetail_result">
			<div class="text-block-27">09월 23일 금요일 20:00 (현지시간)</div>
		</div>
		<div class="div-block-10"></div>
		<div class="text-block-28"></div>
		<div class="div-block-11">
			<div class="div-block-46">
				<div class="div-block-12">
					<div class="text-block-29">등수</div>
					<div class="text-block-29-copy">당첨조건</div>
					<div class="text-block-29-copy2">당첨금</div>
					<div class="text-block-29-copy2">당첨수</div>
				</div>
				<span id="balldetail_detail" style="display:contents;"></span>
			</div>
		</div>
	</div>
</div>
<script>
function lottoDetailPop(idx){
	$.ajax({
		type:'get',
		url:'/klottery/resultDetail.do?idx='+idx,
		success:function(data){
			if(data.info.result == 1) $("#balldetail_result").css("display" ,"none");
			$(".balldetail .text-block-27").text(data.info.rdate+" (현지시간)");
			if(data.info.type == 2) $(".balldetail .text-block-28").html("");
			else $(".balldetail .text-block-28").html('* 아래의 결과는 <span class="text-span">캘리포니아주만의 결과</span>입니다.');
			let ballData = "";
			ballData += '<div class="wball_pick _1">'+data.info.num1+'</div>';
			ballData += '<div class="wball_pick _1">'+data.info.num2+'</div>';
			ballData += '<div class="wball_pick _1">'+data.info.num3+'</div>';
			ballData += '<div class="wball_pick _1">'+data.info.num4+'</div>';
			ballData += '<div class="wball_pick _1">'+data.info.num5+'</div>';
			if(data.info.num6 != null && data.info.num6 != '')
				ballData += '<div class="wball_pick _1">'+data.info.num6+'</div>';
			ballData += '<div class="bball_pick _1">'+data.info.bnum+'</div>';
			$(".balldetail .div-block-10").html(ballData);
			
			let rankList = data.info.data.split('|');
			let rankData = "";
			for(var i=0; i< rankList.length; i++){
				rankData +='<div class="div-block-12-copy">';
				let rdata = rankList[i].split(',');
				rankData +='<div class="text-block-29 _1">'+rdata[0]+'등</div>';
				rankData +='<div class="text-block-29-copy _1">'+getLottoRankOption(data.info.type , Number(rdata[0]))+'</div>';
				rankData +='<div class="text-block-29-copy2 _1">'+(data.info.type == 2 ? '' : '$')+comma(rdata[1])+'</div>';
				rankData +='<div class="text-block-29-copy2 _1">'+comma(rdata[2])+'</div>';
				rankData +='</div>';
			}
			$("#balldetail_detail").html(rankData);
			$(".balldetail").css("display","flex");
		}
	})
}
function comma(num) {
	let setNum = Number(num);
	return setNum.toLocaleString()
}
function getLottoRankOption(type , rank){
	if(type == 2){
		switch(rank){
			case 1: return "당첨번호 6개";
			case 2: return "당첨번호 5개 + 보너스 1개";
			case 3: return "당첨번호 5개";
			case 4: return "당첨번호 4개";
			case 5: return "당첨번호 3개";
		}
	}else{
		switch(rank){
			case 1: return "5개 화이트볼 + 1개 "+(type==1?'메가':'파워')+"볼";
			case 2: return "5개 화이트볼";
			case 3: return "4개 화이트볼 + 1개 "+(type==1?'메가':'파워')+"볼";
			case 4: return "4개 화이트볼";
			case 5: return "3개 화이트볼 + 1개 "+(type==1?'메가':'파워')+"볼";
			case 6: return "3개 화이트볼";
			case 7: return "2개 화이트볼 + 1개 "+(type==1?'메가':'파워')+"볼";
			case 8: return "1개 화이트볼 + 1개 "+(type==1?'메가':'파워')+"볼";
			case 9: return "1개 "+(type==1?'메가':'파워')+"볼";
		}
	}
}
</script>