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
				<h3>
					포인트 내역
					<span>챌린지 참여를 통해 포인트 적립 후 상품 구매 시 사용 가능합니다.</span>
				</h3>
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
						<p class="icon-point">
							<fmt:formatNumber pattern="##,###" value="${ usePoint }" />
						</p>
					</div>
					<div class="box">
						<strong>적립</strong>
						<p class="icon-point">
							<fmt:formatNumber pattern="##,###" value="${ saveTotal }" />
						</p>
					</div>
					<div class="box">
						<strong>사용</strong>
						<p class="icon-point">
							<fmt:formatNumber pattern="##,###" value="${ spendTotal }" />
						</p>
					</div>
					<div class="box">
						<strong>소멸 예정</strong>
						<p class="icon-point">
							<fmt:formatNumber pattern="##,###" value="${ disapearTotal }" />
						</p>
					</div>
				</div>

				<c:if test="${ arrange eq '적립내역'}">
					<div class="tab">
						<form action="${ path }/point">
							<div class="tab-title">
								<button type="submit" class="is-open" name="arrange" value="적립내역">적립 내역</button>
								<button type="submit" name="arrange" value="사용내역">사용 내역</button>
								<button type="submit" name="arrange" value="소멸내역">소멸 예정 내역</button>
							</div>
						</form>
						
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
												<th>적립 포인트</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${ !empty point }">
												<c:forEach var="point" items="${ point }">
													<tr>
														<td>
															<fmt:formatDate value="${ point.saveDate }" pattern="yyyy-MM-dd"/>
														</td>
														<td>${ point.saveContent }</td>
														<td>
															<span class="point-plus">
																<fmt:formatNumber pattern="##,###" value="${ point.savePoint }" />
															</span>
														</td>
													</tr>
												</c:forEach>
											</c:if>
										
											<c:if test="${ empty point }">
												<tr>
													<td colspan="3">
														<div class="empty-content">
															<i class="material-icons">info</i>
															<p>포인트 적립 내역이 없습니다.</p>
														</div>
													</td>
												</tr>												
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div> <!-- // tab-content -->
					</div> <!-- // tab -->
				</c:if>
						
				<c:if test="${ arrange eq '사용내역'}">
					<div class="tab tab-point">
						<form action="${ path }/point">
							<div class="tab-title">
								<button type="submit" name="arrange" value="적립내역">적립 내역</button>
								<button type="submit" class="is-open" name="arrange" value="사용내역">사용 내역</button>
								<button type="submit" name="arrange" value="소멸내역">소멸 예정 내역</button>
							</div>
						</form>
						
						<div class="tab-content">
							<div class="tab-view is-open" id="tab02">
								<div class="board">
									<table class="table">
										<colgroup>
											<col width="20%">
											<col width="*">
											<col width="20%">
										</colgroup>
										<thead>
											<tr>
												<th>사용일</th>
												<th>상세 내역</th>
												<th>사용 포인트</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${ !empty point }">
												<c:forEach var="point" items="${ point }">
													<tr>
														<td>
															<fmt:formatDate value="${ point.spendDate }" pattern="yyyy-MM-dd"/>
														</td>
														<td>${ point.spendContent }</td>
														<td>
															<span class="point-minus">
																<fmt:formatNumber pattern="##,###" value="${ point.spendPoint }" />
															</span>
														</td>
													</tr>
												</c:forEach>
											</c:if>
											
											<c:if test="${ empty point }">
												<tr>
													<td colspan="3">
														<div class="empty-content">
															<i class="material-icons">info</i>
															<p>포인트 사용 내역이 없습니다.</p>
														</div>
													</td>
												</tr>												
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div> <!-- // tab-content -->
					</div> <!-- // tab -->
				</c:if>
						
				<c:if test="${ arrange eq '소멸내역'}">
					<div class="tab tab-point">
						<form action="${ path }/point">
							<div class="tab-title">
								<button type="submit" name="arrange" value="적립내역">적립 내역</button>
								<button type="submit" name="arrange" value="사용내역">사용 내역</button>
								<button type="submit" class="is-open" name="arrange" value="소멸내역">소멸 예정 내역</button>
							</div>
						</form>
						
						<div class="tab-content">
							<div class="tab-view is-open" id="tab03">
								<div class="board">
									<table class="table">
										<colgroup>
											<col width="20%">
											<col width="*">
											<col width="20%">
										</colgroup>
										<thead>
											<tr>
												<th>소멸 예정일</th>
												<th>상세 내역</th>
												<th>소멸 예정 포인트</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${ !empty point }">
												<c:forEach var="point" items="${ point }">
													<tr>
														<td>
															<fmt:formatDate value="${ point.disapearDate }" pattern="yyyy-MM-dd"/>
														</td>
														<td>${ point.saveContent }</td>
														<td>
															<span class="point-minus">
																<fmt:formatNumber pattern="##,###" value="${ point.savePoint }" />
															</span>
														</td>
													</tr>
												</c:forEach>
											</c:if>
											
											<c:if test="${ empty point }">
												<tr>
													<td colspan="3">
														<div class="empty-content">
															<i class="material-icons">info</i>
															<p>포인트 소멸 예정 내역이 없습니다.</p>
														</div>
													</td>
												</tr>												
											</c:if>
										</tbody>
									</table>
									<p class="notice-txt">- 포인트 소멸 예정일이 30일 미만인 내역만 조회 됩니다.</p>
								</div>
							</div>
						</div> <!-- // tab-content -->
					</div> <!-- // tab -->
				</c:if>
				
				<c:if test="${ !empty point }">
					<div class="paging">
						<a href="${ path }/point?page=1&count=${ pageInfo.listLimit }&arrange=${ arrange }" class="first">
							<span>맨 앞으로</span>
						</a>
						<a href="${ path }/point?page=${ status.current }&count=${ pageInfo.listLimit }&arrange=${ arrange }" class="prev">
							<span>이전</span>
						</a>
						<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
							<c:if test="${ status.current == pageInfo.currentPage }">
								<strong>${ status.current }</strong>
							</c:if>

							<c:if test="${ status.current != pageInfo.currentPage }">
								<a href="${ path }/point?page=${ status.current }&count=${ pageInfo.listLimit }&arrange=${ arrange }">${ status.current }</a>
							</c:if>
						</c:forEach>
						<a href="${ path }/point?page=${ pageInfo.nextPage }&count=${ pageInfo.listLimit }&arrange=${ arrange }" class="next">
							<span>다음</span>
						</a>
						<a href="${ path }/point?page=${ pageInfo.maxPage }&count=${ pageInfo.listLimit }&arrange=${ arrange }" class="last">
							<span>맨 뒤로</span>
						</a>
					</div>
				</c:if>
					
				
				
			</div> <!-- point -->
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
            if(idx == 0) {
                $(this).addClass('current');
            }
        });
	});
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>