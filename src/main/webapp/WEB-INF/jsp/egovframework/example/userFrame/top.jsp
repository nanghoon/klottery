<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="top">
	<div class="topbar">
		<div class="topwrap_login">
			<div class="m_top">
				<a href="/klottery/main.do" class="m_logobtn w-inline-block">
					<img src="/klottery/webflow/images/logo.png" loading="lazy" width="93"
					srcset="/klottery/webflow/images/k-lottery로고-p-500.png 500w, /klottery/webflow/images/k-lottery로고-p-800.png 800w, /klottery/webflow/images/k-lottery로고-p-1080.png 1080w, /klottery/webflow/images/k-lottery로고-p-1600.png 1600w, /klottery/webflow/images/k-lottery로고-p-2000.png 2000w, /klottery/webflow/images/logo.png 2068w"
					sizes="(max-width: 479px) 100vw, (max-width: 767px) 93px, 100vw"
					alt="" class="m_logo">
				</a>
				<c:if test="${userIdx == null}">
					<div class="login" onclick="locaion.href='/klottery/login.do'">로그인</div>
					<div class="join" onclick="locaion.href='/klottery/join.do'">회원가입</div>
					<a href="javascript:$('.m_menuframe').css('display','flex')" class="m_menubtn w-inline-block">
						<img src="/klottery/webflow/images/menu_icon-2_1menu_icon-2.png" loading="lazy" alt="" class="m_menuicon">
					</a>
				</c:if>
				<c:if test="${userIdx != null}">
					<div class="m_menuwrap">
						<div class="div-block-37 m">
							<img src="/klottery/webflow/images/4213460_account_avatar_head_person_profile_icon_14213460_account_avatar_head_person_profile_icon.png"
								loading="lazy" alt="" class="user">
						</div>
						<a href="javascript:$('.m_menuframe').css('display','flex')" class="m_menubtn w-inline-block">
							<img src="/klottery/webflow/images/menu_icon-2_1menu_icon-2.png" loading="lazy" alt="" class="m_menuicon">
						</a>
					</div>
				</c:if>
			</div>
			<div class="m_menuframe">
				<div class="m_menubox">
					<div class="m_box">
						<a href="javascript:$('.m_menuframe').css('display','none')" class="closebtn w-inline-block">
							<img src="/klottery/webflow/images/remove_x_icon_1remove_x_icon.png" loading="lazy"
							alt="" class="closeicon _2">
						</a>
					</div>
					<div class="m_menucontainer">
						<div class="m_tabwrap">
							<div class="m_tab click"></div>
							<div class="m_tab _2"></div>
							<div class="m_tab _4"></div>
							<div class="m_tab _5"></div>
							<c:if test="${userIdx != null}">
								<a href="#" class="m_logoutbtn w-button">로그아웃</a>
							</c:if>
						</div>
						<div class="menuboxwrap">
							<div class="menubox order">
								<div class="m_ordermenubox">
									<div class="m_ordertxt">[ 02월 12일 토요일 13:00 추첨 *한국 표준시 ]</div>
									<div class="m_ordertxt prize">
										정산 회차 1등 당첨금<span class="text-span-47"> $ 42,000,000</span>
									</div>
									<div class="m_ordertxt prize _2">추첨 대기중</div>
									<img src="/klottery/webflow/images/logo_mgm_left.png" loading="lazy" alt="" class="mlogo"> 
									<a href="#" class="m_orderbutton w-button">메가밀리언 주문하기</a>
								</div>
								<div class="m_ordermenubox">
									<div class="m_ordertxt">[ 02월 12일 토요일 13:00 추첨 *한국 표준시 ]</div>
									<div class="m_ordertxt prize">
										정산 회차 1등 당첨금<span class="text-span-47"> $ 42,000,000</span>
									</div>
									<div class="m_ordertxt prize _2">504억원</div>
									<img src="/klottery/webflow/images/lotto_logo.png" loading="lazy" alt="" class="mlogo"> 
									<a href="#" class="m_orderbutton w-button">로또 주문하기</a>
								</div>
								<div class="m_ordermenubox">
									<div class="m_ordertxt">[ 02월 12일 토요일 13:00 추첨 *한국 표준시 ]</div>
									<div class="m_ordertxt prize">
										정산 회차 1등 당첨금<span class="text-span-47"> $ 42,000,000</span>
									</div>
									<div class="m_ordertxt prize _2">
										<span class="text-span-48">이월</span>504억원
									</div>
									<img src="/klottery/webflow/images/logo_pwb_left.png" loading="lazy" alt="" class="mlogo"> 
									<a href="#" class="m_orderbutton w-button">파워볼 주문하기</a>
								</div>
							</div>
							<div class="menubox mypage">
								<div class="m_container">
									<a href="/klottery/intro.do" class="menubtn w-inline-block">
										<div class="f_txt m">
											<span class="text-span-37">〉</span>복권소개
										</div>
									</a>
								</div>
								<div class="m_container">
									<a href="#" class="menubtn w-inline-block">
										<div class="f_txt m">
											<span class="text-span-37">〉</span>당첨결과
										</div>
									</a>
									<div class="menuwrap">
										<a href="/klottery/result.do?type=1" class="menubtn _2 w-inline-block">
											<div class="f_txt m">메가밀리언</div>
										</a> 
										<a href="/klottery/result.do?type=2" class="menubtn _2 w-inline-block">
											<div class="f_txt m">동행복권</div>
										</a> 
										<a href="/klottery/result.do?type=3" class="menubtn _2 w-inline-block">
											<div class="f_txt m">뉴욕로또</div>
										</a>
									</div>
								</div>
							</div>
							<div class="menubox customer">
								<div class="m_container">
									<a href="/klottery/eventList.do" class="menubtn w-inline-block">
										<div class="f_txt m">
											<span class="text-span-37">〉</span>이벤트
										</div>
									</a>
								</div>
								<div class="m_container">
									<a href="#" class="menubtn w-inline-block">
										<div class="f_txt m">
											<span class="text-span-37">〉</span>고객센터
										</div>
									</a>
									<div class="menuwrap">
										<a href="/klottery/faqList.do" class="menubtn _2 w-inline-block">
											<div class="f_txt m">자주묻는질문</div>
										</a> 
										<a href="/klottery/user/qnaList.do" class="menubtn _2 w-inline-block">
											<div class="f_txt m">1:1상담</div>
										</a> 
										<a href="#" class="menubtn _2 w-inline-block">
											<div class="f_txt m">구매가이드</div>
										</a> 
										<a href="#" class="menubtn _2 w-inline-block">
											<div class="f_txt m">당첨가이드</div>
										</a>
									</div>
								</div>
								<a href="#" class="menubtn w-inline-block">
									<div class="f_txt m">
										<span class="text-span-37">〉</span>마이페이지
									</div>
								</a> 
								<a href="#" class="menubtn _2 w-inline-block">
									<div class="f_txt m">마이페이지홈</div>
								</a> 
								<a href="#" class="menubtn _2 w-inline-block">
									<div class="f_txt m">구매/당첨내역</div>
								</a> 
								<a href="#" class="menubtn _2 w-inline-block">
									<div class="f_txt m">포인트내역</div>
								</a> 
								<a href="#" class="menubtn _2 w-inline-block">
									<div class="f_txt m">포인트충전</div>
								</a> 
								<a href="#" class="menubtn _2 w-inline-block">
									<div class="f_txt m">출금하기</div>
								</a> 
								<a href="#" class="menubtn _2 w-inline-block">
									<div class="f_txt m">개인정보</div>
								</a>
							</div>
							<div class="menubox introduce">
								<div class="m_container">
									<a href="#" class="menubtn w-inline-block">
										<div class="f_txt m">
											<span class="text-span-37">〉</span>회사소개
										</div>
									</a>
								</div>
								<div class="m_container">
									<a href="#" class="menubtn w-inline-block">
										<div class="f_txt m">
											<span class="text-span-37">〉</span>이용약관
										</div>
									</a> 
									<a href="#" class="menubtn w-inline-block">
										<div class="f_txt m">
											<span class="text-span-37">〉</span>개인정보처리방침
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="topbox login">
		<c:if test="${userIdx != null}">
			<div class="topwrap login">
				<div class="text-block-49-copy">${userId}님 환영합니다.</div>
				<div class="text-block-56">
					<span class="text-span-6">보유포인트</span> 0
				</div>
				<div class="text-block-56">충전</div>
				<div class="text-block-56">출금</div>
			</div>
		</c:if>
		<div class="topwrap">
			<a href="/klottery/main.do" class="w-inline-block">
				<img src="/klottery/webflow/images/logo.png" loading="lazy"
				srcset="/klottery/webflow/images/k-lottery로고-p-500.png 500w, /klottery/webflow/images/k-lottery로고-p-800.png 800w, /klottery/webflow/images/k-lottery로고-p-1080.png 1080w, /klottery/webflow/images/k-lottery로고-p-1600.png 1600w, /klottery/webflow/images/k-lottery로고-p-2000.png 2000w, /klottery/webflow/images/logo.png 2068w"
				sizes="100vw" alt="" class="logo">
			</a>
			<div class="topmenubox">
				<a href="/klottery/intro.do" class="topmenulink w-inline-block <c:if test = "${fn:contains(curPage, 'intro.do')}">click</c:if>">
					<div class="topmenu">복권소개</div>
				</a> 
				<a href="#" class="topmenulink w-inline-block _menuBuyGame">
					<div class="topmenu">게임구매</div>
				</a>
				<div class="lotto_buy_pop click">
					<a href="#" class="lottobox w-inline-block">
						<img src="/klottery/webflow/images/mega_logo.png" loading="lazy"
						srcset="/klottery/webflow/images/메가밀리언-로고-p-500.png 500w, /klottery/webflow/images/메가밀리언-로고-p-800.png 800w, /klottery/webflow/images/메가밀리언-로고-p-1080.png 1080w, /klottery/webflow/images/mega_logo.png 1200w"
						sizes="100vw" alt="">
						<div class="text-block-22">메가밀리언</div>
						<div class="text-block-23">구매 바로가기</div> 
					</a> 
					
					<a href="#" class="lottobox w-inline-block">
						<img src="/klottery/webflow/images/lotto_logo.png" loading="lazy" alt="">
						<div class="text-block-22">동행복권</div>
						<div class="text-block-23">구매 바로가기</div> 
					</a> 
					<a href="#" class="lottobox w-inline-block">
						<img src="/klottery/webflow/images/power_logo.png" loading="lazy"
						srcset="/klottery/webflow/images/power_logo-p-500.png 500w, /klottery/webflow/images/power_logo.png 505w"
						sizes="100vw" alt="" class="image-14">
						<div class="text-block-22">파워볼</div>
						<div class="text-block-23">구매 바로가기</div> 
					</a>
				</div>
				<a href="/klottery/result.do?type=1" class="topmenulink w-inline-block <c:if test = "${fn:contains(curPage, 'result.do')}">click</c:if>">
					<div class="topmenu">당첨결과</div>
				</a> 
				<a href="/klottery/faqList.do" class="topmenulink w-inline-block <c:if test = "${fn:contains(curPage, 'faqList.do')||fn:contains(curPage, 'qna')||fn:contains(curPage, 'buyGuide.do')||fn:contains(curPage, 'hitGuide.do')}">click</c:if>">
					<div class="topmenu">고객센터</div>
				</a> 
				<a href="/klottery/eventList.do" class="topmenulink w-inline-block <c:if test = "${fn:contains(curPage, 'event')}">click</c:if>">
					<div class="topmenu">이벤트</div>
				</a>
			</div>
			<c:if test="${userIdx == null}">
				<div class="topmenubox">
					<a href="/klottery/join.do" class="topmenubtn w-button">회원가입 </a> 
					<a href="/klottery/login.do" class="topmenubtn w-button">로그인</a>
				</div>
			</c:if>
			<c:if test="${userIdx != null}">
				<div class="topmenubox">
					<a href="#" class="topmenubtn w-button click">마이페이지 </a> 
					<a href="/klottery/logout.do" class="topmenubtn w-button">로그아웃</a>
				</div>
			</c:if>
		</div>
	</div>
</div>
<script>
$(document).ready(function(){
	$("._menuBuyGame , .lotto_buy_pop").on('mouseover',function(){
		$(".lotto_buy_pop").css("display","flex");
	}).on("mouseleave",function(){
		$(".lotto_buy_pop").css("display","none");
	})
})
</script>