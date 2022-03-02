<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원정보</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
	<div class="contents">
		<!-- 왼쪽 사이드바 -->
		<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
			<section class="content-wrap">
                    <div class="page-tit">
                        <h3>회원정보수정</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="${ path }profile_edit">회원정보수정</a>
                        </div>
                    </div>

                    <!-- profile_edit section -->
                    <div class="category">
                        <div class="profile-edit-wrap">
                            <div id="edit-box">
                            <div id="edit-area">
                                <br>
                                <h2>회원정보수정</h2>
                                <br>
                                <hr class="long-line">
                                <br>

                            <form name="profile_edit_form" action="${ path }/profile_edit" method="post">
                                <div id="form-test">
                                <div id="profile_img_area">
                                	<c:if test="${ empty loginMember.modify_img_name }">
                                    <img id="preview_edit" src="${ path }/resources/images/member/profile1.png" />
                                    </c:if>                                                                
                                	<c:if test="${ !empty loginMember.modify_img_name }">
                                    <img id="preview_edit" src="${ path }/resources/upload/member/${loginMember.modify_img_name}" />
                                    </c:if>
                                <div class="filebox2">
                                    <label for="profileImg">프로필 사진 등록</label>
                                    <input type="file" name="profile" id="profile" title="프로필사진"
                                        value="${ loginMember.img_name }" required />
                                </div>
                                </div>
                                
                                <div id="edit-input-area">

                                <div class="form-group2">
                                    <div id="name-area">
                                    <!-- <label for="userId">아이디</label> -->
                                    </div>
                                    <!-- <br> -->
                                    <!-- <p id="member-id"><i class="material-icons md-16">check</i> OK</p> -->
                                    <input type="text" name="userId" id="userId2" value="${ loginMember.id }"
                                        placeholder="아이디" disabled/>
                                    <input type="button" id="unregister-btn" class="btn gray" value="회원탈퇴">
                                
                                    
                                    
                                </div>
                                <div class="form-group2">
                                    <!-- <label for="userPw">비밀번호</label> -->
                                    <!-- <br> -->
                                    <!-- <p id="member-id"><i class="material-icons md-16">check</i> OK</p> -->
                                    <input type="password" name="userPwd" id="userPwd" value="*****"
                                        placeholder="비밀번호" disabled />
                                    <input type="button" id="edit-btn" class="btn" value="비밀번호 변경">
                                    
                                </div>
                                <div class="form-group2">
                                    <!-- <label for="userName">이름</label> -->
                                    <!-- <br> -->
                                    <input type="text" name="userName" id="userName" placeholder="이름" value="${ loginMember.name }"/>
                                    <p id="member-name"></p>
                                </div>
                                <div class="form-group2">
                                    <!-- <label for="userEmail">이메일</label> -->
                                    <!-- <br> -->
                                    <input type="mail" name="userEmail" id="userEmail" placeholder="이메일" value="${ loginMember.email }" />
                                    <p id="member-email"></p>
                                </div>
                                <div class="form-group2">
                                    <!-- <label for="userPhone">전화번호</label> -->
                                    <!-- <br> -->
                                    <input type="text" name="userPhone" id="userPhone" placeholder="휴대전화" value="${ loginMember.phone }" />
                                    <p id="member-phone"></p>
                                </div>
                                <div class="form-group2">
                                    <!-- <label for="userAddress">주소</label> -->
                                    <!-- <br> -->
                                    <input type="text" name="userAddress" id="userAddress" placeholder="주소" value="${ loginMember.address }" />
                                    <input type="button" id="edit-btn" class="btn" value="주소찾기">
                                    <!-- <br><br> -->
                                    <input type="text" name="userAddress" id="userAddress" placeholder="나머지 주소" />
                                </div>
                                <br>
                            </div>
                        </div>
                        
                        <hr class="long-line">
                        <br>
                        <div id="btn_area1">
                                <button class="btn btn-l gray" id="edit_btn" onclick="location.href='${ path }/profile_view';">이전으로</button>
                                <button class="btn btn-l" id="edit_btn">수정하기</button>
                        </div>
                            </form>
                            <br><br>

                        </div>
                    </div>


                        </div>
                    </div>
                    <!-- // profile_edit section -->

                    <div class="guide">

                        <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
                    </div>
            </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/member.js"></script>