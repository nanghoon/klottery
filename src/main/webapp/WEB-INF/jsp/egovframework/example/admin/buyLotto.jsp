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
					<h1 class="page-header">
					회원 ${type == 1 ? '메가밀리언' : type == 2 ? '동행복권' : '파워볼' } 구매 리스트
					</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
						<div class="panel-heading">
						회원 ${type == 1 ? '메가밀리언' : type == 2 ? '동행복권' : '파워볼' } 구매 리스트
						</div>
                        <div class="panel-body">
                        	<div class="row">
								<form action="/klottery/admin/lotto/buyLotto.do" name="listForm" id="listForm">
		                           	<input type="hidden" name="pageIndex" value="1"/>
		                           	<input type="hidden" name="type" value="${type}"/>
									<div class="col-lg-2">
										<label>정렬 선택</label>
										<div class="form-group">
											<select class="form-control" name="order">
												<option value="cnt" <c:if test="${order == 'cnt'}">selected</c:if>>회차순</option>
												<option value="bdate" <c:if test="${order == 'bdate'}">selected</c:if>>구매일순 </option>
											</select>
										</div>
									</div>
									<div class="col-lg-2">
			                           	<div class="form-group ">
			                           		<label>회원 아이디/이름 검색 </label>
			                           		<div class="form-group input-group">
			                           			<input type="text" name="search" onkeypress="if(event.keyCode==13) {javascript:checkForm(); return false;}" class="form-control" value="${search}" placeholder="아이디/이름">
												<span class="input-group-btn">
			                                       <button class="btn btn-default" onclick="checkForm()" type="button"><i class="fa fa-search"></i></button>
			                                   </span>                            		
											</div>
			                           	</div>
			                        </div>
								</form>
                           	</div>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>추첨회차</th>
                                            <th>구매일</th>
                                            <th>회원ID(회원명)</th>
                                            <th>구매 유형</th>
                                            <th>게임 수 </th>
                                            <th>복권 스캔 여부</th>
                                            <th>당첨 여부</th>
                                            <th>당첨금</th>
                                            <th>추첨일시(현지)</th>
                                            <th>지급 여부</th>
                                            <th>처리일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="item" items="${list}" varStatus="i">
	                                        <tr onclick="location.href='/klottery/admin/lotto/buyLottoDetail.do?cnt=${item.cnt}&midx=${item.midx}&gid=${item.gid}&type=${type}'" style="cursor:pointer;<c:if test="${item.approval != 0 && item.hit == 1}">background:yellow;</c:if>">
	                                            <td>${item.cnt}회차</td>
	                                            <td><fmt:formatDate value="${item.bdate}" pattern="yyyy-MM-dd"/></td>
	                                            <td>${item.id == null ? '탈퇴된 회원' : item.id}(${item.name == null ? '탈퇴된 회원' : item.name})</td>
	                                            <td>
	                                            	<c:if test="${item.kind=='0'}">수동 선택</c:if>
	                                            	<c:if test="${item.kind=='1'}">자동 구매</c:if>
	                                            	<c:if test="${item.kind=='2'}">나의 로또볼</c:if>
												</td>
												<td>${item.gtype}게임</td>
	                                            <td>${item.scan == 1 ? '스캔완료' : '스캔필요'}</td>
	                                            <td>
													<c:if test="${item.approval == 0 }">추첨 예정</c:if>
													<c:if test="${item.approval != 0 }">
														<c:if test="${item.hit == 1}">당첨</c:if>
														<c:if test="${item.hit != 1}">낙첨</c:if>
													</c:if>
	                                            </td>
	                                            <td> - <%--$ <fmt:formatNumber value="${item.hitMoney}"/> --%></td>
	                                            <td>
													<c:if test="${item.rdate == null}">추첨 예정</c:if>
													<c:if test="${item.rdate != null}"><fmt:formatDate value="${item.rdate}" pattern="yyyy-MM-dd" /></c:if>
	                                            </td>
	                                            <td>
	                                            	<c:if test="${item.approval == 0 }">
	                                            		추첨예정
	                                            	</c:if>
	                                            	<c:if test="${item.approval != 0 }">
		                                            	<c:if test="${item.give == 0}">낙첨</c:if>
		                                            	<c:if test="${item.give == 1}">지급 완료</c:if>
	                                            	</c:if>
	                                            </td>
	                                            <td><fmt:formatDate value="${item.adate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
							<div class="row">
								<div class="col-sm-12" style="text-align:center;">
								<ul class="pagination">
									<ui:pagination paginationInfo="${pi}" type="admin" jsFunction="page"/>
								</ul>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
<jsp:include page="../adminFrame/footer.jsp"></jsp:include>
<script>
function page(pageNo){
	document.listForm.pageIndex.value = pageNo;
   	document.listForm.submit();
}
function checkForm(file){
	var sdate = $("#sdate").val();
	var edate = $("#edate").val();
	if((sdate == '' && edate != '') || (sdate != '' && edate == '')){
		alert("조회시작기간과 조회종료기간을 설정해주세요.");
		return;
	}
	if(edate < sdate){
		alert("조회종료기간이 조회시작기간보다 작을 수 없습니다.");
		return;
	}
	$("#listForm").submit();
}
</script>
</body>
</html>