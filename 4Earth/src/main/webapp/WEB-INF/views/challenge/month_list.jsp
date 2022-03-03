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
                        <h3>이달의 챌린지</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="${ path }/today_main">에코 챌린지</a>
                            <span>이달의 챌린지</span>
                        </div>
                    </div>

                    <div class="challenge">
                        <div class="challenge-sort">
                            <form action="" method="">
                                <select name="filter" id="filter" class="selectbox">
                                    <option value="최신순" selected>최신순</option>
                                    <option value="높은 포인트순">높은 포인트순</option>
                                    <option value="낮은 포인트순">낮은 포인트순</option>
                                </select>
                            </form>
                        </div>

                        <div class="thumb-list vertical col-2">
                            <ul>
                            	<c:if test="${ !empty monthList }">
									<c:forEach var="monthList" items="${ monthList }">
		                                <li class="complete">
		                                    <a href="${ path }/month_view?chalNo=${ monthList.chalNo }">
		                                        <div class="img-thumb">
		                                            <img src="${ path }/resources/images/challenge/challenge_today01.jpg" alt="">
		                                        </div>
		                                        <div class="item-cont">
		                                            <strong>${ monthList.chalTitle }</strong>
		                                            <p>${ monthList.chalContent }</p>
		                                            <span class="icon-point">
		                                            	<fmt:formatNumber pattern="##,###" value="${ monthList.chalPoint }" />
		                                            </span>
		                                        </div>
		                                    </a>
		                                </li>
									</c:forEach>
								</c:if>
                            </ul>
                            
                            <div class="paging">
                            	<a href="${ path }/month_list?page=1" class="first"><span>맨 앞으로</span></a>
                                <a href="${ path }/month_list?page=${ pageInfo.prevPage }" class="prev"><span>이전</span></a>
                                
                                
                                
                                <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">	
										<strong>${ status.current }</strong>
									</c:if>
									
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }/month_list?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
                                <a href="${ path }/month_list?page=${ pageInfo.nextPage }" class="next"><span>다음</span></a>
                                <a href="${ path }/month_list?page=${ pageInfo.maxPage }" class="last"><span>맨 뒤로</span></a>
                            </div>
                        </div>
                    </div>
                </section>


                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<script type="text/javascript">
let idxNum=1;
</script>          

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script src="resources/js/challenge.js"></script>