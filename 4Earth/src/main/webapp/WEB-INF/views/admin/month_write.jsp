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
        <h2 style="text-align: center">이달의 챌린지 등록하기</h2> <br>
           	<form action="${ path }/admin/month_write" name="today" method="post" enctype="multipart/form-data">
           	<table class="echo-write">
           		<tr>
           		<th>제목: </th>
        		<td><input name="chalTitle" type="text"></td>
           			<th>
                        포인트 : 
                    <input type="hidden" name="" value="">
                    </th>
                    <td colspan="1">
                        <input name="chalPoint" type="text">
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
        			<th>참여수: </th>
        			<td><input name="chalCount" type="text"></td>
        			<th>빈칸: </th>
        			<td>..</td>
        		</tr>
        		<tr style="text-align: center;">
        			<th colspan="2">챌린지 내용</th>
        			<th colspan="2">사진</th>
        		</tr>   
        		<tr style="text-align: center;">
        			<td colspan="2">
        				<input name="chalContent" type="text" style="width: 100%; height: 300px;">
        			</td>
        			<th colspan="2">
        				<input type="file" name="imgname" id="chalImg" title="뮬품사진"
                                        value="" />
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