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
        <h2 style="text-align: center">이달의 챌린지 수정하기</h2> <br>
        <input type="hidden" name="chalNo" type="text" value="${ month.chalNo }" readonly="readonly">
           	<form action="${ path }/admin/month_update?no=${ month.chalNo }" name="month" method="post" enctype="multipart/form-data">
           	<table class="echo-write">
           		<tr>
           			<th>카테고리: </th>
        		<td>
        			<input name="category" type="text" value="${ month.category }">
        		</td>
           			<th>
                        번호 : 
                    </th>
                    <td colspan="1">
                        <input name="chalNo" type="text" value="${ month.chalNo }" readonly="readonly">
                    </td>
           		</tr>
           		<tr>
           		<th>제목: </th>
        		<td><input name="chalTitle" type="text" value="${ month.chalTitle }"></td>
           			<th>
                        포인트 : 
                    </th>
                    <td colspan="1">
                        <input name="chalPoint" type="text" value="${ month.chalPoint }">
                    </td>
           		</tr>
                <tr>
        			<th>시작일: </th>
        			<td>
        				<input id="startDateGet" name="startDate1" type="text" value="" placeholder="yyyy-MM-ddThh:MM">
        				<input id="startDateSet" name="startDate" type="hidden" value="">
        			</td>
        			<th>종료일: </th>
        			<td>
        				<input id="endDateGet" name="endDate1" type="text" value="" placeholder="yyyy-MM-ddThh:MM">
	        			<input id="endDateSet" name="endDate" type="hidden" value="">
        			</td>
        		</tr>
        		<tr>
        			<th>
                        참여수 : 
                    </th>
                    <td colspan="1">
                        <input name="chalCount" type="text" value="${ month.chalCount }">
                    </td>
        		</tr>
        		<tr style="text-align: center;">
        			<th colspan="2">챌린지 내용</th>
        			<th colspan="2">사진</th>
        		</tr>   
        		<tr style="text-align: center;">
        			<td colspan="2">
        				<input name="chalContent" type="text" style="width: 100%; height: 300px;" value="${ month.chalContent }">
        			</td>
        			<th colspan="2">
        				<img id="member-img" src="${ path }/resources/upload/challenge/${ month.renamedFilename }" />
        				<input type="file" name="imgname" id="today-image" title="챌린지사진"
                                        value="${ month.renamedFilename }" />
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
    $("#startDateGet").change(function(){
    	const str = $(this).val();
    	const start_date = new Date(str);
        $('#startDateSet').val(start_date);
    });
    
    $("#endDateGet").change(function(){
    	const str = $(this).val();
    	const end_date = new Date(str);
        $('#endDateSet').val(end_date);
    });
    </script>
</body>
</html>