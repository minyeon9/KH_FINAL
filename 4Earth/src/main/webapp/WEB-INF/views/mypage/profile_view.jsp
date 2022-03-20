<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>내 정보</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
        <div class="container">
            <div class="contents">
                <!-- 왼쪽 사이드바 -->
                <%@ include file="/WEB-INF/views/common/sideBar.jsp" %>
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>내 정보</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="${ path }/profile_view">내 정보</a>
                        </div>
                    </div>

                    <!-- Signup-form section -->
                    <div class="category">
                        <div class="profile-wrap">
                        
                            <div id="form-box">
                            <div id="form-area">
                                <br>
                                <h2>내 정보</h2>
                                <br>
                                <c:if test="${ empty loginMember.img_name }">
                                <img id="preview" src="${ path }/resources/images/member/user_default1.jpg" />
                                </c:if>
                                <c:if test="${ !empty loginMember.img_name }">
                                	<c:if test="${ !empty loginMember.modify_img_name}">
	                                	<img id="preview" src="${ path }/resources/upload/member/${loginMember.modify_img_name}" />
                                	</c:if>
	                                <c:if test="${ empty loginMember.modify_img_name }">
                                		<img id="preview" src="${loginMember.img_name}" />                                
                                	</c:if>            
                                </c:if>
                                <table id="profile_table">
                                    <tbody>
                                    	<c:if test="${ loginMember.platform_type == 'HOMEPAGE' }">
                                        <tr>
                                            <td class="profile_title">아이디</td>
                                            <td>${ loginMember.id }</td>
                                        </tr>
                                        </c:if>
                                        <tr>
                                            <td class="profile_title">이름</td>
                                            <td>${ loginMember.name }</td>
                                        </tr>
                                        <tr>
                                            <td class="profile_title">이메일</td>
                                            <c:if test="${ !empty loginMember.email }">
                                            	<td>${ loginMember.email }</td>
                                            </c:if>
                                            <c:if test="${ empty loginMember.email }">
                                            	<td>미입력</td>
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <td class="profile_title">전화번호</td>
                                            <c:if test="${ !empty loginMember.phone }">
                                            	<td>${ loginMember.phone }</td>
                                            </c:if>
                                            <c:if test="${ empty loginMember.phone }">
                                            	<td>미입력</td>
                                            </c:if>
                                        </tr>
                                        <tr>
                                            <td class="profile_title">주소</td>
                                            <c:if test="${ !empty loginMember.address }">
                                            	<td>
                                            	(우편번호 : ${ loginMember.postcode })<br>
                                            	${ loginMember.address }<br>
                                            	${ loginMember.extra_address } 
                                            	${ loginMember.detail_address }
                                            	</td>
                                            </c:if>
                                            <c:if test="${ empty loginMember.address }">
                                            	<td>미입력</td>
                                            </c:if>                                                 
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <a href="#popup01" class="btn-open-pop">
                                <button class="btn btn-l gray" >회원탈퇴</button>
                                </a>
                                <button class="btn btn-l" onclick="location.href='${ path }/profile_edit';" >정보수정</button>
                                <br><br><br>
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
                                                    <c:if test="${ loginMember.platform_type != 'HOMEPAGE' }">
                                                    <p>2. SNS회원의 경우 탈퇴 시 연결해제는 해당 플랫폼에서 가능합니다.</p>
                                                    <p>(단, 카카오는 탈퇴 시 바로 연결해제 가능)</p>
                                                    </c:if>
                                                    <c:if test="${ loginMember.platform_type == 'HOMEPAGE' }">
                                                    <p>2. 탈퇴 시 고객님께서 보유하셨던 포인트는 모두 삭제됩니다. </p>
                                                    </c:if>
                                                    <p>3. 탈퇴한 아이디는 본인과 타인 모두 재사용이 불가하오니 신중하게 선택해주시기 바랍니다. </p>
                                                    <c:if test="${ loginMember.platform_type != 'HOMEPAGE' }">
                                                    <p>  (단 SNS 로그인의 경우 탈퇴 후 같은 아이디로 재가입이 가능합니다. )</p>
                                                    </c:if>
                                                    <p>4. 혹시 이용 과정에서 불편한 점이 있으셨다면 [1:1 문의]로 내용을 남겨주세요. </p>
                                                </div>
                                                </div>
                                                <br>
                                                <c:if test="${ loginMember.platform_type == 'HOMEPAGE' }">
                                                <div class="form-group">
                                                <div class="check-box">
                                                    <input type="checkbox" id="checkbox2" required> 
                                                    <label for="checkbox2" id="check-cont">안내사항을 모두 확인하였으며, 이에 동의합니다.</label>
                                                </div>
                                                </div>
                                                </c:if>
                                            </div>
                                            <c:if test="${ loginMember.platform_type == 'HOMEPAGE' }">
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
                                                </c:if>
                                                <br>
                                                <c:if test="${ loginMember.platform_type == 'KAKAO' }">
                                                	<!--  <button type="submit"></button>  -->
				                                    <a href="javascript:unlinkWithKakao();">
				                                    <img class="login-btn" src="${ path }/resources/images/member/kakao_unlink_btn.png">
				                                    </a>
			                                    </c:if>
			                                    <c:if test="${ loginMember.platform_type == 'GOOGLE' }">
                                                	<!--  <button type="submit"></button>  -->
				                                    <a href="javascript:unregisterSNS();">
				                                    <img class="login-btn" src="${ path }/resources/images/member/google_unregister_btn.png">
				                                    </a>
			                                    </c:if>
			                                    <c:if test="${ loginMember.platform_type == 'NAVER' }">
                                                	<!--  <button type="submit"></button>  -->
				                                    <a href="javascript:unregisterSNS();">
				                                    <img class="login-btn" src="${ path }/resources/images/member/naver_unregister_btn.png">
				                                    </a>
			                                    </c:if>
			                                    <c:if test="${ loginMember.platform_type == 'HOMEPAGE' }">
                                                <button type="submit" class="btn btn-login" >회원탈퇴</button>
                                                <br><br>
                                                </c:if>
                                                <br>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="dimed"></div>

                        </div>
                    </div>

                        </div>
                    </div>
                    <!-- // Signup-form section -->
                    <div class="guide">
                        <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
                    </div>
            </div>
		</div> 
            
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
let idxNum=4;
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/mypage.js"></script>
<!--  <script src="resources/js/member.js"></script>  -->