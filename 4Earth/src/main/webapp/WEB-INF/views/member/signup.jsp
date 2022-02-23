<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<%@ include file="/WEB-INF/views/common/header.jsp" %>

       <div class="container">
            <div class="contents">
                <!-- 왼쪽 사이드바 -->
                <div class="side-bar is-open">
                    <button class="btn toggle-nav">
                        <i class="material-icons md-24">last_page</i>
                    </button>
                    <ul>
                        <li class="current">
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                    </ul>
                </div>
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>회원가입</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="${ path }/signup">회원가입</a>
                        </div>
                    </div>


                <!-- login section -->
                    <div class="category">
                        <div class="signup-wrap">
                            <!-- <div class="signup-img">
                                <img id="img2" src="../resources/images/member/signup-img.jpg">
                            </div> -->


                            <div class="login-left-area">
                            <div class="login-form">
                                <br><br><br>
                                <h1>회원가입</h1>
                                <br>
                                <hr class="short-line"><br>
                                <br>
                                <button class="btn btn-login" onclick="location.href='${ path }/signup_form'">통합 회원 가입</button>
                                <br>
                                <ul class="find-area">
                                    <li><span id="text">이미 회원이신가요?</span></li>
                                    <!-- <li id="bar">|</li> -->
                                    <li><a href="${ path }/login" class="sml-text2"><span>로그인</span></a></li>
                                </ul>
                                <br>
                                <hr class="short-line">
                                <br>
                                <div class="simple-login-area">
                                    <p>SNS 간편 회원가입</p>
                                    <a href="javascript:kakaoLogin();">
                                    <!-- <input type="button" class="splgin-btn" id="kakao" style="cursor:pointer;" value="카카오 간편 로그인"> -->
                                    <img class="login-btn" src="${ path }/resources/images/member/kakao-signup-btn.png">
                                    </a>
                                    <a href="">
                                    <img class="login-btn" src="${ path }/resources/images/member/naver-signup-btn.png" alt="">
                                    <!-- <input type="button" class="splgin-btn" id="naver" style="cursor:pointer;" value="네이버 간편 로그인"> -->
                                    </a>
                                    <a href="javascript:kakaoLogout();">
                                    <img class="login-btn" src="${ path }/resources/images/member/google-signup-btn.png">
                                    <!-- <input type="button" class="splgin-btn" id="google" style="cursor:pointer;" value="카카오 로그아웃"> -->
                                    </a>
                                </div>

                                <br><br>

                            </div>
                        </div>

                        <div class="img-area">
                            <img id="img" src="${ path }/resources/images/member/signup-img.jpg">
                        </div>


                        </div>
                        
                    </div>
                    <!-- // login section -->


                    <div class="guide">

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>
        
        <%@ include file="/WEB-INF/views/common/footer.jsp" %>
    	<script src="resources/js/member.js"></script>