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

                            <form name="profile_edit_form" action="${ path }/profile_edit" method="post" enctype="multipart/form-data">
                                <div id="form-test">
                                <div id="profile_img_area">
                                	<c:if test="${ empty loginMember.img_name }">
                                    <img id="preview" class="preview_edit" src="${ path }/resources/images/member/user_default1.jpg" />
                                    </c:if>                                                                
                                	<c:if test="${ !empty loginMember.img_name }">
                                		<c:if test="${ !empty loginMember.modify_img_name}">
                                    		<img id="preview" class="preview_edit" src="${ path }/resources/upload/member/${loginMember.modify_img_name}" />
                                    	</c:if>
                                    	<c:if test="${ empty loginMember.modify_img_name }">
                                			<img id="preview" class="preview_edit" src="${loginMember.img_name}" />                                
                                		</c:if>  
                                    </c:if>
                                <div class="filebox2">
                                    <label for="profileImg">프로필 사진 등록</label>
                                    <input type="file" name="imgname" id="profileImg" title="프로필사진"
                                        value="${ loginMember.img_name }" />
                                </div>
                                </div>
                                
                                <div id="edit-input-area">

                                <div class="form-group2">
                                    <div id="name-area">
                                    <!-- <label for="userId">아이디</label> -->
                                    </div>
                                    <!-- <br> -->
                                    <!-- <p id="member-id"><i class="material-icons md-16">check</i> OK</p> -->
                                    <input type="text" name="id" id="userId2" value="${ loginMember.id }"
                                        placeholder="아이디" class="readonly" readonly/>
                                    <a href="#popup01" class="btn-open-pop">
                                    <input type="button" id="unregister-btn2" class="btn gray" value="회원탈퇴">
                                	</a>
                                    
                                    
                                </div>
                                <div class="form-group2">
                                    <!-- <label for="userPw">비밀번호</label> -->
                                    <!-- <br> -->
                                    <!-- <p id="member-id"><i class="material-icons md-16">check</i> OK</p> -->
                                    <input type="password" name="password" id="userPwd" value="*****"
                                        placeholder="비밀번호" class="readonly" disabled/>
                                    <input type="button" id="edit-btn" class="btn" value="비밀번호 변경">
                                    
                                </div>
                                <div class="form-group2">
                                    <!-- <label for="userName">이름</label> -->
                                    <!-- <br> -->
                                    <input type="text" name="name" id="userName" placeholder="이름" value="${ loginMember.name }"/>
                                    <p id="member-name"></p>
                                </div>
                                <div class="form-group2">
                                    <!-- <label for="userEmail">이메일</label> -->
                                    <!-- <br> -->
                                    <input type="mail" name="email" id="userEmail" placeholder="이메일" value="${ loginMember.email }" />
                                    <p id="member-email"></p>
                                </div>
                                <div class="form-group2">
                                    <!-- <label for="userPhone">전화번호</label> -->
                                    <!-- <br> -->
                                    <input type="text" name="phone" id="userPhone" placeholder="휴대전화" value="${ loginMember.phone }" />
                                    <p id="member-phone"></p>
                                </div>
                                <div class="form-group2">
                                    <!-- <label for="userAddress">주소</label> -->
                                    <!-- <br> -->
                                    <input type="text" name="address" id="userAddress" placeholder="주소" value="${ loginMember.address }" />
                                    <!--<input type="button" id="edit-btn2" class="btn" value="주소찾기">
                                     <br><br> 
                                    <input type="text" name="userAddress" placeholder="나머지 주소" />-->
                                </div>
                                <br>
                            </div>
                        </div>
                        
                        <hr class="long-line">
                        <br>
                        <div id="btn_area1">
                                <button type="button" class="btn btn-l gray" id="edit_btn" onclick="location.href='${ path }/profile_view';">이전으로</button>
                                <button type="submit" class="btn btn-l">수정하기</button>
                        </div>
                            </form>
                            <br><br>

                        </div>
                    </div>
								<div class="layer-popup" id="popup01">
                                    <div class="layer-inner">
                                        <div class="pop-head">
                                            <strong>회원탈퇴 안내</strong>
                                            <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
                                        </div>
                                        <form id="unregister-form" action="${ path }/member_delete" method="post">
                                        <div class="pop-cont2">
                                            <div id="unregster_notice">
                                                <br>
                                                <h2>회원탈퇴 안내</h2>
                                                <br>
                                                <div id="unregister_cont">
                                                    <p>1. 회원탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의 소비자 보호에 관한 법률에 의거한 고객정보 보호정책에 따라 관리됩니다. </p>
                                                    <p>2. 탈퇴 시 고객님께서 보유하셨던 포인트는 모두 삭제됩니다. </p>
                                                    <p>3. 탈퇴한 아이디는 본인과 타인 모두 재사용이 불가하오니 신중하게 선택해주시기 바랍니다. </p>
                                                    <p>4. 혹시 이용 과정에서 불편한 점이 있으셨다면 [1:1 문의]로 내용을 남겨주세요. </p>
                                                </div>
                                                </div>
                                                <br>
                                                <div class="form-group">
                                                <div class="check-box">
                                                    <input type="checkbox" id="checkbox2" required> 
                                                    <label for="checkbox2" id="check-cont">안내사항을 모두 확인하였으며, 이에 동의합니다.</label>
                                                </div>
                                                </div>
                                            </div>
                                            <br>
                                            <h3>탈퇴를 희망하신다면 비밀번호를 다시 한번 입력해주세요.</h3>
                                            <br>
                                                <div class="input-with-icon">
                                                    <i class="material-icons">lock</i>
                                                    <input type="password" name="password" placeholder="비밀번호를 입력해주세요." required>
                                                    <br><br>
                                                <p>본인확인을 위해 비밀번호를 다시 한번 확인합니다. </p>
                                                <p>비밀번호 재확인이 완료되면 회원탈퇴가 진행됩니다.</p>

                                                <br>
                                                </div>
                                                <br>
                                                <button type="submit" class="btn btn-login" >회원탈퇴</button>
                                                <br>
                                            </form>
                                        </div>
                                        <div class="btn-wrap">
                                            <!-- <button class="btn gray btn-close-pop">취소</button> -->
                                            <!-- <button class="btn btn-close-pop">확인</button> -->
                                        </div>
                                    </div>

                        </div>
                    </div>
                    <!-- // profile_edit section -->

                    <div class="guide">

                        <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
                    </div>
            </div>

<script type="text/javascript">
let idxNum=5;
</script>                 
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/member.js"></script>
<script src="resources/js/mypage.js"></script>