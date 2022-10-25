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
		<div class="banner2">
			<div class="bannerwrap2">
				<div class="text-block-13 _1">회원가입</div>
				<div class="text-block-49-copy _1">K LOTTERY의 회원이 되신 것을 환영합니다</div>
			</div>
		</div>
		<div class="hit_content">
			<div class="ghltkthro _1">
				<div class="w-form">
					<form method="post" id="checkForm">
						<div class="hit_list_title-copy _2">
							<div class="div-block-25">
								<a href="#" class="myinfobtn-copy w-button">이용약관 및 개인정보취급방침 동의</a>
							</div>
							<label class="w-checkbox">
								<input type="checkbox" id="allChk" class="w-checkbox-input">
								<span class="checkbox-label-3 w-form-label" for="checkbox">모든 약관을 확인하고 전체동의합니다.</span>
							</label>
						</div>
						<div class="hit_list_title-copy _3">
							<div class="text-block-49-copy">
								∨ K LOTTERY이용약관 <span class="text-span-5">(필수)</span>
							</div>
							<label class="w-checkbox checkbox-field">
								<input type="checkbox" name="arrayIdx" class="w-checkbox-input">
								<span class="checkbox-label-4 w-form-label" for="checkbox-2">약관동의</span>
							</label>
						</div>
						<div class="textarea-copy"></div>
						<div class="hit_list_title-copy _3">
							<div class="text-block-49-copy">
								∨ 개인정보 수집 및 이용에 대한 안내 <span class="text-span-5">(필수)</span>
							</div>
							<label class="w-checkbox checkbox-field">
								<input type="checkbox" name="arrayIdx" class="w-checkbox-input">
								<span class="checkbox-label-4 w-form-label" for="checkbox-2">약관동의</span>
							</label>
						</div>
						<div class="textarea-copy"></div>
						<div class="div-block-15">
							<a href="javascript:joinNext()" class="button-2-copy w-button">다음단계</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="info_content-copy" style="display:none;">
			<div class="hit_content_wrap">
				<div class="hit_list_title-copy">
					<div class="div-block-25">
						<a href="javascript:void(0);" class="myinfobtn w-button click">개인정보</a>
					</div>
					<div class="div-block-13">
						<div class="text-block-32 _1">* 표시는 입력 필수</div>
					</div>
				</div>
				<div class="info_content">
					<div class="w-form">
						<form id="joinForm" name="joinForm" method="post">
							<div class="info">
								<div class="text-block-37-copy">
									<span class="text-span-2">*</span> 이름
								</div>
								<div class="div-block-29">
									<div class="div-block-30">
										<input type="text" class="text-field-3-copy-copy w-input" maxlength="20" name="name" id="name">
									</div>
								</div>
							</div>
							<div class="info">
								<div class="text-block-37-copy">
									<span class="text-span-2">*</span> 아이디
								</div>
								<div class="div-block-29">
									<div class="div-block-30">
										<input type="text" class="text-field-3-copy-copy w-input" maxlength="20" name="id" id="id">
										<a href="javascript:dupleChk('id')" class="button-3 _1 w-button duple_id">중복체크</a>
									</div>
								</div>
							</div>
							<div class="info">
								<div class="text-block-37-copy">
									<span class="text-span-2">*</span> 비밀번호
								</div>
								<div class="div-block-29">
									<div class="div-block-30">
										<div class="text-block-37-copy-copy-copy">비밀번호</div>
										<input type="password" class="text-field-3 w-input" maxlength="20" name="pw" id="pw">
									</div>
									<div class="div-block-30">
										<div class="text-block-37-copy-copy-copy">비밀번호 확인</div>
										<input type="password" class="text-field-3 w-input" maxlength="20" name="pwChk" id="pwChk">
									</div>
								</div>
							</div>
							<div class="info">
								<div class="text-block-37-copy">
									<span class="text-span-2">*</span> 생년월일
								</div>
								<div class="div-block-29">
									<div class="div-block-30">
										<jsp:useBean id="now" class="java.util.Date" />
										<fmt:formatDate value="${now}" pattern="yyyy" var="yearStart"/>
										<select name="year" class="select-field-2 w-select">
											<c:forEach begin="0" end="${yearStart - 1900}" var="result" step="1">
											    <option value="${yearStart-result}" <c:if test="${yearStart-result == year}">selected</c:if> >${yearStart-result}</option>
											</c:forEach>											
										</select>
										<select name="month" class="select-field-2 w-select">
											<c:forEach begin="1" end="12" step="1" var="i">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>
										<select name="day" class="select-field-2 w-select">
											<c:forEach begin="1" end="31" step="1" var="i">
												<option value="${i}">${i}</option>
											</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="info">
								<div class="text-block-37-copy">
									<span class="text-span-2">*</span> 연락처
								</div>
								<div class="div-block-29">
									<div class="div-block-30">
										<input type="text" class="text-field-3-copy w-input" maxlength="3" name="phone1" id="phone1">
										<input type="text" class="text-field-3-copy w-input" maxlength="4" name="phone2" id="phone2">
										<input type="text" class="text-field-3-copy w-input" maxlength="4" name="phone3" id="phone3"> 
										<a href="javascript:auth()" class="button-3 _1 w-button auth">본인인증</a>
									</div>
									<div class="div-block-30">
										<input type="text" class="text-field-3 w-input" maxlength="6" name="phoneChk" id="phoneChk">
										<a href="javascript:authChk()" class="button-3 _2 w-button authChk">인증번호 확인</a>
									</div>
								</div>
							</div>
							<div class="info">
								<div class="text-block-37-copy">
									<span class="text-span-2">*</span> 이메일주소
								</div>
								<div class="div-block-29">
									<div class="div-block-30">
										<input type="text" class="text-field-3-copy-copy w-input" maxlength="25" name="email1" id="email1">
										<div class="text-block-48">@</div>
										<input type="text" class="text-field-3-copy-copy _1 w-input" maxlength="25" name="email2" id="email2">
										<select id="email3" name="email3" class="select-field-2 w-select">
											<option value="">직접입력</option>
											<option value="naver.com">naver.com</option>
											<option value="hanmail.net">hanmail.net</option>
											<option value="daum.net">daum.net</option>
											<option value="nate.com">nate.com</option>
											<option value="gmail.com">gmail.com</option>
											<option value="hotmail.com">hotmail.com</option>
											<option value="lycos.co.kr">lycos.co.kr</option>
											<option value="empal.com">empal.com</option>
											<option value="cyworld.com">cyworld.com</option>
											<option value="yahoo.com">yahoo.com</option>
											<option value="paran.com">paran.com</option>
											<option value="dreamwiz.com">dreamwiz.com</option>											<option value="First">naver.com</option>
										</select> 
										<a href="javascript:dupleChk('email')" class="button-3 _1 w-button duple_email">중복체크</a>
									</div>
								</div>
							</div>
							<div class="info">
								<div class="text-block-37-copy">· 주소</div>
								<div class="div-block-29">
									<div class="div-block-30">
										<input type="text" class="text-field-3 w-input" maxlength="10" name="zip" id="zip">
										<a href="javascript:findAdd()" class="button-3 _1 w-button">우편번호찾기</a>
									</div>
									<div class="div-block-30">
										<input type="text" class="text-field-3 _1 w-input" maxlength="50" name="add1" id="add1">
									</div>
									<div class="div-block-30">
										<input type="text" class="text-field-3 _1 w-input" maxlength="50" name="add2" id="add2">
									</div>
									<div class="text-block-48">*이벤트 당첨 시 경품제공을 위한 주소정보입니다.</div>
								</div>
							</div>
							<div class="info _1">
								<div class="text-block-37-copy">
									<span class="text-span-2">*</span> 수신여부
								</div>
								<div class="div-block-29-copy">
									<div class="info-box _2">
										<div class="text-block-37-copy _1">·SMS 수신여부</div>
										<label class="radio-button-field w-radio">
											<input type="radio" id="smsY" name="sms" value="1" class="w-form-formradioinput radio-button w-radio-input" checked>
											<span class="radio-button-label w-form-label" for="smsY">예</span>
										</label>
										<label class="radio-button-field w-radio">
											<input type="radio" id="smsN" name="sms" value="0" class="w-form-formradioinput radio-button w-radio-input">
											<span class="radio-button-label w-form-label" for="smsN">아니요</span>
										</label>
									</div>
									<div class="info-box _2">
										<div class="text-block-37-copy _1">· 이메일 수신여부</div>
										<label class="radio-button-field w-radio">
											<input type="radio" id="mailY" name="mail" value="1" class="w-form-formradioinput radio-button w-radio-input" checked>
											<span class="radio-button-label w-form-label" for="mailY">예</span>
										</label>
										<label class="radio-button-field w-radio">
											<input type="radio" id="mailN" name="mail" value="0" class="w-form-formradioinput radio-button w-radio-input">
											<span class="radio-button-label w-form-label" for="mailN">아니요</span>
										</label>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
				<div class="div-block-15">
					<a href="javascript:formReset()" class="button-2-copy _2 w-button">취소</a> 
					<a href="javascript:join()" class="button-2-copy w-button">가입하기</a>
				</div>
			</div>
		</div>		
		<jsp:include page="../userFrame/bottom.jsp"></jsp:include>
	</div>
	<jsp:include page="../userFrame/footer.jsp"></jsp:include>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	// 약관 동의 --
	$("#allChk").on('click',function(){
		$("#checkForm").find('input').prop('checked', $(this).is(':checked'));
	})
	$("input[name=arrayIdx]").on('click',function(){
		let isChecked = true;
		$("input[name=arrayIdx]").each(function(){
			isChecked  = isChecked && $(this).is(":checked");
		})
		$("#allChk").prop('checked',isChecked);
	})
	
	// 이메일 주소 -- 
	$("#email3").on('change',function(){
		if($("#email3").val() == ""){
			$("#email2").attr("readonly" , false);
			$("#email2").val("");
			$("#email2").focus();
		}else{
			$("#email2").val($("#email3").val());
			$("#email2").attr("readonly" , true);
		}
	})
})

function joinNext(){
	if($("#allChk").is(":checked")){
		$(".hit_content").hide();
		$(".info_content-copy").css("display","flex");
	}else{
		alert("약관 동의는 필수입니다");
	}
}

function formReset(){
	if(confirm("가입을 취소하시겠습니까?")){
		$("#joinForm")[0].reset();
	}
}
var dupleId = false;
var authPhone = false;
var dupleEmail = false;

function dupleChk(kind){
	$(".duple_"+kind).attr("href","javascript:void(0)");
	let formdata = $("#joinForm").serialize();
	formdata += "&kind="+kind;
	$.ajax({
		type : 'post',
		data : formdata,
		url : '/klottery/dupleChk.do',
		success:function(data){
			alert(data.msg);
			if(data.result == 'suc'){
				$("[id*="+kind+"]").attr("readonly",true);	
				if(kind == 'id'){
					dupleId = true;
				}else{
					$("#email3").css('display','none');		
					dupleEmail = true;
				}
			}else{
				$(".duple_"+kind).attr("href","javascript:dupleChk('"+kind+"')");
			}
		},error:function(e){
			console.log(e);
		}
	})
}

function auth(){
	if(authPhone) alert("이미 인증된 번호입니다.");
	$(".auth").attr("href","javascript:void(0)");
	let formdata = $("#joinForm").serialize();
	$.ajax({
		type : 'post',
		data : formdata,
		url : '/klottery/auth.do',
		success:function(data){
			alert(data.msg);
			if(data.result != 'suc') $(".auth").attr("href","javascript:auth()");
		},error:function(e){
			console.log(e);
		}
	})
}

function authChk(){
	if(authPhone) alert("이미 인증된 번호입니다.");
	$(".authChk").attr("href","javascript:void(0)");
	let formdata = $("#joinForm").serialize();
	$.ajax({
		type : 'post',
		data : formdata,
		url : '/klottery/authChk.do',
		success:function(data){
			alert(data.msg);
			if(data.result == 'suc'){
				$("[id*=phone]").attr("readonly",true);
				authPhone = true;
			}else{
				$(".auth").attr("href","javascript:auth()");
				$(".authChk").attr("href","javascript:authChk()");
			}
		},error:function(e){
			console.log(e);
		}
	})
}

function findAdd(){
    new daum.Postcode({
        oncomplete: function(data) {
            $("#zip").val(data.zonecode);
            $("#add1").val(data.roadAddress);
            $("#add2").focus();
        }
    }).open();
}

function join(){
	if(!dupleId){
		alert("아이디 중복체크 필요"); return; 
	}
	if(!authPhone){
		alert("연락처 본인인증 필요"); return;
	}
	if(!dupleEmail){
		alert("이메일 중복체크 필요"); return;
	}
	let formdata = $("#joinForm").serialize();
	$.ajax({
		type :'post',
		data : formdata,
		url : '/klottery/joinProcess.do',
		success:function(data){
			alert(data.msg);
			if(data.result == 'suc') location.href='/klottery/login.do';
		},error:function(e){
			console.log(e);
		}
	})
}
</script>
</html>