<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../adminFrame/header.jsp"></jsp:include>
</head>
<script src="/klottery/se2/js/HuskyEZCreator.js" charset="utf-8" ></script>
<body>
	<div id="wrapper">
		<jsp:include page="../adminFrame/top.jsp"></jsp:include>
		<jsp:include page="../adminFrame/left.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">1:1문의 상세페이지</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							1:1문의 상세페이지
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group">
										<label>문의자</label>
										<pre>${info.writer == null ? '탈퇴된 회원' : info.writer}</pre>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="form-group">
										<label>카테고리</label>
										<pre>${info.category}</pre>
									</div>
								</div>
								<div class="col-lg-4">
									<div class="form-group">
										<label>문의날짜</label>
										<pre><fmt:formatDate type="date" value="${info.qdate}"/></pre>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group" style="word-break:break-all;">
										<label>문의제목</label>
										<div style="border:1px solid #ccc; background-color:#f5f5f5;border-radius:4px;padding:9.5px">
											${info.title}
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group" style="word-break:break-all;">
										<label>문의내용</label>
										<div style="border:1px solid #ccc; background-color:#f5f5f5;border-radius:4px;padding:9.5px">${fn:replace(text, replaceChar, "<br/>")}</div>
									</div>
								</div>
							</div>
							<c:if test="${info.answerYn eq 'N'}">
								<form id="answerForm">
									<input type="hidden" name="midx" value="${info.midx}"/>
									<input type="hidden" name="idx" value="${info.idx}"/>
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<label>답변내용</label>
												<textarea class="form-control" maxlength=700 rows="10" name="answer" id="smartEditor"></textarea>
											</div>
										</div>
									</div>
								</form>
							</c:if>
							<c:if test="${info.answerYn eq 'Y'}">
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group" style="word-break:break-word;">
											<label>답변내용</label>
											<div style="border:1px solid #ccc; background-color:#f5f5f5;border-radius:4px;padding:9.5px">${fn:replace(answer, replaceChar, "<br/>")}</div>
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${info.answerYn eq 'N'}">
				<button type="button" onclick="javascript:answerProcess()" class="btn btn-default">답변등록</button>
			</c:if>
			<button type="button" onclick="javascript:delProcess(${info.idx})" class="btn btn-danger">삭제</button>
		</div>
	</div>
	<jsp:include page="../adminFrame/footer.jsp"></jsp:include>
<script>
function answerProcess(){
	oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD",[]);
	let data = $("#answerForm").serialize();
	$.ajax({
		type :'post',
		data : data,
		url :'/klottery/admin/board/answer.do',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){
				location.reload();
			}
		}
	})
}
function delProcess(idx){
	var param = {"delArray" : idx};
	if(confirm("삭제하시겠습니까? 복구하실 수 없습니다.")){
		jQuery.ajax({
			type:'post',
			data:param,
			url:"/klottery/admin/board/qnaDelete.do",
			success:function(data){
				if(data.result == 'success'){
					alert("삭제되었습니다.");
					location.href= '/klottery/admin/board/qnaList.do';
				}else{
					alert("에러가 발생했습니다. 다시 시도해주세요");
					location.reload();
				}
			},
			errer:function(e){
				console.log('error' + e);
			}
		});
	}else{
		return;
	}
}
var oEditors = []; 
nhn.husky.EZCreator.createInIFrame({ 
	oAppRef : oEditors, 
	elPlaceHolder : "smartEditor",  
	sSkinURI : "${pageContext.request.contextPath}/se2/SmartEditor2Skin.html",  
	fCreator : "createSEditor2", 
	htParams : {  
		bUseToolbar : true,  
		bUseVerticalResizer : false,
		//bSkipXssFilter : true,
		bUseModeChanger : false 
		},
});
</script>
</body>
</html>