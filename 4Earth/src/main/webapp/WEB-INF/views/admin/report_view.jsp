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
	<link rel="stylesheet" href="${ path }/resources/css/admin.css">
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
	<div class="admin-report">
        <h2 style="text-align: center">신고 보기</h2> <br>
           <table id="report-table">
	           <colgroup>
	           		<col style="10%">
	           		<col style="40%">
	           		<col style="15%">
	           		<col style="35%">
	    		</colgroup>
		        	<tbody>
		        		<tr>
		        			<th>신고번호</th>
		        			<td>${ report.reportNo }</td>
		        			<th>제목</th>
		        			<td>${ report.reportTitle }</td>
		        		</tr>
		        		<tr>
		        			<th>신고 분류</th>
		        			<td>${ report.reportCategory }</td>
		        			<th>신고일</th>
		        			<td>${ report.reportDate }</td>
		        		</tr>
		        		<tr>
		        			<th>신고 회원</th>
		        			<td>${ report.reportMemberNo }</td>
		        			<th>신고받은 회원</th>
		        			<td>${ report.reportedMemberNo }</td>
		        		</tr>
		        		<tr style="min-height: 200px;">
		        			<td colspan="4">
			        			<div id="report-content">
				        			${ report.reportContent }
			        			</div>
			        		</td>
		        		</tr>
	        		</tbody>
	       		</table>
	       	</div>
    
    <script>
    </script>
</body>
</html>