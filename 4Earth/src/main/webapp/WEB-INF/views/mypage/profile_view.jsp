<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>회원정보</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
        <div class="container">
            <div class="contents">
                <!-- 왼쪽 사이드바 -->
                <%@ include file="/WEB-INF/views/common/sideBar.jsp" %>
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>회원정보</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="${ path }/profile_view">회원정보</a>
                        </div>
                    </div>

                    <!-- Signup-form section -->
                    <div class="category">
                        <div class="profile-wrap">
                        
                            <div id="form-box">
                            <div id="form-area">
                                <br>
                                <h2>회원정보</h2>
                                <br>
                                <c:if test="${ empty loginMember.modify_img_name }">
                                <img id="preview" src="${ path }/resources/images/member/user_default1.jpg" />
                                </c:if>
                                <c:if test="${ !empty loginMember.modify_img_name }">
                                <img id="preview" src="${ path }/resources/upload/member/${loginMember.modify_img_name}" />
                                </c:if>
                                <table id="profile_table">
                                    <tbody>
                                        <tr>
                                            <td class="profile_title">아이디</td>
                                            <td>${ loginMember.id }</td>
                                        </tr>
                                        <tr>
                                            <td class="profile_title">이름</td>
                                            <td>${ loginMember.name }</td>
                                        </tr>
                                        <tr>
                                            <td class="profile_title">이메일</td>
                                            <td>${ loginMember.email }</td>
                                        </tr>
                                        <tr>
                                            <td class="profile_title">전화번호</td>
                                            <td>${ loginMember.phone }</td>
                                        </tr>
                                        <tr>
                                            <td class="profile_title">주소</td>
                                            <td>${ loginMember.address }</td>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <button class="btn btn-l gray">회원탈퇴</button>
                                <button class="btn btn-l" onclick="location.href='${ path }/profile_edit';" >정보수정</button>
                                <br><br><br>

                        </div>
                    </div>

                        </div>
                    </div>
                    <!-- // Signup-form section -->
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