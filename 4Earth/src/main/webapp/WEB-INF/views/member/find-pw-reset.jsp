<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>비밀번호 찾기</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div class="container">
            <div class="contents">
                <%@ include file="/WEB-INF/views/common/sideBar.jsp" %> 

                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>비밀번호 찾기</h3>
                        <div class="bread-crumb">
                            <a href="${ path }/"><i class="material-icons md-16">home</i></a>
                            <a href="${ path }find_pw">비밀번호 찾기</a>
                        </div>
                    </div>

                <!-- findfw-reset section -->
                    <div class="category">
                        <div class="login-wrap">

                            <div class="img-area2">
                                <img id="img2" src="${ path }/resources/images/member/find-pw2.jpg">
                            </div>


                            <div class="right-area">
                            <div class="find-form">
                                <br><br><br><br>
                                <h1>비밀번호 재설정</h1>
                                <br>
                                <form name="pw_reset_form" action="${ path }/pw_reset" method="post" onsubmit="return pw_reset_check()">
                                    <section id="pw_reset_section">
                                    	<div class="pw_reset_Tarea">
	                                        <p id="pw_reswe_title1">새 비밀번호</p>
	                                        <span class="alert1" id="member-password2"></span>
                                        </div>
                                        <div class="input-with-icon">
                                            <i class="material-icons">lock</i>
                                            <input type="password" name="userPwd2" id="userPwd2" placeholder="문자, 숫자, 특수문자 포함 총 8~16자">
                                        </div>
                                        <br>       
                                        <div class="pw_reset_Tarea">                         
	                                        <p id="pw_reswe_title2">새 비밀번호 확인</p>
	                                        <span class="alert1" id="member-passwordcheck"></span>
	                                    </div>
                                        <div class="input-with-icon">
                                            <i class="material-icons">lock</i>
                                            <input type="password" name="userPwCheck" id="userPwCheck2" placeholder="위 비밀번호와 동일하게 입력">
                                        </div>
                                        <br>
                                        <div id="btn-area">
                                            <button class="btn btn-login" id="chg-btn" type="submit">비밀번호 재설정</button>
                                        </div>
                                </section>
                                </form>

                                <div id="find-area-box">
                                <ul class="find-area2">
                                    <li><a href="${ path }/find_id" class="sml-text2"><span>아이디 찾기</span></a></li>
                                    <li id="bar">|</li>
                                    <li><a href="${ path }/signup" class="sml-text2"><span>회원가입</span></a></li>
                                </ul>
                                </div>
                                <hr class="short-line2">
                                <br>
                                <br><br>
                            </div>
                        </div>
                        </div>
                    </div>
                    <!-- // find-pw-reset-section -->

                    <div class="guide">
                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>            
<script type="text/javascript">
let idxNum=1;
</script>             
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/member.js"></script>