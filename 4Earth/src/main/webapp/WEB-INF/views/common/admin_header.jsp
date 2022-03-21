<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

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
    <link rel="shortcut icon" href="${ path }/resources/favicon.ico">
    <title>4Earth 관리</title>
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
                    <!-- <div class="before-login">
                        <a href="#">
                            <i class="material-icons md-18">login</i> 로그인
                        </a>
                        <a href="#">
                            <i class="material-icons md-18">person_add</i> 회원가입
                        </a>
                    </div> -->
                    
    				<c:if test="${ !empty loginMember }">
                    <div class="after-login">
                    	<a href="${ path }/admin/main"><i class="material-icons md-18">manage_accounts</i> Admin</a>
                        <a href="${ path }"><i class="material-icons md-18">manage_accounts</i> User</a>
                        <a href="${ path }/profile_view"><i class="material-icons md-18">account_circle</i> 
                            ${ loginMember.name }</b>님</a>
                        <a href="${ path }/logout"><i class="material-icons md-18">logout</i> 로그아웃</a>
                    </div>
                    </c:if>
                </div>
            </div>
            <nav class="nav">
                <ul class="nav-list">
                	<li>
						<h2><a href="javascript:void(0);">게시판</a></h2>
						<ul>
							<li><a href="${ path }/admin/notice">공지사항</a></li>
						</ul>
					</li>
                    <li class="current">
                    	<h2><a href="javascript:void(0);">회원</a></h2>
                        <ul>
                            <li><a href="${ path }/admin/member">회원</a></li>
                        </ul>
                    </li>
                    <li>
                    	<h2><a href="javascript:void(0);">문의</a></h2>
                        <ul>
                            <li><a href="${ path }/admin/qna">문의</a></li>
                            <li><a href="${ path }/admin/qna_done">문의 완료</a></li>
                            <li><a href="${ path }/admin/echo_qna">상품 문의</a></li>
                        </ul>
                    </li>
                    <li>
                    	<h2><a href="javascript:void(0);">신고</a></h2>
                        <ul>
                            <li><a href="${ path }/admin/report_list">신고</a></li>
                            <li><a href="${ path }/admin/reported_list">신고받은 회원</a></li>
                        </ul>
                    </li>
                    <li>
                    	<h2><a href="javascript:void(0);">챌린지</a></h2>
                        <ul>
                            <li><a href="${ path }/admin/challenge_today">오늘의 챌린지</a></li>
                            <li><a href="${ path }/admin/challenge_month">이달의 챌린지</a></li>
                            <li><a href="${ path }/admin/challenge_today_manage">오늘의 챌린지 참여 회원</a></li>
                            <li><a href="${ path }/admin/challenge_month_manage">이달의 챌린지 참여 회원</a></li>
                        </ul>
                    </li>
                    <li>
                    	<h2><a href="javascript:void(0);">에코샵</a></h2>
                        <ul>
                            <li><a href="${ path }/admin/echo_list">에코샵 상품</a></li>
                            <li><a href="${ path }/admin/echo_order">주문 접수</a></li>
                            <li><a href="${ path }/admin/echo_delivery">발송 완료</a></li>
                            <li><a href="${ path }/admin/echo_cancel">주문 취소</a></li>
                            <li><a href="${ path }/admin/echo_bidding">상품 접수</a></li>
                        </ul>
                    </li>
                </ul>
				<div class="bg-nav"></div>
            </nav>
        </header>