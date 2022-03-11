<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <script
      src="https://kit.fontawesome.com/b670a466b9.js"
      crossorigin="anonymous"
    ></script>
    <title>공지사항 - 세부내용</title>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
       <div class="container">
        <div class="contents">
          <section class="content-wrap">
            <div class="page-tit">
              <h3>제목</h3>

              <div class="bread-crumb">
                <a href="${ path }"
                  ><i class="material-icons md-16">home</i></a
                >
                <a href="#">About Us</a>
                <span>공지사항</span>
              </div>
            </div>
            <hr />
            <br />
            에디터 내용
            <br />
            <br />
            <div class="view_table_bottom">
              <a class="btn" href="${ path }/notice" role="button"> 목록 </a>
              <a class="btn" href="${ path }/notice_write" role="button">
                글쓰기
              </a>
              <a class="btn" href="${ path }/notice_modify" role="button">
                수정하기
              </a>
              <a class="btn" href="${ path }/notice_delete" role="button">
                삭제하기
              </a>
            </div>
            <ul>
              <li>
                <a href="#" class="angle">
                  <i class="fa-solid fa-angle-up"></i> 이전글 내용 입니다</a
                >
              </li>
              <li>
                <a href="#" class="angle">
                  <i class="fa-solid fa-angle-down"></i> 다음글 내용 입니다</a
                >
              </li>
            </ul>
          </section>
        </div>
      </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>