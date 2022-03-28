<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>공지사항</title>
<link rel="shortcut icon" href="${ path }/resources/favicon.ico">
</head>

<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container">
	<div class="contents">
		<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
		<section class="content-wrap">
			<div class="page-tit">
				<h3>공지사항</h3>
				<div class="bread-crumb">
					<a href="${ path }"><i class="material-icons md-16">home</i></a> <a
						href="#">About Us</a> <span>공지사항</span>
				</div>
			</div>
			<br />
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>파일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ empty list }">
						<tr>
							<td colspan="6">
								<div class="empty-content">
									<i class="material-icons">info</i>
									<p>조회된 공지사항 내역이 없습니다.</p>
								</div>
							</td>
						</tr>
					</c:if>
					<c:if test="${ !empty list }">
						<c:forEach var="notice" items="${ list }">
							<tr>
								<td>${ notice.no }</td>
								<td><a href="${ path }/notice/view?no=${ notice.no }">
										${ notice.title } </a></td>
								<td>${ notice.writerId }</td>
								<td><fmt:formatDate type="date"
										value="${ notice.createDate }" /></td>
								<td><c:if test="${ empty notice.originalFileName }">
										<span> - </span>
									</c:if> <c:if test="${ !empty notice.originalFileName }">
										<!-- <img src="../resources/images/common/file.gif" width="20" height="20"/> -->
										<i class="material-icons md-22">save</i>
									</c:if></td>
							</tr>
						</c:forEach>

					</c:if>
				</tbody>
			</table>
			<div class="table_bottom">

				<div class="input-with-icon search-input">
					<input type="text" placeholder="검색어를 입력해주세요." id="search-val" />
					<button id="search">
						<i class="material-icons">search</i>
					</button>
				</div>

				<c:if test="${ loginMember.member_type eq 'ADMIN' }">
					<a class="btn" href="${ path }/notice/write" role="button"> 글쓰기
					</a>
				</c:if>
			</div>

			<div class="paging">
				<!-- 맨 처음으로 -->
				<a class="first" href="${ path }/notice/list?page=1"> </a>

				<!-- 이전 페이지로 -->
				<a class="prev"
					href="${ path }/notice/list?page=${ pageInfo.prevPage }"> </a>

				<!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }"
					end="${ pageInfo.endPage }" varStatus="status">
					<c:if test="${ status.current == pageInfo.currentPage}">
						<strong>${ status.current }</strong>
					</c:if>

					<c:if test="${ status.current != pageInfo.currentPage }">
						<a
							href="${ path }/notice/list?page=${ status.current }&count=${ pageInfo.listLimit }">
							${ status.current } </a>
					</c:if>
				</c:forEach>

				<!-- 다음 페이지로 -->
				<a class="next"
					href="${ path }/notice/list?page=${ pageInfo.nextPage }"> </a>

				<!-- 맨 끝으로 -->
				<a class="last"
					href="${ path }/notice/list?page=${ pageInfo.maxPage }"> </a>
			</div>

		</section>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script src="../resources/js/notice.js"></script>
<script>
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['list', 'faq','qnalist'];
        let menuName = ['공지사항', 'FAQ', '1:1 문의'];
        let menuIcon = ['description', 'quiz', 'headset_mic' ];

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
        })
    });
    
    $("#search").ready(() => {
			$("#search").on('click', () => {
				location.replace("${ path }/notice/list?title=" + $("#search-val").val());
			})
		});
</script>