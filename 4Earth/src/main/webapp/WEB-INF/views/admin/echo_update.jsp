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
        <h2 style="text-align: center">물품 수정하기</h2> <br>
           	<form action="${ path }/admin/echo_update?no=${ product.proNo }" name="product" method="post" enctype="multipart/form-data">
           	<table class="echo-write">
           		<tr>
        		<th>번호: </th>
        		<td><input name="proNo" type="text" value="${ product.proNo }" readonly="readonly"></td>
           		<th>이름: </th>
        		<td><input name="proName" type="text" value="${ product.proName }"></td>
           		</tr>
           		<tr>
                    <th>
                        카테고리 : 
                    <input type="hidden" name="" value="">
                    </th>
                    <td colspan="1">
                        <select name="proCat" id="cat" class="c1" onchange="">
                            <option value="101">간편식</option>
                            <option value="102">디저트/간식</option>
                            <option value="103">건조식품</option>
                            <option value="201">세탁</option>
                            <option value="202">주방</option>
                            <option value="203">욕실</option>
                            <option value="301">바디케어</option>
                            <option value="302">기초화장품</option>
                            <option value="303">메이크업</option>
                            <option value="304">헤어케어</option>
                            <option value="401">강아지</option>
                            <option value="402">고양이</option>
                        </select>
                        <select name="proStat" id="stat" class="c2">
                            <option value="1">모집중</option>
                            <option value="2">모집성공</option>
                            <option value="3">판매중</option>
                            <option value="4">일시품절</option>
                            <option value="5">판매중지</option>
                        </select>
                    </td>
                    <th colspan="1">제조사 :</th>
                    <td colspan="1">
	        			<input name="proMfg" type="text" value="${ product.proMfg }">
	        		</td>
                </tr>
                <tr>
        			<th>이름: </th>
        			<td></td>
        			<th>가격: </th>
        			<td><input name="proPrice" type="text" value="${ product.proPrice }"></td>
        		</tr>
        		<tr>
        			<th>용량: </th>
        			<td><input name="proVol" type="text" value="${ product.proVol }"></td>
        			<th>수량</th>
        			<td><input name="proStock" type="text" value="${ product.proStock }"></td>
        		</tr>
        		<tr style="text-align: center;">
        			<th colspan="2">상품 설명</th>
        			<th colspan="2">사진</th>
        		</tr>   
        		<tr style="text-align: center;">
        			<td colspan="2">
        				<input name="proInfo" type="text" style="width: 100%; height: 300px;" value="${ product.proInfo }">
        			</td>
        			<th colspan="2">
        				<img id="member-img" src="${ path }/resources/upload/store/${ product.proModifyImg }" />
        				<input type="file" name="imgname" id="echoImg" title="뮬품사진"
                                        value="${ product.proModifyImg }" />
        			</th>
        		</tr>   
                <tr>
                    <th colspan="4">
                        <p><input class="btn" type="submit" value="등록"></p>
                    </th>
                </tr>
            </table>                                   
        	</form>
		</div>
    <script>
    $('#stat option[value=${ product.proStat }]').prop('selected', 'selected').change();
    $('#category option[value=${ product.proCat }]').prop('selected', 'selected').change();
    </script>
</body>
</html>