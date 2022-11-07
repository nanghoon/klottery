<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../adminFrame/header.jsp"></jsp:include>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../adminFrame/top.jsp"></jsp:include>
		<jsp:include page="../adminFrame/left.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">${type == 1 ? '메가밀리언' : type == 2 ? '동행복권' : '파워볼' } 구매 정보</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
						${infoList[0].id}님의 ${infoList[0].cnt}회차 ${type == 1 ? '메가밀리언' : type == 2 ? '동행복권' : '파워볼' } 구매 정보
						</div>
						<div class="panel-body">
							<form name="updateForm" id="updateForm" method="post">
									<div class="row">
										<div class="col-lg-3">
											<div class="form-group">
												<label>아이디</label> 
												<pre>${infoList[0].id == null ? '탈퇴된 회원' : infoList[0].id}</pre>
											</div>
										</div>
										<div class="col-lg-3">
											<div class="form-group">
												<label>이름</label> 
												<pre>${infoList[0].id == name ? '탈퇴된 회원' : infoList[0].name}</pre>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label>회원 현재 보유 포인트</label> 
												<pre><fmt:formatNumber value="${infoList[0].point}"/></pre>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-2">
											<div class="form-group">
												<label>구매 게임</label>
												<pre>${fn:length(infoList)}게임</pre> 
											</div>
										</div>
										<div class="col-lg-4">
											<div class="form-group">
												<label>회원 구매 번호</label>
												<c:set var="hit" value="추첨 예정"/>
												<c:forEach var="item" items="${infoList}">
													<c:if test="${item.lottery < 0}"><c:set var="hit" value="낙첨"/></c:if>
													<c:if test="${item.lottery > 0}"><c:set var="hit" value="당첨"/></c:if>
													<div class="form-group input-group">
														<div class="btn btn-default btn-circle">${fn:split(item.num,',')[0]}</div>
														<div class="btn btn-default btn-circle">${fn:split(item.num,',')[1]}</div>
														<div class="btn btn-default btn-circle">${fn:split(item.num,',')[2]}</div>
														<div class="btn btn-default btn-circle">${fn:split(item.num,',')[3]}</div>
														<div class="btn btn-default btn-circle">${fn:split(item.num,',')[4]}</div>
														<c:if test="${item.type == 2}">
															<div class="btn btn-default btn-circle">${fn:split(item.num,',')[5]}</div>
														</c:if>
														<c:if test="${item.type != 2}">
															<div class="btn btn-warning btn-circle">${fn:split(item.num,',')[5]}</div>
														</c:if>
														<c:if test="${item.lottery > 0}"><div style="display:inline-block">&nbsp;${item.lottery}등</div></c:if>
													</div>												
												</c:forEach>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="form-group">
												<label>복권 스캔 업로드(250x300)</label>
												<c:if test="${infoList[0].scan == 1}">
													<div class="form-group input-group">
														<img src="/filePath/klottery/photo/${infoList[0].scanimg}" width="30%;"/>
														<div class="form-group input-group">
															<input type="file" name="file" id="file" accept="image/*" > 
															<span class="input-group-btn">
																<button class="btn btn-default" type="button" onclick="uploadScan(${infoList[0].cnt} , ${infoList[0].midx} , ${infoList[0].gid} , ${type})">
																	사진 수정
																</button>
															</span>
														</div>
													</div>
												</c:if>
												<c:if test="${infoList[0].scan != 1}">
													<div class="form-group input-group">
														<input type="file" name="file" id="file" accept="image/*" > 
														<span class="input-group-btn">
															<button class="btn btn-default" type="button" onclick="uploadScan(${infoList[0].cnt} , ${infoList[0].midx} , ${infoList[0].gid} , ${type})">
																등록
															</button>
														</span>
													</div>
												</c:if>
											</div>
										</div>
										<div class="col-lg-2">
											<div class="form-group">
												<label>회원 당첨여부</label>
												<c:if test="${infoList[0].approval == 0}"><pre>추첨예정</pre></c:if>
												<c:if test="${infoList[0].approval != 0}"><pre>${hitMoney > 0 ? '당첨' : '낙첨'}</pre></c:if>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-4">
											<div class="form-group">
												<label>회원 당첨금 (달러)</label>
												<pre><%-- $ <fmt:formatNumber value="${hitMoney}"/> --%>-</pre>
											</div>
										</div>
										<div class="col-lg-4">
											<div class="form-group">
												<label>회원 당첨금(한화 - 추첨 당시 환율 기준)</label> 
												<pre><%-- <fmt:formatNumber value="${hitMoney*infoList[0].erate}"/>원 --%>-</pre>
											</div>
										</div>
										<%-- <div class="col-lg-5">
											<div class="form-group">
												<label>실제 지급될 포인트 ($5,000이상 - 38.82% 제외 /소수점 반올림)</label>
												<c:if test="${hitMoney > 5000}">
													<pre id="realPoint"><fmt:formatNumber value="${((hitMoney*infoList[0].erate) - ((hitMoney*infoList[0].erate)*0.3882))}" pattern="#,###"/>원</pre>	
												</c:if>
												<c:if test = "${hitMoney < 5000 }">
													<pre id="realPoint"><fmt:formatNumber value="${hitMoney*infoList[0].erate}" pattern="#,###"/>원</pre>
												</c:if> 
											</div>
										</div> --%>
										<%-- <div class="col-lg-4">
											<div class="form-group">
												<label>지급 여부 (당첨금 전체지급 아님)</label>
                                       			<c:if test="${infoList[0].approval == 0}">
                                       				<pre>추첨 예정</pre>
                                  				</c:if>
                                       			<c:if test="${infoList[0].approval == 1}">
                                       				<pre>지급 완료</pre>
                                  				</c:if>
                                       			<c:if test="${infoList[0].approval == 2}">
                                       				<pre>미지급</pre>
                                       				<button style="padding:8px 12px;" onclick="changePoint(${infoList[0].episode} , ${infoList[0].midx} , ${infoList[0].gid})" class="btn btn-default" type="button">당첨금 지급</button>
                                  				</c:if>
                                       			<c:if test="${infoList[0].approval == 4}">
                                       				<pre>낙첨</pre>
                                  				</c:if>
											</div>
										</div> --%>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="../adminFrame/footer.jsp"></jsp:include>
	<script>
	function uploadScan(epi , midx , gid , type){
		let form = $("#updateForm")[0]; 
		let data = new FormData(form);
		data.append("cnt" , epi); 
		data.append("midx" , midx); 
		data.append("gid" , gid); 
		data.append("type" , type); 
		$.ajax({
			type:'post',
			data : data,
			url:'/klottery/admin/lotto/lottoScan.do',
			processData:false,
			contentType:false,
			success:function(data){
				alert(data.msg);
				if(data.result == 'success'){
					location.reload();
				}
			}
		})
	}
	</script>
</body>
</html>