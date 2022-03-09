<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://kit.fontawesome.com/da4a2ee2c4.js" crossorigin="anonymous"></script>
    <title>장바구니</title>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
<div class="container">
	<div class="contents">
		<section class="content-wrap">
		<div class="purchase-wrap">
		
	          <div class="page-tit">
	              <h3>장바구니</h3>
	              <div class="bread-crumb">
	                  <a href="#"><strong>장바구니</strong></a>
	                  <a href="#">주문/결제</a>
	                  <span>주문완료</span>
	              </div>
	          </div>
	
	          <div class="store-wrap">
	
	              <!-- Cart -->
	              <section>
                  	<c:set var="col_sum" value="0"/> 
               		  <c:if test="${ empty list }">
                		 <div class="cart-empty">
                        	<p>장바구니가 비어있습니다.</p>
                        	<a href="${ path }/product_list">쇼핑하러 가기</a>
                		 </div>
                      </c:if>   
                      <c:if test="${ !empty list }">  
                      <form id="form" modelAttribute="cartList" onsubmit="return false;">     
                      <table class="cart-table">
                          <thead>
                              <tr style="border-bottom: 2px solid rgb(206, 206, 206);">
                                  <th colspan="4">상품정보</th>
                                  <th>구매량</th>
                                  <th>금액</th>
                              </tr>
                          </thead>
                          <tbody>
                              <c:forEach var="product" items="${ list }" varStatus="count">
	                              <tr class="cart-list">
	                                  <td>
	                                      <div class="check-box">
	                                          <input type="checkbox" id="checkbox${ count.count }"> 
	                                          <label for="checkbox${ count.count }"></label>
	                                      </div>
	                                  </td>
	                                  <td>
	                                      <div class="cart-img">
	                                          <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
	                                      </div>
	                                  </td>
	                                  <td colspan="2" class="selectedProduct">
	                                      <strong>${ product.proName }</strong>
	                                      <p>${ product.proOpt }</p>
	                                      <input type="hidden" name="cartList[${ count.count -1 }].proName" value="${ product.proName }" disabled="disabled">
	                                      <input type="hidden" id="proNo" name="cartList[${ count.count -1 }].proNo" value="${ product.proNo }" disabled="disabled">
	                                      <input type="hidden" id="proOptNo" name="cartList[${ count.count -1 }].proOptNo" value="${ product.proOptNo }" disabled="disabled">
	                                      <input type="hidden" id="proOpt" name="cartList[${ count.count -1 }].proOpt" value="${ product.proOpt }" disabled="disabled">
	                                  </td>
	                                  <td style="text-align: center;" id="qty">
	                                  	${ product.cartQty }
	                                  	<input type="hidden" name="cartList[${ count.count -1 }].cartQty" value="${ product.cartQty }" disabled="disabled">
	                                  </td>
	                                  <td style="text-align: center;">
		                                  <span id="priceForcheckbox${ count.count }" class="cart-price">
			                                  <fmt:formatNumber value="${ product.proPrice * product.cartQty }" pattern="##,###,###"/> 원
			                                  <input type="hidden" id="cartQty" name="cartList[${ count.count -1 }].proPrice" value="${ product.proPrice * product.cartQty }" disabled="disabled">
		                                  </span>
		                                  <a href="" class="cart-delete"><i class="material-icons md-24" style="font-size: 16px;">close</i></a>
	                                  	  <c:set var="col_sum" value="${ col_sum + product.proPrice * product.cartQty }"/>
	                                  </td>		                                 
	                              </tr>
                              </c:forEach> 
                          </tbody>
                          <tr id="cart-result1">
                              <th style="width: 20%; vertical-align: bottom;">
                                  총 상품금액
                              </th>
                              <th rowspan="2">
                                  +
                              </th>
                              <th style="width: 20%; vertical-align: bottom;">
                                  배송비
                              </th>
                              <th rowspan="2">
                                  =
                              </th>
                              <th rowspan="2" style="vertical-align: middle; font-size: 18px;">
                                  총 금액
                              </th>
                              <th rowspan="2" id="sum-final" style="vertical-align: middle; font-size: 18px;">	                                  
                                  <c:if test="${ col_sum ge 30000 }">
                                  	<fmt:formatNumber value="${ col_sum }" pattern="##,###,###"/> 원
                                  </c:if>
                                  <c:if test="${ col_sum lt 30000 }">
                                  	<fmt:formatNumber value="${ col_sum + 2500 }" pattern="##,###,###"/> 원
                                  </c:if>	                                  		                                  	
                              </th>
                          </tr>
                          <tr id="cart-result2">
                              <th id="sum-product" style="vertical-align: top;">
                                  <fmt:formatNumber value="${ col_sum }" pattern="##,###,###"/> 원
                              </th>                                        
                              <th id="sum-delivery" style="vertical-align: top;">
                                  <c:if test="${ col_sum ge 30000 }">
	                                  0 원		                                 
                                  </c:if>
                                  <c:if test="${ col_sum lt 30000 }">
                                  	  2,500 원
                                  </c:if>
                              </th>                                        
                          </tr> 
                          <tr>
                              <th colspan="6">
                                  <button class="cart-btn" onclick="location.href='${ path }/product_list'">계속 쇼핑하기</button>
                                  <button id="purchase" class="cart-btn">주문하기</button>
                              </th>
                          </tr>
                      </table>
                      </form>   
                      </c:if>     
                      
                      <!-- 삭제 form -->
					  <form action="/cart_delete" method="post" class="quantity_delete_form">
						  <input type="hidden" name="cartId" class="delete_cartId">
						  <input type="hidden" name="memberId" value="${ loginMember.no }">
					  </form>             
	              </section>
	              <!-- // Cart -->
	
	          </div> <!-- // store-wrap -->
			</div>	              
           </section>
           
           <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
         </div> 
</div>    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	// 체크박스에 따라 금액 계산
	$(document).ready(() => {
		$("input[type='checkbox']").prop("checked", true);		
		
		var sum = ${ col_sum };

		console.log("sum : " + sum);
		
		$(".check-box input[type='checkbox']").on("change", (e) => {
			var item = e.target;
			var productSum = $(item).parents(".cart-table").find("#sum-product");
			var deliverySum = $(item).parents(".cart-table").find("#sum-delivery");
			var finalSum = $(item).parents(".cart-table").find("#sum-final");
			
			var price = parseInt($("#priceFor"+ item.id).find("input[type='hidden']").val());
			
			var delivery = 2500;
			
			if(item.checked){
				console.log("check");
				
				console.log(price);
				
				sum = sum + price;
				
				console.log("sum : " + sum);
				
				productSum.text(toCommas(sum));
				
				if(sum < 30000){
					
					deliverySum.text(toCommas(delivery));
					finalSum.text(toCommas(sum + delivery));
				} else {
					delivery = 0;
					
					deliverySum.text(toCommas(delivery));
					finalSum.text(toCommas(sum + delivery));					
				}
			} else {
				console.log("uncheck");
				
				console.log(price);
				
				sum = sum - price;
				
				console.log("sum : " + sum);

				productSum.text(toCommas(sum));
				
				if(sum < 30000){
					
					deliverySum.text(toCommas(delivery));
					finalSum.text(toCommas(sum + delivery));
				} else {
					delivery = 0;
					
					deliverySum.text(toCommas(delivery));
					finalSum.text(toCommas(sum + delivery));					
				}
			}			
		});
	});	
	
	// 상품 삭제
	$(".cart-list").on("click", ".cart-delete", function(e) {
		console.log("삭제");
		
		e.preventDefault();
		 
		$(this).closest('.cart-list').remove();
		
		var proNo = $(this).closest('.cart-list').find("#proNo").val();
		var proOptNo = $(this).closest('.cart-list').find("#proOptNo").val();
		var memberNo = `${ loginMember.no }`;
		
		let product = {
				"proNo" : proNo,
				"proOptNo" : proOptNo,
				"memberNo" : memberNo
		}
		
		$.ajax({
			type : "post",
			url : "${ path }/delete_cart", 
		    data : 
		    	JSON.stringify(product)
		    ,
		    contentType : 'application/json; charset=UTF-8',
		    error : function(request, error) {
		    	console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    },
		    success : function(data) {
				console.log("ajax success");
				console.log("data : " + data);
		    }
		});
	});
	
	// 숫자 3자리마다 ',' 찍기
    function toCommas(value) {
	    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원";
	}
	
	// 주문하기
	$(document).on("click", "#purchase", function() {	
		let form = document.getElementById("form");
		
		// 선택된 체크박스 개수
		let selected = document.querySelectorAll("input[type='checkbox']:checked");
		
		let selectedCount = selected.length;
		
		console.log(selectedCount);
		if(selectedCount == 0){
			
			alert("상품을 선택해주세요.");
		}  else {
			let itemArr = new Array();
			
			$("tbody").find("input[type='checkbox']:checked").each(function() {				
				var checked = $(this);
				
				console.log($(checked));
				
				checked.parents(".cart-list").find("input[type='hidden']").removeAttr("disabled");				
				
			});	
			
			form.action = "${ path }/purchase_payment"
			form.method = "POST";
			form.submit();			
		}
	});
</script>
</html>