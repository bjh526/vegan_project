<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 일반 회원 가입 </title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="<c:url value='/resources/css/common.css' />" rel="stylesheet">
<link href="<c:url value='/resources/css/join.css' />" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="<c:url value='/resources/script/join_u.js' />"></script>   

</head>
<body>
	<div class="join_topMenu col-lg-3">
		<a href="${path }/member/join_c">사업자로 회원가입하기</a>
	</div>
	<!-- 회원가입 폼 시작 -->
    <div class="logo">
        <a href="${path }/member/main"><img src="<c:url value='/resources/img/vegetable_logos_finals/tight_light_mask.png' />" class="logoImg"></a>
    </div>

    <div class="col-lg-3 container">
        <h4 class="mb-3">회원가입</h4>

        <form class="needs-validation" novalidate name="frmJoin" method="post">

            <div class="row g-3">

                <!-- 이메일 시작 -->
                <div class="col-12">
                    <label class="form-label">이메일</label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="email" name="input_email" value="aaa111@mail.com" class="form-control" aria-describedby="addon-wrapping">
                        <button class="input-group-text" id="btn_email" type="button">중복확인</button>
                    </div>
                    <div class="result r_true txt_email_t">사용 가능한 이메일 입니다.</div>
                    <div class="result r_false txt_email_f">이미 존재하는 이메일 입니다.</div>
                    <div class="result txt_email_form">이메일 형식이 아닙니다. 예)vegan@vegetable.com</div>
                </div>
                <!-- 이메일 끝 -->

                <!-- 비밀번호 시작 -->
                <div class="col-12">
                    <label class="form-label">비밀번호 (영문, 숫자, 특수문자 8~20자)</label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="password" name="input_pwd" class="form-control" aria-describedby="addon-wrapping">
                    </div>
                    <span class="result txt_pwd_form">공백은 입력할 수 없습니다.</span>
                </div>
                <!-- 비밀번호 끝 -->

                <!-- 비밀번호 재입력 시작 -->
                <div class="col-12">
                    <label class="form-label">비밀번호 재입력</label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="password" name="input_pwd_r" class="form-control"
                            aria-describedby="addon-wrapping">
                    </div>
                    <div class="result r_true txt_pwd_t">비밀번호가 일치합니다.</div>
                    <div class="result r_false txt_pwd_f">비밀번호가 일치하지 않습니다.</div>
                </div>
                <!-- 비밀번호 재입력 끝 -->

                <!-- 이름 시작 -->
                <div class="col-12">
                    <label class="form-label">이름</label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="text" name="input_name" class="form-control" aria-describedby="addon-wrapping">
                    </div>
                </div>
                <!-- 이름 끝 -->

                <!-- 닉네임 시작 -->
                <div class="col-12">
                    <label class="form-label">닉네임</label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="text" name="input_nick" class="form-control" aria-describedby="addon-wrapping">
                        <button class="input-group-text" id="btn_nick" type="button">중복확인</button>
                    </div>
                    <div class="result r_true txt_nick_t">사용 가능한 닉네임 입니다.</div>
                    <div class="result r_false txt_nick_f">이미 존재하는 닉네임 입니다.</div>
                </div>
                <!-- 닉네임 끝 -->

                <!-- 전화번호 시작 -->
                <div class="col-12">
                    <label class="form-label">휴대전화번호</label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="tel" name="input_tel" class="form-control" aria-describedby="addon-wrapping">
                        <button class="input-group-text" id="btn_tel" type="button">인증하기</button>
                    </div>
                </div>
                <!-- 전화번호 끝 -->

                <!-- 주소 시작 -->
                <div class="col-12">
                    <label class="form-label">주소</label>
                    <div class="input-group flex-nowrap replyInput">
                        <input type="text" name="input_addr" class="form-control" aria-describedby="addon-wrapping">
                        <button class="input-group-text" type="button">주소검색</button>
                    </div>
                </div>
                <!-- 주소 끝 -->

                <!-- 비건단계 선택 시작 -->
                <div class="col-12">
                    <label class="form-label">비건단계[선택]</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v1">
                        <label class="form-check-label" for="v1">
                            비건 (Vegan)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v2">
                        <label class="form-check-label" for="v2">
                            락토 베지테리언 (lacto-vegetarian)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v3">
                        <label class="form-check-label" for="v3">
                            오보 베지테리언 (ovo-vegetarian)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v4">
                        <label class="form-check-label" for="v4">
                            락토 오보 베지테리언 (lacto-ovo-vegetarian)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v5">
                        <label class="form-check-label" for="v5">
                            페스코 베지테리언 (Pescatarian 또는 Pesco-vegetarian)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v6">
                        <label class="form-check-label" for="v6">
                            폴로 베지테리언 (Pollotarian)
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="input_lvl" id="v7">
                        <label class="form-check-label" for="flexRadioDefault1">
                            플랙시테리언 (Flexitarian)
                        </label>
                    </div>
                </div>
                <!-- 비건단계 선택 끝 -->

                <button class="w-100 btn btn-primary btn-lg" type="button"
                    style="background-color:#55771C; border:none; margin-top: 40px;" id="btn_join">작성완료</button>
        </form>
    </div>
    <!-- 회원가입 폼 끝 -->
	
<script type="text/javascript">
	let frmJoin = document.frmJoin;
	
	let btn_email = document.getElementById('btn_email');
	let input_pwd_r = frmJoin.input_pwd_r;
	let btn_nick = document.getElementById('btn_nick');
	let btn_tel = document.getElementById('btn_tel');
	let btn_join = document.getElementById('btn_join');
	
	btn_email.addEventListener('click', duplicate_input); // 중복확인
	input_pwd_r.addEventListener('keyup', check_pwd); // 비밀번호 재확인
	btn_nick.addEventListener('click', duplicate_input); // 중복확인
	btn_tel.addEventListener('click', verify_tel); // 휴대폰 인증
	btn_join.addEventListener('click', valid_join); // 가입버튼
	
	function duplicate_input() {
		// 입력받은 email 값을 보내서 중복확인하고 다시 페이지로 와야함
		// ajax로 해야함
		let e_target = event.target.id;
		let nick = frmJoin.input_nick.value.replaceAll(' ','');
		let email = frmJoin.input_email.value.replaceAll(' ','');
		if ( e_target == 'btn_email' && email != "" ) {
			if ( email.includes('@', 1) == true) {
				$.ajax({
					type: "POST",
					dataType: "text",
					async: "false",
					url: "${path }/member/join.do?command=duplicate_email",
					data: { "input_email": frmJoin.input_email.value },
					success: function ( data ) {
					// 사용 가능한 아이디 입니다. 출력, 중복확인 버튼 비활성화
					// 이미 존재하는 아이디다 -> false
					// 가입 가능한 아이디다 -> true
						 if ( data == 'true' ) {
							btn_email.disabled = true;
							frmJoin.input_email.readOnly = true;
							document.querySelector('.txt_email_t').style.display = 'block';
							document.querySelector('.txt_email_f').style.display = 'none';
							document.querySelector('.txt_email_form').style.display = 'none';
						} else {
							document.querySelector('.txt_email_form').style.display = 'none';
							document.querySelector('.txt_email_t').style.display = 'none';
							document.querySelector('.txt_email_f').style.display = 'block';
						} 
					},
					error:function(data, textStatus) {
						alert("에러가 발생했습니다.");
					}
				});
			} else {
				// 이메일 형식이 아닙니다. 예) vegan@vegetable.com
				document.querySelector('.txt_email_form').style.display = 'block';
				document.querySelector('.txt_email_t').style.display = 'none';
				document.querySelector('.txt_email_f').style.display = 'none';
				frmJoin.input_email.value = null;
				frmJoin.input_email.focus();
			}
			
		} else if ( e_target == 'btn_nick' && nick != "" ) {
			$.ajax({
				type: "POST",
				dataType: "text",
				async: "false",
				url: "${path }/member/join.do?command=duplicate_nick",
				data: { "input_nick": frmJoin.input_nick.value },
				success: function ( data ) {
					 if ( data == 'true' ) {
						btn_nick.disabled = true;
						frmJoin.input_nick.readOnly = true;
						document.querySelector('.txt_nick_t').style.display = 'block';
						document.querySelector('.txt_nick_f').style.display = 'none';
					} else {
						document.querySelector('.txt_nick_t').style.display = 'none';
						document.querySelector('.txt_nick_f').style.display = 'block';
					} 
				},
				error:function(data, textStatus) {
					alert("에러가 발생했습니다.");
				}
			});
		}
		
	} // 이메일 중복확인 끝
	
	function check_pwd () { // 비밀번호 재입력
		let pwd = frmJoin.input_pwd.value.replaceAll(' ','');
		let pwd_r = frmJoin.input_pwd_r.value.replaceAll(' ','');
		if ( pwd == pwd_r  ) {
			if ( pwd != "" && pwd_r != "" ) {
				document.querySelector('.txt_pwd_t').style.display = 'block';
				document.querySelector('.txt_pwd_f').style.display = 'none';
				document.querySelector('.txt_pwd_form').style.display = 'none';
			} else {
				document.querySelector('.txt_pwd_t').style.display = 'none';
				document.querySelector('.txt_pwd_f').style.display = 'none';
				document.querySelector('.txt_pwd_form').style.display = 'block';
				frmJoin.input_pwd.value = null;
				frmJoin.input_pwd_r.value = null;
				frmJoin.input_pwd.focus();
			}
			
		} else {
			document.querySelector('.txt_pwd_form').style.display = 'none';
			document.querySelector('.txt_pwd_t').style.display = 'none';
			document.querySelector('.txt_pwd_f').style.display = 'block';
		}
	}  // 비밀번호 재입력 끝
	
	function verify_tel() {} // 휴대폰 인증
	
	function valid_join() {
		let email = frmJoin.input_email.value.replaceAll(' ','');
		let name = frmJoin.input_name.value.replaceAll(' ','');
		let tel = frmJoin.input_tel.value.replaceAll(' ','');
		let nick = frmJoin.input_nick.value.replaceAll(' ','');
		let pwd = frmJoin.input_pwd.value.replaceAll(' ','');
		let pwd_r = frmJoin.input_pwd_r.value.replaceAll(' ','');
		
		let st_txt_email_t = document.querySelector('.txt_email_t').style.display;
		let st_txt_email_f = document.querySelector('.txt_email_t').style.display;
		let st_txt_email_form = document.querySelector('.txt_email_t').style.display;
		
		let st_txt_pwd_t = document.querySelector('.txt_pwd_t').style.display;
		let st_txt_pwd_f = document.querySelector('.txt_pwd_f').style.display;
		let st_txt_pwd_form = document.querySelector('.txt_pwd_form').style.display;
		
		let st_txt_nick_t = document.querySelector('.txt_nick_t').style.display;
		let st_txt_nick_f = document.querySelector('.txt_nick_f').style.display;
		
		if ( st_txt_email_t != 'block') {
			// 중복확인이 완료되지 않은 경우
			alert("이메일 입력 및 중복확인이 필요합니다.");
			frmJoin.input_email.focus();
		}
		if ( pwd == "" || pwd == null ) {
			alert("비밀번호를 입력해 주세요.");
			frmJoin.input_pwd.focus();
		}
		if ( st_txt_pwd_t != 'block' ) {
			alert("비밀번호가 일치하지 않습니다.");
			frmJoin.input_pwd_r.focus();
		}
		if ( name == "" || name == null ) {
			alert("이름을 입력해 주세요");
			frmJoin.input_name.focus();
		}
		if ( st_txt_nick_t != 'block') {
			// 중복확인이 완료되지 않은 경우
			alert("닉네임 입력 및 중복확인이 필요합니다.");
			frmJoin.input_nick.focus();
		}
		if ( tel == "" || tel == null ) {
			alert("휴대폰번호를 입력해 주세요");
			frmJoin.input_tel.focus();
		}
		console.log("빈칸검사");
		if ( st_txt_email_t == 'block' ) {
			// 중복확인이 된 경우
			console.log("이메일");
			if ( pwd != "" || pwd != null ) {
				console.log("비밀번호");
				if ( st_txt_pwd_t == 'block' && st_txt_pwd_f == 'none' && st_txt_pwd_form == 'none' ) {
					console.log("비밀번호재확인");
					if ( name != "" || name != null ) {
						console.log("이름");
						if ( st_txt_nick_t == 'block' && st_txt_nick_f == 'none' ) {
							console.log("닉네임");
							if ( tel != "" || tel != null ) {
								console.log("전화번호");
								frmJoin.action = "${path }/member/joinProc.do";
								frmJoin.submit();
							}
						}
					}
				}
			}
		}
		
	}
	
</script>
</body>
</html>