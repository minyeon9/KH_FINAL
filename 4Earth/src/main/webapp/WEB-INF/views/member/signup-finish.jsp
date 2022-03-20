<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% request.setCharacterEncoding("UTF-8"); %>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입완료</title>

</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container">
	<div class="contents">
	
<%@ include file="/WEB-INF/views/common/sideBar.jsp" %>
	
		<section class="content-wrap">
			<div class="page-tit">
				<h3>회원가입</h3>
				<div class="bread-crumb">
					<a href="../index.html"><i class="material-icons md-16">home</i></a> <a href="#">회원가입</a>
				</div>
			</div>

			<!-- Signup-finish section -->
			<div class="category">
				<div class="signup-finish-wrap">

					<div id="form-box">
						<div id="form-area">
							<br><br>
							<h2>회원가입 완료</h2>
							<br>
							<hr class="long-line">
							<br> 
							<img id="congratulation" src="${ path }/resources/images/member/concratulation.png" alt="">

							<h1 id="signup-finish-title">
								<span id="username"></span>
								님의 가입을 환영합니다!
							</h1>
							<br>
							<p id="signup-finish-text">
								환경을 생각하는 4Earth의 멤버가 되신걸 축하드립니다. <br> 환경지킴이로써 에코챌린지를 시작해보세요!
							</p>
							<br><br>
							<button class="btn btn-l gray" id="signup-finish-btn1" onClick="location.href='${ path }/'">홈으로</button>
							<c:if test="${ empty loginMember }">
							<button class="btn btn-l" id="signup-finish-btn2" onClick="location.href='${ path }/login'">로그인</button>
							</c:if>
							<br><br><br><br><br><br><br>
						</div>
					</div>
				</div>
			</div>
			<!-- // Signup-finish section -->

			<div class="guide">

				<button class="btn scroll-top">
					<i class="material-icons md-24">vertical_align_top</i>
				</button>
			</div>
	</div>
	
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
//회원가입 완료 이름 출력
$(() => {
	const url = new URL(window.location.href);
	const urlParams = url.searchParams;
	document.getElementById("username").innerHTML=urlParams.get('name');
});
let idxNum=2;
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/member.js"></script>