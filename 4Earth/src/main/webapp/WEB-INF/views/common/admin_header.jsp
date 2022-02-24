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
    <link rel="stylesheet" href="resources/css/admin.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <script src="resources/js/jquery-3.6.0.js"></script>
    <script src="resources/js/ui.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>ADMIN</title>
</head>
<body>
    <div class="wrap">
        <header>
            <div class="header-inner">
                <h1 class="logo"><a href="${ path }">logo</a></h1>
                <div class="user">
                    <!-- <div class="before-login">
                        <a href="#">
                            <i class="material-icons md-18">login</i> 로그인
                        </a>
                        <a href="#">
                            <i class="material-icons md-18">person_add</i> 회원가입
                        </a>
                    </div> -->
    
                    <div class="after-login">
                        <a href="#">Guide</a>
                        <a href="#"><i class="material-icons md-18">manage_accounts</i> Admin</a>
                        <a href="#"><i class="material-icons md-18">account_circle</i> 
                            박민영</b>님</a>
                        <a href="#"><i class="material-icons md-18">logout</i> 로그아웃</a>
                    </div>
                </div>
            </div>
            <nav class="nav">
                <a href="${ path }/admin" class="logo">ADMIN PAGE</a>
                <ul class="nav-list">
                    <li>
                        <a href="#">
                        <i class="material-icons md-36">assignment</i>게시판</a>
                        <ul>
                            <li><a href="admin_notice">공지사항</a></li>
                        </ul>
                    </li>
                    <li class="current"><a href="#"><i class="material-icons md-36">person</i>회원</a>
                        <ul>
                            <li><a href="admin_member">회원 목록</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="material-icons md-36">live_help</i>문의</a>
                        <ul>
                            <li><a href="admin_helpboard">문의 목록</a></li>
                            <li><a href="admin_helpboard_done">문의 완료 목록</a></li>
                            <li><a href="admin_faq">faq</a></li>
                        </ul>
                    </li>
                    <li>&nbsp;</li>
                    <li><a href="#"><i class="material-icons md-36">report_problem</i>신고</a>
                        <ul>
                            <li><a href="admin_report_list">신고 목록</a></li>
                            <li><a href="admin_reported_list">신고받은 회원 목록</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="material-icons md-36">checklist</i>챌린지</a>
                        <ul>
                            <li><a href="admin_challenge_today">오늘의 챌린지 목록</a></li>
                            <li><a href="admin_challenge_month">이달의 챌린지 목록</a></li>
                            <li><a href="admin_challenge_today_manage">오늘의 챌린지 관리</a></li>
                            <li><a href="admin_challenge_month_manage">이달의 챌린지 관리</a></li>
                        </ul>
                    </li>
                    <li><a href="#"><i class="material-icons md-36">storefront</i>에코샵</a>
                        <ul>
                            <li><a href="admin_echo_list">에코샵 물품 목록</a></li>
                            <li><a href="admin_echo_order">주문 접수 목록</a></li>
                            <li><a href="admin_echo_delivery">발송 완료 목록</a></li>
                            <li><a href="admin_echo_cancel">주문 취소 목록</a></li>
                            <li><a href="admin_echo_bidding">물품 접수 목록</a></li>
                        </ul>
                    </li>
                    <div class="bg-nav"></div>
                </ul>
            </nav>
        </header>