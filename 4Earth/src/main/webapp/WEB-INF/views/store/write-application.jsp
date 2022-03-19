<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="resources/css/style.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    <script src="resources/js/ui.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="shortcut icon" href="resources/favicon.ico">
    <script src="https://kit.fontawesome.com/da4a2ee2c4.js" crossorigin="anonymous"></script>
    <script src="resources/ckeditor5/build/ckeditor.js"></script>
    <title>입고 신청하기</title>
    <style>
    	.ck-editor__editable {min-height: 400px;}
    </style>
</head>
<body>
	<div class="store-popup">
        <h2>상품 등록 신청하기</h2>

        <br>
		
		<section>
		<div class="store-guide">
			<h4>상품 등록 신청 안내</h4>
            <p>
                <i class="material-icons md-24">navigate_next</i>
                 <u>기존 판매처의 상품 링크</u>와 <u>카테고리</u>를 반드시 선택해주세요.
            </p>
            <p>
            	<i class="material-icons md-24">navigate_next</i>
                 신청해주신 상품은 환경표지, 동물 실험 여부 등의 적합성 심사 및 판매처와의 협의를 거친 후 모집이 시작됩니다.
            </p>
		</div>
        <form method="post" action="${ path }/write_application" id="ckeditorForm">
            <table class="store-editor">
                <tr>
                    <td style="width: 10%;">
                        상품 링크 : 
                    </td>
                    <td>
                        <input type="url" name="appUrl" id="" size="42" required="required">
                    </td>
                </tr>
                <tr>
                    <td>
                        상품명 : 
                    </td>
                    <td>
                        <input type="text" name="appName" id="" size="40" maxlength="40" required="required">
                    </td>
                </tr>
                <tr>
                    <td>
                        제목 : 
                    </td>
                    <td>
                        <input type="text" name="appTitle" id="" size="40" maxlength="40" required="required">
                    </td>
                </tr>
                <tr>
                    <td>
                        카테고리 : 
                    </td>
                    <td>
                        <select name="category-upper" id="" class="c1">
                            <option value="대분류" selected>대분류</option>
                            <option value="식품">식품</option>
                            <option value="생활">생활</option>
                            <option value="뷰티">뷰티</option>
                            <option value="반려동물">반려동물</option>
                        </select>
                        <select name="category-lower" id="" class="c2">
                            <option>소분류</option>
                        </select>
                        <input type="hidden" name="appCatName">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="appContent" id="editor" required="required" class="ck_editor_txt">
                        </textarea> 
                    </td>
                </tr>                
                <tr>
                    <th colspan="2">
                        <p><input class="btn" type="submit" value="등록"></p>
                    </th>
                </tr>
            </table>                                   
        </form>
        </section>
    </div>
    
    <script>
        ClassicEditor
        .create( document.querySelector( '#editor' ), {
            ckfinder: {
                uploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json',
            },
            toolbar: {
                items: [
                'link',
                'heading',
                '|',
                'bold',
                'italic',
                '|',
                'outdent',
                'indent',
                '|',
                'undo',
                'redo',
                ],
            },
            language: 'ko',
            image: {
                toolbar: [
                'imageTextAlternative',
                'imageStyle:inline',
                'imageStyle:block',
                'imageStyle:side',
                ],
            }
        } )
        .catch( error => {
            console.error( error );
        } );

        // 상위 select 태그 값에 따라 하위 select 태그 값 변경 
        $(document).ready(() => {
            var food = ['간편식', '디저트/간식', '건조식품'];
            var life = ['세탁', '주방', '욕실'];
            var beauty = ['바디케어', '기초화장품', '메이크업', '헤어케어'];
            var pet = ['강아지', '고양이'];

            $('.c1').change(function(){
                var bel = $(this).val();

                if(bel == '식품'){
                    $('.op').remove();

                    $.each(food, function(i, item){
                        $('.c2').append('<option class="op" value="' + item + '">' +item+ '</option>');
                    });
                }
                if(bel == '생활'){
                    $('.op').remove();

                    $.each(life, function(i, item){
                        $('.c2').append('<option class="op" value="' + item + '">' +item+ '</option>');
                    });
                }
                if(bel == '뷰티'){
                    $('.op').remove();

                    $.each(beauty, function(i, item){
                        $('.c2').append('<option class="op" value="' + item + '">' +item+ '</option>');
                    });
                }
                if(bel == '반려동물'){
                    $('.op').remove();

                    $.each(pet, function(i, item){
                        $('.c2').append('<option class="op" value="' + item + '">' +item+ '</option>');
                    });
                }
            });
        });
        
        // 옵션 선택 & 내용 입력 필수	
        $("#ckeditorForm").submit(function(e) {
        	// 카테고리 값 전달
        	let category = $(".c2 option:selected").val();
        	
        	$("input[name='appCatName']").val(category);
        	
       		if(category == null || category == "소분류"){	
        		alert("상품 카테고리를 선택해주세요.");
                e.preventDefault();
        	} else {    
        		// 내용 입력 required
	            var content = $('.ck_editor_txt').val();
	            html = $(content).text();
	            if ($.trim(html) == '') {
	                alert("내용을 작성해주세요.");
	                e.preventDefault();
	            } 
        	}
        });
    </script>
</body>
</html>