<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>회원가입</title>
</head>
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

                    <!-- Signup-form section -->
                    <div class="category">
                        <div class="signup-form-wrap">

                            <!-- <div class="signup-input">
                                <input type="text" placeholder="아이디를 입력해주세요.">
                                <br>
                                <input type="password" placeholder="비밀번호를 입력해주세요.">
                                <br>
                                <button class="btn btn-login">가입하기</button>
                            </div> -->
                            <div id="form-box">
                            <div id="form-area">
                                <br>
                                <h2>회원가입</h2>
                                <br>
                                <hr class="long-line">
                                <br>
                            

                            <form name="memberEnrollFrm" action="${ path }/enroll" method="post">
                                <img class="profileImg" src="${ path }/resources/images/member/profile1.png" />
                                <div class="filebox">
                                    <label for="profileImg">프로필 사진 등록</label>
                                    <input type="file" name="profile" id="profile" title="프로필사진"
                                        value="${ loginMember.originalProfileName }" required />
                                </div>

                                <!-- <div class="form-group">
				<label for="profileImg">프로필 사진</label>
                <br>
				<input type="file" name="profile" id="profile"/>
			</div> -->
                                <br>

                                <div class="form-group">
                                    <label for="userId">아이디</label>
                                    <br>
                                    <input type="text" name="userId" id="userId"
                                        placeholder="첫 문자를 영어로 시작하여 총 5~12자로 입력하세요." />
                                    <input type="button" id="checkDuplicate" class="btn" value="중복검사">
                                    <p id="member-id"></p>
                                </div>
                                <div class="form-group">
                                    <label for="userPw">비밀번호</label>
                                    <br>
                                    <input type="password" name="userPwd" id="userPwd"
                                        placeholder="대/소문자, 숫자, 특수문자 포함하여 총 8~16자로 입력하세요." />
                                    <p id="member-password"></p>
                                </div>
                                <div class="form-group">
                                    <label for="userPw">비밀번호 재확인</label>
                                    <br>
                                    <input type="password" id="userPwCheck" placeholder="입력하신 패스워드를 다시 입력하세요." />
                                    <div id="member-passwordcheck"></div>
                                </div>
                                <div class="form-group">
                                    <label for="userName">이름</label>
                                    <br>
                                    <input type="text" name="userName" id="userName" placeholder="이름" />
                                    <p id="member-name"></p>
                                </div>
                                <div class="form-group">
                                    <label for="userEmail">이메일</label>
                                    <br>
                                    <input type="mail" name="userEmail" id="userEmail" placeholder="이메일" />
                                    <p id="member-email"></p>
                                </div>
                                <div class="form-group">
                                    <label for="userPhone">전화번호</label>
                                    <br>
                                    <input type="text" name="userPhone" id="userPhone" placeholder="휴대전화" />
                                    <p id="member-phone"></p>
                                </div>
                                <div class="form-group">
                                    <label for="userAddress">주소</label>
                                    <br>
                                    <input type="text" name="userAddress" id="userAddress" placeholder="주소" />
                                </div>
                                <br>
                                <!-- <a href="#popup01" class="btn btn-open-pop">게시판 관리</a> -->
                                <a href="#popup01" class="btn-open-pop">
                                <div class="check-box">
                                    <input type="checkbox" id="checkbox1" required> 
                                    <label for="checkbox1"> [필수] 개인정보 수집 및 이용약관 동의</label>
                                </div>
                                </a>
                                <div class="layer-popup" id="popup01">
                                    <div class="layer-inner">
                                        <div class="pop-head">
                                            <strong>개인정보 수집 및 이용약관 동의</strong>
                                            <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
                                        </div>
                                        <div class="pop-cont">
                                            호로롤ㄹ로롤
                                        </div>
                                        <div class="btn-wrap">
                                            <!-- <button class="btn gray btn-close-pop">취소</button> -->
                                            <button class="btn btn-close-pop">확인</button>
                                        </div>
                                    </div>
                                </div>
                                <br><br>
                                <button type="submit" class="btn btn-login">가입하기</button>
                            </form>
                            <br><br>

                        </div>
                    </div>


                        </div>
                    </div>
                    <!-- // Signup-form section -->


                    <div class="guide">



                        <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
                    </div>
            </div>
            
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/member.js"></script>