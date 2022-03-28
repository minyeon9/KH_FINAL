<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.ck-editor__editable {
	min-height: 400px;
}
</style>
<script src="../resources/ckeditor5/build/ckeditor.js"></script>
<title>1:1 문의</title>
<link rel="shortcut icon" href="${ path }/resources/favicon.ico">
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container">
	<div class="contents">
		<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
		<section class="content-wrap">
			<div class="page-tit">
				<h3>1:1 문의</h3>
				<div class="bread-crumb">
					<a href="${ path }"><i class="material-icons md-16">home</i></a> <a
						href="${ path }/notice/list">About Us</a> <span>1:1 문의</span>
				</div>
			</div>
			<br />
			<form action="${ path }/notice/qnaWrite" id="ckeditorForm"
				method="post" enctype="multipart/form-data">

				<table class="store-editor">
					<tr>
						<td>제목 :</td>
						<td><input type="text" name="title" id="" size="40"
							maxlength="40" placeholder="제목을 입력해주세요."></td>
					</tr>
					<tr>
						<td>카테고리 :</td>
						<td><select name="category-upper" id="" class="c1">
								<option value="대분류" selected>대분류</option>
								<option value="챌린지">챌린지</option>
								<option value="소분샵">에코샵</option>
								<option value="회원">회원가입/정보</option>
								<option value="기타">기타</option>
						</select> <select name="category-lower" id="" class="c2">
								<option>소분류</option>
						</select> <input type="hidden" name="category"></td>
					</tr>
					<tr>
						<td><label for="upfile">파일첨부 : </label></td>
						<td><input type="file" name="upfile"><br> <c:if
								test="${ !empty qna.originalFileName }">
								<img src="${ path }/resources/images/file.png" width="20"
									height="20" />
								<c:out value="${ qna.originalFileName }"></c:out>
							</c:if></td>
					</tr>
					<tr>
						<td>내용작성 :</td>
						<td colspan="2"><textarea name="content" id="editor">
                        </textarea></td>
					</tr>
				</table>

				<div class="write_table_bottom">
					<a class="btn" href="${ path }/notice/qnalist">목록</a> <input
						type="submit" class="btn" value="작성하기">
				</div>
			</form>
		</section>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="../resources/js/notice.js"></script>
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

    $(document).ready(() => {
        var 챌린지 = ['챌린지수행관련문의', '포인트관련문의', '챌린지오류관련문의'];
        var 소분샵 = ['구매', '환불', '포인트'];
        var 회원 = ['가입', '탈퇴', '정보수정'];
        var 기타 = ['기타'];
        
        $('.c1').change(function(){
        	
            var bel = $(this).val();
            
            if(bel == '챌린지'){
                $('.op').remove();

                $.each(챌린지, function(i, item){
                    $('.c2').append('<option class="op">' +item+ '</option>');
                });
            }
            if(bel == '소분샵'){
                $('.op').remove();

                $.each(소분샵, function(i, item){
                    $('.c2').append('<option class="op">' +item+ '</option>');
                });
            }
            if(bel == '회원가입/정보'){
                $('.op').remove();

                $.each(회원, function(i, item){
                    $('.c2').append('<option class="op">' +item+ '</option>');
                });
            }
            if(bel == '기타'){
                $('.op').remove();

                $.each(기타, function(i, item){
                    $('.c2').append('<option class="op">' +item+ '</option>');
                });
            }
            

        });
    });
    
 // 옵션 선택 & 내용 입력 필수	
    $("#ckeditorForm").submit(function(e) {
    	// 카테고리 값 전달
    	let category = $(".c2 option:selected").val();
    	
    	$("input[name='category']").val(category);
    	
   		if(category == null || category == "소분류"){	
    		alert("상품 카테고리를 선택해주세요.");
            e.preventDefault();
    	} else {    
    		// 내용 입력 required
            var content = $('#editor').val();
            html = $(content).text();
            if ($.trim(html) == '') {
                alert("내용을 작성해주세요.");
                e.preventDefault();
            } 
    	}
    });
    
    
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['list', 'faq','qnalist'];
        let menuName = ['공지사항', 'FAQ', '1:1 문의'];
        let menuIcon = ['home', 'home', 'home' ]

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }
        sideBarMenu.each(function(idx, el) {
	        if(idx == 2) {
	            $(this).addClass('current');
	        }
	    })
    });
</script>