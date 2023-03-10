<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="totArticles" value="${articleMap.totArticles }" />
<c:set var="section" value="${articlesMap.section }"></c:set>
<c:set var="pageNum" value="${articlesMap.pageNum }"></c:set>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

function goToComment(c_articleNo) {
	location.href="${path}/community/viewArticle.do?c_articleNo="+c_articleNo+"";
}
function cantWrite() {
	alert('로그인 후 작성 가능합니다.');
	location.href='${path}/member/login';
}
	
	function filter(){
		let cnt = 1;
		
		$.ajax({
			type: 'GET',
			url : "${path}/community/changeFilter.do",
			data : $("form[name=filter-form]").serialize(),
			success : function(result){
				//테이블 초기화
				$('#byRecipe > .feedConatiner').empty();
				if(result.length>=1){
					result.forEach(function(item){
						str = "<div class='feedConatiner'>";
						
						str += "<div class='container col-lg-6 recipe'><div class='imgContainer'><div id='carouselExampleInterval' class='carousel slide' data-bs-ride='carousel'><div class='carousel-inner' style='height: 300px;'>";
						str += "<div class='carousel-item active' data-bs-interval='3000'>"
						str += "<img src='${path}/download.do?c_articleNo="+item.c_articleNo+"&c_image="+item.c_image+"' class='d-block w-100 carousel' alt='...' style='height: 300px' ></div></div></div></div>"
						str += "<div class='iconBox'>"
						str += "<img src='../resources/img/icon/heart_icon.png' class='icon'>"
						
						str += "<span id='heart"+cnt+"_span'><span>"+item.heart+"</span></span>"
						str += "<img src='../resources/img/icon/text_icon.png' class='icon' onclick='goToComment("+item.c_articleNo+")'><span>"+item.reply_cnt+"</span>"
						
						
						str += "<img src='../resources/img/icon/scrap_icon.png' class='icon'>"
						
						str += "<span id='scrap"+cnt+"_span'><span>"+item.c_scraps+"</span></span></form>"
						str += "</div><div class='contentBox'>"
						str += "<a href='${path}/community/viewArticle.do?c_articleNo="+item.c_articleNo+"'>"
						str += "<h5 class='content'>"+item.c_title+"</h5>"
						str += "<p class='content'>콘텐츠 내용</p></a></div></div>"
						
						str += "</div>";
						
						
						$('#byRecipe').append(str);
						cnt++;
	        		});			 
				}
			}, error : function() {
				alert('잘 안됨');
			}
		});
	}

	function viewSearchList(){
		let cnt = 1;
		// 3. url로 넘긴 컨트롤러에서 실행한 sql결과(result)를 foreach로 돌려서 div id writeList에 검색시마다 넣어줌
		$.ajax({
			type: 'GET',
			url : "${path}/member/viewSearchList.do",
			data : $("form[name=search-form]").serialize(),
			success : function(result){
				// 4. 테이블 초기화
				$('#byRecipe > .feedConatiner').empty();
				if(result.length>=1){
					result.forEach(function(item){
						str = "<div class='feedConatiner'>";
						
						str += "<div class='container col-lg-6 recipe'><div class='imgContainer'><div id='carouselExampleInterval' class='carousel slide' data-bs-ride='carousel'><div class='carousel-inner' style='height: 300px;'>";
						str += "<div class='carousel-item active' data-bs-interval='3000'>"
						str += "<img src='${path}/download.do?c_articleNo="+item.c_articleNo+"&c_image="+item.c_image+"' class='d-block w-100 carousel' alt='...' style='height: 300px' ></div></div></div></div>"
						str += "<div class='iconBox'>"
						str += "<img src='../resources/img/icon/heart_icon.png' class='icon'>"
						
						str += "<span id='heart"+cnt+"_span'><span>"+item.heart+"</span></span>"
						str += "<img src='../resources/img/icon/text_icon.png' class='icon' onclick='goToComment("+item.c_articleNo+")'><span>"+item.reply_cnt+"</span>"
						
						
						str += "<img src='../resources/img/icon/scrap_icon.png' class='icon'>"
						
						str += "<span id='scrap"+cnt+"_span'><span>"+item.c_scraps+"</span></span>"
						str += "</div><div class='contentBox'>"
						str += "<a href='${path}/community/viewArticle.do?c_articleNo="+item.c_articleNo+"'>"
						str += "<h5 class='content'>"+item.c_title+"</h5>"
						str += "<p class='content'>콘텐츠 내용</p></a></div></div>"
						
						str += "</div>";
						
						
						$('#byRecipe').append(str);
						cnt++;
	        		});			 
				}
			}, error : function() {
				alert('잘 안됨');
			}
		});
	}

</script>
<script src="../resources/script/community.js"></script>

<head>
<style>
.o_img {
	width: 200px;
	height: auto;
}

.e_img {
	width: 500px;
	height: auto;
}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="../resources/css/header.css" rel="stylesheet">
<link href="../resources/css/landingpage.css" rel="stylesheet">
<link href="../resources/css/common.css" rel="stylesheet">
<link href="../resources/css/feedCard.css" rel="stylesheet">
<link href="../resources/css/footer.css" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/resrevCard.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
	<div class="landingPage">

		<!--main-page 시작-->
		<div class="main-page" style="min-height: 800px;">
			<div class="inner">
				
			<div class="btnReserv">
				<div class="boxFilter">
					
					<c:choose>
						<c:when test="${userLogOn == true && user_onDTO != null }">
							<a href="${path }/community/articleForm.do"><button>게시글
									작성</button></a>
						</c:when>
						<c:when test="${isAdminLogOn == true && user_onDTO != null }">
						</c:when>
						<c:otherwise>
							<button onclick="cantWrite()">게시글 작성</button>
						</c:otherwise>
					</c:choose>

				
					<form name="filter-form" autocomplete="off">
					<select name="search_type">
						<option selected="selected" value="">필터</option>
						<option value="write">등록일순으로</option>
						<option value="views">조회수순으로</option>
						<option value="scraps">스크랩순으로</option>
						<option value="hearts">좋아요순으로</option>
						<option value="reply_cnt">댓글순으로</option>
					</select> <input type="button" value="필터링" onclick="filter()">
					</form>
					
					<form name="search-form" autocomplete="off">
							<input type="hidden" name="c_category" value="recipe"> <select
								name="search_type" class="selectSearch">
								<option selected="selected" value="">검색필터</option>
								<option value="c_title">제목</option>
								<option value="u_nick">닉네임</option>
							</select> <input class="inputSearch" type="search" name="keyword"
								>
							<button class="btnSearch" type="button"
								onclick="viewSearchList()">검색</button>
						</form>
						
				</div>
			</div>

				

				








				<div class="boxFilter">
					<h2>RECIPE</h2>
				</div>


				



				<div id="byRecipe">
					<div class="feedConatiner">

						<!-- feedCard 시작-->
				 		<c:forEach var="c3" items="${articleMap.recipe }"
							varStatus="status3">

							<div class="container col-lg-6 recipe">

								<div class="imgContainer">
									<div id="carouselExampleInterval" class="carousel slide"
										data-bs-ride="carousel">
										<div class="carousel-inner" style="height: 300px;">

											<c:forEach var="i" items="${articleMap.img }">
												<c:if test="${c3.c_articleNo == i.c_articleNo }">
													<div class="carousel-item active" data-bs-interval="2000">
														<img
															src="${path }/download.do?c_articleNo=${i.c_articleNo}&c_image=${i.c_image}"
															class="d-block w-100 carousel" alt="..."
															style="height: 300px">

													</div>
												</c:if>

											</c:forEach>



										</div>

									</div>
								</div>
								<div class="iconBox">

									<c:choose>
										<c:when test="${userLogOn != null && com_heartDTO != null }">
											<c:forEach var="heart" items="${com_heartDTO }">

												<c:if test="${heart.c_articleNo == c3.c_articleNo }">
													<img src="../resources/img/icon/heartFull_icon.png"
														class="icon">
													<script>
            					$(function() {
            						$("#btnHeart"+${status3.count + 20000}+"").css({"display": "none"});
								});
            						
            					</script>
												</c:if>

											</c:forEach>
											<img src="../resources/img/icon/heart_icon.png" class="icon"
												id="btnHeart${status3.count + 20000}">
										</c:when>
										<c:otherwise>
											<img src="../resources/img/icon/heart_icon.png" class="icon">
										</c:otherwise>
									</c:choose>



									<span>${c3.heart }</span> <img
										src="../resources/img/icon/text_icon.png" class="icon"
										onclick="goToComment(${c3.c_articleNo})"> <span>${c3.reply_cnt }</span>


									<c:choose>
										<c:when test="${userLogOn != null && com_scrapDTO != null }">
											<c:forEach var="scrap" items="${com_scrapDTO }">

												<c:if test="${scrap.c_articleNo == c3.c_articleNo }">
													<img src="../resources/img/icon/scrapFull_icon.png"
														class="icon">
													<script>
            					$(function() {
            						$("#btnScrap"+${status3.count + 20000}+"").css({"display": "none"});
								});
            						
            					</script>
												</c:if>

											</c:forEach>
											<img src="../resources/img/icon/scrap_icon.png" class="icon"
												id="btnScrap${status3.count + 20000}">
										</c:when>
										<c:otherwise>
											<img src="../resources/img/icon/scrap_icon.png" class="icon">
										</c:otherwise>
									</c:choose>


									<span>${c3.c_scraps }</span>


								</div>
								<div class="contentBox">
									<a
										href="${path }/community/viewArticle.do?c_articleNo=${c3.c_articleNo}">
										<h5 class="content">${c3.c_title }</h5>
										<p class="content">${c3.c_content }</p>
									</a>
								</div>

							</div>

						</c:forEach>  
						<!-- feedCard 끝 -->



					</div>
				</div> 









			</div>
		</div>
	</div>
</body>
</html>