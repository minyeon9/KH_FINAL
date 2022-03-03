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
    <link rel="stylesheet" href="${ path }/resources/css/jquery.fullPage.css">
    <script src="${ path }/resources/js/jquery-3.6.0.js"></script>
    <script src="${ path }/resources/js/ui.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="shortcut icon" href="${ path }/resources/favicon.ico">
    <script src="https://kit.fontawesome.com/da4a2ee2c4.js" crossorigin="anonymous"></script>
    <script src="${ path }/resources/ckeditor5/build/ckeditor.js"></script>
    <title>신고내용</title>
</head>
<body>
	<div class="">
        <h2>신고 제목 : ${ report.reportTitle }</h2>
        <br>
			<h4>신고 번호 : ${ report.reportNo }</h4>
		<br>
			<div>
				신고분류 ${ report.reportCategory } <br>
				신고일 ${ report.reportDate } <br>
      			신고 회원 ${ report.reportMemberNo } <br>
       			신고받은 회원 ${ report.reportedMemberNo } <br>
			</div>
		<div class="board">
	           <table class="table">
	        	<tbody>
	        		<tr>
	        			<th colspan="6">내용</th>
	        		</tr>
	        		<tr>
	        			<td colspan="6">${ report.reportContent }</td>
	        		</tr>
	        	</tbody>
	           </table>
	       </div>
	        <form method="post">
	            <table class="store-editor">
	            </table>                                   
	        </form>
	    </div>
    
    <script>
    </script>
</body>
</html>