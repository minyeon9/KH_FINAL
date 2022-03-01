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
                <%@ include file="/WEB-INF/views/common/sideBar.jsp" %>
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

                            <div id="form-box">
                            <div id="form-area">
                                <br>
                                <h2>회원가입</h2>
                                <br>
                                <hr class="long-line">
                                <br>
                            
                            <form name="signup-form" action="${ path }/signup_form" method="post" enctype="multipart/form-data" >
                          
                                <img id="preview" src="${ path }/resources/images/member/profile1.png" />
                                <div class="filebox">
                                    <label for="profileImg">프로필 사진 등록</label>
                                    <input type="file" name="imgname" id="profileImg" title="프로필사진"
                                        value="profile1.png" />
                                </div>

                                <br>

                                <div class="form-group">
                                <div id="name-area">
                                    <label for="userId">아이디</label> 
                                    <p id="member-id"></p>
                                </div>
                                    <br>
                                    <input type="text" name="id" id="userId" 
                                        placeholder="첫 문자를 영어로 시작하여 총 5~12자로 입력하세요." required/>
                                    <input type="button" id="checkDuplicate" class="btn" value="중복검사">
                                    
                                </div>
                                <div class="form-group">
                                    <label for="userPw">비밀번호</label>
                                    <br>
                                    <input type="password" name="password" id="userPwd"
                                        placeholder="대/소문자, 숫자, 특수문자 포함하여 총 8~16자로 입력하세요." required />
                                    <p id="member-password"></p>
                                </div>
                                <div class="form-group">
                                    <label for="userPw">비밀번호 재확인</label>
                                    <br>
                                    <input type="password" id="userPwCheck" placeholder="입력하신 패스워드를 다시 입력하세요." required/>
                                    <div id="member-passwordcheck"></div>
                                </div>
                                <div class="form-group">
                                    <label for="userName">이름</label>
                                    <br>
                                    <input type="text" name="name" id="userName" placeholder="이름" required/>
                                    <p id="member-name"></p>
                                </div>
                                <div class="form-group">
                                    <label for="userEmail">이메일</label>
                                    <br>
                                    <input type="mail" name="email" id="userEmail" placeholder="이메일" required />
                                    <p id="member-email"></p>
                                </div>
                                <div class="form-group">
                                    <label for="userPhone">전화번호</label>
                                    <br>
                                    <input type="text" name="phone" id="userPhone" placeholder="휴대전화" required/>
                                    <p id="member-phone"></p>
                                </div>
                                <div class="form-group">
                                    <label for="userAddress">주소</label>
                                    <br>
                                    <input type="text" name="address" id="userAddress" placeholder="주소" required/>
                                </div>
                                <br>
                                <div class="form-group">
                                <a href="#popup01" class="btn-open-pop">
                                <div class="check-box">
                                    <input type="checkbox" id="checkbox1" required name="terms">
                                    <label for="checkbox1"> [필수] 개인정보 수집 및 이용약관 동의</label>
                                </div>
                                </a>
                                </div>
                                <div class="layer-popup" id="popup01">
                                    <div class="layer-inner">
                                        <div class="pop-head">
                                            <strong>개인정보 수집 및 이용약관 동의</strong>
                                            <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
                                        </div>
                                        <div class="pop-cont">
                                          	1. 개인정보의 수집항목 <br>
											4Earth는 홈페이지 회원 가입 시 회원 서비스 제공에 필요한 최소한의 정보를 수집하고 있으며 개인정보파일에 수집되는 항목은 다음과 같습니다.<br>
											<회원가입><br>
											- 이름, 아이디, 연락처, 이메일<br>
											<br>
											2. 개인정보 수집목적<br>
											(재)4Earth가 제공하는 맞춤화된 서비스(컨텐츠 제공, 각종 서비스 안내 및 참가신청 등) 및 개발(사전조사 및 만족도 설문조사, 고객문의 등)을 위해 수집합니다. (재)4Earth는 원칙적으로 이용자의 개인정보를 수집 및 이용 목적범위 내에서 처리하며, 이용자의 사전 동의 없이는 본래의 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다.
											<br>
											가. 회원관리<br>
											회원 맞춤 서비스 제공, 개인식별, 전체 서비스의 원활한 운영을 위한 관리, 회원탈퇴 의사 확인<br>
											<br>
											나. 고유서비스 이용 및 신규 개발<br>
											4Earth에서 제공하는 컨설팅을 비롯한 각종 고유 서비스 제공의 필요 시, 신규 서비스 개발 시 의견수렴 및 안내<br>
											<br>
											3. 개인정보의 보유기간<br>
											- 홈페이지 회원가입에 따라 수집된 개인정보 보유기간은 2년입니다.<br>
                                        </div>
                                        <div class="btn-wrap">
                                            <button type="button" class="btn btn-close-pop">확인</button>
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
            

<script>
 /*document.getElementById("checkbox1").setCustomValidity("개인정보 수집 및 이용약관을 체크해주세요."); */
</script>           
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/member.js"></script>