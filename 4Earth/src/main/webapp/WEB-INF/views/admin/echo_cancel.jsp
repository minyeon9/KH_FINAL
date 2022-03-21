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
                        <h3>주문 취소</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코샵</a>
                            <span>주문 취소</span>
                        </div>
                    </div>

                        <!-- Category -->
                        <section>
                            <div>
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="member-select" class="selectbox">
                                            <option value="1" selected>번호순</option>
                                            <option value="2">회원번호</option>
                                        </select>
                                        <select name="" id="" class="selectbox">
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
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="*">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>주문 번호</th>
                                            <th>주문 회원 번호</th>
                                            <th>주문 금액</th>
                                            <th>주문일</th>
                                            <th>상태</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${ empty orderList }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="6">
													<div class="empty-content">
						                       			<i class="material-icons">info</i>
						                       			<p>조회된 주문 취소 내역이 없습니다.</p>
						                       		</div>
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty orderList }">
	                                    <tbody>
											<c:forEach var="order" items="${ orderList }" varStatus="vs">
		                                        <tr>
		                                            <td>${ order.orderNo }</td>
		                                            <td>${ order.memberNo }</td>
		                                            <td>${ order.orderPrice }</td>
		                                            <td>
		                                            	<fmt:formatDate value="${ order.orderDate }" pattern="yyy-MM-dd hh:mm"/>
		                                            </td>
		                                            <td>
		                                            	<button class="btn btn-s" id="echo_order_detail" value="${ order.orderNo }">보기</button>
                            						</td>
		                                            <td>
		                                                <button type="button" class="btn btn-s" id="echo_reDelivery" value="${ order.orderNo }">취소</button>
		                                            </td>
		                                        </tr>
											</c:forEach>
		                                </tbody>
									</c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-wrap">
                            </div>
                        </section>
                        <!-- // Category -->
                        
                        <c:if test="${ !empty orderList }">
	                        <div class="paging">
								<!-- 맨 처음으로 -->
								<a class="first" href="${ path }/admin/echo_cancel?page=1"></a>
					
								<!-- 이전 페이지로 -->
								<a class="prev" href="${ path }/admin/echo_cancel?page=${ pageInfo.prevPage }"></a>
					
								<!--  10개 페이지 목록 -->
								<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">			
										<strong>${ status.current }</strong>
									</c:if>
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }/admin/echo_cancel?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
					
								<!-- 다음 페이지로 -->
								<a class="next" href="${ path }/admin/echo_cancel?page=${ pageInfo.nextPage }"></a>
					
								<!-- 맨 끝으로 -->
								<a class="last" href="${ path }/admin/echo_cancel?page=${ pageInfo.maxPage }"></a>
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
	    let menuPath = ['${ path }/admin/echo_list','${ path }/admin/echo_order','${ path }/admin/echo_delivery','${ path }/admin/echo_cancel','${ path }/admin/echo_bidding'];
	    let menuName = ['에코샵 상품', '주문 접수', '발송 완료', '주문 취소', '상품 접수'];
	    let menuIcon = ['inventory_2', 'app_registration', 'local_shipping', 'remove_circle', 'edit'];
	
	    for( let i = 0; i < menuName.length; i++ ) {
	        let menuIdx = sideBarMenu.eq(i);
	
	        menuIdx.find('a').attr('href', menuPath[i]);
	        menuIdx.find('a > i').text(menuIcon[i]);
	        menuIdx.find('a > span').text(menuName[i]);
	    }
	
	    sideBarMenu.each(function(idx, el) {
	        if(idx == 3) {
	            $(this).addClass('current');
	        }
	    });
	});
	
	$(document).ready(() => {
		$("#echo_reDelivery").on("click", (e) => {
			if(confirm("정말로 이 주문을 배송 시키겠습니까??")) {
				location.replace("${ path }/admin/order_reDelivery?no=" + e.target.value);
			}
		})
	});
	
	$(document).on("click","#echo_order_detail", (e) => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "${ path }/admin/echo_order_detail?no="+ e.target.value;
        
        open(url, "", 'status=no, height=800, width=1500, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
	
	$(document).ready(() => {
		$(document).on('click', '#search', () => {
			if($("#member-select option:selected").val() == 1) {
				location.replace("${ path }/admin/echo_cancel?no=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 2) {
				location.replace("${ path }/admin/echo_cancel?name=" + $("#search-val").val());
			}
		})
	});
</script>

</html>