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
		<div class="banner">
			<div class="bannerwrap">
				<div class="bannerbox m">
					<div class="bannerbox1">
						<img src="/klottery/webflow/images/mega_logo.png" loading="lazy" width="227"
							srcset="/klottery/webflow/images/메가밀리언-로고-p-500.png 500w, /klottery/webflow/images/메가밀리언-로고-p-800.png 800w, /klottery/webflow/images/메가밀리언-로고-p-1080.png 1080w, /klottery/webflow/images/mega_logo.png 1200w"
							sizes="227px" alt="">
					</div>
					<div class="bannerbox2">
						<div class="lottohit">메가밀리언 추첨</div>
						<div class="lottohitdate">- ${mDate}</div>
					</div>
					<div class="bannerbox3-copy">
						<c:if test="${!mShow}">
							<div class="lotto_money">
								<div class="lotto_money-copy">추첨대기중</div>
							</div>
						</c:if>
						<c:if test="${mShow}">
							<div class="lotto_money">
								<div class="lotto_won">₩</div>
								<div class="lotto_money"><fmt:formatNumber value="${mWon}"/></div>
								<div class="lotto_money2">
									<div class="moenytxt1">당첨금</div>
									<div class="moenytxt2">억원</div>
								</div>
							</div>
						</c:if>
					</div>
					<div class="bannerbox4">
						<jsp:useBean id="javaDate" class="java.util.Date" />
						<jsp:setProperty name="javaDate" property="time" value="${mega.rdate.time + 13*60*60*1000}"/>
						<div class="lotto_recent_date">
							직전회차 : <fmt:setLocale value="en_us" scope="session"/><fmt:formatDate value="${javaDate}" pattern="EEE / MMM dd"/>
						</div>
						<div class="lottoball">
							<div class="whiteball">
								<div class="wball_num">${mega.num1}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${mega.num2}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${mega.num3}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${mega.num4}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${mega.num5}</div>
							</div>
							<div class="bonusball">
								<div class="bball_num">${mega.bnum}</div>
							</div>
						</div>
						<a href="/klottery/user/buyMega.do" class="megabtn w-button">구매하기</a>
					</div>
				</div>
				<div class="bannerbox l">
					<div class="bannerbox1">
						<img src="/klottery/webflow/images/lotto_logo.png" loading="lazy" width="199" alt="">
					</div>
					<div class="bannerbox2">
						<div class="lottohit">동행복권 추첨</div>
						<div class="lottohitdate">- 매주 토요일 20:00</div>
					</div>
					<div class="bannerbox3-copy">
						<c:if test="${!lShow}">
							<div class="lotto_money">
								<div class="lotto_money-copy">추첨대기중</div>
							</div>
						</c:if>
						<c:if test="${lShow}">
							<div class="lotto_money">
								<div class="lotto_won">₩</div>
								<div class="lotto_money"><fmt:formatNumber value="${lWon}"/></div>
								<div class="lotto_money2">
									<div class="moenytxt1">당첨금</div>
									<div class="moenytxt2">억원</div>
								</div>
							</div>
						</c:if>
					</div>
					<div class="bannerbox4">
						<div class="lotto_recent_date">직전회차 : <fmt:setLocale value="en_us" scope="session"/><fmt:formatDate value="${lotto.rdate}" pattern="EEE / MMM dd"/></div>
						<div class="lottoball">
							<div class="whiteball">
								<div class="wball_num">${lotto.num1}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${lotto.num2}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${lotto.num3}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${lotto.num4}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${lotto.num5}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${lotto.num6}</div>
							</div>
							<div class="bonusball">
								<div class="bball_num">${lotto.bnum}</div>
							</div>
						</div>
						<a href="/klottery/user/buyLotto.do" class="lottobtn w-button">구매하기</a>
					</div>
				</div>
				<div class="bannerbox p">
					<div class="bannerbox1 _1">
						<img src="/klottery/webflow/images/power_logo.png" loading="lazy" sizes="295px"
							srcset="/klottery/webflow/images/power_logo-p-500.png 500w, /klottery/webflow/images/power_logo.png 505w"
							width="295" alt="" class="image">
					</div>
					<div class="bannerbox2">
						<div class="lottohit">파워볼 추첨</div>
						<div class="lottohitdate">- ${pDate}</div>
					</div>
					<div class="bannerbox3-copy">
						<c:if test="${!pShow}">
							<div class="lotto_money">
								<div class="lotto_money-copy">추첨대기중</div>
							</div>
						</c:if>
						<c:if test="${pShow}">
							<div class="lotto_money">
								<div class="lotto_won">₩</div>
								<div class="lotto_money"><fmt:formatNumber value="${pWon}"/></div>
								<div class="lotto_money2">
									<div class="moenytxt1">당첨금</div>
									<div class="moenytxt2">억원</div>
								</div>
							</div>
						</c:if>
					</div>
					<div class="bannerbox4">
						<jsp:setProperty name="javaDate" property="time" value="${power.rdate.time + 13*60*60*1000}"/>
						<div class="lotto_recent_date">
							직전회차 : <fmt:setLocale value="en_us" scope="session"/><fmt:formatDate value="${javaDate}" pattern="EEE / MMM dd"/>
						</div>
						<div class="lottoball">
							<div class="whiteball">
								<div class="wball_num">${power.num1}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${power.num2}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${power.num3}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${power.num4}</div>
							</div>
							<div class="whiteball">
								<div class="wball_num">${power.num5}</div>
							</div>
							<div class="bonusball">
								<div class="bball_num">${power.bnum}</div>
							</div>
						</div>
						<a href="/klottery/user/buyPower.do" class="powerbtn w-button">구매하기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="shortcut">
			<div class="shortcutwrap">
				<div class="shorcut_div">
					<img src="/klottery/webflow/images/FQ.png" loading="lazy" width="76"
						srcset="/klottery/webflow/images/FQ-p-500.png 500w, /klottery/webflow/images/FQ-p-800.png 800w, /klottery/webflow/images/FQ.png 804w"
						sizes="(max-width: 479px) 51vw, 76px" alt="" class="image">
					<div class="shortcut_txt_div">
						<div class="shortcut_title">FAQ</div>
						<div class="shortcut_text">바로가기</div>
					</div>
				</div>
				<div class="shorcut_div">
					<img src="/klottery/webflow/images/buy_secure.png" loading="lazy" width="65"
						srcset="/klottery/webflow/images/안심구매-p-500.png 500w, /klottery/webflow/images/buy_secure.png 587w"
						sizes="(max-width: 479px) 51vw, 65px" alt="">
					<div class="shortcut_txt_div">
						<div class="shortcut_title">안심구매</div>
						<div class="shortcut_text">바로가기</div>
					</div>
				</div>
				<div class="shorcut_div">
					<img src="/klottery/webflow/images/mega_logo.png" loading="lazy" width="135"
						srcset="/klottery/webflow/images/메가밀리언-로고-p-500.png 500w, /klottery/webflow/images/메가밀리언-로고-p-800.png 800w, /klottery/webflow/images/메가밀리언-로고-p-1080.png 1080w, /klottery/webflow/images/mega_logo.png 1200w"
						sizes="(max-width: 479px) 51vw, (max-width: 767px) 20vw, 135px"
						alt="">
					<div class="shortcut_txt_div">
						<div class="shortcut_title">메가밀리언</div>
						<div class="shortcut_text">바로가기</div>
					</div>
				</div>
				<div class="shorcut_div">
					<img src="/klottery/webflow/images/lotto_logo.png" loading="lazy" width="119" alt="">
					<div class="shortcut_txt_div">
						<div class="shortcut_title">동행복권</div>
						<div class="shortcut_text">바로가기</div>
					</div>
				</div>
				<div class="shorcut_div">
					<img src="/klottery/webflow/images/power_logo.png" loading="lazy" width="190"
						srcset="/klottery/webflow/images/power_logo-p-500.png 500w, /klottery/webflow/images/power_logo.png 505w"
						sizes="(max-width: 479px) 51vw, (max-width: 991px) 20vw, 190px"
						alt="">
					<div class="shortcut_txt_div">
						<div class="shortcut_title">파워볼</div>
						<div class="shortcut_text">바로가기</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section">
			<div class="guidebox">
				<a href="/klottery/buyGuide.do" class="buy_guide w-button">구매 가이드</a> 
				<a href="/klottery/hitGuide.do" class="hit_guide w-button">당첨자 가이드</a>
			</div>
			<div class="sequenceline"></div>
			<div class="sequence">
				<div class="sequencewrap">
					<div class="step">
						<div class="step_num">01</div>
						<img src="/klottery/webflow/images/join.png" loading="lazy" width="34" alt=""
							class="image-2">
						<div class="step_txt">회원가입</div>
					</div>
					<div class="step">
						<div class="step_num">02</div>
						<img src="/klottery/webflow/images/point.png" loading="lazy" width="38" alt=""
							class="image-3">
						<div class="step_txt">포인트 충전</div>
					</div>
					<div class="step">
						<div class="step_num">03</div>
						<img src="/klottery/webflow/images/gameOrder.png" loading="lazy" width="36" alt=""
							class="image-4">
						<div class="step_txt">게임주문</div>
					</div>
					<div class="step">
						<div class="step_num">04</div>
						<img src="/klottery/webflow/images/omr.png" loading="lazy" width="48" alt=""
							class="image-5">
						<div class="step_txt">OMR 카드입력</div>
					</div>
					<div class="step">
						<div class="step_num">05</div>
						<img src="/klottery/webflow/images/buy_lotto.png" loading="lazy" width="45" alt=""
							class="image-6">
						<div class="step_txt">실물로또구매</div>
					</div>
					<div class="step">
						<div class="step_num">06</div>
						<img src="/klottery/webflow/images/scan.png" loading="lazy" width="44" alt=""
							class="image-7">
						<div class="step_txt">스캔/업로드</div>
					</div>
					<div class="step">
						<div class="step_num">07</div>
						<img src="/klottery/webflow/images/check_num.png" loading="lazy" width="63" alt=""
							class="image-8">
						<div class="step_txt">번호확인</div>
					</div>
					<div class="step">
						<div class="step_num">08</div>
						<img src="/klottery/webflow/images/draw_lots.png" loading="lazy" width="75" alt=""
							class="image-9">
						<div class="step_txt">추첨</div>
					</div>
					<div class="step">
						<div class="step_num">09</div>
						<img src="/klottery/webflow/images/hiResult.png" loading="lazy" width="33" alt=""
							class="image-10">
						<div class="step_txt">당첨확인</div>
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