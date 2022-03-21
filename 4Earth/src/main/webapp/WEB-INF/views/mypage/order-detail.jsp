<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>주문 상세</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div class="container">
            <div class="contents">
                <%@ include file="/WEB-INF/views/common/sideBar.jsp" %>
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>주문 상세 내역</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">마이페이지</a>
                            <span>주문&dot;배송</span>
                        </div>
                    </div>

                        <section>
                            <br> 
                                <div class="order-info">
                                    <div class="order-no">
                                        주문번호
                                        <b>
                                        	<fmt:formatDate value="${ orderSum.orderDate }" pattern="yyyyMMdd"/>${ orderSum.orderNo }
                                        </b>
                                    </div>
                                    <div class="order-date">
                                        주문일자
                                        <fmt:formatDate value="${ orderSum.orderDate }" pattern="yyyy-MM-dd hh:mm:ss"/>
                                    </div>
                                </div>                         
                                <table class="cart-table order-table">
                                    <thead>
                                        <tr>
                                            <th colspan="4">상품정보</th>
                                            <th>주문 금액</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach var="list" items="${ orderDetailList }">
                                    		<tr>
	                                            <td style="width: 30%;">
	                                                <div class="cart-img">
		                                                <a href="${ path }/product_detail?no=${ list.detailProNo }">
		                                                    <img src="${ path }/resources/upload/store/${ list.proModifyImg }" alt="">
		                                                </a>
	                                                </div>
	                                            </td>
	                                            <td colspan="3" style="text-align: left; width: 35%;">
	                                            	<a href="${ path }/product_detail?no=${ list.detailProNo }">
		                                                <strong>${ list.detailProName }</strong>
		                                                <p>${ list.detailOptName }</p>
	                                            	</a>
	                                            </td>
	                                            <td>
	                                                <fmt:formatNumber value="${ list.detailPrice }" pattern="##,###,###"/> 원
	                                            </td>
	                                            <td style="text-align: right;">
	                                            	<input name="proNo" type="hidden" value="${ list.detailProNo }">
	                                            	<input name="optName" type="hidden" value="${ list.detailOptName }">
	                                            	<input name="optNo" type="hidden" value="${ list.detailOpt }">
	                                                <button class="btn writeReview">리뷰 작성</button>
	                                            </td>
	                                        </tr>
                                    	</c:forEach>                                        
                                    </tbody>
                                    <tr id="sum-result1" style="border-bottom: none;">
	                                      <th style="width: 20%; vertical-align: bottom;">
	                                          총 주문 금액
	                                      </th>
	                                      <th rowspan="2">
	                                          -
	                                      </th>
	                                      <th style="width: 20%; vertical-align: bottom;">
	                                          포인트 사용
	                                      </th>
	                                      <th rowspan="2">
	                                          =
	                                      </th>
	                                      <th rowspan="2" style="vertical-align: middle; font-size: 18px;">
	                                          최종 결제 금액
	                                      </th>
	                                      <th rowspan="2" id="sum-result2-final" style="vertical-align: middle; font-size: 18px;">
	                                      	 <fmt:formatNumber value="${ orderSum.orderPrice }" pattern="##,###,###"/>
	                                      	 원
	                                      </th>
	                                  </tr>
	                                  <tr id="sum-result2">
	                                      <th style="vertical-align: top;" id="sum-result2-product">
	                                      	 <fmt:formatNumber value="${ orderSum.orderPrice + orderSum.orderPoint }" pattern="##,###,###"/>
	                                      	 원
	                                      </th>                                        
	                                      <th style="vertical-align: top;" id="sum-result2-point">
	                                         <fmt:formatNumber value="${ orderSum.orderPoint }" pattern="##,###,###"/>
	                                         원
	                                      </th>                                        
	                                  </tr>
                                </table>
                            <div>
                                
                                
                            </div>
                        </section>

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
		
	// 리뷰 작성
    $(".writeReview").on("click", (e) => {
    	console.log("!");	
    
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        var loginMember = "<%= session.getAttribute("loginMember") %>";
        
        var button = $(e.target);

        var no = button.siblings("input[name='proNo']").val();
        var optName = button.siblings("input[name='optName']").val();
        var optNo = button.siblings("input[name='optNo']").val();
        const url = "${ path }/write_review?no=" + no + "&optName=" + optName + "&optNo=" + optNo;
        
        if(loginMember == "null"){
        	alert("로그인 후 이용이 가능합니다.");
        	
        	window.location = "${ path }/login";
        } else{
        	
        	open(url, "", 'status=no, height=800, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
        }            
    });

</script>

</html>