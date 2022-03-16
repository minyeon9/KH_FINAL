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
				<h3>오늘의 챌린지</h3>
				<div class="bread-crumb">
					<a href="${ path }"><i class="material-icons md-16">home</i></a>
					<a href="${ path }/today_main">에코 챌린지</a> <span>오늘의 챌린지</span>
				</div>
			</div>

			<div class="challenge today">
				<c:if test="${ mapLength == 4 }">
					<div class="complete-info">
						<p>
							<strong>${ todayDateStr }</strong>
							오늘의 챌린지 달성이 완료되었습니다!<br>내일도 챌린지에 참여해주세요.
						</p>
					</div>
				</c:if>

				<div class="thumb-list vertical challenge">
					<ul>
						<c:if test="${ !empty todayList }">
							<c:forEach var="todayList" items="${ todayList }" varStatus="listStatus">
								<c:set var="myListNumberSet" value="${ myListNumber }" />
								<c:choose>
									<c:when test="${fn:contains(myListNumberSet, todayList.chalNo)}">
										<li class="complete">
											<i class="num">${ listStatus.count }</i>
											<div class="item">
												<div class="img-thumb">
													<img src="${ path }/resources/images/challenge/${ todayList.renamedFilename }" alt="">
												</div>
												<div class="item-cont">
													<strong>${ todayList.chalTitle }</strong>
													<p>${ todayList.chalContent }</p>
													<span>
														오늘의 챌린지 모두 달성 시
														<em class="icon-point">
															<fmt:formatNumber pattern="##,###" value="${ todayList.chalPoint }" />
														</em>
													</span>

													<button class="btn gray" disabled>참여완료</button>
												</div>
											</div>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<i class="num">${ listStatus.count }</i>
											<div class="item">
												<div class="img-thumb">
													<img src="${ path }/resources/images/challenge/${ todayList.renamedFilename }" alt="">
												</div>
												<div class="item-cont">
													<strong>${ todayList.chalTitle }</strong>
													<p>${ todayList.chalContent }</p>
													<span>
														오늘의 챌린지 모두 달성 시
														<em class="icon-point">
															<fmt:formatNumber pattern="##,###" value="${ todayList.chalPoint }" />
														</em>
													</span>
													<button class="btn" onclick="location.href='${ path }/today_view?chalNo=${ todayList.chalNo }'">참여하기</button>
												</div>
											</div>
											</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
		</section>

		<button class="btn scroll-top">
			<i class="material-icons md-24">vertical_align_top</i>
		</button>
	</div>
</div>

<script type="text/javascript">
	let idxNum = 0;
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="resources/js/challenge.js"></script>