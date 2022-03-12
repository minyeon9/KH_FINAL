<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- <script src="../resources/ckeditor/ckeditor.js"></script>
    <script>
        CKEDITOR.replace("content", {
        filebrowserUploadUrl : "/earth/notice/write",
        language : "ko"
        });
            			 
    </script> -->
    <script src="../resources/ckeditor5/build/ckeditor.js"></script>
    <title>공지사항</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

      <div class="container">
        <div class="contents">
          <section class="content-wrap">
            <div class="page-tit">
              <h3>공지사항 글 작성</h3>
              <div class="bread-crumb">
                <a href="${ path }"
                  ><i class="material-icons md-16">home</i></a
                >
                <a href="#">About Us</a>
                <span>공지사항</span>
              </div>
            </div>
            <br />
            <form action="${ path }/notice/write" method="post" enctype="multipart/form-data">
            	
            	<label for="title">제목: </label>
            	<input type="text" name="title" placeholder="제목을 입력해주세요.">
            	<br><br>
            	
            	<label for="upfile">파일첨부: </label>
							<input type="file" name="upfile">
							<br><br>
							
							작성내용: 
							<textarea name="content" ></textarea>
							
							
            	<div class="write_table_bottom">
              	<a class="btn" href="${ path }/notice/list">목록</a>
              	<input type="submit" class="btn" value="작성하기">
            	</div>
            </form>
          </section>
        </div>
      </div>
      
<%@ include file="/WEB-INF/views/common/footer.jsp" %>