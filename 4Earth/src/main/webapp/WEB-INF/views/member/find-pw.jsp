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
                <div class="loader"></div>
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
                                    <p>회원가입 시 입력한 이메일로 인증번호가 발송됩니다.</p>
                                    <!-- <hr class="short-line"> -->
                                    <br>
                                    
                                    
                                    <form id="findpw-form" action="${ path }/find_pw" method="post">
                                    <div class="input-with-icon">
                                        <i class="material-icons">person</i>
                                        <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요.">
                                    </div>
                                    <br>
                                    <div class="input-with-icon">
                                        <i class="material-icons">badge</i>
                                        <input type="text" name="name" id="name" placeholder="이름을 입력해주세요.">
                                    </div>
                                    <br>
                                    <div class="input-with-icon">
                                        <i class="material-icons">mail</i>
                                        <input type="mail" name="email" id="email" placeholder="이메일을 입력해주세요.">
                                    </div>
                                    <!-- <a href="#popup02" class="btn-open-pop"></a> -->
                                    <!--<button class="btn btn-login" id="findPw" type="submit">비밀번호 찾기</button>-->
                                    <input type="button" class="btn btn-login" id="findPw" value="비밀번호 찾기" class="submit">
                                    
                                </form>
                                    
                                    <div id="find-area-box">
                                        <ul class="find-area2">
                                            <li><a href="${ path }/login" class="sml-text2"><span>이전 화면으로</span></a></li>
                                            <li id="bar">|</li>
                                            <li><a href="${ path }/find_id" class="sml-text2"><span>아이디 찾기</span></a></li>
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
                        <strong>비밀번호 재설정을 위한 인증번호 확인</strong>
                        <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
                    </div>
                    <div class="pop-cont">
                        <form name="verification_form" action="${ path }/verification" method="post">
                        <br>
                        <h2>인증번호 확인</h2>
                        <br>
                        <div style="text-align: center;">
                        <img id="result-img2" src="${ path }/resources/images/member/find-pw-result.png">
                        </div>
                        <br>
                        <p class="atho_content">가입 시 입력하신 이메일로 인증번호가 발송되었습니다. </p>
                        <p class="atho_content">발송된 인증번호를 입력하시면 비밀번호를 재설정하실 수 있습니다.</p>
                        <br>
                            <table id="authorization-table">
                                <tr>
                                    <th>인증번호</th>
                                    <td>
                                        <div class="input-group1">
                                        <input type="text" name="vf_code" id="vf_code" placeholder="메일로 받은 인증번호 입력" required/>
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