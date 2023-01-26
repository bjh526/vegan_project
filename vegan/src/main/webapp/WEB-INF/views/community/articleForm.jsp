<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
				let cnt = 1;
				
				function fn_addFile() {
					$("#d_file").append("<input type='file' id='c_image"+cnt+"' name='c_image"+cnt+"' required='required'>");
					
					
					$("#c_image"+cnt+"").change(function () {
	                    if (this.files && this.files[0]) {
	                        let reader = new FileReader;
	                        reader.onload = function (data) {
	                        	$('.select_img').append("<img src='' class='img_"+cnt+"' />")
	                            $(".select_img .img_"+cnt+"").attr("src", data.target.result).width(100);
	                        }
	                        reader.readAsDataURL(this.files[0]);
	                    }
	                });
					
					cnt++;
				}
			</script>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="/resources/css/articleForm.css" rel="stylesheet">
    <link href="/resources/css/common.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="${path }/community/addArticle.do" enctype="multipart/form-data">
	
	<div class="container col-lg-4">
        <!-- 카테고리 선택 시작 -->
        <div class="contentBox">
            <label class="form-label">카테고리</label>
            <div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="c_category" id="card_sort1" value="recipe"
                        checked="checked">
                    <label class="form-check-label" for="inlineRadio1">레시피</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="c_category" id="card_sort2" value="vegan life">
                    <label class="form-check-label" for="inlineRadio2">비건라이프</label>
                </div>
            </div>
        </div>
        <!-- 카테고리 선택 끝 -->

        <!-- 제목 시작 -->
        <div class="contentBox">
            <label class="form-label">제목</label>
            <input type="text" class="form-control" name="c_title" id="input_point" required="required">
            <div class="invalid-feedback">
                Valid restaurant name is required.
            </div>
        </div>
        <!-- 제목 끝 -->

        <!-- 내용 시작 -->
        <div class="contentBox">
            <label class="form-label">내용</label>
            <div class="input-group has-validation">
                <textarea rows="10" class="form-control" name="c_content" id="input_point" required="required"
                    style="resize:none"></textarea>
                <div class="invalid-feedback">
                    Your information is required.
                </div>
            </div>
        </div>
        <!-- 내용 끝 -->

        <!-- 이미지 첨부 시작 -->
        <div class="inputArea contentBox">
            <label>이미지 첨부</label>
            
            

			<input type="button" value="파일첨부" onclick="fn_addFile()" >
			<div id="d_file"><input type="file" id="basic_image" name="basic_image" required="required">
			<script>
			$("#basic_image").change(function () {
                if (this.files && this.files[0]) {
                    let reader = new FileReader;
                    reader.onload = function (data) {
                    	$('.select_img').append("<img src='' class='basic_img' />")
                        $(".select_img .basic_img").attr("src", data.target.result).width(100);
                    }
                    reader.readAsDataURL(this.files[0]);
                }
            });
			</script>
			</div>
			<div class="select_img"></div>
           
        </div>
        <!-- 이미지 첨부 끝 -->

        <input class="w-100 btn btn-primary btn-lg" type="submit" style="background-color:#55771C; border:none"
             value="게시글 등록">
    </div>
    
</form>
    
    
    

	
	
</body>
</html>