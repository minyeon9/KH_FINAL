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
                       <a href="${ path }today_list">에코 챌린지</a>
                       <span>오늘의 챌린지</span>
                   </div>
	            </div>
	
	            <div class="challenge">
	                <div class="complete-page">
	                    <div class="img-thumb">
	                        <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
	                    </div>
	                    <p><span>${ loginMember.id }</span>님, 오늘의 챌린지 인증이 완료되었습니다.</p>
	                    <strong><span>${ today.chalTitle }</span> 달성 완료되었습니다!</strong>
	                    <a href="${ path }/today_list" class="btn">오늘의 챌린지 메인으로</a>
	                </div>
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