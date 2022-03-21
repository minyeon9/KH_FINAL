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
	              	<!--  -->
                  	<c:set var="col_sum" value="0"/> 
               		  <c:if test="${ empty list }">
                		 <div class="empty-content full">
                   			<i class="material-icons">info</i>
                   			<p>장바구니가 비어있습니다.</p>
                   			<a class="btn" href="${ path }/product_list">쇼핑하러 가기</a>
                   		</div>
                      </c:if>   
                      <c:if test="${ !empty list }">
                      <table class="cart-table">
                          <thead>
                              <tr style="border-bottom: 1px solid #ccc;">
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
	                                      	<a href="${ path }/product_detail?no=${ product.proNo }">
	                                          <img src="${ path }/resources/upload/store/${ product.proModifyImg }" alt="">
	                                      	</a>
	                                      </div>
	                                  </td>
	                                  <td colspan="2" class="selectedProduct">
	                                  	  <a href="${ path }/product_detail?no=${ product.proNo }">
		                                      <strong>${ product.proName }</strong>
		                                      <p>${ product.proOpt }</p>
	                                      </a>
	                                      <input type="hidden" id="proModifyImg" value="${ product.proModifyImg }" disabled="disabled">
	                                      <input type="hidden" id="proName" value="${ product.proName }" disabled="disabled">
	                                      <input type="hidden" id="proNo" value="${ product.proNo }" disabled="disabled">
	                                      <input type="hidden" id="proOptNo" value="${ product.proOptNo }" disabled="disabled">
	                                      <input type="hidden" id="proOpt" value="${ product.proOpt }" disabled="disabled">
			                              <input type="hidden" id="proPrice" value="${ product.proPrice }" disabled="disabled">
	                                  	  <input type="hidden" id="cartQty" value="${ product.cartQty }" disabled="disabled">
	                                  </td>
	                                  <td style="text-align: center;" id="qty">
	                                  	${ product.cartQty }
	                                  </td>
	                                  <td style="text-align: center;">
		                                  <span id="priceForcheckbox${ count.count }" class="cart-price">
			                                  <fmt:formatNumber value="${ product.proPrice * product.cartQty }" pattern="##,###,###"/> 원
		                                  	  <input type="hidden" value="${ product.proPrice * product.cartQty }" disabled="disabled">
		                                  </span>
		                                  <a href="" class="cart-delete"><i class="material-icons md-18">close</i></a>
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
                              <th rowspan="2" id="sum-final" style="vertical-align: middle; font-size: 18px; color: #76b779;">	                                  
                                                                    		                                  	
                              </th>
                          </tr>
                          <tr id="cart-result2">
                              <th id="sum-product" style="vertical-align: top;">
    
                              </th>                                        
                              <th id="sum-delivery" style="vertical-align: top;">
                                
                              </th>                                        
                          </tr> 
                          <tr>
                              <th colspan="6">
                                  <button class="btn btn-l cart-btn" onclick="location.href='${ path }/product_list'">계속 쇼핑하기</button>
                                  <button id="purchase" class="btn btn-l cart-btn">주문하기</button>
                              </th>
                          </tr>
                      </table>
                         
                      </c:if>   
                      
                      <!-- 주문하기 form -->
                      <form:form id="form" modelAttribute="cartList" onsubmit="return false;"> 
                     
                      </form:form>
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
	// 금액 계산
	$(document).ready(() => {
		$("input[type='checkbox']").prop("checked", true);	
		
		var sum = ${ col_sum };

		console.log("sum : " + sum);
		
		var productPrice = $("#sum-product");
		var deliveryPrice = $("#sum-delivery");
		var sumFinal = $("#sum-final");
		
		productPrice.text(toCommas(sum));
		deliveryPrice.text(toCommas(2500));
		
		if(sum >= 30000){
			deliveryPrice.text(toCommas(0));
			sumFinal.text(toCommas(sum));
		} else {
			
			sumFinal.text(toCommas(sum + 2500));
		}		
		
		// 체크박스 변경 시 금액 재계산
		$(".check-box input[type='checkbox']").on("change", (e) => {
			var item = e.target;
			var productSum = $(item).parents(".cart-table").find("#sum-product");
			var deliverySum = $(item).parents(".cart-table").find("#sum-delivery");
			var finalSum = $(item).parents(".cart-table").find("#sum-final");
			
			console.log("item : " + item);
			console.log("productSum : " + productSum.text());
			
			var price = parseInt($("#priceFor"+ item.id).find("input[type='hidden']").val());
			
			var delivery = 2500;
			
			console.log("sum = " + sum);
			console.log("price = " + price);
			
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
				$(item).parents(".cart-list").find("input[type='hidden']").attr("disabled", true);
				
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
		
		console.log($(this));
		console.log(proNo);
		console.log(proOptNo);
		console.log(memberNo);
		
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
				
				window.location = "${ path }/purchase_cart";
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
			let form_content = '';
			let index = 0;
			
			
			$("tbody").find("input[type='checkbox']:checked").each(function(i, element) {				
				var checked = $(element);
				
				console.log("$(checked) : " + $(element));
				
				let proName = checked.parents(".cart-list").find("#proName").val();
				let proNo = checked.parents(".cart-list").find("#proNo").val();
				let proOptNo = checked.parents(".cart-list").find("#proOptNo").val();
				let proOpt = checked.parents(".cart-list").find("#proOpt").val();
				let proPrice = checked.parents(".cart-list").find("#proPrice").val();
				let cartQty = checked.parents(".cart-list").find("#cartQty").val();
				let proModifyImg = checked.parents(".cart-list").find("#proModifyImg").val();
				
				let input = "<input name='cartList[" + index + "].proName' type='hidden' value='" + proName + "'>"
						    + "<input name='cartList[" + index + "].proNo' type='hidden' value='" + proNo + "'>"
							+ "<input name='cartList[" + index + "].proOptNo' type='hidden' value='" + proOptNo + "'>"
							+ "<input name='cartList[" + index + "].proOpt' type='hidden' value='" + proOpt + "'>"
							+ "<input name='cartList[" + index + "].proPrice' type='hidden' value='" + proPrice + "'>"
							+ "<input name='cartList[" + index + "].cartQty' type='hidden' value='" + cartQty + "'>"
							+ "<input name='cartList[" + index + "].proModifyImg' type='hidden' value='" + proModifyImg + "'>";

				form_content += input;
				
				index += 1;				
			});	
			$("#form").html(form_content);
			
			form.action = "${ path }/purchase_payment"
			form.method = "POST";
			form.submit();
		}
	});
</script>
</html>