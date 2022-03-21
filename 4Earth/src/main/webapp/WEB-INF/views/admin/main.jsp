<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<%@ include file="/WEB-INF/views/common/admin_header.jsp" %>

        <div class="container" style="background: #f9f9f9;">
            <div class="contents">
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>4Earth 관리</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <span>4Earth 관리</span>
                        </div>
                    </div>

                    <div class="admin-category">
                        <ul>
                            <li><a href='${ path }/admin/notice'><i class="material-icons md-36">assignment</i>게시판</a></li>
                            <li ><a href='${ path }/admin/member'><i class="material-icons md-36">person</i>회원</a></li>
                            <li><a href="${ path }/admin/qna"><i class="material-icons md-36">live_help</i>문의</a></li>
                            <li><a href="${ path }/admin/report_list"><i class="material-icons md-36">report_problem</i>신고</a></li>
                            <li><a href="${ path }/admin/challenge_today"><i class="material-icons md-36">checklist</i>챌린지</a></li>
                            <li><a href="${ path }/admin/echo_list"><i class="material-icons md-36">storefront</i>에코샵</a></li>
                        </ul>
                    </div>
                        
                    
            </section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

</html>