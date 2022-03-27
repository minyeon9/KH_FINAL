<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<%@ include file="/WEB-INF/views/common/admin_header.jsp" %>

        <div class="container">
            <div class="contents">
                <div class="side-bar is-open">
                    <button class="btn toggle-nav">
                        <i class="material-icons md-24">last_page</i>
                    </button>
                    <ul>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                    </ul>
                </div>
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>신고받은 회원</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">신고</a>
                            <span>신고받은 회원</span>
                        </div>
                    </div>

                        <!-- Category -->
                        <section>
                            <div>
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="" class="selectbox">
                                            <option value="최신순" selected>최신순</option>
                                        </select>
                                        <select name="" id="count-select" class="selectbox">
                                            <option value="" selected="selected">목록 개수 선택</option>
                                            <option value="5">5개씩 보기</option>
                                            <option value="10">10개씩 보기</option>
                                            <option value="30">30개씩 보기</option>
                                        </select>
                                    </div>
                                    <div class="input-with-icon search-input">
                                        <input type="text" placeholder="검색어를 입력해주세요." id="search-val">
                                        <button id="search"><i class="material-icons">search</i></button>
                                    </div>
                                </div>
                            </div>

                            <div class="board">
                                <table class="table">
                                    <colgroup>
                                        <col width="10%">
                                        <col width="13%">
                                        <col width="*">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="20%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>회원 번호</th>
                                            <th>회원명</th>
                                            <th>가입일</th>
                                            <th>회원등급</th>
                                            <th>신고회수</th>
                                            <th>상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${ empty list }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="7">
													<div class="empty-content">
						                       			<i class="material-icons">info</i>
						                       			<p>조회된 회원이 없습니다.</p>
						                       		</div>
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty list }">
		                                <tbody>
											<c:forEach var="reported" items="${ list }">
		                                        <tr>
		                                            <td>${ reported.no }</td>
		                                            <td>${ reported.name }</td>
		                                            <td>${ reported.enrollDate }</td>
		                                            <td>${ reported.member_type }</td>
		                                            <td>${ reported.reportedTimes }</td>
		                                            <%-- <td><fmt:formatDate value="${ reported.reportDate }" pattern="yyy-MM-dd hh:mm"/></td> --%>
		                                            <td>${ reported.status }</td>
		                                            <td>
		                                                <button id="unban" name="no" value=${ reported.no } class="btn btn-s">해제</button>
		                                                <button id="ban" name="no" value=${ reported.no } class="btn btn-s gray">정지</button>
		                                            </td>
		                                        </tr>
											</c:forEach>
		                                </tbody>
									</c:if>
                                </table>
                            </div>
                            <div class="btn-wrap">
                            </div>
                        </section>
                        <!-- // Category -->
                        
                        <c:if test="${ !empty list }">
	                        <div class="paging">
								<!-- 맨 처음으로 -->
								<a class="first" href="${ path }/admin_member?page=1"></a>
					
								<!-- 이전 페이지로 -->
								<a class="prev" href="${ path }/admin_member?page=${ pageInfo.prevPage }"></a>
					
								<!--  10개 페이지 목록 -->
								<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">			
										<strong>${ status.current }</strong>
									</c:if>
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }/admin/member?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
					
								<!-- 다음 페이지로 -->
								<a class="next" href="${ path }/admin_member?page=${ pageInfo.nextPage }"></a>
					
								<!-- 맨 끝으로 -->
								<a class="last" href="${ path }/admin_member?page=${ pageInfo.maxPage }"></a>
							</div> 
						</c:if>                   
                    </div>
                    
            </section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	$(() => {
	    let sideBarMenu = $('.side-bar ul li');
	    let menuPath = ['${ path }/admin/report_list','${ path }/admin/reported_list' ];
	    let menuName = ['신고', '신고 받은 회원'];
	    let menuIcon = ['report_problem', 'people'];
	
	    for( let i = 0; i < menuName.length; i++ ) {
	        let menuIdx = sideBarMenu.eq(i);
	
	        menuIdx.find('a').attr('href', menuPath[i]);
	        menuIdx.find('a > i').text(menuIcon[i]);
	        menuIdx.find('a > span').text(menuName[i]);
	    }
	
	    sideBarMenu.each(function(idx, el) {
	        if(idx == 1) {
	            $(this).addClass('current');
	        }
	        
	        $('#count-select').on('change',  (e) => {
				location.replace("${ path }/admin/reported_list?count=" + e.target.value);
			})
	    });
	    
	    
	    $(document).ready(() => {
			$('#search').on('click', () => {
				location.replace("${ path }/admin/reported_list?name=" + $("#search-val").val());
			})
		});
	});
	
	$(document).ready(() => {
		$(document).on('click','#ban', (e) => {
			if(confirm("회원을 정지 하시겠습니까?")) {
				location.replace("${ path }/admin/member_delete?no=" + e.target.value);
			}
		})
	});
	
	$(document).ready(() => {
		$(document).on('click','#unban', (e) => {
			if(confirm("회원 정지를 해제 하시겠습니까?")) {
				location.replace("${ path }/admin/member_unban?no=" + e.target.value);
			}
		})
	});
</script>

</html>