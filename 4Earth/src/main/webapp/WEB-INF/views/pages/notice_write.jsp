<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>공지사항</title>
     <script src="resources/ckeditor5/build/ckeditor.js"></script>
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
            <div class="write_table_bottom">
              <a class="btn" href="${ path }/notice">목록</a>
              <button type="submit" class="btn">작성하기</button>
            </div>
          </section>
        </div>
      </div>
      
<%@ include file="/WEB-INF/views/common/footer.jsp" %>