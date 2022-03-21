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
        <h2 style="text-align: center">문의 답변 하기</h2> <br>
        <input type="hidden" name="" type="text" value="${ qna.no }" readonly="readonly">
           	<table class="echo-write">
           		<tr>
           			<th>
                        번호 : 
                    </th>
                    <td colspan="1">
                        <input name="" type="text" value="${ qna.no }" readonly="readonly">
                    </td>
           			<th>문의 회원 번호: </th>
		       		<td>
		       			<input name="" type="text" value="${ qna.writerNo }" readonly="readonly">
		       		</td>
           		</tr>
           		<tr>
	           		<th>제목: </th>
	        		<td>
	        			<input name="" type="text" value="${ qna.title }" readonly="readonly">
	        		</td>
        			<th>문의일: </th>
        			<td>
        				<fmt:formatDate value="${ qna.createDate }" pattern="yyy-MM-dd hh:mm"/>
        			</td>
           		</tr>
           		<tr>
        			<th colspan="1">사진</th>
        			<td colspan="1">
        				<img id="member-img" src="${ path }/resources/upload/notice/${ qna.renamedFileName }" />
        				
        			</td>
        			<th colspan="1">문의 내용</th>
        			<td colspan="1">
        				<input name="content" type="text" style="width: 90%; height: 300px;" value="${ qna.content }" readonly="readonly">
        			</td>
           		</tr>
                <tr>
        			<th colspan="1">답변</th>
        			<td colspan="3">
        			<form id="answer" action="${ path }/admin/qna_answer?no=${ qna.no }" name="qnaAnswer" method="post">
		       			<input name="qnaNo" type="hidden" value="${ qna.no }" readonly="readonly">
		       			<input name="writerNo" type="hidden" value="${ qna.writerNo }" readonly="readonly">
        				<input name="answerContent" type="text" style="width: 90%; height: 300px;">
        			</form>
        			</td>
        		</tr>  
                <tr>
                    <th colspan="4">
                        <p><input class="btn" type="submit" form="answer" value="답변등록"></p>
                    </th>
                </tr>
            </table>
		</div>
    <script>
    </script>
</body>
</html>