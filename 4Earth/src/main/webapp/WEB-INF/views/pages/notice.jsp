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
              <h3>공지사항</h3>
              <div class="bread-crumb">
                <a href="${ path }"
                  ><i class="material-icons md-16">home</i></a
                >
                <a href="#">About Us</a>
                <span>공지사항</span>
              </div>
            </div>
            <br />
            <table class="table">
              <thead>
                <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>조회수</th>
                  <th>날짜</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th>1</th>
                  <td>
                    <a href="${ path }/notice_view">에코샵 현대 백화점 입점!!</a>
                  </td>
                  <td>99128</td>
                  <td>2022-01-11</td>
                </tr>
              </tbody>
            </table>
            <div class="table_bottom">
              <a class="btn" href="${ path }/notice_write" role="button">
                글쓰기
              </a>
            </div>
            <form action="#" method="GET" class="form-search">
              <div class="input-with-icon search-input">
                <input type="text" placeholder="검색어를 입력해주세요." />
                <button><i class="material-icons">search</i></button>
              </div>
            </form>
            <div class="paging">
              <!-- 맨 처음으로 -->
              <a
                class="first"
                onclick="location.href='${ path }/notice?page=1'"
              >
              </a>

              <!-- 이전 페이지로 -->
              <a
                class="prev"
                onclick="location.href='${ path }/notice?page=${ pageInfo.prevPage }'"
              >
              </a>

              <!--  10개 페이지 목록 -->
              <c:forEach
                begin="${ pageInfo.startPage }"
                end="${ pageInfo.endPage }"
                varStatus="status"
              >
                <c:if test="${ status.current == pageInfo.currentPage}">
                  <button disabled>${ status.current }</button>
                </c:if>

                <c:if test="${ status.current != pageInfo.currentPage }">
                  <button
                    onclick="location.href='${ path }/notice?page=${ status.current }'"
                  >
                    ${ status.current }
                  </button>
                </c:if>
              </c:forEach>

              <!-- 다음 페이지로 -->
              <a
                class="next"
                onclick="location.href='${ path }/notice?page=${ pageInfo.nextPage }'"
              >
              </a>

              <!-- 맨 끝으로 -->
              <a
                class="last"
                onclick="location.href='${ path }/notice?page=${ pageInfo.maxPage }'"
              >
              </a>
            </div>
          </section>
        </div>
      </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>