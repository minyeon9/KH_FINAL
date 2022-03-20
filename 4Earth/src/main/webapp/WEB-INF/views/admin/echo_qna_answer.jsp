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
    <title>상품 문의 내용</title>
</head>
<body>
	<div class="admin-report">
        <h2 style="text-align: center">문의 답변 하기</h2> <br>
        <input type="hidden" name="inqNo" type="text" value="${ inq.inqNo }" readonly="readonly">
           	<table class="echo-write">
           		<tr>
           			<th>
                        문의 번호 : 
                    </th>
                    <td colspan="1">
                        <input name="inqNo" type="text" value="${ inq.inqNo }" readonly="readonly">
                    </td>
           			<th>문의 회원: </th>
		       		<td>
		       			<input name="memberNo" type="text" value="${ inq.memberNo }" readonly="readonly">
		       		</td>
           		</tr>
           		<tr>
	           		<th>문의 상품: </th>
	        		<td>
	        			<a href="${ path }/product_detail?no=${ inq.proNo }" target="_blank" style="cursor: pointer;">
	        				<input name="proNo" type="text" value="${ inq.proNo }" readonly="readonly">
	        			</a>
	        		</td>
        			<th>작성일: </th>
        			<td>
        				<fmt:formatDate value="${ inq.inqDate }" pattern="yyy-MM-dd hh:mm"/>
        			</td>
           		</tr>
           		<tr>
        			<th colspan="1">사진</th>
        			<td colspan="1">
        				<img id="member-img" src="${ path }/resources/upload/store/${ product.proModifyImg }" />
        			</td>
        			<th colspan="1">문의 내용</th>
        			<td colspan="1">
        				<input name="content" type="text" style="width: 90%; height: 300px;" value="${ inq.inqContent }" readonly="readonly">
        			</td>
           		</tr>
                <tr>
        			<th colspan="1">답변</th>
        			<td colspan="3">
        			<form id="answer" action="${ path }/admin/echo_qna_answer?no=${ inq.inqNo }" name="qnaAnswer" method="post">
		       			<input name="proNo" type="hidden" value="${ inq.proNo }" readonly="readonly">
		       			<input name="memberNo" type="hidden" value="${ inq.memberNo }" readonly="readonly">
		       			<input name="inqNo" type="hidden" value="${ inq.inqNo }" readonly="readonly">
        				<input name="inqAns" type="text" style="width: 90%; height: 300px;">
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