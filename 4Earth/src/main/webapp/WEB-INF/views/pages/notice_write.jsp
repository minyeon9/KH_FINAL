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
    <title>공지사항 작성</title>
  </head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

      <div class="container">
        <div class="contents">
          <section class="content-wrap">
            <div class="page-tit">
              <h3>공지사항 글 작성</h3>
              <div class="bread-crumb">
                <a href="../index.html"
                  ><i class="material-icons md-16">home</i></a
                >
                <a href="#">About Us</a>
                <span>공지사항</span>
              </div>
            </div>
            <br />
            <div id="editor"></div>
            <script>
              ClassicEditor.create(document.querySelector('#editor'), {
                toolbar: {
                  items: [
                    'heading',
                    '|',
                    'bold',
                    'italic',
                    'link',
                    'bulletedList',
                    'numberedList',
                    '|',
                    'outdent',
                    'indent',
                    '|',
                    'imageUpload',
                    'blockQuote',
                    'insertTable',
                    'mediaEmbed',
                    'undo',
                    'redo',
                  ],
                },
                language: 'ko',
                image: {
                  toolbar: [
                    'imageTextAlternative',
                    'imageStyle:inline',
                    'imageStyle:block',
                    'imageStyle:side',
                  ],
                },
                table: {
                  contentToolbar: [
                    'tableColumn',
                    'tableRow',
                    'mergeTableCells',
                  ],
                },
              })
                .then((editor) => {
                  console.log('Editor was initialized', editor)
                })
                .catch((error) => {
                  console.error(error.stack)
                })
            </script>
          </section>
        </div>
      </div>
      
<%@ include file="/WEB-INF/views/common/footer.jsp" %>