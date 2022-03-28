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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <title>주문/결제</title>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="container">
	<div class="contents">
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
                              	  <c:forEach var="orderDetail" items="${ list }">
	                              	  <tr>
	                                      <td>
	                                          <div class="cart-img">
	                                          <a href="${ path }/product_detail?no=${ product.proNo }">
	                                              <img src="${ path }/resources/upload/store/${ orderDetail.proModifyImg }" alt="">
	                                          </a>
	                                          </div>
	                                      </td>
	                                      <td colspan="3" style="text-align: left;">
		                                      <a href="${ path }/product_detail?no=${ product.proNo }">
		                                          <strong>${ orderDetail.detailProName }</strong>
		                                          <p>${ orderDetail.detailOptName }</p>
		                                      </a>
	                                      </td>
	                                      <td style="text-align: center;">${ orderDetail.detailQty }</td>
	                                      <td style="text-align: center;">
	                                      	<fmt:formatNumber value="${ orderDetail.detailPrice }" pattern="##,###,###"/> 원	                                      	
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
                                      총 주문 금액
                                  </th>
                                  <th rowspan="2" style="vertical-align: middle; font-size: 18px;">
                                      <c:if test="${ orderSum.orderPrice ge 30000 }">
                                      	<fmt:formatNumber value="${ orderSum.orderPrice }" pattern="##,###,###"/> 원
                                      </c:if>
                                      <c:if test="${ orderSum.orderPrice lt 30000 }">
                                      	<fmt:formatNumber value="${ orderSum.orderPrice + 2500 }" pattern="##,###,###"/> 원
                                      </c:if>
                                  </th>
                              </tr>
                              <tr id="cart-result2">
                                  <th style="vertical-align: top;">
                                  	<fmt:formatNumber value="${ orderSum.orderPrice }" pattern="##,###,###"/> 원
                                  </th>                                        
                                  <th style="vertical-align: top;">
                                      <c:if test="${ orderSum.orderPrice ge 30000 }">
                                      	0 원
                                      </c:if>
                                      <c:if test="${ orderSum.orderPrice lt 30000 }">
                                      	2,500 원
                                      </c:if>
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
                                      <input type="checkbox" id="checkbox1" name="del-info" checked="checked" onclick="onlyOne(this)"> 
                                      <label for="checkbox1" style="font-size: 12px; font-weight: 400;">기본배송지</label>
                                  </div>
                          </strong>  
                          <div class="delivery">
                          	<div class="address1">
                          		<table class="del-table">
                                  <tr>
                                      <td class="del-item" style="height: 50px;">수령인</td>
                                      <td colspan="2">
                                          <input type="text" name="del-name" value="${ loginMember.name }" readonly="readonly">
                                      </td>
                                  </tr>
                                  <tr style="border-bottom: none; height: 17%;">
                                      <td rowspan="2" class="del-item" style="height: 95px;">주소</td>
                                      <td colspan="2">
                                          <input type="text" name="del-postcode" readonly="readonly" value="${ loginMember.postcode }">
                                      </td>
                                  </tr>
                                  <tr style="height: 17%;">
                                      <td>
                                          <input type="text" size="40px" name="del-address" readonly="readonly" value="${ loginMember.address }">
                                      </td>
                                      <td>
                                          <input type="text" size="30px" name="del-extraAddress" readonly="readonly" value="${ loginMember.extra_address }">
                                          <input type="text" name="del-detailAddress" readonly="readonly" value="${ loginMember.detail_address }">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="del-item" style="height: 50px;">전화번호</td>
                                      <td colspan="2">
                                          <input type="text" name="del-phone" value="${ loginMember.phone }" readonly="readonly">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="del-item" style="height: 50px;">배송 요청사항</td>
                                      <td colspan="2">
                                          <input type="text" size="90px" name="del-msg" list="del-msg" placeholder="(직접 입력)">
                                          <datalist id="del-msg">
                                              <option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
                                              <option value="문 앞에 놔주세요.">문 앞에 놔주세요.</option>
                                              <option value="배송 전 연락해주세요.">배송 전 연락해주세요.</option>
                                          </datalist>
                                      </td>
                                  </tr>
                              </table>
                          	</div>
                          	<div class="address2">
                          	<table class="del-table">
                                  <tr>
                                      <td class="del-item" style="height: 50px;">수령인</td>
                                      <td colspan="2">
                                          <input type="text" name="del-name">
                                      </td>
                                  </tr>
                                  <tr style="border-bottom: none; height: 17%;">
                                      <td rowspan="2" class="del-item" style="height: 95px;">주소</td>
                                      <td colspan="2">
                                          <input type="text" name="del-postcode" id="sample6_postcode" placeholder="우편번호">
                                          <button class="btn" onclick="execution_daum_address()">우편번호 찾기</button>
                                      </td>
                                  </tr>
                                  <tr style="height: 17%;">
                                      <td>
                                          <input type="text" size="40px" name="del-address" id="sample6_address" placeholder="주소">
                                      </td>
                                      <td>
                                          <input type="text" size="30px" name="del-extraAddress" id="sample6_extraAddress" placeholder="참고항목">
                                          <input type="text" name="del-detailAddress" id="sample6_detailAddress" placeholder="상세주소 (동ㆍ호수)">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="del-item" style="height: 50px;">전화번호</td>
                                      <td colspan="2">
                                          <input type="text" name="del-phone" placeholder="'-' 생략">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="del-item" style="height: 50px;">배송 요청사항</td>
                                      <td colspan="2">
                                          <input type="text" size="90px" name="del-msg" list="del-msg" placeholder="(직접 입력)">
                                          <datalist id="del-msg">
                                              <option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
                                              <option value="문 앞에 놔주세요.">문 앞에 놔주세요.</option>
                                              <option value="배송 전 연락해주세요.">배송 전 연락해주세요.</option>
                                          </datalist>
                                      </td>
                                  </tr>
                              </table>
                          	</div>                              
                          </div>
                          <!-- //Delivery -->

                          <br><br><br><br>

                          <!-- Sum -->
                          <strong>결제 예정 금액</strong>
                          <div class="sum">
                              <table class="sum-table">
                                  <tr>
                                      <td colspan="5">
                                          <b>포인트 사용</b>                                                 
                                          <input type="text" name="point-usage" id="point-input" class="point-usage" 
                                          	pattern="[0-9]+" style="margin-left: 15%;" min="0" max="${ point }">
                                          point
                                      </td>
                                      <td>
                                          <small style="float: right; color: rgb(153, 153, 153);">
                                          	(보유 포인트 : <fmt:formatNumber value="${ point }" pattern="##,###,###"/> point )
                                          </small>
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
                                      <th rowspan="2" id="sum-result2-final" style="vertical-align: middle; font-size: 18px;">
                                      </th>
                                  </tr>
                                  <tr id="sum-result2">
                                      <th style="vertical-align: top;" id="sum-result2-product">
                                      </th>                                        
                                      <th style="vertical-align: top;" id="sum-result2-point">
                                          0 원
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
                                          <input type="radio" class="btn-check" name="options-outlined" value="일반결제" id="raio1">
                                          <label class="btn btn-radio" for="raio1">일반 결제</label>
                                          <input type="radio" class="btn-check" name="options-outlined" value="네이버페이" id="radio2">
                                          <label class="btn btn-radio" for="radio2">네이버 페이</label>
                                          <input type="radio" class="btn-check" name="options-outlined" value="카카오페이" id="radio3">
                                          <label class="btn btn-radio" for="radio3">카카오 페이</label>
                                          <input type="radio" class="btn-check" name="options-outlined" value="휴대폰결제" id="radio4">
                                          <label class="btn btn-radio" for="radio4">휴대폰 결제</label>
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
                                      <input type="checkbox" class="agreement" id="checkbox3" required="required"> 
                                      <label for="checkbox3">모든 내용을 확인하였으며, 결제를 진행합니다.</label>
                                  </th>
                              </tr>
                              <tr>
                              	<th>
                              		<button id="purchase" class="purchase-btn">결제하기</button>
                              	</th>
                              </tr>
                          </table>
                          
                          <!-- 결제하기 form -->
                          <form class="order-form" action="${ path }/purchase_complete" method="post">
                          	<!-- 회원 번호 -->
                          	<input type="hidden" name="memberNo" value="${ loginMember.no }">
                          	<!-- 주문 번호 -->
                          	<input type="hidden" name="orderNo" value="${ orderSum.orderNo }">                          	
                          	<!-- 배송 정보 -->
                          	<input type="hidden" name="delName">                          
                          	<input type="hidden" name="delPostcode">                          
                          	<input type="hidden" name="delAddress">                          
                          	<input type="hidden" name="delExtraAddress">                          
                          	<input type="hidden" name="delDetailAddress">                          
                          	<input type="hidden" name="delPhone">                          
                          	<input type="hidden" name="delMsg">     
                          	<!-- 포인트 사용 & 결제 금액 -->    
                          	<input type="hidden" name="pointUsage"> 
                          	<input type="hidden" name="priceFinal">                           	
                          	<!-- 결제 수단 -->
                          	<input type="hidden" name="orderMethod"> 
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
	// 배송지 선택 버튼
	function onlyOne(element){
	    const checkboxes = document.getElementsByName("del-info");
	
	    checkboxes.forEach((cb) => {
	        cb.checked = false;
	    });
	
	    element.checked = true;
	};

	// 배송지 선택에 따라 배송지 입력폼 변경
	$(".check-box").on("change", () => {		
		// 기본배송지
		if($("#checkbox1").is(":checked")){
			$(".address1").css("display", "block");
			$(".address2").css("display", "none");
			
			// required 속성 제거
			$("[name=del-name]").attr("required", false);
			$("[name=del-postcode]").attr("required", false);
			$("[name=del-address]").attr("required", false);
			$("[name=del-detailAddress]").attr("required", false);
			$("[name=del-phone]").attr("required", false);
		}
		
		// 신규배송지
		if($("#checkbox2").is(":checked")){
			$(".address2").css("display", "block");
			$(".address1").css("display", "none");
			
			// required 속성 부여
			$("[name=del-name]").attr("required", true);
			$("[name=del-postcode]").attr("required", true);
			$("[name=del-address]").attr("required", true);
			$("[name=del-detailAddress]").attr("required", true);
			$("[name=del-phone]").attr("required", true);
		}
	})
	
	// 우편번호 찾기 (Daum Postcode Sevice)
	// https://postcode.map.daum.net/guide
	function execution_daum_address(){ 
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.    
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
	        }
	    }).open();  
	}
	
	// 포인트 사용
	$('#point-input').on('keyup', function() {
		let maxPoint = ${ point };
		let orderPrice = parseInt(${ orderSum.orderPrice });

		if (orderPrice < 30000) {
			orderPrice += 2500;
		}
		
		// 숫자만 입력 가능
	    if (/[^0-9]/g.test(this.value)) {
	        this.value = this.value.replace(/[^0-9]/g, '');
	        alert("숫자만 입력가능합니다.");
	    }
		// 보유 포인트 이상 사용 불가능
		if (this.value > maxPoint) {
		    this.value = maxPoint;
		    alert("보유하신 포인트 이상은 사용하실 수 없습니다.");
		}
		// 주문 금액 이상 사용 불가능
		if(this.value > orderPrice){
			this.value = orderPrice;
			alert("주문 금액 이상은 사용하실 수 없습니다.");
		}
	});
	
	// 결제 예정 금액
	$(document).ready(() => {	
		var orderPrice = parseInt(${ orderSum.orderPrice });

		if (orderPrice < 30000) {
			orderPrice += 2500;
		}
		
		$("#sum-result2-product").text(toCommas(orderPrice));
		$("#sum-result2-final").text(toCommas(orderPrice));
	});
	
	// 최종 결제 금액
	$("input[name=point-usage]").on("change", () => {
		$("#sum-result2-final").empty();
		var point = $(event.target).val();
		var orderPrice = parseInt(${ orderSum.orderPrice });
		
		if (orderPrice < 30000) {
			orderPrice += 2500;
		}
		
		console.log(orderPrice);
		
		$("#sum-result2-point").text(toCommas(point));
		$("#sum-result2-final").text(toCommas(orderPrice-point));
	});
		
	// 숫자 3자리마다 ',' 찍기
    function toCommas(value) {
	    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원";
	}
	
	// 구매 동의 체크박스 미선택 시 결제하기 버튼 비활성화
	$(document).ready(() => {
		$("#purchase").attr("disabled", true);
		
		$(".agreement").on("change", () => {
			$("#purchase").attr("disabled", $(".agreement:checked").length == 0);
		});
	});
	
	// 결제하기
	$("#purchase").on("click", () => {
		// 주문 정보
		let orderNo = `${ orderSum.orderNo }`;
		
		// 회원에게 보여줄 주문 번호(주문날짜 + 주문번호) 생성
		let today = new Date();
		
		let year = today.getFullYear();
		let month = today.getMonth() + 1;
		let date = today.getDate();
		
		let clientOrderNo = String(year) + String(month) + String(date) + String(orderNo);
		
		console.log(clientOrderNo);		
		
		// 배송 정보
		if($("#checkbox1").is(":checked")){
			var del = $(".address1").find(".del-table");
		} else if($("#checkbox2").is(":checked")) {
			var del = $(".address2").find(".del-table");
		}
		
		console.log(del);
		
		let delName = del.find("input[name=del-name]").val();
		let delPostcode = del.find("input[name=del-postcode]").val();
		let delAddress = del.find("input[name=del-address]").val();
		let delExtraAddress = del.find("input[name=del-extraAddress]").val();
		let delDetailAddress= del.find("input[name=del-detailAddress]").val();
		let delPhone = del.find("input[name=del-phone]").val();
		let delMsg = del.find("input[name=del-msg]").val();
		
		$("input[name=delName]").val(delName);
		$("input[name=delPostcode]").val(delPostcode);
		$("input[name=delAddress]").val(delAddress);
		$("input[name=delExtraAddress]").val(delExtraAddress);
		$("input[name=delDetailAddress]").val(delDetailAddress);
		$("input[name=delPhone]").val(delPhone);
		$("input[name=delMsg]").val(delMsg);
		
		// 포인트 사용
		$("input[name=pointUsage]").val($(".point-usage").val());
		
		// 결제 금액
		let orderPrice = parseInt(${ orderSum.orderPrice });
		
		if (orderPrice < 30000) {
			orderPrice += 2500;
		}
		
		let price = orderPrice - $("input[name=point-usage]").val();
		
		$("input[name=priceFinal]").val(price);
		
		// 결제 정보
		let method = $("input[type=radio]:checked").val();
		
		console.log("method : " + method);
		
		$("input[name=orderMethod]").val(method);
		
		// 아임포트 설정
		var pg = "";
		var pm = "";
		
		if(method === "일반결제"){
			pg = "html5_inicis";
			pm = "card";
		}
		/*
			네이버페이
		else if(method == "radio2"){
			pg = "naverpay";
			pm = "";
		}
		*/
		else if(method == "카카오페이"){
			pg = "kakao";
			pm = "kakaopay";
		}
		else if(method == "휴대폰결제"){
			pg = "danal";
			pm = "phone";
		}
		
		// 아임포트 결제
		// https://docs.iamport.kr/implementation/payment
		var IMP = window.IMP; // 생략 가능
	    IMP.init("imp95685445"); // 아임포트 가입하여 발급받은 가맹점 식별코드
		
		// IMP.request_pay(param, callback) 결제창 호출
	      IMP.request_pay({ 	    	  
	          pg: pg, // 결제창 정보
	          /*
	          'kakao':카카오페이,
	          html5_inicis':이니시스(웹표준결제)
	          'nice':나이스페이
	          'jtnet':제이티넷
	          'uplus':LG유플러스
	          'danal':다날
	          'payco':페이코
	          'syrup':시럽페이
	          'paypal':페이팔
	          */	        	          
	          pay_method: pm, // 결제 수단
	          /*
	          'samsung':삼성페이,
	          'card':신용카드,
	          'trans':실시간계좌이체,
	          'vbank':가상계좌,
	          'phone':휴대폰소액결제
	          */
	          merchant_uid: orderNo,
	          name: "주문번호 " + clientOrderNo,
	          amount: price,
	          buyer_name: delName,
	          buyer_tel: delPhone,
	          buyer_addr: delAddress + delDetailAddress,
	          buyer_postcode: delPostcode
	      }, function (rsp) { // callback
	          console.log(rsp);
	          if (rsp.success) { 
	        	    // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우		      
	        	  	var msg = '결제가 완료되었습니다';
	        	  	msg += '고유ID : ' + rsp.imp_uid;
	        	  	msg += '상점 거래ID : ' + rsp.merchant_uid;
	        	  	msg += '결제 금액 : ' + rsp.paid_amount;
	        	  	msg += '카드 승인번호 : ' + rsp.apply_num;		        	
	    			
	        	  	$(".order-form").submit();
	          } else {
	        	  var msg = '결제에 실패하였습니다. ';
	        	  msg += '에러내용 : ' + rsp.error_msg;
	          }
	          alert(msg);
	      });
		
	});
</script>
</html>