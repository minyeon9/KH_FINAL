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
                    <h3>오늘의 챌린지</h3>
                    <div class="bread-crumb">
                        <a href="${ path }"><i class="material-icons md-16">home</i></a>
                        <a href="javascript:void(0);">에코 챌린지</a>
                        <span>오늘의 챌린지</span>
                    </div>
                </div>

                <div class="challenge today">
                    <div class="how-to">
                        <strong>오늘의 챌린지 참여 방법</strong>
                        <p>어쩌고 저쩌고<br>어쩌고 저쩌고<br>어쩌고 저쩌고<br>어쩌고 저쩌고<br>어쩌고 저쩌고</p>
                    </div>

                    <div class="thumb-list">
                       	<c:if test="${ empty todayList }">
                       		<div class="empty-content">
                       			<p>조회된 오늘의 챌린지가 없습니다.</p>
                       		</div>
                       	</c:if>
                        <ul>
                        	<c:if test="${ !empty todayList }">
	                         	<c:forEach var="todayList" items="${ todayList }">
	                              <li>
	                                  <i class="num">${ todayList.chalNo }</i>
	                                  <div class="img-thumb">
	                                      <img src="${ path }${todayList.chalImgPath}/challenge_today0${todayList.chalNo}.jpg" alt="">
	                                  </div>
	                                  <strong>${ todayList.chalTitle }</strong>
	                                  <p>${ todayList.chalContent }</p>
	                              </li>
								</c:forEach>
							</c:if>
                        </ul>
                    </div>
                    
                    <c:if test="${ !empty todayList }">
	                    <div class="btn-wrap">
	                        <a href="${ path }/today_view" class="btn">참여하기</a>
	                    </div>
					</c:if>
                </div>

            </section>

            <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
        </div>
    </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['/4earth/today_list', '/4earth/month_list', '/4earth/ongoing_list'];
        let menuName = ['오늘의 챌린지', '이달의 챌린지', '참여 중인 챌린지'];
        let menuIcon = ['task_alt', 'public', 'bookmark_border' ]

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }

        sideBarMenu.each(function(idx, el) {
            if(idx == 0) {
                $(this).addClass('current');
            }
        });
    });
</script>

</html>