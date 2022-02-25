<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

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
            <div class="write_table_bottom">
              <a class="btn" href="./notice.html" role="button">목록</a>
              <a class="btn" href="./notice_write.html" role="button">
                작성하기
              </a>
            </div>
          </section>
        </div>
      </div>
      

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
