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
    <title>주문/결제</title>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="container">
		<section class="content-wrap">
			<div class="purchase-wrap">
		
	          <div class="page-tit">
                        <h3></h3>
                        <div class="bread-crumb">
                            <a href="#">장바구니</strong></a>
                            <a href="#"><strong>주문/결제</strong></a>
                            <span>주문완료</span>
                        </div>
                    </div>
	
	          <div class="store-wrap">
	
	              
	              <section>
	                  <strong>주문리스트</strong>    
                          <!-- List -->                        
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
                                          <div class="cart-img">
                                              <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                          </div>
                                      </td>
                                      <td colspan="3" style="text-align: left;">
                                          <strong>상품명</strong>
                                          <p>옵션</p>
                                      </td>
                                      <td style="text-align: center;">구매량</td>
                                      <td style="text-align: center;">가격</td>
                                  </tr>
                                  <tr>
                                      <td>
                                          <div class="cart-img">
                                              <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                          </div>
                                      </td>
                                      <td colspan="3" style="text-align: left;">
                                          <strong>상품명</strong>
                                          <p>옵션 그런데 이제 옵션명이 매우 긴 경우에 또 이제 좀 더 긴</p>
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
                                      총 주문 금액
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
                          </table>
                          <!-- // List -->

                          <br><br><br><br>

                          <!-- Delivery -->
                          <strong>
                              배송 정보
                                  <div class="check-box" style="float: right;  margin-left: 10px;">
                                      <input type="checkbox" id="checkbox2" name="del-info" onclick="onlyOne(this)"> 
                                      <label for="checkbox2" style="font-size: 12px; font-weight: 400;">신규배송지</label>
                                  </div>
                                  <div class="check-box" style="float: right;">
                                      <input type="checkbox" id="checkbox1" name="del-info" checked onclick="onlyOne(this)"> 
                                      <label for="checkbox1" style="font-size: 12px; font-weight: 400;">기본배송지</label>
                                  </div>
                          </strong>  
                          <div class="delivery">
                              <table class="del-table">
                                  <tr>
                                      <td class="del-item">수령인</td>
                                      <td colspan="2">
                                          <input type="text">
                                      </td>
                                  </tr>
                                  <tr style="border-bottom: none; height: 17%;">
                                      <td rowspan="2" class="del-item">주소</td>
                                      <td colspan="2">
                                          <input type="text">
                                          <button class="btn">우편번호 찾기</button>
                                      </td>
                                  </tr>
                                  <tr style="height: 17%;">
                                      <td>
                                          <input type="text" size="60px">
                                      </td>
                                      <td>
                                          <input type="text" placeholder="상세주소 (동ㆍ호수)">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="del-item">전화번호</td>
                                      <td colspan="2">
                                          <input type="text" placeholder="'-' 생략">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="del-item">배송 요청사항</td>
                                      <td colspan="2">
                                          <input type="text" size="90px" list="del-msg">
                                          <datalist id="del-msg">
                                              <option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
                                              <option value="문 앞에 놔주세요.">문 앞에 놔주세요.</option>
                                              <option value="배송 전 연락해주세요.">배송 전 연락해주세요.</option>
                                              <option value=""></option>
                                          </datalist>
                                      </td>
                                  </tr>
                              </table>
                          </div>
                          <!-- //Delivery -->

                          <br><br><br><br>

                          <!-- Sum -->
                          <strong>결제 금액</strong>
                          <div class="sum">
                              <table class="sum-table">
                                  <tr>
                                      <td colspan="5">
                                          <b>포인트</b>                                                 
                                          <input type="text" style="margin-left: 15%;">
                                          point
                                      </td>
                                      <td>
                                          <small style="float: right; color: rgb(153, 153, 153);">(보유 포인트 : 2,000 point )</small>
                                      </td>
                                  </tr>
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
                                      <th rowspan="2" style="vertical-align: middle; font-size: 18px;">
                                          5,000 원
                                      </th>
                                  </tr>
                                  <tr id="sum-result2">
                                      <th style="vertical-align: top;">
                                          7,500 원
                                      </th>                                        
                                      <th style="vertical-align: top;">
                                          2,000 원
                                      </th>                                        
                                  </tr> 
                              </table>
                          </div>
                          <!-- // Sum -->

                          <br><br><br><br>

                          <!-- Method -->
                          <strong>결제 수단</strong>
                          <div class="method">
                              <table class="mtd-table">
                                  <tr>
                                      <td>
                                          <input type="radio" class="btn-check" name="options-outlined" id="raio1">
                                          <label class="btn btn-radio" for="raio1">신용 카드</label>
                                          <input type="radio" class="btn-check" name="options-outlined" id="radio2">
                                          <label class="btn btn-radio" for="radio2">계좌 이체</label>
                                          <input type="radio" class="btn-check" name="options-outlined" id="radio3">
                                          <label class="btn btn-radio" for="radio3">휴대폰 결제</label>
                                      </td>
                                  </tr>
                              </table>
                          </div>
                          <!-- // Method -->
                          
                          <br><br>
                          <hr style="border: 1px solid #669948;">


                          <table style="width: 100%; height: 40px;">
                              <tr>
                                  <th class="check-box">
                                      <input type="checkbox" id="checkbox3"> 
                                      <label for="checkbox3">모든 내용을 확인하였으며, 결제를 진행합니다.</label>
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
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	function onlyOne(element){
	    const checkboxes = document.getElementsByName("del-info");
	
	    checkboxes.forEach((cb) => {
	        cb.checked = false;
	    });
	
	    element.checked = true;
	};
</script>
</html>