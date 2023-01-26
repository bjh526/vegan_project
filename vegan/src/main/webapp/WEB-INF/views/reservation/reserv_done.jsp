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
		<c:if test="${reservProc != null && reservProc == true }">
			reserv_done.jsp<br>
			예약이 완료되었습니다. <br>
			<button id="btn_reservDetail">자세히 보기</button>\
			<a href="${path }/main">홈</a>
			<script type="text/javascript">
				let btn_reservDetail = document.querySelector("#btn_reservDetail");
				console.log("btn_reservDetail");
				btn_reservDetail.addEventListener('click', function(event) {
					console.log("버튼 클릭됨");
				});
			</script>
		</c:if>
	
</body>
</html>