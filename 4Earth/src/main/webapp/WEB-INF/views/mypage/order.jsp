<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>주문내역조회</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div class="container">
            <div class="contents">
                <%@ include file="/WEB-INF/views/common/sideBar.jsp" %>
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>주문/배송 조회</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="#">마이페이지</a>
                            <span>주문&dot;배송</span>
                        </div>
                    </div>



                        <section> 
                            <br>                         
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th style="width: 32%;">주문번호</th>
                                            <th>주문일자</th>
                                            <th>총 구매금액</th>
                                            <th>결제방법</th>
                                            <th>주문상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:if test="${ empty orderSum }">
                                    		<tr>
	                                            <td colspan="5">
	                                            	<div class="empty-content">
						                       			<i class="material-icons">info</i>
						                       			<p>조회된 주문·배송 내역이 없습니다.</p>
						                       		</div>
	                                            </td>
	                                        </tr>
                                    	</c:if>
                                    	<c:if test="${ !empty orderSum }">
                                    		<c:forEach var="orderSum" items="${ orderSum }">
                                    			<tr>
		                                            <td>
		                                            	<a href="${ path }/order_detail?orderNo=${ orderSum.orderNo }" style="text-decoration: underline;">
		                                            		<fmt:formatDate value="${ orderSum.orderDate }" pattern="yyyyMMdd"/>${ orderSum.orderNo }
		                                            	</a>
		                                            </td>
		                                            <td>
		                                            	<fmt:formatDate value="${ orderSum.orderDate }" pattern="yyyy-MM-dd"/>
		                                            </td>
		                                            <td><fmt:formatNumber value="${ orderSum.orderPrice }" pattern="##,###,###"/> 원</td>
		                                            <td>${ orderSum.orderMethod }</td>
		                                            <td>${ orderSum.orderStat }</td>
		                                        </tr>
                                    		</c:forEach>
                                    	</c:if>
                                    </tbody>
                                </table>
                            <div>
                                
                                
                            </div>
                        </section>
						
						<c:if test="${ !empty orderSum }">
							<div class="paging">
								<a href="${ path }/order?page=1" class="first"><span>맨 앞으로</span></a> 
								<a href="${ path }/order?page=${ pageInfo.prevPage }" class="prev"><span>이전</span></a>
								<c:forEach begin="${ pageInfo.startPage }"
									end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">
										<strong>${ status.current }</strong>
									</c:if>
		
									<c:if test="${ status.current != pageInfo.currentPage }">
										<a href="${ path }/order?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
								<a href="${ path }/order?page=${ pageInfo.nextPage }" class="next"><span>다음</span></a> 
								<a href="${ path }/order?page=${ pageInfo.maxPage }" class="last"><span>맨 뒤로</span></a>
							</div>
						</c:if>

                        

                </section>


                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
            <!-- <div class="select-option">
                상품 선택
            </div> -->
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['/4earth/point', '/4earth/order','/4earth/wishlist', '/4earth/my_ongoing_list', '/4earth/profile_view'];
        let menuName = ['포인트 내역', '주문/배송 내역', '찜한 상품', '참여 중인 챌린지', '내정보'];
        let menuIcon = ['savings', 'local_shipping', 'favorite', 'headset_mic', 'bookmark_border', 'person']

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
        });
    });
</script>

</html>