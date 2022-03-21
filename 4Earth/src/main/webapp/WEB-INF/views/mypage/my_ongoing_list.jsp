<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>챌린지</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
	<div class="contents">
		<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

		<section class="content-wrap">
			<div class="page-tit">
				<h3>참여 중인 챌린지</h3>
				<div class="bread-crumb">
					<a href="${ path }"><i class="material-icons md-16">home</i></a>
					<a href="${ path }/today_main">에코 챌린지</a> <span>참여 중인 챌린지</span>
				</div>
			</div>

			<div class="challenge">
				<div class="thumb-list ongoing">
					<c:if test="${ empty ongoingList }">
						<div class="empty-content full">
							<i class="material-icons">info</i>
							<p>참여 중인 챌린지가 없습니다.</p>
							<a class="btn" href="${ path }/month_list">챌린지 참여하러 가기</a>
						</div>
					</c:if>
					
					<c:if test="${ !empty ongoingList }">
						<ul>
							<c:forEach var="ongoingList" items="${ ongoingList }">
								<li class="complete">
									<c:set var="myCount" value="${ fn:length(count) }" />
									<a href="${ path }/month_view?chalNo=${ ongoingList.chalNo }">
										<div class="img-thumb">
											<img src="${ path }/resources/upload/challenge/${ ongoingList.renamedFilename }" alt="">
										</div>
										<div class="item-cont">
											<strong>${ ongoingList.chalTitle }</strong>
											<p>${ ongoingList.chalContent }</p>
											<div class="my-count">
												<span>참여 현황</span>
												<em>${ ongoingList.myCount }</em>/${ ongoingList.chalCount }
											</div>
										</div>
									</a>
								</li>
							</c:forEach>
						</ul>
						
						<div class="paging">
							<a href="${ path }/ongoing_list?page=1" class="first"><span>맨 앞으로</span></a>
							<a href="${ path }/ongoing_list?page=${ pageInfo.prevPage }" class="prev"><span>이전</span></a>
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:if test="${ status.current == pageInfo.currentPage }">
									<strong>${ status.current }</strong>
								</c:if>
	
								<c:if test="${ status.current != pageInfo.currentPage }">
									<a href="${ path }/ongoing_list?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
								</c:if>
							</c:forEach>
							<a href="${ path }/ongoing_list?page=${ pageInfo.nextPage }" class="next"><span>다음</span></a>
							<a href="${ path }/ongoing_list?page=${ pageInfo.maxPage }" class="last"><span>맨 뒤로</span></a>
						</div>
					</c:if>
					
				</div>
			</div>
		</section>

		<button class="btn scroll-top">
			<i class="material-icons md-24">vertical_align_top</i>
		</button>
	</div>
</div>

<script>
	$(() => {
		let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['/4earth/point', '/4earth/order','/4earth/wishlist', '/4earth/my_ongoing_list', '/4earth/profile_view'];
        let menuName = ['포인트 내역', '주문/배송 내역', '찜한 상품', '참여 중인 챌린지', '내정보'];
        let menuIcon = ['savings', 'local_shipping', 'favorite', 'headset_mic', 'bookmark_border', 'person']

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }
        
        sideBarMenu.each(function(idx, el) {
            if(idx == 3) {
                $(this).addClass('current');
            }
        });
	});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>