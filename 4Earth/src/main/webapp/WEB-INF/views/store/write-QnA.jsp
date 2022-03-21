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
    <title>상품문의작성</title>
    <style>
    	.ck-editor__editable {min-height: 400px;}
    </style>
</head>
<body>
	<div class="store-popup">
        <h2>상품 문의 작성</h2>

        <br>

		<section>
		<div class="store-guide">
			<h4>상품 문의 안내</h4>
            <p>
                <i class="material-icons md-24">navigate_next</i>
                 주문 후 주문/배송/취소 등에 관한 문의는 <a href="">About Us</a> > <a href="${ path }/notice/qnalist">1:1 문의</a>를 이용해주시기 바랍니다.
            </p>
            <p>
            	<i class="material-icons md-24">navigate_next</i>
                 주문번호, 연락처, 계좌번호 등의 개인 정보 관련 내용은 공개되지 않도록 비밀글로 문의해 주시기 바랍니다. 공개된 글은 비밀글로 전환될 수 있으며, 개인 정보 노출로 인한 피해는 eco5에서 책임지지 않습니다.
            </p>
            <p>
            	<i class="material-icons md-24">navigate_next</i>
            	상품과 관련없는 문의는 강제 삭제 될 수 있습니다.
            </p>
		</div>
        <form action="${ path }/write_qna" method="post" id="ckeditorForm">
        	<input type="hidden" name="proNo" value="${ product.proNo }">
            <table class="store-editor">
                <tr>
                    <td style="width: 50%;">
                        <label for="title">
                            제목 : <input type="text" name="inqTitle" id="" size="38" maxlength="38" list="qnaType" required="required">
                            <datalist id="qnaType">
                                <option value="상품 관련 문의입니다.">상품 관련 문의입니다.</option>
                                <option value="배송 관련 문의입니다.">배송 관련 문의입니다.</option>
                                <option value="품절/재입고 관련 문의입니다.">품절/재입고 관련 문의입니다.</option>
                            </datalist>
                        </label>
                    </td>
                    <td style="text-align: left;">
                        <div class="check-box">
                            <input type="checkbox" name="secret" id="checkbox1"> 
                            <label for="checkbox1">비밀글</label>
                        </div>
                        <input type="hidden" name="inqSecret" id="inqSecret" value="N">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="inqContent" id="editor" class="ck_editor_txt">
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
</body>
    <script>
    	// ckEditor 설정 
        ClassicEditor.create(document.querySelector('#editor'), {
            toolbar: {
                items: [
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
            language: 'ko'
            })
        .catch( error => {
            console.error( error );
        });
    	
    	// 비밀글 여부 
    	$(".check-box").on("change", () => {
    		if($("#checkbox1").is(":checked")){
        		$("#inqSecret").val("Y");        		
        	} else {
        		$("#inqSecret").val("N");  
        	}
    	});        
	
    	// 내용 입력 필수	
        $("#ckeditorForm").submit(function(e) {
            var content = $('.ck_editor_txt').val();
            html = $(content).text();
            if ($.trim(html) == '') {
                alert("내용을 작성해주세요.");
                e.preventDefault();
            } 
        });
</script>
</html>