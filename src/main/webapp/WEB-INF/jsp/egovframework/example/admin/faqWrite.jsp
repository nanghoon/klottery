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
					<h1 class="page-header">자주묻는질문  등록</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">자주묻는질문  등록</div>
						<div class="panel-body">
							<form name="insertForm" id="insertForm" method="post">
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<label>제목</label> 
											<input class="form-control" placeholder="제목" name="title" id="title" maxlength="100">
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
			<button type="button" onclick="javascript:insertProcess()" class="btn btn-default">글 등록</button>
		</div>
	</div>
	<jsp:include page="../adminFrame/footer.jsp"></jsp:include>
	<script>
		var oEditors = [];
		nhn.husky.EZCreator
				.createInIFrame({
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

		function insertProcess() {
			oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD", []);
			let category = $("select[name=category]").val();
			var data = $("#insertForm").serialize();
			var url = "/klottery/admin/board/faqInsert.do";
			$.ajax({
				type : 'post',
				url : url,
				data : data,
				success : function(data) {
					if (data.result == 'success') {
						alert("글 등록이 완료되었습니다.");
						location.href = "/klottery/admin/board/faqList.do";
					} else {
						alert(data.msg);
					}
				},
				error : function(e) {
					console.log('ajaxError' + e);
				}
			});
		}
	</script>
</body>
</html>