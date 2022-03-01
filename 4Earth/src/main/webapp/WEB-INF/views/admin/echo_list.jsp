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
                        <h3>에코샵 물품 목록</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코샵</a>
                            <span>에코샵 물품 목록</span>
                        </div>
                    </div>

                    <div class="guide">
                        <!-- Category -->
                        <section>
                            <div style="margin-bottom: 5px;">
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="" class="selectbox">
                                            <option value="최신순" selected>최신순</option>
                                            <option value="댓글순">댓글순</option>
                                        </select>
                                        <select name="" id="" class="selectbox">
                                            <option value="10" selected>10개씩 보기</option>
                                            <option value="30">30개씩 보기</option>
                                        </select>
                                        <div class="input-with-icon search-input">
                                            <input type="text" placeholder="검색어를 입력해주세요.">
                                            <button><i class="material-icons">search</i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="board">
                                <table class="table">
                                    <colgroup>
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="*">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>물품 번호</th>
                                            <th>물품 이름</th>
                                            <th>분류</th>
                                            <th>등록일</th>
                                            <th>재고 수</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${ empty list }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="6">
												조회된 멤버가 없습니다
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty list }">
										<c:forEach var="product" items="${ list }">
		                                    <tbody>
		                                        <tr>
		                                            <td>${ product.proNo }</td>
		                                            <td>${ product.proName }</td>
		                                            <td>${ product.proCat }</td>
		                                            <td>${ product.proDate }</td>
		                                            <td>${ product.proVol }</td>
		                                            <td>
		                                                <button class="btn btn-s">등록</button>
		                                                <button id="delete" name="no" value=${ product.proNo } class="btn btn-s gray">정지</button>
		                                            </td>
		                                        </tr>
		                                    </tbody>
										</c:forEach>
									</c:if>
                                </table>
                            </div>
                            <div class="btn-wrap">
                                <button class="btn">작성</button>
                            </div>
                        </section>
                        <!-- // Category -->
                        
                        <div class="paging">
							<a class="prev" href="${ path }/admin/echo_list?page=1"></a>
							<a class="prev" href="${ path }/admin/echo_list?page=${ pageInfo.prevPage }"><span>이전</span></a>
				
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:if test="${ status.current == pageInfo.currentPage }">			
									<strong>${ status.current }</strong>
								</c:if>
								<c:if test="${ status.current != pageInfo.currentPage }">				
									<a href="${ path }/admin/echo_list?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
								</c:if>
							</c:forEach>
							<a class="next" href="${ path }/admin/echo_list?page=${ pageInfo.nextPage }"><span>다음</span></a>
							<a class="next" href="${ path }/admin/echo_list?page=${ pageInfo.maxPage }"></a>
                         
				
						</div>                   
                    </div>
                    
            </section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	$(() => {
	    let sideBarMenu = $('.side-bar ul li');
	    let menuPath = ['${ path }/admin/echo_list','${ path }/admin/echo_order','${ path }/admin/echo_delivery','${ path }/admin/echo_order_cancel','${ path }/admin/echo_bidding'];
	    let menuName = ['에코샵 물품 목록', '주문 접수 목록', '발송 완료 목록', '주문 취소 목록', '물품 접수 목록'];
	    let menuIcon = ['home', 'home', 'home', 'home', 'home']
	
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
	    });
	});
	
	$(document).ready(() => {
		$("#delete").on("click", (e) => {
			if(confirm("정말로 이 물품 판매를 정지시키겠습니까??")) {
				location.replace("${ path }/admin/echo_pro_delete?no=" + e.target.value);
			}
		})
	});
</script>

</html>