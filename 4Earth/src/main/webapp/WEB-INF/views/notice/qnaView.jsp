<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 
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
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

      <div class="container">
        <div class="contents">
        <%@ include file="/WEB-INF/views/common/sideBar.jsp" %> 
          <section class="content-wrap">
            <div class="page-tit">
              <h3> ${ qna.title } </h3>
              <div class="bread-crumb">
                <a href="${ path }"
                  ><i class="material-icons md-16">home</i></a
                >
                <a href="#">About Us</a>
                <span>공지사항</span>
              </div>
            </div>
            <br />
            	<table class="notice_editor">
                <tr>
                	<td>작성자 </td>
                	<td>${ qna.writerId }</td>
									</td>
								</tr>
                <tr>
                	<td>첨부파일 </td>
										<c:if test="${ empty qna.originalFileName }">
											<span> - </span>
										</c:if>
										<c:if test="${ !empty qna.originalFileName }">
											<img src="../resources/images/file.png" width="20" height="20"/>
										
											<a href="javascript:fileDownload('${ qna.originalFileName }', '${qna.renamedFileName}')">
												<c:out value="${ qna.originalFileName }" />
											</a>
										</c:if>
										<td>작성일자 </td>
										<td>${ qna.modifyDate }</td>
								</tr>
                <tr>
                		<td>
                			작성내용 : 
                		</td>
                    <td>
                        ${ qna.content }
                    </td>
                </tr>
            	</table>
            	
            <div class="view_table_bottom">
              <a class="btn" href="${ path }/notice/qnalist" role="button"> 목록 </a>
              <a class="btn" href="${ path }/notice/qnaModify?no=${ qna.no }" role="button">
                수정하기
              </a>
              <a class="btn" href="${ path }/notice/qnaDelete" role="button">
                삭제하기
              </a>
            </div>
             
              	<ul>
		              <li>
		              	<c:choose> 
											<c:when test="${qna.no > 0}">
												<a href="${ path }/notice/qnaView?no=${ qna.no - 1 }" class="angle">
						                  	<i class="fa-solid fa-angle-up"></i> 이전글 </a
						                	>
											</c:when>
											<c:otherwise>
												<c:redirect url="/notice/qnaView?" context="/earth">
									        <c:param name="no" value="1"/>
												</c:redirect>
											</c:otherwise>
										</c:choose>
		              </li>
		              <li>
		                <a href="${ path }/notice/qnaView?no=${ qna.no + 1 }" class="angle">
		                  <i class="fa-solid fa-angle-down"></i>다음글 </a
		                >
		              </li>
            		</ul>
          </section>
        </div>
      </div>


<script>
$(document).ready(() => {
	$("#btnDelete").on("click", () => {
		if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
			location.replace("${ path }/notice/qnadelete?no=${ qna.no }");
		}
	})
});

function fileDownload(oname, rname) {
	
	// encodeURIComponent()
	//  - 아스키문자(a~z, A~Z, 1~9, ... )는 그대로 전달하고 기타 문자(한글, 특수 문자 등)만 %XX(16진수 2자리)와 같이 변환된다.
	location.assign("${ path }/notice/fileDown?oname=" + encodeURIComponent(oname) + "&rname=" + encodeURIComponent(rname));
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
