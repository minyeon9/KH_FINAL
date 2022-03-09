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
	                                              <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
	                                          </div>
	                                      </td>
	                                      <td colspan="3" style="text-align: left;">
	                                          <strong>${ orderDetail.detailProName }</strong>
	                                          <p>${ orderDetail.detailOptName }</p>
	                                      </td>
	                                      <td style="text-align: center;">${ orderDetail.detailQty }</td>
	                                      <td style="text-align: center;">${ orderDetail.detailPrice }</td>
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
                                          <input type="text" value="${ loginMember.name }" readonly="readonly">
                                      </td>
                                  </tr>
                                  <tr style="border-bottom: none; height: 17%;">
                                      <td rowspan="2" class="del-item" style="height: 95px;">주소</td>
                                      <td colspan="2">
                                          <input type="text" readonly="readonly">
                                      </td>
                                  </tr>
                                  <tr style="height: 17%;">
                                      <td>
                                          <input type="text" size="40px" readonly="readonly" value="${ loginMember.address }">
                                      </td>
                                      <td>
                                          <input type="text" size="30px" readonly="readonly" value="">
                                          <input type="text" readonly="readonly" value="">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="del-item" style="height: 50px;">전화번호</td>
                                      <td colspan="2">
                                          <input type="text" placeholder="'-' 생략" value="${ loginMember.phone }" readonly="readonly">
                                      </td>
                                  </tr>
                                  <tr>
                                      <td class="del-item" style="height: 50px;">배송 요청사항</td>
                                      <td colspan="2">
                                          <input type="text" size="90px" list="del-msg" placeholder="(직접 입력)">
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
                                          <input type="text" size="30px" id="sample6_extraAddress" placeholder="참고항목">
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
                                          <input type="text" size="90px" list="del-msg" placeholder="(직접 입력)">
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
                                          <label class="btn btn-radio" for="raio1">일반 결제</label>
                                          <input type="radio" class="btn-check" name="options-outlined" id="radio2">
                                          <label class="btn btn-radio" for="radio2">네이버 페이</label>
                                          <input type="radio" class="btn-check" name="options-outlined" id="radio3">
                                          <label class="btn btn-radio" for="radio3">카카오 페이</label>
                                          <input type="radio" class="btn-check" name="options-outlined" id="radio4">
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
</script>
</html>