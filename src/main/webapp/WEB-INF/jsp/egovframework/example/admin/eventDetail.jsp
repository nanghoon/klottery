<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../adminFrame/header.jsp"></jsp:include>
</head>
<script src="/klottery/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<body>
	<div id="wrapper">
		<jsp:include page="../adminFrame/top.jsp"></jsp:include>
		<jsp:include page="../adminFrame/left.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">이벤트 수정</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">이벤트 수정</div>
						<div class="panel-body">
							<form name="updateForm" id="updateForm" method="post">
								<input type="hidden" name="idx" value="${info.idx}" />
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label>제목</label> 
											<input class="form-control" value="${info.title}" name="title" id="title" maxlength="100">
										</div>
									</div>
									<div class="col-lg-2">
										<div class="form-group">
											<div>
												<img src="/filePath/klottery/editor/${info.img}" style="max-width:100%; max-height:200px"/>
											</div>
											<br/>
											<input type="file" id="file" name="file">
											<span>※새로운 사진을 등록하면 변경됩니다. (200x200)</span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label>이벤트 시작일</label>
											<input type="date" class="form-control" value="${info.sdate}" name="sdate"/> 
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label>이벤트 종료일</label> 
											<input type="date" class="form-control" value="${info.edate}" name="edate"/> 
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<label>내용</label>
											<textarea class="form-control" rows="15" name="text" id="smartEditor"></textarea>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<button type="button" onclick="javascript:updateProcess()" class="btn btn-default">글 수정</button>
			<button type="button" onclick="javascript:delProcess(${info.idx})" class="btn btn-danger">글 삭제</button>
		</div>
	</div>
	<jsp:include page="../adminFrame/footer.jsp"></jsp:include>
	<script>
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
	fOnAppLoad : function(){
		   oEditors.getById["smartEditor"].exec("PASTE_HTML", ['${text}']);
		  },				
});

function updateProcess(){
	let sdate = $("input[name='sdate']").val();
	let edate = $("input[name='edate']").val();
	let rdate = $("input[name='rdate']").val();
	if(sdate > edate){
		alert("이벤트 종료일이 이벤트 시작일보다 작을 수 없습니다");
		return false;
	}
	if(edate > rdate){
		alert("당첨자 발표일이 이벤트 종료일보다 작을 수 없습니다");
		return false;
	}
	oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD",[]);
	var form = $("#updateForm")[0]; 
	var data = new FormData(form);
	var url = "/klottery/admin/board/eventUpdate.do";
	$.ajax({
		type:'post',
		url : url,
		data: data,
		processData:false,
		contentType:false,
		success:function(data){
			if(data.result == 'success'){
				alert("글 수정이 완료되었습니다.");
				location.href="/klottery/admin/board/eventList.do";
			}else{
				alert(data.msg);
			}
		},
		error:function(e){
			console.log('ajaxError' + e);
		}
	});
}
function delProcess(idx){
	var param = {"delArray" : idx};
	if(confirm("삭제하시겠습니까? 복구하실 수 없습니다.")){
		jQuery.ajax({
			type:'post',
			data:param,
			url:"/klottery/admin/board/eventDelete.do",
			success:function(data){
				if(data.result == 'success'){
					alert("삭제되었습니다.");
					location.href= '/klottery/admin/board/eventList.do';
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
</script>
</body>
</html>