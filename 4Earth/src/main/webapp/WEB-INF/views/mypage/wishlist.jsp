<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>찜 목록</title>
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
                            <strong></strong>     
                            <hr style="border: 1px solid #669948;">
                            <br>                
                            <div class="thumb-list">
                                <ul>
                                    <c:if test="${ !empty list }">
                                		<c:forEach var="product" items="${ list }">
                                			<li>
		                                        <div class="img-thumb">
		                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
		                                        </div>
		                                        <div class="tag-wrap">
		                                        	<c:if test="${ product.isNew lt 7 }">
			                                            <span class="tag tag-orange">
			                                            	NEW
			                                            </span>
		                                        	</c:if>
		                                        </div>
		                                        <input type="hidden" value="${ product.proNo }">
		                                        <strong><a href="${ path }/product_detail?no=${ product.proNo }">${ product.proName }</a></strong>
		                                        <div class="price">
		                                        	<fmt:formatNumber value="${ product.proPrice }" pattern="##,###,###"/> 원
		                                        </div>
		                                        <div class="review">
		                                        	<small>
			                                        <span class="icon-star">
		                                                <i class="unfill"></i>
		                                                <i class="fill" style="width: ${ product.proRating * 20 }%"></i>
		                                            </span>
		                                        	${ product.proRating }
		                                        	</small>
		                                        </div>
		                                        <div class="btn-wrap">
		                                            <a href="javascript:void(0);"><i class="heart fa fa-heart-o"></i></a>
		                                        </div>
		                                    </li>
                                		</c:forEach>
                                	</c:if>
                                </ul>
                            </div>
                        </section>

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
	    let menuPath = ['#', '#','#', '#', '#', '#'];
	    let menuName = ['포인트 내역', '주문/배송 내역', '찜한 상품', '1:1문의 내역', '참여 중인 챌린지', '내정보'];
	    let menuIcon = ['savings', 'local_shipping', 'favorite', 'headset_mic', 'bookmark_border', 'person']
	
	    for( let i = 0; i < menuName.length; i++ ) {
	        let menuIdx = sideBarMenu.eq(i);
	
	        menuIdx.find('a').attr('href', menuPath[i]);
	        menuIdx.find('a > i').text(menuIcon[i]);
	        menuIdx.find('a > span').text(menuName[i]);
	    }
	});

 // 찜
    $(".heart.fa").click(function() {
        var selected = $(this);
    	var productNo = $(this).parents("li").find("input[type='hidden']").val();
        
        console.log(JSON.stringify(productNo));
        
		$.ajax({
			type : "post",
			url : "${ path }/add_wish",
			data : 
				productNo,
			contentType : 'application/json; charset=UTF-8',
			error : function(request, error){
		    	console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    	
		    	if(request.status === 500){
		    		alert("이미 찜");
		    	}
		    	else if(request.status === 400){		    		
			    	alert("우선 로그인해주세요");
			    	window.location = "${ path }/login";
		    	}
			},
			success : function(data){
				console.log("ajax success");
				console.log(data);
				
				console.log(selected);
				selected.toggleClass("fa-heart fa-heart-o");
			}
		});        
    }); 
	
</script>

</html>