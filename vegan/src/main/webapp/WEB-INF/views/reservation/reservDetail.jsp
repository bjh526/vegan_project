<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="resto" value="${restoList }" />
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resources/css/reservDetail.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69f40615d8246aa59404879f19fe7284"></script>
<script>
// 	function reservConfirm(){
// 		var totalDeposit = document.getElementById("deposit").innerText;
// 		// 예약금 여유
// 		if(totalDeposit < ???){
			
// // 		}// 예약금 부족
// 		else if(totalDeposit > ???){
// 			var select = confirm('예약포인트가 부족합니다. 포인트 충전 페이지로 이동하시겠습니까?');
// 			if(select == true){
// 				location.href="${path}/resto/restoList.do";
// 			} else if(select == false){
// 				return;
// 			}
// 		}
// 	}
</script>
    <title>Document</title>
</head>

<body>
    <div class="detailContainer">

        <div class="detailTop">
            <h2 class="resto_name">${resto.resto_name }</h2>
            <p>주메뉴, 지역</p>
        </div>

        <div class="reservInfo">
            <h5>예약정보</h5>

            <div class="fLeft">
                <div class="infoLeft">
                    <p class="reservator">예약자</p>
                    <p class="schedule">예약일정</p>
                    <p class="people">인원</p>
                    <p class="deposit">예약포인트</p>
                </div>
                <div class="infoRight">
                    <p class="reservator">${user_onDTO.u_name }</p>
                    <c:if test="${fn:substring(reservTime,2,4) == 00 }">
						<p class="schedule">${reservDate } ${fn:substring(reservTime,0,2)}시</p>       
                    </c:if>
                    <c:if test="${fn:substring(reservTime,2,4) ne 00}">
                    	<p class="schedule">${reservDate } ${fn:substring(reservTime,0,2)}시 ${fn:substring(reservTime,2,4)}분</p>
                    </c:if>
                    <p class="people">${headCount }인</p>
                    <c:set var="totalDeposit" value="${resto.deposit * headCount }" />
                    <p class="deposit" id="deposit">${totalDeposit } 포인트</p>
                </div>
            </div>
        </div>

        <div class="detailInfo">
            <h5>상세정보</h5>
            <div class="detail">
                <strong>전화번호</strong>
                <p class="resto_tel">${resto.resto_tel }</p>

                <strong>매장주소</strong>
                <p class="resto_addr">${resto.resto_addr }</p>

                <strong>영업시간</strong>
                <p class="resto_time">${resto.resto_time }</p>
                <strong>쉬는시간</strong>
                <p class="resto_break">${resto.resto_break }</p>

				<input type="button" value="예약하기" onClick="reservConfirm()">
            </div>
        </div>


    </div>
</body>
</html>