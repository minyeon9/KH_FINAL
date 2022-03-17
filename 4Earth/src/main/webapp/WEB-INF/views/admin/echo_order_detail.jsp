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
        <h2 style="text-align: center">주문내역 </h2> <br>
           	<table class="echo-write">
           	<c:forEach var="orderDetail" items="${ list }" varStatus="vs">
           		<tr>
	        		<th>번호:</th>
	        		<td><input name="detailProNo" type="text" value="${ orderDetail.detailProNo }" readonly="readonly"></td>
	           		<th>이름: </th>
	        		<td><input name="detailProName" type="text" value="${ orderDetail.detailProName }" readonly="readonly"></td>
        			<th>옵션: </th>
        			<td><input name="detailOptName" type="text" value="${ orderDetail.detailOptName }" readonly="readonly"></td>
        			<th>개수: </th>
        			<td><input name="detailQty" type="text" value="${ orderDetail.detailQty }" readonly="readonly"></td>
        			<th>개당 가격: </th>
        			<td><input name="detailPrice" type="text" value="${ orderDetail.detailPrice }" readonly="readonly"></td>
           		</tr>
           	</c:forEach>
            <tr>
                <th colspan="8">
                </th>
                <th colspan="2">
                	 <form action="${ path }/admin/echo_order_detail?no=${list[0].orderNo}" name="orderDetail" method="post">
                		<input name="orderNo" type="hidden" value="${list[0].orderNo}" readonly="readonly">
                    <p><input class="btn" type="submit" value="배송시작"></p>
		            </form>
                </th>
            </tr>
            </table>
		</div>
    <script>
    </script>
</body>
</html>