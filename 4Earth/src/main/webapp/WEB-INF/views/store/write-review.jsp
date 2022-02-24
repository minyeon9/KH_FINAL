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
    <link rel="stylesheet" href="resources/css/jquery.fullPage.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    <script src="resources/js/ui.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="shortcut icon" href="resources/favicon.ico">
    <script src="https://kit.fontawesome.com/da4a2ee2c4.js" crossorigin="anonymous"></script>
    <script src="resources/ckeditor5/build/ckeditor.js"></script>
    <title>상품 후기 작성</title>
</head>
<body>
	<div class="store-popup">
        <h2>상품 후기 작성</h2>

        <br>
		
		<section>
		<div class="store-guide">
			<h4>상품 후기 작성 안내</h4>
            <p>
                <i class="material-icons md-24">navigate_next</i>
                 상품후기를 작성하시면 100point가 적립되며 주문 상태 [배송 완료] 이후부터 사용하실 수 있습니다.
            </p>
            <p>
            	<i class="material-icons md-24">navigate_next</i>
                 상품평과 상관없는 판매 관련이나 관련 홍보글은 사전통보없이 관리자에 의해 삭제될 수 있습니다.
            </p>
		</div>
        <form method="post">
            <table class="store-editor">
                <tr>
                    <td style="width: 50%;">
                        <label for="title">
                            제목 : <input type="text" name="title" id="" size="40" maxlength="40">
                        </label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="content" id="editor">
                        </textarea> 
                    </td>
                </tr>
                <tr>
                    <th>
                        <p><input class="btn" type="submit" value="등록"></p>
                    </th>
                </tr>
            </table>                                   
        </form>
        </section>
    </div>
</body>
    <script>
        ClassicEditor
        .create( document.querySelector( '#editor' ), {
            ckfinder: {
                uploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files&responseType=json',
            },
            toolbar: {
                items: [
                'ckfinder',
                'heading',
                '|',
                'bold',
                'italic',
                'link',
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
    </script>
</html>