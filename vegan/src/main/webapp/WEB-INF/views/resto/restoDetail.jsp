<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="resto" value="${resto }" />
<c:set var="c_email" value="${c_email }" />
<c:set var="u_nick" value="${u_nick }" />
<%-- <c:set var="userLogOn" value="${userLogOn }" /> --%>
<%-- <c:set var="clientLogOn" value="${clientLogOn }" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>식당상세정보</title>

<link href="../resources/css/restoDetail.css" rel="stylesheet">
<link href="../resources/css/common.css" rel="stylesheet">
<script src="../resources/script/community.js"></script>

<link rel="stylesheet" href="../resources/css/modal.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<style>
/*.text {
		border: none;
		outline: none;
	}*/
.reviewRate {
	visibility: hidden;
}

.imageFileName {
	visibility: hidden;
}
</style>
<script>
	let reservTime;
	function readURL(input){
		if(input.files && input.files[0]){
		let reader = new FileReader();
		reader.onload = function(e){
			$("#preview").attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
		}
	}
	function fn_enable(review_no){
		var review_num = document.getElementById("review_no" + review_no);
		
		if(review_num.value == review_no){
			document.getElementById("review_content" + review_num.value).disabled=false;
			$('input[name=mod' + review_num.value + ']').hide();
			$('input[name=del' + review_num.value + ']').hide();
			$('input[name=hide' + review_num.value + ']').hide();
			$('input[name=show' + review_num.value + ']').hide();
			$('input[name=modFinish' + review_num.value + ']').prop('type', "submit");
			$('input[id=rate' + review_num.value + ']').hide();
			$('input[id=imageFileName' + review_num.value + ']').css('visibility', "visible");
			$('select[id=rate' + review_num.value + ']').css('visibility', "visible");

		}
	}
	function fn_remove(url, review_no, resto_no){
		if(confirm('정말 삭제하시겠습니까?')){
			let form = document.createElement("form");
			form.method="post";
			form.action=url;
			
			let review_noInput = document.createElement("input");
			review_noInput.setAttribute("type", "hidden");
			review_noInput.setAttribute("name", "review_no");
			review_noInput.setAttribute("value", review_no);
			
			let resto_noInput = document.createElement("input");
			resto_noInput.setAttribute("type", "hidden");
			resto_noInput.setAttribute("name", "resto_no");
			resto_noInput.setAttribute("value", resto_no);
			
			form.appendChild(review_noInput);
			form.appendChild(resto_noInput);
			document.body.appendChild(form)
			
			form.submit();
			
		} else {
			alert("삭제가 취소 되었습니다.");
		}
	}
	function fn_hide(url, review_no, resto_no){
		if(confirm('리뷰를 숨기시겠습니까?')){
			let form = document.createElement("form");
			form.method="post";
			form.action=url;
			
			let review_noInput = document.createElement("input");
			review_noInput.setAttribute("type", "hidden");
			review_noInput.setAttribute("name", "review_no");
			review_noInput.setAttribute("value", review_no);
			
			let resto_noInput = document.createElement("input");
			resto_noInput.setAttribute("type", "hidden");
			resto_noInput.setAttribute("name", "resto_no");
			resto_noInput.setAttribute("value", resto_no);
			
			form.appendChild(review_noInput);
			form.appendChild(resto_noInput);
			document.body.appendChild(form)
			
			form.submit();
		} else {
			alert("취소 되었습니다.");
		}
	}
	function fn_show(url, review_no, resto_no){
		if(confirm('리뷰가 보이게 하시겠습니까?')){
			let form = document.createElement("form");
			form.method="post";
			form.action=url;
			
			let review_noInput = document.createElement("input");
			review_noInput.setAttribute("type", "hidden");
			review_noInput.setAttribute("name", "review_no");
			review_noInput.setAttribute("value", review_no);
			
			let resto_noInput = document.createElement("input");
			resto_noInput.setAttribute("type", "hidden");
			resto_noInput.setAttribute("name", "resto_no");
			resto_noInput.setAttribute("value", resto_no);
			
			form.appendChild(review_noInput);
			form.appendChild(resto_noInput);
			document.body.appendChild(form)
			
			form.submit();
		} else {
			alert("취소 되었습니다.");
		}
	}
	function reservDetail(url, resto_no){
		let form = document.createElement("form");
		form.method="GET";
		form.action=url;
		
		var headCount = document.getElementById("headCount").innerText;
		let headCountInput = document.createElement("input");
		headCountInput.setAttribute("type", "hidden");
		headCountInput.setAttribute("name", "headCount");
		headCountInput.setAttribute("value", headCount);
		
		let reserv_schedInput = document.createElement("input");
		reserv_schedInput.setAttribute("type", "hidden");
		reserv_schedInput.setAttribute("name", "reservTime");
		reserv_schedInput.setAttribute("value", reservTime);
		
		let resto_noInput = document.createElement("input");
		resto_noInput.setAttribute("type", "hidden");
		resto_noInput.setAttribute("name", "resto_no");
		resto_noInput.setAttribute("value", resto_no);
		
		var reservDate = document.getElementById("datepicker").value;
		let dateInput = document.createElement("input");
		dateInput.setAttribute("type", "hidden");
		dateInput.setAttribute("name", "reservDate");
		dateInput.setAttribute("value", reservDate);
		
		form.appendChild(headCountInput);
		form.appendChild(reserv_schedInput);
		form.appendChild(resto_noInput);
		form.appendChild(dateInput);
		document.body.appendChild(form)
		
		form.submit();
	}
	$(document).ready(function(){
		$(".reserv_sched").click(function(){
			reservTime = $(this).val();
			$('input[name=reservTime]').attr('value', reservTime);
		});
	});

</script>
</head>
<body style="margin: 0px;">
	<input type="hidden" value="${resto.resto_no }" name="resto_no">
	<div class="landingPage">

		<div class="between"></div>
		<!--main-page 시작-->
		<div class="main-page">

			<!-- carousel 시작 -->
			<div id="carouselExampleInterval" class="carousel slide col-lg-6"
				data-bs-ride="carousel">

				<div class="carousel-inner" style="height: 200px">
					<c:if test="${empty resto_imageList}">
						<div class="carousel-item" data-bs-interval="10000">
							<img src="../resources/img/image.jpg"
								class="d-block w-100 carousel" alt="...">
						</div>
					</c:if>
					<c:if test="${not empty resto_imageList }">
						<input type="hidden" id="originalFileName"
							value="${review.imageFileName }">
						<div class="carousel-item active" data-bs-interval="10000">
							<img
								src="${path }/downloadRestoImage.do?imageFileName=${resto.imageFileName}&resto_no=${resto.resto_no}"
								class="d-block w-100 carousel" alt="...">
						</div>
						<c:forEach var="image" items="${resto_imageList }"
							varStatus="status">
							<c:if test="${status.count ne 1 }">
								<div class="carousel-item" data-bs-interval="2000">
									<img
										src="${path }/downloadRestoImage.do?imageFileNo=${image.imageFileNo }&imageFileName=${image.imageFileName }&resto_no=${resto.resto_no }"
										class="d-block w-100 carousel" alt="...">
								</div>
							</c:if>
						</c:forEach>
					</c:if>
				</div>
				<button class="carousel-control-prev" type="button"
					style="margin-right: 100px;"
					data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleInterval" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
			<!-- carousel 끝 -->

			<div class="between"></div>

			<!-- card 시작 -->
			<nav class="nav">
				<div class="detailTop col-lg-3">
					<h3>${resto.resto_name }</h3>
					<p style="font-size: 20px">${resto.resto_info }</p>
					<p style="font-size: 20px">★ ${resto.avg_rate }</p>
					<!-- <p style="font-size :17px; color:#777;">패스트푸드, 서울 마포구 양화로 45</p> -->
				</div>
			</nav>
			<!-- card 끝 -->

			<div class="btnReserv">
				<div class="btnChange">
					<a href="#box_1"><button type="button" class="btn btn-success"
							id="box1"
							style="background-color: #55771C; border: none; width: 70px;">홈</button></a>
					<a href="#box_2"><button type="button" class="btn btn-success"
							id="box2"
							style="background-color: #55771C; border: none; width: 70px;">메뉴</button></a>
					<a href="#box_3"><button type="button" class="btn btn-success"
							id="box4"
							style="background-color: #55771C; border: none; width: 70px;">리뷰</button></a>
				</div>
				<hr>
			</div>

			<div class="home col-lg-6" id="box_1">
				<h4>정보</h4>
				<div class="homeContent">
					<div class="restoDetail">
						<strong class="infoStrong">식당상세</strong>
						<p class="para">${resto.resto_detail }</p>
					</div>

					<div class="restoInfo fLeft">
						<strong class="infoStrong">연락처</strong>
						<p class="para">${resto.resto_tel }</p>
						<strong class="infoStrong">영업시간</strong>
						<p class="para">${resto.resto_time }</p>
						<strong class="infoStrong">브레이크타임</strong>
						<p class="para">${resto.resto_break }</p>
					</div>
					<div class="restoInfo fLeft">
						<strong class="infoStrong">예약포인트</strong>
						<p class="para">${resto.deposit }포인트</p>
						<strong class="infoStrong">식당주소</strong>
						<p class="para">${resto.resto_addr }</p>
						<strong class="infoStrong">음식종류</strong>
						<p class="para">${resto.vegan }</p>
					</div>
				</div>
			</div>
			<div class="menu col-lg-6" id="box_2">
				<h4>메뉴</h4>


				<div class="fLeft">
					<!-- 메뉴1 이름부터 for문 -->
					<p>메뉴 1</p>
					<hr>
					<!-- 여기까지 -->
				</div>


				<div class="fLeft">
					<!-- 메뉴1 가격부터 for문 -->
					<p>100,000</p>
					<hr>
					<!-- 여기까지 -->
				</div>
				<div style="clear: both"></div>
			</div>

			<div class="between"></div>

			<div class="reviewBox col-lg-6" id="box_3">
				<h4>리뷰</h4>
				<c:if test="${userLogOn == true }">
					<div class="btnBox">
						<button type="button" class="btn btn-success reviewBtn" id="box1"
							style="background-color: #36714B; border: none; width: 80px;"
							onClick="reviewPopUp(${resto.resto_no})">리뷰작성</button>
					</div>
				</c:if>
				<c:forEach var="review" items="${reviewList }">
					<c:if test="${userLogOn == true and review.show == 'n'}">
						<div class="review">
							<c:if test="${review.imageFileName ne null }">
								<img
									src="${path }/downloadReviewImage.do?resto_no=${review.resto_no }&imageFileName=${review.imageFileName }"
									class="reviewImg">
							</c:if>

							<div class="reviewPadding">
								<strong class="u_nick">${review.u_nick }</strong>
								<div class="dropdown">
									<c:if
										test="${userLogOn == true and review.u_nick == user_onDTO.u_nick}">
										<span class="dropbtn">메뉴</span>
										<div class="dropdown-content">
											<button type="button" class="btn btn-success"
												onClick="modReview(${resto.resto_no}, ${review.review_no })">수정하기</button>
											<c:if test="${review.show == 'y' }">
												<button type="button" class="btn btn-success"
													onClick="fn_hide('${path}/resto/hideReview.do', ${review.review_no }, ${review.resto_no })">숨기기</button>
											</c:if>
											<c:if test="${review.show == 'n' }">
												<button type="button" class="btn btn-success"
													onClick="fn_show('${path}/resto/showReview.do', ${review.review_no }, ${review.resto_no })">보이기</button>
											</c:if>
											<button type="button" class="btn btn-success" name="del"
												onClick="fn_remove('${path}/resto/removeReview.do',  ${review.review_no }, ${review.resto_no })">삭제하기</button>
										</div>
									</c:if>
								</div>

								<p class="rate">
									<c:if test="${review.rate eq 1 }">
							★☆☆☆☆
						</c:if>
									<c:if test="${review.rate eq 2 }">
							★★☆☆☆
						</c:if>
									<c:if test="${review.rate eq 3 }">
							★★★☆☆
						</c:if>
									<c:if test="${review.rate eq 4 }">
							★★★★☆
						</c:if>
									<c:if test="${review.rate eq 5 }">
							★★★★★
						</c:if>
								</p>
							</div>

							<hr>
							<p class="reviewContent">${review.review_content }</p>
						</div>
					</c:if>
					<c:if test="${review.show == 'y' and review.del == 'n' }">
						<div class="review">
							<c:if test="${review.imageFileName ne null }">
								<img
									src="${path }/downloadReviewImage.do?resto_no=${review.resto_no }&imageFileName=${review.imageFileName }"
									class="reviewImg">
							</c:if>

							<div class="reviewPadding">
								<strong class="u_nick">${review.u_nick }</strong>
								<div class="dropdown">
									<c:if
										test="${userLogOn == true and review.u_nick == user_onDTO.u_nick}">
										<span class="dropbtn">메뉴</span>
										<div class="dropdown-content">
											<button type="button" class="btn btn-success"
												onClick="modReview(${resto.resto_no}, ${review.review_no })">수정하기</button>
											<c:if test="${review.show == 'y' }">
												<button type="button" class="btn btn-success"
													onClick="fn_hide('${path}/resto/hideReview.do', ${review.review_no }, ${review.resto_no })">숨기기</button>
											</c:if>
											<c:if test="${review.show == 'n' }">
												<button type="button" class="btn btn-success"
													onClick="fn_show('${path}/resto/showReview.do', ${review.review_no }, ${review.resto_no })">보이기</button>
											</c:if>
											<button type="button" class="btn btn-success" name="del"
												onClick="fn_remove('${path}/resto/removeReview.do',  ${review.review_no }, ${review.resto_no })">삭제하기</button>
										</div>
									</c:if>
								</div>

								<p class="rate">
									<c:if test="${review.rate eq 1 }">
							★☆☆☆☆
						</c:if>
									<c:if test="${review.rate eq 2 }">
							★★☆☆☆
						</c:if>
									<c:if test="${review.rate eq 3 }">
							★★★☆☆
						</c:if>
									<c:if test="${review.rate eq 4 }">
							★★★★☆
						</c:if>
									<c:if test="${review.rate eq 5 }">
							★★★★★
						</c:if>
								</p>
							</div>

							<hr>
							<p class="reviewContent">${review.review_content }</p>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<!-- content div -->

		</div>

		<!--modal start-->

		<div id="modal" class="modal-overlay">
			<div class="modal-window">

				<div class="close-area">X</div>
				<div class="content" style="text-align: center">
					<h3 style="width: 100%">예약</h3>
					<p>
					<div class="divCal">
						<h4>날짜</h4>
						<input type="text" class="form-control dateSelect" id="datepicker">
					</div>

					<div class="divPeo">
						<h4>인원</h4>
						<input type="button" value="-" onClick="count('minus')"
							class="countMinus"> <span id="headCount">1</span> <input
							type="button" value="+" onClick="count('plus')" class="countPlus">
					</div>

					<div class="divTime"></div>
					<c:if test="${end gt start}">
						<c:forEach var="time" begin="${start }" end="${end -50}" step="50">
							<c:set var="fourDigits" value="0${time }" />
							<c:set var="oneTwo" value="${fn:substring(fourDigits,0,2) }" />
							<c:set var="threeFour" value="${fn:substring(fourDigits,2,4) }" />
							<c:set var="firstTwo" value="${fn:substring(time,0,2) }" />
							<c:set var="lastTwo" value="${fn:substring(time,2,4) }" />
							<c:choose>
								<c:when test="${time >= startBreak and time <= endBreak }"></c:when>
								<c:when test="${time lt 1000 and threeFour ne 50}">
									<input type="button" class="reserv_sched"
										value="${fourDigits }">
								</c:when>
								<c:when test="${time lt 1000 and threeFour eq 50}">
									<input type="button" class="reserv_sched" value="${oneTwo }30">
								</c:when>
								<c:when test="${time gt 1000 and lastTwo ne 50}">
									<input type="button" class="reserv_sched" value="${time }">
								</c:when>
								<c:when test="${time gt 1000 and lastTwo eq 50}">
									<input type="button" class="reserv_sched"
										value="${firstTwo }30">
								</c:when>
							</c:choose>
						</c:forEach>
					</c:if>

					<c:if test="${start gt end}">
						<c:forEach var="time" begin="${start }" end="2350" step="50">
							<c:set var="firstTwo" value="${fn:substring(time,0,2) }" />
							<c:set var="lastTwo" value="${fn:substring(time,2,4) }" />
							<c:choose>
								<c:when test="${time >= startBreak and time <= endBreak }"></c:when>
								<c:when test="${time gt 1000 and lastTwo ne 50}">
									<input type="button" class="reserv_sched" value="${time }">
								</c:when>
								<c:when test="${time gt 1000 and lastTwo eq 50}">
									<input type="button" class="reserv_sched"
										value="${firstTwo }30">
								</c:when>
							</c:choose>
						</c:forEach>
						<c:forEach var="time" begin="0" end="${end -50 }" step="50">
							<c:set var="fourDigits" value="0${time }" />
							<c:set var="oneTwo" value="${fn:substring(fourDigits,0,2) }" />
							<c:set var="threeFour" value="${fn:substring(fourDigits,2,4) }" />
							<c:choose>
								<c:when test="${time >= startBreak and time <= endBreak }"></c:when>
								<c:when test="${time eq 0}">
									<input type="button" class="reserv_sched" value="0000">
								</c:when>
								<c:when test="${time eq 50}">
									<input type="button" class="reserv_sched" value="0030">
								</c:when>
								<c:when test="${time lt 1000 and threeFour ne 50}">
									<input type="button" class="reserv_sched"
										value="${fourDigits }">
								</c:when>
								<c:when test="${time lt 1000 and threeFour eq 50}">
									<input type="button" class="reserv_sched" value="${oneTwo }30">
								</c:when>
							</c:choose>
						</c:forEach>
					</c:if>
					<!-- <br><input type="text" name="reservTime"> -->
					<br> <input type="button" value="예약하기"
						class="reservBtn btn btn-light"
						onClick="reservDetail('${path}/reservation/reservDetail.do', ${resto.resto_no})">
				</div>
			</div>
			<!--modal end-->
		</div>
	</div>
	<!-- main-page 끝-->
	<!-- main 끝 -->
	<div class="reservBox">
		<div class="btnBox">
			<c:if test="${userLogOn == true }">
				<img src="../resources/img/icon/scrap_icon_noScrap.png" class="icon"
					onclick="btnClick(this.id)" id="btnHeart1">
				<img src="../resources/img/icon/scrap_icon_scrap.png" class="icon"
					onclick="btnClickAgain(this.id)" id="blkbtnHeart1"
					style="display: none">
				<a href="#modal"><button type="button"
						class="btn btn-outline-success" id="btn-modal">예약하기</button></a>
			</c:if>
			<c:if test="${clientLogOn == true }">
				<a href="${path }/resto/modRestoForm.do?resto_no=${resto.resto_no }">
					<button type="button" class="btn btn-outline-success"
						id="btn-modal">식당수정</button>
				</a>
			</c:if>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>

</body>
<style>
.reserv_sched {
	width: 50px;
	height: 40px;
	padding: 5px;
	margin: 5px;
}

.reserv_sched:active {
	margin-left: 5px;
	margin-top: 5px;
	color: red;
}

.reserv_sched:focus {
	color: red;
}

.countMinus {
	width: 30px;
	height: 30px;
}

.countPlus {
	width: 30px;
	height: 30px;
}
</style>
<script>
	function reviewPopUp(resto_no){
		window.open("${path}/resto/addReviewForm.do?resto_no=" + resto_no, "리뷰작성", "width=600, height=600");
	}
	
	function modReview(resto_no, review_no){
		window.open("${path}/resto/modReviewForm.do?resto_no=" + resto_no +"&review_no=" + review_no, "리뷰수정", "width=600, height=600");
	}

    const modal = document.getElementById("modal")

    function modalOn() {
        modal.style.display = "flex";
    }

    function isModalOn() {
        return modal.style.display === "flex"
    }

    function modalOff() {
        modal.style.display = "none"
    }

    window.onload = function () {
        const btnModal = document.getElementById("btn-modal")
        btnModal.addEventListener("click", e => {
        	$('div[id=modal]').css('visibility', "visible");
            modalOn()
            $("div#modal").css({
        		"top": (($(window).height()-$("div#modal").outerHeight())/2+$(window).scrollTop())+"px"
        	});
        })
    }

    const closeBtn = modal.querySelector(".close-area")
    closeBtn.addEventListener("click", e => {
        modalOff()
    })

    modal.addEventListener("click", e => {
        const evTarget = e.target
        if (evTarget.classList.contains("modal-overlay")) {
            modalOff()
        }
    })

    window.addEventListener("keyup", e => {
        if (isModalOn() && e.key === "Escape") {
            modalOff()
        }
    })

     $(function () {
            $("#datepicker").datepicker();
        });
    
    function count(type){
    	var number = document.getElementById("headCount");
    	var headCount = number.innerText;
    	
    	if(type == 'plus' && headCount != 10){
    		headCount = parseInt(headCount) + 1;
    	} else if(type == 'minus' && headCount != 1){
    		headCount = parseInt(headCount) - 1;
    	}

    	number.innerText = headCount;
    };

    $("#Date").datepicker({

        showOn: "both", // 버튼과 텍스트 필드 모두 캘린더를 보여준다.

        buttonImage: "../resources/img/icon/calendar.png", // 버튼 이미지

        buttonImageOnly: false, // 버튼에 있는 이미지만 표시한다.v

        changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.

        changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.

        minDate: '-100y', // 현재날짜로부터 100년이전까지 년을 표시한다.

        nextText: '다음 달', // next 아이콘의 툴팁.

        prevText: '이전 달', // prev 아이콘의 툴팁.

        numberOfMonths: [1, 1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.

        stepMonths: 1, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 

        yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.

        showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 

        currentText: '오늘 날짜', // 오늘 날짜로 이동하는 버튼 패널

        closeText: '닫기',  // 닫기 버튼 패널

        dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.

        showAnim: "slide", //애니메이션을 적용한다.

        showMonthAfterYear: true, // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 

        dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.

        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // 월의 한글 형식.

        yearRange: "2022:2023" //연도 범위

    });
</script>

</html>

<!--             <div class="between"></div> -->
<!-- 					식당이름 <input type="text" name="avg_rate" readonly="readonly" -->
<%-- 						value="평점 ★ ${resto.avg_rate }"> --%>
<!-- 					<textarea class="text" rows="1" cols="20" style="resize: none;" -->
<%-- 						name="vegan" readonly="readonly">${resto.vegan }</textarea> --%>
<!-- 				</h3> <textarea class="text" rows="1" cols="65" style="resize: none;" -->
<%-- 					name="resto_name" readonly="readonly">${resto.resto_name }</textarea><br> --%>
<!-- 				식당 소개<br> <textarea class="text" rows="3" cols="65" -->
<%-- 					style="resize: none;" name="resto_info" readonly="readonly">${resto.resto_info }</textarea> --%>
<!-- 				<hr> 예약포인트<br> <textarea class="text" rows="1" cols="65" -->
<%-- 					style="resize: none;" name="deposit" readonly="readonly">${resto.deposit }</textarea><br> --%>
<!-- 				<hr> 식당주소<br> <textarea class="text" rows="1" cols="65" -->
<%-- 					style="resize: none;" name="resto_addr" readonly="readonly">${resto.resto_addr }</textarea><br> --%>
<!-- 				연락처<br> <textarea class="text" rows="1" cols="65" -->
<%-- 					style="resize: none;" name="resto_tel" readonly="readonly">${resto.resto_tel }</textarea><br> --%>
<!-- 				<textarea class="text" rows="1" cols="65" style="resize: none;" -->
<%-- 					name="c_email" readonly="readonly">${resto.c_email }</textarea> --%>
<!-- 				<hr> 영업시간<br> <textarea class="text" rows="1" cols="65" -->
<%-- 					style="resize: none;" name="resto_time" readonly="readonly">${resto.resto_time }</textarea><br> --%>
<!-- 				쉬는시간<br> <textarea class="text" rows="1" cols="65" -->
<%-- 					style="resize: none;" name="resto_break" readonly="readonly">${resto.resto_break }</textarea> --%>
<!-- 				<hr> <b>상세정보</b><br> <textarea class="text" rows="20" -->
<!-- 					cols="65" style="resize: none;" name="resto_detail" -->
<%-- 					readonly="readonly">${resto.resto_detail }</textarea> --%>
<!-- 				<hr></td> -->
<!-- 	</table> -->
<!-- 	<form method="post" name="addReview" -->
<%-- 		action="${path }/resto/addReview.do" enctype="multipart/form-data"> --%>
<%-- 		<input type="hidden" value="${resto.resto_no }" name="resto_no"> --%>
<%-- 		<input type="hidden" value="${review.review_no }" name="review_no"> --%>
<!-- 		<table border="1" align="center" width="500"> -->
<!-- 			<tr> -->
<!-- 				<td> -->
<!-- 					<div> -->
<!-- 						<img src="" id="preview" width="500"><br> <input -->
<!-- 							type="file" name="imageFileName" onchange="readURL(this)"> -->
<!-- 					</div> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><select name="rate"> -->
<!-- 						<option>평점</option> -->
<!-- 						<option value="1">1</option> -->
<!-- 						<option value="2">2</option> -->
<!-- 						<option value="3">3</option> -->
<!-- 						<option value="4">4</option> -->
<!-- 						<option value="5">5</option> -->
<!-- 				</select></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><textarea class="text" rows="5" cols="65" -->
<!-- 						style="resize: none;" name="review_content" placeholder="내용"></textarea> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><input type="submit" value="리뷰등록"></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</form> -->
<!-- 	<table border="1" align="center"> -->
<!-- 		<tr> -->
<%-- 			<td><c:forEach var="review" items="${reviewList }"> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when --%>
<%-- 							test="${resto.resto_no eq review.resto_no and review.imageFileName ne null}"> --%>
<!-- 							<form method="post" action="modReview.do" -->
<!-- 								enctype="multipart/form-data"> -->
<%-- 								<input type="hidden" value="${review.resto_no }" name="resto_no"> --%>
<!-- 								<img name="imageFileName" -->
<%-- 									src="${path }/downloadReviewImage.do?resto_no=${review.resto_no }&imageFileName=${review.imageFileName }" --%>
<!-- 									id="preview" width="500" align="center"><br> <input -->
<!-- 									type="file" name="reviewImageFileName" -->
<%-- 									id="imageFileName${review.review_no}" class="imageFileName" --%>
<!-- 									onchange="readURL(this)"><br> -->
<%-- 								<c:if test="${review.show eq 'y' }"> --%>
<%-- 									<input type="button" name="hide${review.review_no}" value="숨기기" --%>
<%-- 										onClick="fn_hide('${path}/resto/hideReview.do', ${review.review_no }, ${review.resto_no })"> --%>
<!-- 									<br> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${review.show eq 'n' }"> --%>
<%-- 									<input type="button" name="show${review.review_no}" value="보이기" --%>
<%-- 										onClick="fn_show('${path}/resto/showReview.do', ${review.review_no }, ${review.resto_no })"> --%>
<!-- 									<br> -->
<%-- 								</c:if> --%>
<!-- 								<textarea class="text" rows="1" cols="20" style="resize: none;" -->
<%-- 									name="u_nick" placeholder="닉네임" disabled="disabled">${review.u_nick }</textarea> --%>
<!-- 								<br> -->
<%-- 								<c:if test="${review.rate eq 1 }"> --%>
<!-- 									<input type="text" name="rateInStar" -->
<%-- 										id="rate${review.review_no}" placeholder="평점" --%>
<!-- 										disabled="disabled" value="★☆☆☆☆"> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${review.rate eq 2 }"> --%>
<!-- 									<input type="text" name="rateInStar" -->
<%-- 										id="rate${review.review_no}" placeholder="평점" --%>
<!-- 										disabled="disabled" value="★★☆☆☆"> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${review.rate eq 3 }"> --%>
<!-- 									<input type="text" name="rateInStar" -->
<%-- 										id="rate${review.review_no}" placeholder="평점" --%>
<!-- 										disabled="disabled" value="★★★☆☆"> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${review.rate eq 4 }"> --%>
<!-- 									<input type="text" name="rateInStar" -->
<%-- 										id="rate${review.review_no}" placeholder="평점" --%>
<!-- 										disabled="disabled" value="★★★★☆"> -->
<%-- 								</c:if> --%>
<%-- 								<c:if test="${review.rate eq 5 }"> --%>
<!-- 									<input type="text" name="rateInStar" -->
<%-- 										id="rate${review.review_no}" placeholder="평점" --%>
<!-- 										disabled="disabled" value="★★★★★"> -->
<%-- 								</c:if> --%>
<!-- 								<select name="rate" class="reviewRate" -->
<%-- 									id="rate${review.review_no}"> --%>
<%-- 									<option value="${review.rate }">${review.rate }</option> --%>
<!-- 									<option value="1">1</option> -->
<!-- 									<option value="2">2</option> -->
<!-- 									<option value="3">3</option> -->
<!-- 									<option value="4">4</option> -->
<!-- 									<option value="5">5</option> -->
<!-- 								</select> -->
<!-- 								<textarea class="text" rows="1" cols="10" style="resize: none;" -->
<%-- 									name="review_date" placeholder="리뷰일자" disabled="disabled">${review.review_date }</textarea> --%>
<!-- 								<br> -->
<!-- 								<textarea class="text" rows="5" cols="60" style="resize: none;" -->
<%-- 									id="review_content${review.review_no }" name="review_content" --%>
<%-- 									class="review_content" placeholder="내용" disabled="disabled">${review.review_content }</textarea> --%>
<!-- 								<br> <input type="hidden" -->
<%-- 									name="modFinish${review.review_no}" value="수정완료"> <input --%>
<%-- 									type="button" value="수정하기" name="mod${review.review_no}" --%>
<%-- 									onClick="fn_enable(${review.review_no})"> <input --%>
<%-- 									type="button" value="삭제하기" name="del${review.review_no}" --%>
<%-- 									onClick="fn_remove('${path}/resto/removeReview.do', ${review.review_no }, ${review.resto_no })"><br> --%>
<!-- 								<hr> -->
<%-- 								<input type="hidden" value="${review.review_no }" --%>
<%-- 									name="review_no" id="review_no${review.review_no }"> --%>
<!-- 							</form> -->
<%-- 						</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							<form method="post" action="modReview.do" -->
<!-- 								enctype="multipart/form-data"> -->
<%-- 								<input type="hidden" value="${review.resto_no }" name="resto_no"> --%>
<%-- 								<c:if --%>
<%-- 									test="${resto.resto_no eq review.resto_no and review.imageFileName eq null}"> --%>
<!-- 									<input type="file" name="reviewImageFileName" -->
<%-- 										id="imageFileName${review.review_no}" class="imageFileName" --%>
<!-- 										onchange="readURL(this)"> -->
<!-- 									<br> -->
<%-- 									<c:if test="${review.show eq 'y' }"> --%>
<%-- 										<input type="button" name="hide${review.review_no}" --%>
<!-- 											value="숨기기" -->
<%-- 											onClick="fn_hide('${path}/resto/hideReview.do', ${review.review_no }, ${review.resto_no })"> --%>
<!-- 										<br> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${review.show eq 'n' }"> --%>
<%-- 										<input type="button" name="show${review.review_no}" --%>
<!-- 											value="보이기" -->
<%-- 											onClick="fn_show('${path}/resto/showReview.do', ${review.review_no }, ${review.resto_no })"> --%>
<!-- 										<br> -->
<%-- 									</c:if> --%>
<!-- 									<textarea class="text" rows="1" cols="20" style="resize: none;" -->
<%-- 										name="u_nick" placeholder="닉네임" disabled="disabled">${review.u_nick }</textarea> --%>
<!-- 									<br> -->
<%-- 									<c:if test="${review.rate eq 1 }"> --%>
<!-- 										<input type="text" name="rateInStar" -->
<%-- 											id="rate${review.review_no}" placeholder="평점" --%>
<!-- 											disabled="disabled" value="★☆☆☆☆"> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${review.rate eq 2 }"> --%>
<!-- 										<input type="text" name="rateInStar" -->
<%-- 											id="rate${review.review_no}" placeholder="평점" --%>
<!-- 											disabled="disabled" value="★★☆☆☆"> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${review.rate eq 3 }"> --%>
<!-- 										<input type="text" name="rateInStar" -->
<%-- 											id="rate${review.review_no}" placeholder="평점" --%>
<!-- 											disabled="disabled" value="★★★☆☆"> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${review.rate eq 4 }"> --%>
<!-- 										<input type="text" name="rateInStar" -->
<%-- 											id="rate${review.review_no}" placeholder="평점" --%>
<!-- 											disabled="disabled" value="★★★★☆"> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${review.rate eq 5 }"> --%>
<!-- 										<input type="text" name="rateInStar" -->
<%-- 											id="rate${review.review_no}" placeholder="평점" --%>
<!-- 											disabled="disabled" value="★★★★★"> -->
<%-- 									</c:if> --%>
<!-- 									<select name="rate" class="reviewRate" -->
<%-- 										id="rate${review.review_no}"> --%>
<%-- 										<option value="${review.rate }">${review.rate }</option> --%>
<!-- 										<option value="1">1</option> -->
<!-- 										<option value="2">2</option> -->
<!-- 										<option value="3">3</option> -->
<!-- 										<option value="4">4</option> -->
<!-- 										<option value="5">5</option> -->
<!-- 									</select> -->
<!-- 									<textarea class="text" rows="1" cols="10" style="resize: none;" -->
<%-- 										name="review_date" placeholder="리뷰일자" disabled="disabled">${review.review_date }</textarea> --%>
<!-- 									<br> -->
<!-- 									<textarea class="text" rows="5" cols="60" style="resize: none;" -->
<%-- 										id="review_content${review.review_no }" name="review_content" --%>
<%-- 										class="review_content" placeholder="내용" disabled="disabled">${review.review_content }</textarea> --%>
<!-- 									<br> -->
<%-- 									<input type="hidden" name="modFinish${review.review_no}" --%>
<!-- 										value="수정완료"> -->
<%-- 									<input type="button" value="수정하기" name="mod${review.review_no}" --%>
<%-- 										onClick="fn_enable(${review.review_no})"> --%>
<%-- 									<input type="button" value="삭제하기" name="del${review.review_no}" --%>
<%-- 										onClick="fn_remove('${path}/resto/removeReview.do', ${reviewList })"> --%>
<!-- 									<br> -->
<!-- 									<hr> -->
<%-- 									<input type="hidden" value="${review.review_no }" --%>
<%-- 										name="review_no" id="review_no${review.review_no }"> --%>
<%-- 								</c:if> --%>
<!-- 							</form> -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
<%-- 				</c:forEach><br></td> --%>
<!-- 		</tr> -->
<!-- 	</table> -->
<!-- 	</div> -->