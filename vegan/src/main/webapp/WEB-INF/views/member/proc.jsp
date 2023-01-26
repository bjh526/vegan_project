<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${certifEmail != null }">
		<c:choose>
			<c:when test="${certifEmail == true }">
			이메일이 인증되었습니다.
			서비스 이용이 가능합니다.
		</c:when>
			<c:otherwise>
			이미 인증 처리된 계정입니다.
		</c:otherwise>
		</c:choose>
		
		<a href="${path }/member/login">로그인하기</a>
	</c:if>

	<c:if test="${auth == 'A' }">
		이메일 인증이 필요한 계정입니다.
		<a href="${path }/main">메인으로</a>
	</c:if>
	<c:if test="${auth == 'C' }">
		비활성화된 계정입니다. 관리자에게 문의해 주세요.
		<a href="${path }/main">메인으로</a>
	</c:if>
	<c:if test="${joinProc != null && joinProc == true }">
		${input_email } 님 회원가입이 완료되었습니다.
		이메일 인증 후 서비스 이용이 가능합니다.
		<a href="${path }/main">메인으로</a>
	</c:if>
	
	<c:if test="${modifyProc != null && modifyProc == true}">
		회원정보가 수정되었습니다.
		<a href="${path }/member/mypage.do">마이페이지</a>
	</c:if>
	<c:if test="${result == 'user_off' }">
		${u_email_off } <br>
		비활성화된 계정입니다.
		<a href="${path }/main">메인으로</a>
	</c:if>
	<c:if test="${resetPwd != null && resetPwd == true }">
		비밀번호가 정상적으로 재설정되었습니다.
		<a href="${path }/member/login">로그인하기</a>
	</c:if>
	<c:if test="${resetPwd != null && resetPwd == false }">
		비밀번호 재설정 중 문제가 발생하였습니다. 관리자에게 문의해 주세요.
		<a href="#">관리자에게 문의하기</a>
	</c:if>
	<c:if test="${delProc != null && delProc == true }">
		계정이 비활성화되었습니다.
		<a href="${path }/main">메인으로</a>
	</c:if>
	<c:if test="${delProc != null && delProc == false }">
		문제가 발생하였습니다. 관리자에게 문의해 주세요.
		<a href="${path }/main">메인으로</a>
	</c:if>
</body>
</html>