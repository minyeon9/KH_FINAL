<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
.ck-editor__editable {
	min-height: 400px;
}
</style>
<script src="../resources/ckeditor5/build/ckeditor.js"></script>
<title>공지사항</title>
<link rel="shortcut icon" href="${ path }/resources/favicon.ico">
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<div class="container">
	<div class="contents">
		<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
		<section class="content-wrap">
			<div class="page-tit">
				<h3>${ qna.title }</h3>
				<div class="bread-crumb">
					<a href="${ path }"><i class="material-icons md-16">home</i></a> <a
						href="${ path }/notice/list">About Us</a> <span>1:1 문의</span>
				</div>
			</div>
			<br />
			<table class="store-editor">
				<tr>
					<td class="img-thumb"><c:if
							test="${ !empty qna.originalFileName }">
							<!-- <img src="../resources/images/common/file.gif" width="20" height="20"/> -->
							<img
								src="${ path }/resources/upload/notice/${ qna.renamedFileName }"
								width="800" height="400" alt="">

							<%-- <a href="javascript:fileDownload('${ notice.originalFileName }', '${notice.renamedFileName}')">
												<c:out value="${ notice.originalFileName }" /> 
											</a>--%>
						</c:if></td>
				</tr>
				<tr>
					<td>${ qna.content }</td>
				</tr>
			</table>

			<div class="view_table_bottom">
				<c:choose>
					<c:when test="${qna.no > 0}">
						<a href="${ path }/notice/view?no=${ qna.no - 1 }" class="btn">
							<i class="fa-solid fa-angle-up"></i> 이전글
						</a>
					</c:when>
					<c:otherwise>
						<c:redirect url="/notice/qnaView?" context="/earth">
							<c:param name="no" value="1" />
						</c:redirect>
					</c:otherwise>
				</c:choose>
				<a class="btn" href="${ path }/notice/qnalist" role="button"> 목록
				</a>

				<c:if
					test="${ ! empty loginMember && loginMember.id == qna.writerId }">
					<a class="btn" href="${ path }/notice/qnaModify?no=${ qna.no }"
						role="button"> 수정 </a>
					<a class="btn" id="btnDelete"
						href="${ path }/notice/qnaDelete?no=${ qna.no }" role="button">
						삭제 </a>
				</c:if>

				<a href="${ path }/notice/qnaView?no=${ qna.no + 1 }" class="btn">
					<i class="fa-solid fa-angle-down"></i>다음글
				</a>
			</div>
		</section>
	</div>
</div>


<script>
$(() => {
    let sideBarMenu = $('.side-bar ul li');
    let menuPath = ['list', 'faq','qnalist'];
    let menuName = ['공지사항', 'FAQ', '1:1 문의'];
    let menuIcon = ['home', 'home', 'home' ]

    for( let i = 0; i < menuName.length; i++ ) {
        let menuIdx = sideBarMenu.eq(i);

        menuIdx.find('a').attr('href', menuPath[i]);
        menuIdx.find('a > i').text(menuIcon[i]);
        menuIdx.find('a > span').text(menuName[i]);
    }
    sideBarMenu.each(function(idx, el) {
        if(idx == 2) {
            $(this).addClass('current');
        }
    })
});


$(document).ready(() => {
	$("#btnDelete").on("click", () => {
		if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
			location.replace("${ path }/notice/qnaDelete?no=${ qna.no }");
		}
	})
});

function fileDownload(oname, rname) {
	
	// encodeURIComponent()
	//  - 아스키문자(a~z, A~Z, 1~9, ... )는 그대로 전달하고 기타 문자(한글, 특수 문자 등)만 %XX(16진수 2자리)와 같이 변환된다.
	location.assign("${ path }/notice/fileDown?oname=" + encodeURIComponent(oname) + "&rname=" + encodeURIComponent(rname));
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>