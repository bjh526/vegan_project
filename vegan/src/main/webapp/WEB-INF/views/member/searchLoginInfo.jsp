<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 이메일 찾기 </title>
<style type="text/css">
	.tit_h4 {
		margin: 0 0 5px 0;
		padding: 0;
	}
	.result {
		font-size: 14px;
		color: #555;
	}
	.r_false {
		color: red;
	}
</style>
</head>
<body>
searchLoginInfo.jsp
	<c:if test="${email != null && restting == null}">
		[결과] 이메일 찾기
		<p>${email }</p>
		<a href="${path }/member/login">로그인</a><br>
		<a href="${path }/main">홈</a>
	</c:if>
	<c:if test="${pwd != null }">
		[결과] 비밀번호 찾기
		<p>${pwd }</p>
		<a href="${path }/member/login">로그인</a><br>
		<a href="${path }/main">홈</a>
	</c:if>
	<c:if test="${restting == true }">
		비밀번호 재설정폼 <br>
		${email }님 비밀번호를 재설정해 주세요.
		<form name="frmReset" method="post">
			<div class="resetPwd">
				<h4 class="tit_h4">비밀번호<span class="option"> (영문, 숫자, 특수문자 8-20자)</span></h4>
				<input type="password" placeholder="비밀번호 " name="input_pwd" value="">
				<span class="result txt_pwd_form">공백은 입력할 수 없습니다.</span>
			</div>
			<div class="resetPwd">
				<h4 class="tit_h4">비밀번호 재입력</h4> <input type="password" name="input_pwd_r" placeholder="비밀번호 재입력">
				<div class="result r_true txt_pwd_t">비밀번호가 일치합니다.</div>
				<div class="result r_false txt_pwd_f">비밀번호가 일치하지 않습니다.</div>
			</div>
			<input type="button" value="비밀번호 변경" id="btn_reset">
			<input type="hidden" value="${email }" name="email">
		</form>
		
		<script>
			let result = document.querySelectorAll('.result');
			for ( let i = 0; i < result.length; i++ ) {
				result[i].style.display = 'none';
			}
		
			let frmReset = document.frmReset;
	
			let input_pwd_r = frmReset.input_pwd_r;
			let btn_reset = document.getElementById('btn_reset');
			
			input_pwd_r.addEventListener('keyup', check_pwd); // 비밀번호 재확인
			btn_reset.addEventListener('click', valid_reset); // 비밀번호 변경 버튼
			
			function check_pwd() { // 비밀번호 재입력
				let pwd = frmReset.input_pwd.value.replaceAll(' ', '');
				let pwd_r = frmReset.input_pwd_r.value.replaceAll(' ', '');
				if (pwd == pwd_r) {
					if (pwd != "" && pwd_r != "") {
						document.querySelector('.txt_pwd_t').style.display = 'block';
						document.querySelector('.txt_pwd_f').style.display = 'none';
						document.querySelector('.txt_pwd_form').style.display = 'none';
					} else {
						document.querySelector('.txt_pwd_t').style.display = 'none';
						document.querySelector('.txt_pwd_f').style.display = 'none';
						document.querySelector('.txt_pwd_form').style.display = 'block';
						frmReset.input_pwd.value = null;
						frmReset.input_pwd_r.value = null;
						frmReset.input_pwd.focus();
					}

				} else {
					document.querySelector('.txt_pwd_form').style.display = 'none';
					document.querySelector('.txt_pwd_t').style.display = 'none';
					document.querySelector('.txt_pwd_f').style.display = 'block';
				}
			} // check_pwd 끝
			
			function valid_reset() {
				let pwd = frmReset.input_pwd.value.replaceAll(' ', '');
				let pwd_r = frmReset.input_pwd_r.value.replaceAll(' ', '');

				let st_txt_pwd_t = document.querySelector('.txt_pwd_t').style.display;
				let st_txt_pwd_f = document.querySelector('.txt_pwd_f').style.display;
				let st_txt_pwd_form = document.querySelector('.txt_pwd_form').style.display;

				if (pwd == "" || pwd == null) {
					alert("비밀번호를 입력해 주세요.");
					frmReset.input_pwd.focus();
				}
				if (st_txt_pwd_t != 'block') {
					alert("비밀번호가 일치하지 않습니다.");
					frmReset.input_pwd_r.focus();
				}
				
				if (pwd != "" || pwd != null) {
					if (st_txt_pwd_t == 'block' && st_txt_pwd_f == 'none' && st_txt_pwd_form == 'none') {
						frmReset.action = "${path }/member/resettingPwd.do?command=reset";
						frmReset.submit();
					}
				}
			} // valid_modify 끝
		</script>
	</c:if>
</body>
</html>