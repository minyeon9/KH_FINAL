<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>오늘의 챌린지</title>
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
                	<c:if test="${ !empty todayMain }">
	                    <div class="how-to">
	                        <strong>오늘의 챌린지 참여 방법</strong>
	                        
	                       	<div class="step">
	                       		<ul class="step-list">
	                       			<li>
	                       				<i class="num">1</i>
	                       				<div>
		                       				<strong>로그인</strong>
		                       				<p>모든 챌린지는 로그인 후 참여 가능합니다.</p>
	                       				</div>
	                       			</li>
	                       			<li>
	                       				<i class="num">2</i>
	                       				<div>
		                       				<strong>참여하기 버튼 클릭</strong>
		                       				<p>각 챌린지의 참여하기 버튼을 클릭하여 해당 챌린지를<br>확인합니다.</p>
	                       				</div>
	                       			</li>
	                       			<li>
	                       				<i class="num">3</i>
	                       				<div>
		                       				<strong>사진 업로드</strong>
		                       				<p>챌린지에 알맞은 사진을 업로드하여<br>챌린지 참여를 인증합니다.</p>
	                       				</div>
	                       			</li>
	                       			<li>
	                       				<i class="num">4</i>
	                       				<div>
		                       				<strong>매일 4개의 챌린지 모두 참여</strong>
		                       				<p>오늘의 챌린지는 매일 4개의 챌린지를 모두 참여해야<br>포인트가 지급됩니다.</p>
	                       				</div>
	                       			</li>
	                       		</ul>
	                       	</div>
	                    </div>
					</c:if>

                    <div class="thumb-list">
                       	<c:if test="${ empty todayMain }">
                       		<div class="empty-content full">
                       			<i class="material-icons">info</i>
                       			<p>금일 진행 중인 오늘의 챌린지가 없습니다.</p>
                       		</div>
                       	</c:if>
                        <ul>
                        	<c:if test="${ !empty todayMain }">
	                         	<c:forEach var="todayMain" items="${ todayMain }" varStatus="status">
	                              <li>
	                                  <i class="num">${ status.count }</i>
	                                  <div class="img-thumb">
	                                      <img src="${ path }/resources/images/challenge/${ todayMain.renamedFilename }" alt="">
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