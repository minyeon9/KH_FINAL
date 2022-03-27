<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${ path }/resources/css/style.css">
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>
<script src="${ path }/resources/js/ui.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="shortcut icon" href="resources/favicon.ico">
<title>main</title>
</head>
<body>
	<div class="wrap">
		<header>
			<div class="header-inner">
				<h1 class="logo">
					<a href="${ path }">
						<img src="${ path }/resources/images/common/logo.png" alt="4Earth">
					</a>
				</h1>
				<div class="user">
					<c:if test="${ empty loginMember }">
						<div class="before-login">
							<a href="${ path }/login"> <i class="material-icons md-18">login</i>
								로그인
							</a> <a href="${ path }/signup"> <i class="material-icons md-18">person_add</i>
								회원가입
							</a>
						</div>
					</c:if>

					<c:if test="${ !empty loginMember }">
						<div class="after-login">
							<c:if test="${ loginMember.member_type eq 'ADMIN'}">
								<!-- 
								<a href="${ path }/admin/main"><i
									class="material-icons md-18">manage_accounts</i> Admin</a>
								 -->
							</c:if>
							<a href="${ path }/purchase_cart">
								<i class="material-icons md-18">shopping_cart</i> 
								장바구니
							</a>
							<a href="${ path }/profile_view">
								<i class="material-icons md-18">account_circle</i> 
								<b>${ loginMember.name }</b>님
							</a>
							<a href="${ path }/logout">
								<i class="material-icons md-18">logout</i>
								로그아웃
							</a>
						</div>
					</c:if>
				</div>
			</div>

			<nav class="nav">
				<a href="${ path }" class="logo"> 
					<img src="${ path }/resources/images/common/icon_logo.png" alt="4Earth">
				</a>
				<ul class="nav-list">
					<li>
						<h2>
							<a href="#">About Us</a>
						</h2>
						<ul>
							<li><a href="${ path }/notice/list">공지사항</a></li>
							<li><a href="${ path }/notice/faq">FAQ</a></li>
							<li><a href="${ path }/notice/qnalist">1:1 문의</a></li>
						</ul>
					</li>
					<li>
						<h2>
							<a href="#">에코 챌린지</a>
						</h2>
						<ul>
							<li><a href="${ path }/today_main">오늘의 챌린지</a></li>
							<li><a href="${ path }/month_list">이달의 챌린지</a></li>
							<li><a href="${ path }/ongoing_list">참여 중인 챌린지</a></li>
						</ul>
					</li>
					<li>&nbsp;</li>
					<li>
						<h2>
							<a href="#">에코샵</a>
						</h2>
						<ul>
							<li><a href="${ path }/product_list">에코샵</a></li>
							<li><a href="${ path }/bidding_list">모집 중인 상품</a></li>
							<li><a href="${ path }/map">오프라인 매장</a></li>
						</ul>
					</li>
					<li>
						<h2>
							<a href="#">마이페이지</a>
						</h2>
						<ul>
							<li><a href="${ path }/point">포인트</a></li>
							<li><a href="${ path }/order">주문&dot;배송</a></li>
							<li><a href="${ path }/wishlist">찜한 상품</a></li>
							<li><a href="${ path }/my_ongoing_list">참여 중인 챌린지</a></li>
							<li><a href="${ path }/profile_view">내정보</a></li>
						</ul>
					</li>
				</ul>
				<div class="bg-nav"></div>
			</nav>
		</header>