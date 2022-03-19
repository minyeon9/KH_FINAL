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
				<h3>이달의 챌린지</h3>
				<div class="bread-crumb">
					<a href="${ path }"><i class="material-icons md-16">home</i></a>
					<a href="${ path }/today_main">에코 챌린지</a> <span>이달의 챌린지</span>
				</div>
			</div>

			<div class="challenge">
				<div class="how-to">
					<strong>이달의 챌린지 참여 방법</strong>

					<div class="step">
						<ul class="step-list">
							<li>
								<i class="num">1</i>
								<div>
									<strong>로그인</strong>
									<p>모든 챌린지는 로그인 후 참여 가능합니다.</p>
								</div>
							</li>
							<li><i class="num">2</i>
								<div>
									<strong>썸네일 클릭</strong>
									<p>로그인 후 각 챌린지의 썸네일을 클릭하시면<br>챌린지 참여가 가능합니다.</p>
								</div>
							</li>
							<li>
								<i class="num">3</i>
								<div>
									<strong>사진 업로드</strong>
									<p>챌린지에 알맞은 사진을 업로드하여<br>챌린지 참여를 인증합니다.</p>
								</div>
							</li>
							<li>
								<i class="num">4</i>
								<div>
									<strong>필요 횟수 충족</strong>
									<p>이달의 챌린지는 각 챌린지 별 필요 횟수 충족 시,<br>챌린지 참여가 최종 완료됩니다.</p>
								</div>
							</li>
						</ul>
					</div>
				</div>

				<div class="challenge-sort" id="challengeSort">
					<form action="${ path }/challenge_arrange">
						<select name="arrange" id="challenge-arrange" class="selectbox" onchange="submit()">
							<option value="최신순" <c:if test="${arrange eq '최신순'}">selected</c:if>>최신순</option>
							<option value="높은포인트순" <c:if test="${arrange eq '높은포인트순'}">selected</c:if>>높은포인트순</option>
							<option value="낮은포인트순" <c:if test="${arrange eq '낮은포인트순'}">selected</c:if>>낮은포인트순</option>
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
											<img src="${ path }/resources/upload/challenge/${ monthList.renamedFilename }" alt="">
										</div>
										<div class="item-cont">
											<span class="tag tag-orange">
												<b>${ monthList.chalCount }</b>회
											</span>
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
						<a href="${ path }/challenge_arrange?page=1&count=${ pageInfo.listLimit }&arrange=${ arrange }#challengeSort" class="first">
							<span>맨 앞으로</span>
						</a>
						<a href="${ path }/challenge_arrange?page=${ status.current }&count=${ pageInfo.listLimit }&arrange=${ arrange }#challengeSort" class="prev">
							<span>이전</span>
						</a>
						<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
							<c:if test="${ status.current == pageInfo.currentPage }">
								<strong>${ status.current }</strong>
							</c:if>

							<c:if test="${ status.current != pageInfo.currentPage }">
								<a href="${ path }/challenge_arrange?page=${ status.current }&count=${ pageInfo.listLimit }&arrange=${ arrange }#challengeSort">${ status.current }</a>
							</c:if>
						</c:forEach>
						<a href="${ path }/challenge_arrange?page=${ pageInfo.nextPage }&count=${ pageInfo.listLimit }&arrange=${ arrange }#challengeSort" class="next">
							<span>다음</span>
						</a>
						<a href="${ path }/challenge_arrange?page=${ pageInfo.maxPage }&count=${ pageInfo.listLimit }&arrange=${ arrange }#challengeSort" class="last">
							<span>맨 뒤로</span>
						</a>
					</div>
					
					
				</div>
			</div>
		</section>


		<button class="btn scroll-top">
			<i class="material-icons md-24">vertical_align_top</i>
		</button>
	</div>
</div>

<script type="text/javascript">
	let idxNum = 1;
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script src="resources/js/challenge.js"></script>