<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>아이디 찾기</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div class="container">
            <div class="contents">
                <%@ include file="/WEB-INF/views/common/sideBar.jsp" %> 

                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>아이디 찾기</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="${ path }find-id">아이디 찾기</a>
                        </div>
                    </div>


                    <!-- find section -->
                    <div class="category">
                        <div class="login-wrap">

                            <div class="img-area2">
                                <img id="img2" src="${ path }/resources/images/member/find-id.jpg">
                            </div>



                            <div class="right-area">
                                <div class="find-form">
                                    <br><br><br>
                                    <h1>아이디 찾기</h1>
                                    <!-- <br> -->
                                    <!-- <hr class="short-line"> -->
                                    <br>
                                    <form id="findId-form" action="${ path }/find_id" method="post">
                                    <div class="input-with-icon">
                                        <i class="material-icons">person</i>
                                        <input type="text" name="userName" id="userName" placeholder="이름을 입력해주세요.">
                                    </div>
                                    <br>

                                    <div class="input-with-icon">
                                        <i class="material-icons">phone_in_talk</i>
                                        <input type="text" name="userPhone" id="userPhone" placeholder="휴대폰 번호 입력('-'생략)">
                                    </div>
                                    <!--  <button class="btn btn-login" type="submit">로그인</button> -->
                                    <input type="button" class="btn btn-login" id="findId" value="아이디 찾기" class="submit">
                                </form>
                                    
                                    <div id="find-area-box">
                                        <ul class="find-area2">
                                            <li><a href="${ path }/login" class="sml-text2"><span>이전 화면으로</span></a></li>
                                            <li id="bar">|</li>
                                            <li><a href="${ path }/find_pw" class="sml-text2"><span>비밀번호 찾기</span></a></li>
                                        </ul>
                                    </div>
                                    <hr class="short-line2">
                                    <br>

                                    <br><br>

                                </div>
                            </div>
                        </div>
                    </div>


                <div class="layer-popup" id="popup02">
                <div class="layer-inner">
                    <div class="pop-head">
                        <strong>아이디 찾기를 위한 문자 인증번호 확인</strong>
                        <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
                    </div>
                    <div class="pop-cont">
                        <form name="verification_form" action="${ path }/verification" method="post">
                        <br>
                        <h2>문자 인증번호 확인</h2>
                        <br>
                        <div style="text-align: center;">
                        <img id="result-img3" src="${ path }/resources/images/member/sms.png">
                        </div>
                        <br>
                        <p class="atho_content">가입 시 입력하신 전화번호로 인증번호가 발송되었습니다. </p>
                        <p class="atho_content">발송된 인증번호를 입력하시면 아이디를 확인하실 수 있습니다.</p>
                        <br>
                            <table id="authorization-table">
                                <tr>
                                    <th>인증번호</th>
                                    <td>
                                        <div class="input-group1">
                                        <input type="text" name="vf_code" id="vf_code" placeholder="문자로 받은 인증번호 입력" required/>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <br>
                            <div id="btn-area">
                            <button type="submit" class="btn btn-login" id="chg-btn">인증번호 확인</button>
                            </div>
                            <br><br>
                        </form>
                    </div>
                    <!-- <div class="btn-wrap">
                        <button class="btn gray btn-close-pop">취소</button>
                        <button class="btn">저장</button>
                    </div> -->
                </div>
            </div>
            <div class="dimed"></div>

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