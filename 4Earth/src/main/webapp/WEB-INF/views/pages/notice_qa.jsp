<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<div class="container">
	<div class="contents">
		<section class="content-wrap">
			<div class="page-tit">
				<section>
					<h3>1:1 문의</h3>
					<br>
					<div class="board-head">
						<div class="board-result">
							총 <span>7</span>건
						</div>
						<div class="select-wrap">
							<select name="" id="" class="selectbox">
								<option value="최신순" selected>최신순</option>
								<option value="댓글순">댓글순</option>
							</select> <select name="" id="" class="selectbox">
								<option value="10" selected>10개씩 보기</option>
								<option value="30">30개씩 보기</option>
							</select>
						</div>
					</div>
					<div class="board">
						<table class="table">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="*">
								<col width="10%">
								<col width="10%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th>No</th>
									<th>분류</th>
									<th>제목</th>
									<th>작성일</th>
									<th>작성자</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>배송</td>
									<td class="board-tit"><a href="#">배송은 며칠 걸리나요?</a></td>
									<td>2021.00.00</td>
									<td>홍길동</td>
									<td>답변 완료</td>
								</tr>
								<tr>
									<td>1</td>
									<td>배송</td>
									<td class="board-tit"><a href="#">배송은 며칠 걸리나요? 두 줄일 때
											두 줄일 때 두 줄일 때 배송은 며칠 걸리나요? 배송은 며칠 걸리나요? 배송은 며칠 걸리나요?</a></td>
									<td>2021.00.00</td>
									<td>홍길동</td>
									<td>
										<button class="btn btn-s">수락</button>
										<button class="btn btn-s gray">반려</button>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btn-wrap">
						<a class="btn" href="./notice_write.html" role="button"> 1:1
							문의하기 </a>
					</div>

					<div class="paging">
						<!-- 맨 처음으로 -->
						<a class="first"
							onclick="location.href='${ path }/board/list?page=1'">
						</a>

						<!-- 이전 페이지로 -->
						<a class="prev"
							onclick="location.href='${ path }/board/list?page=${ pageInfo.prevPage }'">
						</a>

						<!--  10개 페이지 목록 -->
						<c:forEach begin="${ pageInfo.startPage }"
							end="${ pageInfo.endPage }" varStatus="status">
							<c:if test="${ status.current == pageInfo.currentPage}">
								<button disabled>${ status.current }</button>
							</c:if>

							<c:if test="${ status.current != pageInfo.currentPage }">
								<button
									onclick="location.href='${ pageContext.request.contextPath }/board/list?page=${ status.current }'">
									${ status.current }</button>
							</c:if>
						</c:forEach>

						<!-- 다음 페이지로 -->
						<a class="next"
							onclick="location.href='${ path }/board/list?page=${ pageInfo.nextPage }'">
						</a>

						<!-- 맨 끝으로 -->
						<a class="last"
							onclick="location.href='${ path }/board/list?page=${ pageInfo.maxPage }'">
						</a>
					</div>
				</section>
			</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>