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
		<section class="content-wrap">
		<div class="purchase-wrap">
		
	          <div class="page-tit">
	              <h3></h3>
	              <div class="bread-crumb">
	                  <a href="#"><strong>장바구니</strong></a>
	                  <a href="#">주문/결제</a>
	                  <span>주문완료</span>
	              </div>
	          </div>
	
	          <div class="store-wrap">
	
	              <!-- Cart -->
	              <section>
	                  <strong>장바구니</strong>                            
	                      <table class="cart-table">
	                          <thead>
	                              <tr style="border-bottom: 2px solid rgb(206, 206, 206);">
	                                  <th colspan="4">상품정보</th>
	                                  <th>구매량</th>
	                                  <th>금액</th>
	                              </tr>
	                          </thead>
	                          <tbody>
	                              <tr>
	                                  <td>
	                                      <div class="check-box">
	                                          <input type="checkbox" id="checkbox1" checked> 
	                                          <label for="checkbox1"></label>
	                                      </div>
	                                  </td>
	                                  <td>
	                                      <div class="cart-img">
	                                          <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
	                                      </div>
	                                  </td>
	                                  <td colspan="2">
	                                      <strong>상품명</strong>
	                                      <p>옵션</p>
	                                  </td>
	                                  <td style="text-align: center;">구매량</td>
	                                  <td style="text-align: center;">가격</td>
	                              </tr>
	                              <tr>
	                                  <td>
	                                      <div class="check-box">
	                                          <input type="checkbox" id="checkbox2" checked> 
	                                          <label for="checkbox2"></label>
	                                      </div>
	                                  </td>
	                                  <td>
	                                      <div class="cart-img">
	                                          <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
	                                      </div>
	                                  </td>
	                                  <td colspan="2">
	                                      <strong>상품명</strong>
	                                      <p>옵션 그런데 이제 옵션명이 매우 긴 경우에</p>
	                                  </td>
	                                  <td style="text-align: center;">구매량</td>
	                                  <td style="text-align: center;">가격</td>
	                              </tr>
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
	                              <th rowspan="2" style="vertical-align: middle; font-size: 18px;">
	                                  7,500 원
	                              </th>
	                          </tr>
	                          <tr id="cart-result2">
	                              <th style="vertical-align: top;">
	                                  5,000 원
	                              </th>                                        
	                              <th style="vertical-align: top;">
	                                  2,500 원
	                              </th>                                        
	                          </tr> 
	                          <tr>
	                              <th colspan="6">
	                                  <button class="cart-btn">계속 쇼핑하기</button>
	                                  <button onclick="location.href='${ path }/purchase_payment'" class="cart-btn">주문하기</button>
	                              </th>
	                          </tr>
	                      </table>
	                  <div>
	                      
	                      
	                  </div>
	              </section>
	              <!-- // Cart -->
	
	          </div> <!-- // store-wrap -->
			</div>	              
           </section>
           
           <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
         </div>    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	
</script>
</html>