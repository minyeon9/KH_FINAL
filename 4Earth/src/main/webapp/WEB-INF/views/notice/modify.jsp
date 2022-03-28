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
<title>공지사항</title>
<link rel="shortcut icon" href="${ path }/resources/favicon.ico">
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container">
	<div class="contents">
		<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
		<section class="content-wrap">
			<div class="page-tit">
				<h3>공지사항 글 수정</h3>
				<div class="bread-crumb">
					<a href="${ path }"><i class="material-icons md-16">home</i></a> <a
						href="${ path }/notice/list">About Us</a> <span>공지사항</span>
				</div>
			</div>
			<br />
			<form action="${ path }/notice/modify" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="no" value="${ notice.no }"> <input
					type="hidden" name="originalFileName"
					value="${ notice.originalFileName }"> <input type="hidden"
					name="renamedFileName" value="${ notice.renamedFileName }">
				<input type="hidden" name="writerId" value="${ notice.writerId }">

				<table class="store-editor">
					<tr>
						<td>제목 :</td>
						<td><input type="text" name="title" id="" size="40"
							maxlength="40" value="${ notice.title }"></td>
					</tr>
					<tr>
						<td><label for="upfile">파일첨부 : </label></td>
						<td><input type="file" name="upfile"><br> <c:if
								test="${ !empty notice.originalFileName }">
								<img src="${ path }/resources/images/common/file.gif" width="20"
									height="20" />
								<c:out value="${ notice.originalFileName }"></c:out>
							</c:if></td>
					</tr>
					<tr>
						<td>내용작성 :</td>
						<td colspan="2"><textarea name="content" id="editor">
                        	${ notice.content }
                        </textarea></td>
					</tr>
				</table>

				<div class="write_table_bottom">
					<a class="btn" href="${ path }/notice/list">목록</a> <input
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
            if(idx == 0) {
                $(this).addClass('current');
            }
        })
    });
</script>