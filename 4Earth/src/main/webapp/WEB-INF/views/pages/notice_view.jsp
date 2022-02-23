<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="resources/css/style.css" />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <script src="WEB-INF/views/ckeditor5/build/ckeditor.js"></script>
    <script
      src="https://kit.fontawesome.com/b670a466b9.js"
      crossorigin="anonymous"
    ></script>
    <title>notice_view</title>
  </head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
      <div class="container">
        <div class="contents">
          <section class="content-wrap">
            <div class="page-tit">
              <h3>제목</h3>

              <div class="bread-crumb">
                <a href="../index.html"
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
            <div class="table_bottom">
              <a class="btn" href="./notice.html" role="button"> 목록 </a>
              <a class="btn" href="./notice_write.html" role="button">
                글쓰기
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