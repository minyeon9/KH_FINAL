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

				<div class="tab">
					<div class="tab-title">
						<a href="#tab01" class="is-open">적립 내역</a>
						<a href="#tab02">사용 내역</a>
						<a href="#tab03">소멸 예정 내역</a>
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
											<th>적립 포인트</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${ !empty savePoint }">
											<c:forEach var="savePoint" items="${ savePoint }">
												<tr>
													<td>
														<fmt:formatDate value="${ savePoint.saveDate }" pattern="yyyy-MM-dd"/>
													</td>
													<td>${ savePoint.saveContent }</td>
													<td>
														<span class="point-plus">
															<fmt:formatNumber pattern="##,###" value="${ savePoint.savePoint }" />
														</span>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										
										<c:if test="${ empty savePoint }">
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
								
								<%-- <c:if test="${ !empty savePoint }">
									<div class="paging">
										<a href="${ path }/point?page=1" class="first"><span>맨 앞으로</span></a>
										<a href="${ path }/point?page=${ pageInfo.prevPage }" class="prev"><span>이전</span></a>
										<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
											<c:if test="${ status.current == pageInfo.currentPage }">
												<strong>${ status.current }</strong>
											</c:if>
				
											<c:if test="${ status.current != pageInfo.currentPage }">
												<a href="${ path }/month_list?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
												<a href="${ path }/challenge_arrange?page=${ status.current }&count=${ pageInfo.listLimit }&arrange=${ arrange }">${ status.current }</a>
											</c:if>
										</c:forEach>
										<a href="${ path }/point?page=${ pageInfo.nextPage }" class="next"><span>다음</span></a>
										<a href="${ path }/point?page=${ pageInfo.maxPage }" class="last"><span>맨 뒤로</span></a>
									</div>
								</c:if> --%>
							</div>
						</div>
						
						<div class="tab-view" id="tab02">
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
										<c:if test="${ !empty spendPoint }">
											<c:forEach var="spendPoint" items="${ spendPoint }">
												<tr>
													<td>
														<fmt:formatDate value="${ spendPoint.spendDate }" pattern="yyyy-MM-dd"/>
													</td>
													<td>${ spendPoint.spendContent }</td>
													<td>
														<span class="point-minus">
															<fmt:formatNumber pattern="##,###" value="${ spendPoint.spendPoint }" />
														</span>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										
										<c:if test="${ empty spendPoint }">
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
								
								<%-- <c:if test="${ !empty spendPoint }">
									<div class="paging">
										<a href="${ path }/point?spendPage=1#tab02" class="first"><span>맨 앞으로</span></a>
										<a href="${ path }/point?spendPage=${ spendPageInfo.prevPage }#tab02" class="prev"><span>이전</span></a>
										<c:forEach begin="${ spendPageInfo.startPage }" end="${ spendPageInfo.endPage }" varStatus="spendStatus">
											<c:if test="${ spendStatus.current == spendPageInfo.currentPage }">
												<strong>${ spendStatus.current }</strong>
											</c:if>
				
											<c:if test="${ spendStatus.current != spendPageInfo.currentPage }">
												<a href="${ path }/month_list?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
												<a href="${ path }/point?spendPage=${ spendStatus.current }&count=${ pageInfo.listLimit }#tab02">${ spendStatus.current }</a>
											</c:if>
										</c:forEach>
										<a href="${ path }/point?spendPage=${ spendPageInfo.nextPage }#tab02" class="next"><span>다음</span></a>
										<a href="${ path }/point?spendPage=${ spendPageInfo.maxPage }#tab02" class="last"><span>맨 뒤로</span></a>
									</div>
									
								</c:if> --%>
							</div>
						</div>
						
						<div class="tab-view" id="tab03">
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
										<c:if test="${ !empty disapearPoint }">
											<c:forEach var="disapearPoint" items="${ disapearPoint }">
												<tr>
													<td>
														<fmt:formatDate value="${ disapearPoint.disapearDate }" pattern="yyyy-MM-dd"/>
													</td>
													<td>${ disapearPoint.saveContent }</td>
													<td>
														<span class="point-minus">
															<fmt:formatNumber pattern="##,###" value="${ disapearPoint.savePoint }" />
														</span>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										
										<c:if test="${ empty disapearPoint }">
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
								
								<%-- <c:if test="${ !empty savePoint }">
									<div class="paging">
										<a href="${ path }/point?page=1" class="first"><span>맨 앞으로</span></a>
										<a href="${ path }/point?page=${ pageInfo.prevPage }" class="prev"><span>이전</span></a>
										<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
											<c:if test="${ status.current == pageInfo.currentPage }">
												<strong>${ status.current }</strong>
											</c:if>
				
											<c:if test="${ status.current != pageInfo.currentPage }">
												<a href="${ path }/month_list?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
												<a href="${ path }/challenge_arrange?page=${ status.current }&count=${ pageInfo.listLimit }&arrange=${ arrange }">${ status.current }</a>
											</c:if>
										</c:forEach>
										<a href="${ path }/point?page=${ pageInfo.nextPage }" class="next"><span>다음</span></a>
										<a href="${ path }/point?page=${ pageInfo.maxPage }" class="last"><span>맨 뒤로</span></a>
									</div>
								</c:if> --%>
								
								<p class="notice-txt">- 포인트 소멸 예정일이 한 달 미만인 내역만 조회 됩니다.</p>
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
<script>
	let idxNum = 0;
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script src="resources/js/mypage.js"></script>