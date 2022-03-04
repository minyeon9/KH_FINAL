<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>챌린지</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <div class="container">
        <div class="contents">
            <%@ include file="/WEB-INF/views/common/sideBar.jsp" %>
            
            <section class="content-wrap">
                <div class="page-tit">
                    <h3>오늘의 챌린지</h3>
                    <div class="bread-crumb">
                        <a href="${ path }"><i class="material-icons md-16">home</i></a>
                        <a href="javascript:void(0);">에코 챌린지</a>
                        <span>오늘의 챌린지</span>
                    </div>
                </div>

                <div class="challenge today">
                    <div class="how-to">
                        <strong>오늘의 챌린지 참여 방법</strong>
                        <p>어쩌고 저쩌고<br>어쩌고 저쩌고<br>어쩌고 저쩌고<br>어쩌고 저쩌고<br>어쩌고 저쩌고</p>
                    </div>
					<p>${ loginMember.no }</p>
                    <div class="thumb-list">
                       	<c:if test="${ empty todayMain }">
                       		<div class="empty-content">
                       			<p>조회된 오늘의 챌린지가 없습니다.</p>
                       		</div>
                       	</c:if>
                        <ul>
                        	<c:if test="${ !empty todayMain }">
	                         	<c:forEach var="todayMain" items="${ todayMain }">
	                              <li>
	                                  <i class="num">${ todayMain.chalNo }</i>
	                                  <div class="img-thumb">
	                                      <img src="${ path }${todayMain.chalImgPath}/challenge_today0${todayMain.chalNo}.jpg" alt="">
	                                  </div>
	                                  <strong>${ todayMain.chalTitle }</strong>
	                                  <p>${ todayMain.chalContent }</p>
	                              </li>
								</c:forEach>
							</c:if>
                        </ul>
                    </div>
                    
                    <c:if test="${ !empty todayMain }">
	                    <div class="btn-wrap">
	                        <a href="${ path }/today_list" class="btn">참여하기</a>
	                    </div>
					</c:if>
                </div>

            </section>

            <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
        </div>
    </div>

<script type="text/javascript">
let idxNum=0;
</script>          
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/challenge.js"></script>