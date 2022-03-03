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
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="${ path }/find-pw">비밀번호 찾기</a>
                        </div>
                    </div>

                    <!-- find section -->
                    <div class="category">
                        <div class="login-wrap">

                            <div class="img-area2">
                                <img id="img2" src="${ path }/resources/images/member/find-pw1.jpg">
                            </div>

                            <div class="right-area">
                                <div class="find-form">
                                    <br><br><br>
                                    <h1>비밀번호 찾기</h1>
                                    <br>
                                    <p>회원가입 시 입력한 이메일로 임시 비밀번호가 발송됩니다.</p>
                                    <!-- <hr class="short-line"> -->
                                    <br>
                                    <form id="findpw-form" action="${ path }/find-pw" method="post">
                                    <div class="input-with-icon">
                                        <i class="material-icons">person</i>
                                        <input type="text" placeholder="아이디를 입력해주세요.">
                                    </div>
                                    <br>
                                    <div class="input-with-icon">
                                        <i class="material-icons">badge</i>
                                        <input type="text" placeholder="이름을 입력해주세요.">
                                    </div>
                                    <br>
                                    <div class="input-with-icon">
                                        <i class="material-icons">mail</i>
                                        <input type="email" placeholder="이메일을 입력해주세요.">
                                    </div>
                                    <button class="btn btn-login" type="submit">비밀번호 찾기</button>
                                </form>
                                    
                                    <div id="find-area-box">
                                        <ul class="find-area2">
                                            <li><a href="${ path }/login" class="sml-text2"><span>이전 화면으로</span></a></li>
                                            <li id="bar">|</li>
                                            <li><a href="${ path }/find_id" class="sml-text2"><span>아이디 찾기</span></a></li>
                                            <!-- <li id="bar">|</li> -->
                                            <!-- <li><a href="${ path }/enroll" class="sml-text2"><span>회원가입</span></a></li> -->
                                        </ul>
                                    </div>
                                    <hr class="short-line2">
                                    <br>

                                    <br><br>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="guide">
                        <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
                    </div>
            </div>
            
<script type="text/javascript">
let idxNum=1;
</script>             
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/member.js"></script>