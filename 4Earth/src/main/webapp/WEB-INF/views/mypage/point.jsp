<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>포인트 내역</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container">
	<div class="contents">
		<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>

		<section class="content-wrap">
			<div class="page-tit">
				<h3>포인트 내역</h3>
				<div class="bread-crumb">
					<a href="${ path }"><i class="material-icons md-16">home</i></a>
					<a href="javascript:void(0);">마이페이지</a>
					<span>포인트 내역</span>
				</div>
			</div>

			<div class="point">
				<div class="point-details">
					<div class="point-deco">
						<span>P</span>
					</div>
					<div class="available">
						<strong>사용 가능한 포인트</strong>
						<p class="icon-point">1,890</p>
					</div>
					<div class="box">
						<strong>적립</strong>
						<p class="icon-point">1,890</p>
					</div>
					<div class="box">
						<strong>소멸 예정</strong>
						<p class="icon-point">500</p>
					</div>
				</div>

				<div class="tab">
					<div class="tab-title">
						<a href="#tab01" class="is-open">적립/사용 내역</a> <a href="#tab02">소멸 예정</a>
					</div>
					<div class="tab-content">
						<div class="tab-view is-open" id="tab01">
							<div class="board">
								<table class="table">
									<colgroup>
										<col width="20%">
										<col width="*">
										<col width="20%">
									</colgroup>
									<thead>
										<tr>
											<th>적립일</th>
											<th>상세 내역</th>
											<th>적립/사용</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>0000-00-00</td>
											<td>오늘의 챌린지 달성</td>
											<td><span class="plus">1,000</span></td>
										</tr>
										<tr>
											<td>0000-00-00</td>
											<td>상품 구매</td>
											<td><span class="minus">1,000</span></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="tab-view" id="tab02">
							<div class="empty-content">
								<i class="material-icons">info</i>
								<p>포인트 소멸 예정 내역이 없습니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<button class="btn scroll-top">
			<i class="material-icons md-24">vertical_align_top</i>
		</button>

	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['#', '#','#', '#', '#', '#'];
        let menuName = ['포인트 내역', '주문/배송 내역', '찜한 상품', '1:1문의 내역', '참여 중인 챌린지', '내정보'];
        let menuIcon = ['savings', 'local_shipping', 'favorite', 'headset_mic', 'bookmark_border', 'person']

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }
    });
</script>

</html>