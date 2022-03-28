<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>찜한 상품</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div class="container">
            <div class="contents">
            <%@ include file="/WEB-INF/views/common/sideBar.jsp" %>
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>찜한 상품</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="#">마이페이지</a>
                            <span>찜한 상품</span>
                        </div>
                    </div>

                        <section>
                            
                            
                            <div class="thumb-list">
                               	<c:if test="${ empty list }">
                               		<div class="empty-content full">
		                       			<i class="material-icons">info</i>
		                       			<p>찜한 상품이 없습니다.</p>
		                       			<a class="btn" href="${ path }/product_list">쇼핑하러 가기</a>
		                       		</div>
	                            <br>                
                               	</c:if>
                                <ul>
                                    <c:if test="${ !empty list }">
                                		<c:forEach var="product" items="${ list }">
                                			<li>
		                                        <div class="img-thumb">
		                                            <img src="${ path }/resources/upload/store/${ product.proModifyImg }" alt="">
		                                        </div>		                                        
		                                        <strong><a href="${ path }/product_detail?no=${ product.proNo }">${ product.proName }</a></strong>
		                                        <div class="price">
		                                        	<fmt:formatNumber value="${ product.proPrice }" pattern="##,###,###"/> 원
		                                        </div>
		                                        <div class="review">
		                                        	<c:if test="${ product.proRating ne 0.0 }">
			                                        	<small>
					                                        <span class="icon-star">
				                                                <i class="unfill"></i>
				                                                <i class="fill" style="width: ${ product.proRating * 20 }%"></i>
				                                            </span>
				                                        	${ product.proRating }
			                                        	</small>
		                                        	</c:if>
		                                        	<c:if test="${ product.proRating eq 0.0 }">
		                                        		<small>ㅡ</small>
		                                        	</c:if>
		                                        </div>
		                                        <div class="btn-wrap">
		                                            <a href="javascript:void(0);" class="btn-delete-img"><i class="material-icons md-22">delete_outline</i></a>
		                                        	<input type="hidden" id="productNo" value="${ product.proNo }">
		                                        </div>
		                                    </li>
                                		</c:forEach>
                                	</c:if>
                                </ul>
                            </div>
                        </section>
						
						<c:if test="${ !empty list }">
	                        <div class="paging">
	                        	<a href="${ path }/wish_list?page=1" class="first"><span>맨 앞으로</span></a> 
	                            <a href="${ path }/wish_list?page=${ pageInfo.prevPage }" class="prev"><span>이전</span></a>
	                            <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">				
										<strong>${ status.current }</strong>
									</c:if>
									
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }/wish_list?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
	                            <a href="${ path }/wish_list?page=${ pageInfo.nextPage }" class="next"><span>다음</span></a>
	                            <a href="${ path }/wish_list?page=${ pageInfo.maxPage }" class="last"><span>맨 뒤로</span></a>
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
            if(idx == 2) {
                $(this).addClass('current');
            }
        });
	});

	// 찜 삭제
	$(document).on("click", ".btn-wrap", (e) => {
		let selected = e.currentTarget;
		
		let productNo = $(selected).find("input[type=hidden]").val();
		
		selected.closest("li").remove();
		
		console.log(productNo);
		
		$.ajax({
			type : "post",
			url : "${ path }/add_wish",
			data : 
				productNo,
			contentType : 'application/json; charset=UTF-8',
			error : function(request, error) {
		    	console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    },
		    success : function(data) {
				console.log("ajax success");
				console.log("data : " + data);
				
				if(data === "Wish Added" || data === "Wish Again"){
					alert("찜 성공");
				}
				else if(data === "Wish Deleted"){
					alert("찜 목록에서 삭제되었습니다.");
				}
				
				window.location = "${ path }/wishlist";
		    }
		});
	});
	
</script>

</html>