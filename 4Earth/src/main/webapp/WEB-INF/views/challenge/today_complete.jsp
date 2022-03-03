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
	
	            <div class="challenge">
	            	${ today.chalTitle }
	                <div class="complete-page">
	                	<%-- <strong>${ todayMember.chalNo }</strong> --%>
	                    <%-- <div class="img-thumb">
	                        <img src="${ path }/resources/images/upload/${ todayMember.renamedFilename }" alt="">
	                    </div> --%>
	                    <p><span>${ loginMember.name }</span>님, 챌린지 인증이 완료되었습니다.</p>
	                    <a href="${ path }/today_main" class="btn">오늘의 챌린지 메인으로</a>
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