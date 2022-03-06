<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>챌린지</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
        <div class="container">
            <div class="contents">
                <%@ include file="/WEB-INF/views/common/sideBar.jsp" %>
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>참여 중인 챌린지</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="${ path }/today_main">에코 챌린지</a>
                            <span>참여 중인 챌린지</span>
                        </div>
                    </div>

                    <div class="challenge">

                        <div class="thumb-list ongoing">
                            <ul>
                            	<c:if test="${ !empty monthList }">
									<c:forEach var="monthList" items="${ monthList }">
		                                <li class="complete">
		                                    <a href="ongoing_write.html">
		                                        <div class="img-thumb">
		                                            <img src="${ path }/resources/images/challenge/challenge_today04.jpg" alt="">
		                                        </div>
		                                        <div class="item-cont">
		                                            <strong>${ monthList.chalTitle }</strong>
		                                            <p>${ monthList.chalContent}</p>
		                                            <span class="my-count"><em>{ monthList.chalCount}</em>/{ monthList.chalCount}</span>
		                                        </div>
		                                    </a>
		                                </li>
									</c:forEach>
								</c:if>
                            </ul>
                        </div>
                    </div>
                </section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<script type="text/javascript">
let idxNum=2;
</script>          
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="resources/js/challenge.js"></script>