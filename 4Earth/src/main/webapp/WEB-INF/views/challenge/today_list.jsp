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
                       <a href="${ path }/today_main">에코 챌린지</a>
                       <span>오늘의 챌린지</span>
                   </div>
               </div>

               <div class="challenge today">
               		<strong>회원번호 : ${ loginMember.no }</strong><br>
               		<%-- <strong>내가 인증한 챌린지 번호 : ${ map.chalNo0 }</strong><br>
               		<strong>내가 인증한 챌린지 번호 : ${ map.chalNo1 }</strong> --%>
               		<%-- <c:forEach var="values" items="${ values }" varStatus="status">
               			내가 인증한 챌린지 번호 : <c:out value="${ values }"></c:out>
               			<p>${ values }</p>
               		</c:forEach> --%>
               		<p>참여완료 챌린지 번호(array): ${ values }</p>
                   <div class="thumb-list vertical challenge">
                       <ul>
							<c:if test="${ !empty todayList }">
								<c:forEach var="values" items="${ values }">
									<c:forEach var="todayList" items="${ todayList }">
										<c:if test="${ values == todayList.chalNo }">
											<li class="complete">
											    <i class="num">${ todayList.chalNo }</i>
											    <div class="item">
											        <div class="img-thumb">
											            <img src="${ path }${ todayList.chalImgPath }/challenge_today0${ todayList.chalNo }.jpg" alt="">
											        </div>
											        <div class="item-cont">
											            <strong>${ todayList.chalTitle }</strong>
											            <p>${ todayList.chalContent }</p>
											            <span>
											            	오늘의 챌린지 모두 달성 시
											            	<em class="icon-point">
											            		<fmt:formatNumber pattern="##,###" value="${ todayList.chalPoint }" /> 
											            	</em>
											            </span>
									            		<button class="btn gray" disabled onclick="location.href='${ path }/today_view?chalNo=${ todayList.chalNo }'">참여완료</button>
											        </div>
											    </div>
											</li>
										</c:if>
										
										<c:if test="${ values != todayList.chalNo }">
											<li>
											    <i class="num">${ todayList.chalNo }</i>
											    <div class="item">
											        <div class="img-thumb">
											            <img src="${ path }${ todayList.chalImgPath }/challenge_today0${ todayList.chalNo }.jpg" alt="">
											        </div>
											        <div class="item-cont">
											            <strong>${ todayList.chalTitle }</strong>
											            <p>${ todayList.chalContent }</p>
											            <span>
											            	오늘의 챌린지 모두 달성 시
											            	<em class="icon-point">
											            		<fmt:formatNumber pattern="##,###" value="${ todayList.chalPoint }" /> 
											            	</em>
											            </span>
									            		<button class="btn" onclick="location.href='${ path }/today_view?chalNo=${ todayList.chalNo }'">참여하기</button>
											        </div>
											    </div>
											</li>
										</c:if>
									</c:forEach>
									
								</c:forEach>
							</c:if>
                       </ul>
                   </div>
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