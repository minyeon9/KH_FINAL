<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>로그인</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
			<div class="contents">
<%@ include file="/WEB-INF/views/common/sideBar.jsp" %>               

                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>로그인</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="${ path }/login">로그인</a>
                        </div>
                    </div>


                <!-- login section -->
                    <div class="category">
                        <div class="login-wrap">
                            <div class="login-left-area">
                            <div class="login-form">
                                <br><br><br>
                                <h1>로그인</h1>
                                <!-- <br> -->
                                <!-- <hr class="short-line"> -->
                                <br>
                            <form id="login-form" action="${ path }/login" method="post">
                                <div class="input-with-icon">
                                    <i class="material-icons">person</i>
                                    <input type="text" name="id" placeholder="아이디를 입력해주세요.">
                                </div>
                                <br>

                                <div class="input-with-icon">
                                    <i class="material-icons">lock</i>
                                    <input type="password" name="password" placeholder="비밀번호를 입력해주세요.">
                                </div>
                                <button class="btn btn-login" type="submit">로그인</button>
                                <br>
                            </form>
                                <div id="find-area-box">
                                <ul class="find-area">
                                    <li><a href="${ path }/find_id" class="sml-text2"><span>아이디 찾기</span></a></li>
                                    <li id="bar">|</li>
                                    <li><a href="${ path }/find_pw" class="sml-text2"><span>비밀번호 찾기</span></a></li>
                                    <!-- <li id="bar">|</li> -->
                                    <!-- <li><a href="${ path }/enroll" class="sml-text2"><span>회원가입</span></a></li> -->
                                </ul>
                                </div>
                                <hr class="short-line">
                                <br>
                                <div class="simple-login-area">
                                    <p>SNS 간편 로그인</p>
                                    <a href="javascript:kakaoLogin();">
                                    <img class="login-btn" src="${ path }/resources/images/member/kakao-login-btn.png">
                                    </a>
                                    <a href="javascript:loginWithNaver()">
                                    <img class="login-btn" src="${ path }/resources/images/member/naver-login-btn.png" alt="">
                                    <!-- <input type="button" class="splgin-btn" id="naver" style="cursor:pointer;" value="네이버 간편 로그인"> -->
                                    </a>
                                    <a href="javascript:loginWithGoogle();">
                                    <img class="login-btn" src="${ path }/resources/images/member/google-login-btn.png">
                                    <!-- <input type="button" class="splgin-btn" id="google" style="cursor:pointer;" value="카카오 로그아웃"> -->
                                    </a>
                                </div>

                                <br><br>

                            </div>
                        </div>


                            <div class="img-area">
                                <img id="img" src="${ path }/resources/images/member/login.png">
                            </div>
                        </div>
                        
                    </div>
                    <!-- // login section -->


                    <div class="guide">



                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
//사이드바의 인덱스 넘버
let idxNum=1;

</script>          
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/member.js"></script>