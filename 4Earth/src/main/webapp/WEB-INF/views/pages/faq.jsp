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
              <h3>FAQ (자주 묻는 질문)</h3>
              <div class="bread-crumb">
                <a href="../index.html"
                  ><i class="material-icons md-16">home</i></a
                >
                <a href="#">About Us</a>
                <span>FAQ</span>
              </div>
            </div>
            <div class="kind">
              <button>전체</button>
              <button>에코샵</button>
              <button>챌린지</button>
            </div>
          </section>
        </div>
      </div>


        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
