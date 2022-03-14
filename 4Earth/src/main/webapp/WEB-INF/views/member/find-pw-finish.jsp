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
                            <a href="${ path }/find-pw">비밀번호 찾기</a>
                        </div>
                    </div>


                <!-- login section -->
                    <div class="category">
                        <div class="login-wrap">

                            <div class="img-area2">
                                <img id="img2" src="${ path }/resources/images/member/find-pw2.jpg">
                            </div>



                            <div class="right-area">
                            <div class="find-form">
                                <br><br><br><br>
                                <h1>비밀번호 찾기</h1>
                                <br>
                                <!-- <hr class="short-line"> -->
                                <img id="result-img2" src="${ path }/resources/images/member/find-pw-result.png">
                                <br>
                                <br>
                                <p id="find-pw-text">회원가입 시, 기입하신 이메일로
                                    <br>임시 비밀번호가 발송되었습니다. </p>
                                <br>

                                <span id="small-text">
                                    임시 비밀번호로 로그인 하신 후, <br>
                                    마이페이지에서 꼭 비밀번호를 변경해주세요. 
                                </span><br><br>

                                <button class="btn btn-login" onclick="location.href='./login.html';">로그인 하러 가기</button>
                                <br>
                                <div id="find-area-box">
                                <ul class="find-area2">
                                    <li><a href="./find-id.html" class="sml-text2"><span>아이디 찾기</span></a></li>
                                    <li id="bar">|</li>
                                    <!-- <li><a href="#" class="sml-text2"><span>로그인</span></a></li> -->
                                    <!-- <li id="bar">|</li> -->
                                    <li><a href="./signup.html" class="sml-text2"><span>회원가입</span></a></li>
                                </ul>
                                </div>
                                <hr class="short-line2">
                                <br>

                                <br><br>

                            </div>
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
let idxNum=1;
</script>             
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/member.js"></script>