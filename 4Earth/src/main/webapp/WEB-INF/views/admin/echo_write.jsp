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
        <h2 style="text-align: center">물품 등록하기</h2> <br>
           	<form action="${ path }/admin/echo_write" name="product" method="post">
           	<table class="echo-write">
           		<tr>
                    <td>
                        카테고리 : 
                    </td>
                    <td colspan="2">
                        <select name="" id="" class="c1">
                            <option value="대분류" selected>대분류</option>
                            <option value="식품">식품</option>
                            <option value="생활">생활</option>
                            <option value="뷰티">뷰티</option>
                            <option value="반려동물">반려동물</option>
                        </select>
                        <select name="" id="" class="c2">
                            <option>소분류</option>
                        </select>
                    </td>
                </tr>
                <tr>
        			<th>이름: </th>
        			<td><input name="proName" type="text"></td>
        			<th>가격: </th>
        			<td><input name="proPrice" type="text"></td>
        		</tr>
        		<tr>
        			<th>용량: </th>
        			<td><input name="proVol" type="text"></td>
        			<th>수량</th>
        			<td><input name="proSold" type="text"></td>
        		</tr>
        		<tr style="text-align: center;">
        			<th colspan="3">상품 설명 :</th>
        		</tr>   
        		<tr style="text-align: center;">
        			<td colspan="3"><input name="proInfo" type="text" style="width: 100%; height: 300px;"></td>
        		</tr>
        		<tr>
        			<th colspan="2">사진</th>
        			<td colspan="2"><input name="proMfg" type="text" value="4Earth 식품"></td>
        		</tr>           
                <tr>
                    <th colspan="3">
                        <p><input class="btn" type="submit" value="등록"></p>
                    </th>
                </tr>
            </table>                                   
        	</form>
		</div>
    <script>
    </script>
</body>
</html>