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
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="shortcut icon" href="resources/favicon.ico">
	<link rel="stylesheet" href="resources/css/star-rating-svg.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script src="resources/js/jquery-3.6.0.js"></script>
    <script src="https://kit.fontawesome.com/da4a2ee2c4.js" crossorigin="anonymous"></script>
    <script src="resources/ckeditor5/build/ckeditor.js"></script>
    <script src="resources/js/jquery.star-rating-svg.js"></script>
    <title>상품 후기 작성</title>
    <style>
    	.ck-editor__editable {min-height: 400px;}
    </style>
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
        <form action="${ path }/write_review?no=${ proNo }" method="post" id="ckeditorForm" enctype="multipart/form-data">
            <table class="store-editor">
                <tr>
                    <td colspan="2">
                        <label for="title" style="margin-right: 20px;">
                            제목 : <input type="text" name="revTitle" id="" size="40" maxlength="40" required="required">
                        </label> 
                        
                        구매 옵션 : 
                        <!-- 
                        <c:if test="${ not empty optName }">
                        	<input type="text" name="proOptName" value="${ optName }" readonly="readonly">
                        	<input type="hidden" name="proOpt" value="${ optNo }">
                        </c:if>
                        <c:if test="${ empty optName }">
                        </c:if>
                         -->
	                        <select name="proOpt" id="product-option" class="pro-selectbox" style="width: 200px;" required="required">
	                             <option value="--------" selected disabled="disabled">--------</option>                                            
	                             <c:forEach var="optionList" items="${ option }">
	                             	<option value="${ optionList.optNo }">${ optionList.optName }</option>
	                             </c:forEach>
	                         </select>
                         	 <input type="hidden" name="proOptName" id="optName">
                    </td>
                </tr>
                <tr>
	                <td>	                	
	                	<div class="my-rating">별점 : </div>
	                	<input type="hidden" name="revRating" id="revRating">
	                </td>   
	                <td>
	                	<label for="revImg">사진 첨부 : </label>
                        <input type="file" name="upfile" id="revImg" />
	                </td>             
                </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="revContent" id="editor" class="ck_editor_txt">
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
        
        // 옵션명 전달
        $(".pro-selectbox").on("change", () => {
        	var optionName = $(".pro-selectbox option:checked").text();
        	
        	console.log(optionName);
        	
        	$("#optName").val(optionName);
            $("#optName").attr("disabled", false);
        });
        
        // 별점
        // https://github.com/nashio/star-rating-svg
        $(".my-rating").starRating({
	        starSize: 25,
	        callback: function(currentRating, $el){
	            // make a server call here
	            console.log(currentRating);
	            
	            $("#revRating").val(currentRating);
	        }
	    });
        
     	// 옵션 선택 & 내용 입력 필수	
        $("#ckeditorForm").submit(function(e) {
        	var option = $(".pro-selectbox").val();
        	/* var optionReadonly = `${ optName }`;
        	
        	console.log(optionReadonly);
        	
        	if(option == null && optionReadonly == null){ */
       		if(option == null){	
        		alert("구매 옵션을 선택해주세요.");
                e.preventDefault();
        	} else {      
        		
	            var content = $('.ck_editor_txt').val();
	            html = $(content).text();
	            if ($.trim(html) == '') {
	                alert("내용을 작성해주세요.");
	                e.preventDefault();
	            } 
        	}
        });
    </script>
</html>