<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
	                      <table class="cart-table">
	                          <thead>
	                              <tr style="border-bottom: 2px solid rgb(206, 206, 206);">
	                                  <th colspan="4">상품정보</th>
	                                  <th>구매량</th>
	                                  <th>금액</th>
	                              </tr>
	                          </thead>
	                          <tbody>	                              
	                              <c:if test="${ !empty list }">
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
			                                  <td colspan="2">
			                                      <strong>${ product.proName }</strong>
			                                      <p>${ product.proOpt }</p>
			                                  </td>
			                                  <td style="text-align: center;" id="qty">${ product.cartQty }</td>
			                                  <td style="text-align: center;">
				                                  <span id="priceForcheckbox${ count.count }" class="cart-price">
					                                  <fmt:formatNumber value="${ product.proPrice * product.cartQty }" pattern="##,###,###"/> 원
					                                  <input type="hidden" value="${ product.proPrice * product.cartQty }">
				                                  </span>
			                                  	  <c:set var="col_sum" value="${ col_sum + product.proPrice * product.cartQty }"/>
			                                  </td>		                                 
			                              </tr>
		                              </c:forEach>
	                              </c:if>
	                              	
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
	// 체크박스
	$(document).ready(() => {
		$("input[type='checkbox']").prop("checked", true);
		
		var sum = ${ col_sum };

		console.log("sum : " + sum);
		console.log("typeOfsum : " + typeof(sum));
		
		$(".check-box input[type='checkbox']").on("change", (e) => {
			var item = e.target;
			
			var price = parseInt($("#priceFor"+ item.id).find("input[type='hidden']").val());
			
			var delivery = 2500;
			
			if(item.checked){
				console.log("check");
				
				console.log(price);
				console.log("typeOfprice : " + typeof(price));
				
				sum = sum + price;
				
				console.log("sum : " + sum);
				
				$(item).parents(".cart-table").find("#sum-product").text(toCommas(sum));
				
				if(sum < 30000){
					
					$(item).parents(".cart-table").find("#sum-delivery").text(toCommas(delivery));
					$(item).parents(".cart-table").find("#sum-final").text(toCommas(sum + delivery));
				} else {
					delivery = 0;
					
					$(item).parents(".cart-table").find("#sum-delivery").text(toCommas(delivery));
					$(item).parents(".cart-table").find("#sum-final").text(toCommas(sum + delivery));					
				}
			} else {
				console.log("uncheck");
				
				console.log(price);
				console.log("typeOfprice : " + typeof(price));
				
				sum = sum - price;
				
				console.log("sum : " + sum);

				$(item).parents(".cart-table").find("#sum-product").text(toCommas(sum));
				
				if(sum < 30000){
					
					$(item).parents(".cart-table").find("#sum-delivery").text(toCommas(delivery));
					$(item).parents(".cart-table").find("#sum-final").text(toCommas(sum + delivery));
				} else {
					delivery = 0;
					
					$(item).parents(".cart-table").find("#sum-delivery").text(toCommas(delivery));
					$(item).parents(".cart-table").find("#sum-final").text(toCommas(sum + delivery));					
				}
			}			
		});
	});
	
	// 숫자 3자리마다 ',' 찍기
    function toCommas(value) {
	    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원";
	}
	
	// 주문하기 - 작업중
	$(document).on("click", "#purchase", function() {
		if($("#sum-product") == 0){
			alert("상품을 선택해주세요.");
		}  else {
			let itemArr = new Array();
			
			$("tbody").find("input[type='checkbox']:checked").each(function() {
				
				var checked = $(this);
				
				var product = checked.parents(".cart-list").find("strong").text();
				var option = checked.parents(".cart-list").find("p").text();
				var quantity = checked.parents(".cart-list").find("#qty").text();
				var price = checked.parents(".cart-list").find("input[type='hidden']").val();
				
				console.log(product);
				console.log(option);
				console.log(quantity);
				console.log(price);
			});
		}
		
		
	});
</script>
</html>