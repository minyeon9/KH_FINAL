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
											<th>적립/사용</th>
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
													<td><span class="point-plus">${ savePoint.savePoint }</span></td>
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
											<th>적립/사용</th>
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
													<td><span class="point-minus">${ spendPoint.spendPoint }</span></td>
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
							</div>
						</div>
						
						<div class="tab-view" id="tab03">
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
<script>
	let idxNum = 0;
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script src="resources/js/mypage.js"></script>