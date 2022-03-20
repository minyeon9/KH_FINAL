<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="${ path }/resources/css/style.css">
    <script src="${ path }/resources/js/jquery-3.6.0.js"></script>
    <script src="${ path }/resources/js/ui.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="shortcut icon" href="${ path }/resources/favicon.ico">
    <script src="https://kit.fontawesome.com/da4a2ee2c4.js" crossorigin="anonymous"></script>
    <script src="${ path }/resources/ckeditor5/build/ckeditor.js"></script>
    <title>입고 신청하기</title>
    <style>
    	.ck-editor__editable {min-height: 400px;}
    </style>
</head>
<body>
	<div class="container">
        <div class="contents">
          <section class="content-wrap">
            <div class="page-tit">
              <h3>공지사항 글 작성</h3>
            </div>
            <br />
            <form action="${ path }/admin/notice_write" method="post" enctype="multipart/form-data">
            	
            	<table class="store-editor">
                <tr>
                    <td>
                        제목 : 
                    </td>
                    <td>
                        <input type="text" name="title" id="" size="40" maxlength="40" placeholder="제목을 입력해주세요.">
                    </td>
                </tr>
                <tr>
                	<td>
                		<label for="upfile">파일첨부 : </label>
                	</td>
                	<td>
										<input type="file" name="upfile"><br>
											<c:if test="${ !empty notice.originalFileName }">
												<img src="${ path }/resources/images/file.png" width="20" height="20"/>
												<c:out value="${ notice.originalFileName }"></c:out>
											</c:if>
									</td>
                </tr>
                <tr>
                		<td>
                			내용작성 : 
                		</td>
                    <td colspan="2">
                        <textarea name="content" id="editor">
                        </textarea> 
                    </td>
                </tr>
            	</table>
            
            	<div class="write_table_bottom">
              	<input type="submit" class="btn" value="작성하기">
            	</div>
            </form>
          </section>
        </div>
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