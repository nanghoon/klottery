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
<body>
	<div id="wrapper">
		<jsp:include page="../adminFrame/top.jsp"></jsp:include>
		<jsp:include page="../adminFrame/left.jsp"></jsp:include>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">자주묻는질문 </h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">자주묻는질문 </div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped">
									<thead>
										<tr>
											<th><input id="allChk" type="checkbox" onclick="allChk(this)" /></th>
											<th>제목</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${list}" varStatus="i">
											<tr>
												<td><input type="checkbox" name="arrayIdx" value="${item.idx}" /></td>
												<td onclick="location.href='/klottery/admin/board/faqDetail.do?idx=${item.idx}'" style="cursor: pointer; width:60%;word-break:break-all;">${item.title}</td>
												<td><fmt:formatDate value="${item.fdate}" type="date"></fmt:formatDate></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-sm-12" style="text-align: center;">
									<div style="display: flex; justify-content: center">
										<ul class="pagination">
											<ui:pagination paginationInfo="${pi}" jsFunction="page" type="admin" />
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.row -->
			<form action="/klottery/admin/board/faqList.do" name="listForm" id="listForm">
				<input type="hidden" name="pageIndex" value="1" />
			</form>
			<button type="button" onclick="location.href='/klottery/admin/board/faqWrite.do'" class="btn btn-outline btn-default">글등록</button>
			<button type="button" onclick="listDel()" class="btn btn-outline btn-danger">글삭제</button>
		</div>
	</div>
	<jsp:include page="../adminFrame/footer.jsp"></jsp:include>
	<script>
		function allChk(obj) {
			var chkObj = document.getElementsByName("arrayIdx");
			var rowCnt = chkObj.length - 1;
			var check = obj.checked;
			if (check) {
				for (var i = 0; i <= rowCnt; i++) {
					if (chkObj[i].type == "checkbox")
						chkObj[i].checked = true;
				}
			} else {
				for (var i = 0; i <= rowCnt; i++) {
					if (chkObj[i].type == "checkbox") {
						chkObj[i].checked = false;
					}
				}
			}
		}
		function listDel() {
			var idx = "";
			var idxChk = document.getElementsByName("arrayIdx");
			var chked = false;
			var indexid = false;
			for (i = 0; i < idxChk.length; i++) {
				if (idxChk[i].checked) {
					if (indexid) {
						idx = idx + '-';
					}
					idx = idx + idxChk[i].value;
					indexid = true;
				}
			}
			if (!indexid) {
				alert("삭제할 글을 선택해주세요");
				return;
			}
			var param = {
				"delArray" : idx
			};
			if (confirm("삭제하시겠습니까? 복구하실 수 없습니다.")) {
				jQuery.ajax({
					type : 'post',
					data : param,
					url : "/klottery/admin/board/faqDelete.do",
					success : function(data) {
						if (data.result == 'success') {
							alert("삭제되었습니다.");
						} else {
							alert("에러가 발생했습니다. 다시 시도해주세요");
						}
						location.reload();
					},
					errer : function(e) {
						console.log('error' + e);
					}
				});
			} else {
				return;
			}
		}
		function page(pageNo) {
			document.listForm.pageIndex.value = pageNo;
			document.listForm.submit();
		}
	</script>
</body>
</html>