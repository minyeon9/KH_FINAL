<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>챌린지</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:if test="${ mapLength == 4 }">
	<div class="container js-container">
</c:if>
<c:if test="${ mapLength < 4 }">
	<div class="container">
</c:if>
	<div class="contents">
		<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
	
		<section class="content-wrap">
			<div class="page-tit">
				<h3>오늘의 챌린지</h3>
				<div class="bread-crumb">
					<a href="${ path }"><i class="material-icons md-16">home</i></a>
					<a href="${ path }/today_main">에코 챌린지</a> <span>오늘의 챌린지</span>
				</div>
			</div>
	
			<div class="challenge">
				<div class="complete-page">
					<i class="material-icons md-36">task_alt</i>
					<div class="txt">
						<span class="user-name">${ loginMember.name }</span>님,
						<p><span class="chal-title">${ list.chalTitle }</span> 챌린지 인증이 완료되었습니다.</p>
						<c:if test="${ mapLength == 4 }">
							<div class="point"><strong class="icon-point">${ list.chalPoint } Point</strong> 지급 되었습니다.</div>
							<a href="${ path }/point" class="btn-link">
								포인트 내역 <i class="material-icons md-20">arrow_right</i>
							</a>
						</c:if>
					</div>
					<div class="img-thumb">
						<img src="${ path }/resources/upload/challengeUser/${ list.renamedFilename }" alt="">
					</div>
					<a href="${ path }/today_list" class="btn">오늘의 챌린지 목록</a>
				</div>
			</div>
		</section>
	
		<button class="btn scroll-top">
			<i class="material-icons md-24">vertical_align_top</i>
		</button>
	</div>
</div>

<script src="${ path }/resources/js/confetti.js"></script>
<script type="text/javascript">
let idxNum = 0;
$(() => {
	setTimeout(() => {
		$('.container').removeClass('js-container');
		$('.confetti-container').fadeOut(3000);
	}, 3000);
});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="resources/js/challenge.js"></script>