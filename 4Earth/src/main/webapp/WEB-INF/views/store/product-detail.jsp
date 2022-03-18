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
    <title>상품상세</title>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<div class="container">
            <div class="contents">
                <div class="side-bar is-open">
                    <button class="btn toggle-nav">
                        <i class="material-icons md-24">last_page</i>
                    </button>
                    <ul>
                        <li class="current">
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                        <li>
                            <a href="">
                                <i class="material-icons md-16"></i>
                                <span></span>
                            </a>
                        </li>
                    </ul>
                </div>
                
                <section class="content-wrap">
                    <div class="product">
                    <!-- 
                        slide
                    -->
                        <div class="slider">                                
                            <input type="radio" name="slide" id="slide1" checked>
                            <input type="radio" name="slide" id="slide2">
                            <input type="radio" name="slide" id="slide3">
                            <input type="radio" name="slide" id="slide4">
                            <ul id="imgholder" class="imgs">
	                            <c:if test="${ !empty productImgs }">
		                            <c:forEach var="productImgs" items="${ productImgs }">
		                                <li><img src="${ path }/resources/upload/store/${ productImgs.renamedFileName }"></li>
		                            </c:forEach>
	                            </c:if>
	                            <c:if test="${ empty productImgs }">
	                            	<li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
	                            	<li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
	                            	<li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
	                            	<li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
	                            </c:if>
                            </ul>
                            <div class="bullets">
                                <label for="slide1">&nbsp;</label>
                                <label for="slide2">&nbsp;</label>
                                <label for="slide3">&nbsp;</label>
                                <label for="slide4">&nbsp;</label>
                            </div>                        
                        </div>
                        
                        <div class="pro-info">
                        
                        <table class="pro-table">
                            <thead>
                                <tr>
                                    <td colspan="4">
                                    	${ product.proName }
                                    	<input type="hidden" name="no" value="${ product.proNo }">
                                    </td>
                                </tr>
                            </thead>
                            <tbody class="tbody1">
                                <tr>
                                    <td>가격</td>
                                    <td colspan="3">
                                    	<fmt:formatNumber value="${ product.proPrice }" pattern="##,###,###"/> 원
                                    </td>
                                </tr>
                                <tr>
                                    <td>배송비</td>
                                    <td colspan="3">2,500 원 <p>(30,000원 이상 무료배송)</p></td>
                                </tr>
                                <tr style="border-bottom: 1px solid #999;">
                                    <td>제조사</td>
                                    <td colspan="3">${ product.proMfg }</td>
                                </tr>
                                <tr style="border-bottom: 2px solid #467443;">
                                    <td>옵션</td>
                                    <td colspan="3">
                                        <select name="product-option" id="product-option" class="pro-selectbox">
                                            <option value="--------" selected disabled="disabled">--------</option>                                            
                                            <c:forEach var="optionList" items="${ option }">
                                            	<option value="${ optionList.optNo }">${ optionList.optName }</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                             </tbody> 
                           </table> 
                                <!-- 선택 옵션 -->
                                <form name="addToCart">
	                                <div class="selected-wrap" >	                                
	                                <ul>
	                                <!-- 
	                                <li class="selectedProduct">
	                                	<input type="hidden"; name="proNumber" value="${ product.proNo }">
		                                <div id="selectedOption">사과향</div>
		                                <div class="quantity">
		                                	<input type="number" min="1" max="99" step="1" value="1">
		                                	<div class="quantity-nav">
			                                	<div class="quantity-button quantity-up">+</div>
			                                	<div class="quantity-button quantity-down">-</div>
		                                	</div>
		                                </div>
		                                <p class="selected-price">
			                                10,000 원
			                                <a href="" class="cart-delete"><i class="material-icons md-24" style="font-size: 16px;">close</i></a>
		                                </p>
	                                </li>	                                
	                                 -->
	                             	                         	
	                                </ul>
	                                </div>                                                             
                                </form>
                                <!-- // 선택 옵션 -->                              
                            
                            <div class="pro-result">
                                <button class="btn pro-btn" id="buyNow">바로구매</button>
                                <button class="btn pro-btn" id="addCart">장바구니</button>
                                <c:choose>
	                                 <c:when test="${ (loginMember.no eq product.memberNo) && product.wishStat eq 'Y' }">
                                    	<button class="btn pro-btn wish-added" id="addWish">
                                    		<i class="material-icons" id="wish-done">done</i>찜
                                    	</button>			                                        	
	                                 </c:when>
	                                 <c:otherwise>
                                    	<button class="btn pro-btn" id="addWish">
                                    		<i class="material-icons" id="wish-done" style="display: none;">done</i>찜
                                    	</button>			                                        	
	                                 </c:otherwise>
                               	</c:choose>
                                
                            </div>                            
                        </div>
                    </div>

                    <br><br><br><br><br>
                    
                    <!-- 상품설명 -->
                    <div class="pro-detail">
                    	<div class="pro-detail-img">
	                    	<c:if test="${ !empty product.proModifyImg }">
	                       		<img src="${ path }/resources/upload/store/${ product.proModifyImg }" alt="">
	                       	</c:if>
                    	</div>
                        
                        <div class="pro-detail-description">
                        	<p>
	                        	${ product.proInfo }
                        	</p>
                        </div>
                    </div>
                    <!-- //상품설명 -->

                    <br><br><br><br>

                    <!-- 상품후기 -->
                    <section>
	                    <div class="store-board">
	                        <p>
	                            Review
	                        </p>
                            <button class="btn" id="writeReview" style="float: right;">작성하기</button>
	                    </div>
                        <div class="accordian inquiry">
                            <ul>
                            	<c:if test="${ empty revList }">
                            		<p style="text-align: center;">
	                            		<br>등록된 리뷰가 없습니다.
                            		</p>
                            		<br>
                            	</c:if>
                            	<c:if test="${ !empty revList }">
	                            	<c:forEach var="rev" items="${ revList }">
		                            	<li class="inquiry-li">
		                                    <a href="javascript:void(0);">
		                                   		<span class="icon-star">
		                                            <i class="unfill"></i>
		                                            <i class="fill" style="width: ${ rev.revRating * 20 }%"></i>
		                                        </span>
		                                       	<span class="prd-option">
		                                       		<small>구매 옵션 : ${ rev.proOptName }</small>
		                                       		<br>
		                                       		<p style="width: 300px;">${ rev.revTitle }</p>
		                                   		</span>
		                                        <span class="prd-date">
		                                        	<fmt:formatDate value="${ rev.revDate }" pattern="yyy-MM-dd hh:mm"/>
		                                        </span>
		                                        <span class="inquiry-writerId" style="color: #67b16b; width: 80px;">
		                                        	${ rev.memberId }
		                                        </span>
		                                    </a>
		                                    <div>
		                                    	<c:if test="${ !empty rev.renamedFileName }">
		                                    		<div>
		                                    			<img src="${ path }/resources/upload/store/${ rev.renamedFileName }">
		                                    		</div>
		                                    	</c:if>
		                                        <div class="inqContent-wrap" style="padding: 10px 5px;">
			                                    	${ rev.revContent }
		                                    	</div>		                                    	
		                                    </div>
		                                </li> 
	                            	</c:forEach>
                            	</c:if>                  
                            </ul>
                        </div>
                        <c:if test="${ !empty revList }">
	                        <div class="paging">
	                            <a href="${ path }/product_detail?no=${ product.proNo }&revPage=${ revPageInfo.prevPage }" class="prev"><span>이전</span></a>
	                            <c:forEach begin="${ revPageInfo.startPage }" end="${ revPageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == revPageInfo.currentPage }">				
										<strong>${ status.current }</strong>
									</c:if>
									
									<c:if test="${ status.current != revPageInfo.currentPage }">				
										<a href="${ path }/product_detail?no=${ product.proNo }&revPage=${ status.current }&count=${ revPageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
	                            <a href="${ path }/product_detail?no=${ product.proNo }&revPage=${ revPageInfo.nextPage }" class="next"><span>다음</span></a>
	                        	<input type="hidden" name="no" value="${ product.proNo }">
	                        </div>
                        </c:if>
                    </section>
                    <!-- // Board -->

                    <br><br><br><br>

                    <!-- 상품문의 -->
                    <section>
	                    <div class="store-board">
	                        <p>
	                            Q & A
	                        </p>
	                            <button class="btn" id="writeQnA" style="float: right;">작성하기</button>
	                     </div>   
                        <div class="accordian inquiry">
                            <ul>
                            	<c:if test="${ empty inqList }">
                            		<p style="text-align: center;">
                            			<br>등록된 문의가 없습니다.
                            		</p>
                            		<br>
                            	</c:if>
                            	<c:if test="${ !empty inqList }">
	                            	<c:forEach var="inq" items="${ inqList }">
		                            	<li class="inquiry-li">
		                                    <a href="javascript:void(0);">		                                        
		                                        <c:if test="${ inq.inqStat eq 'N' }">
		                                        	<p></p>
		                                        </c:if>
		                                        <c:if test="${ inq.inqStat eq 'Y' }">
		                                        	<p>&lt;답변완료&gt;</p>
		                                        </c:if>		                                        
		                                        <p style="padding-left: 50px">
		                                        	<c:if test="${ inq.inqSecret eq 'Y' }">
		                                        		<i class="material-icons md-16">lock</i>
		                                        	</c:if>		                                            
		                                            ${ inq.inqTitle }
		                                        </p>
		                                        <p class="prd-date" style="width: 165px;">
		                                        	<fmt:formatDate value="${ inq.inqDate }" pattern="yyy-MM-dd hh:mm"/>
		                                        </p>
		                                        <p class="inquiry-writerId" style="color: #67b16b;">${ inq.memberId }</p>
		                                    </a>
		                                    <div>
		                                        <i class="icon-question"></i>
		                                        <div class="inqContent-wrap" style="padding: 10px 5px;">
			                                    	${ inq.inqContent }
		                                    	</div>
		                                    </div>
		                                    <div>
		                                        <i class="icon-answer"></i>
		                                        <p>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br></p>
		                                    </div>
		                                </li>
	                            	</c:forEach>
                            	</c:if>                                
                            </ul>
                        </div>
                        <c:if test="${ !empty inqList }">
	                        <div class="paging">
	                            <a href="${ path }/product_detail?no=${ product.proNo }&inqPage=${ inqPageInfo.prevPage }" class="prev"><span>이전</span></a>
	                            <c:forEach begin="${ inqPageInfo.startPage }" end="${ inqPageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == inqPageInfo.currentPage }">				
										<strong>${ status.current }</strong>
									</c:if>
									
									<c:if test="${ status.current != inqPageInfo.currentPage }">				
										<a href="${ path }/product_detail?no=${ product.proNo }&inqPage=${ status.current }&count=${ inqPageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
	                            <a href="${ path }/product_detail?no=${ product.proNo }&inqPage=${ inqPageInfo.nextPage }" class="next"><span>다음</span></a>
	                        	<input type="hidden" name="no" value="${ product.proNo }">
	                        </div>
                        </c:if>
                    </section>
                    <!-- // Accordian -->
                    
                    
                      <!-- 바로구매 form -->
                      <form:form id="form" modelAttribute="cartList" onsubmit="return false;"> 
                     
                      </form:form>
                    
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
        let menuPath = ['${ path }/product_list', '${ path }/bidding_list','${ path }/map'];
        let menuName = ['소분샵', '소분샵 입고 신청', '오프라인 매장 안내'];
        let menuIcon = ['storefront', 'edit', 'location_on' ];

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }
        
        sideBarMenu.each(function(idx, el) {
            if(idx == 0) {
                $(this).addClass('current');
            }
        });
    });
    
    // 옵션 선택
    $(document).on("change", "#product-option", function(e) {
    	console.log($("#product-option option:selected").text());	
    
    	var option = $("#product-option option:selected").text();
    	var optionNumber = $("#product-option option:selected").val();
    	var price = '<c:out value="${ product.proPrice }"/>';
    	
    	let selected = "<li class='selectedProduct'>"
					    +   "<div class='selectedOption'>"
					    +	option 
					    +	"</div>"
    					+ 	"<input type='hidden'; name='optNumber'; value='" +optionNumber+ "'>"
					    +   "<div class='quantity'>"
					    +    "<input type='number' min='1' max='99' step='1' value='1'>"
					    +   	"<div class='quantity-nav'>"
					    +        "<div class='quantity-button quantity-up'>+</div>"
					    +        "<div class='quantity-button quantity-down'>-</div>"
					    +    	"</div>"
					    +    "</div>"
					    +    "<p class='selected-price'>"
					    +	 "<span class='price-span'>"
					    +	toCommas(price)
					    +	 "</span>"
					    +	 "<a href='' class='cart-delete'><i class='material-icons md-24' style='font-size: 16px;'>close</i></a>"
					    +    "</p>"
					    + "</li>";	
					    
    	$(".selected-wrap ul").append(selected);   
    	
    	$(".selectedProduct").on("click", ".cart-delete", function(e) {
    		console.log("삭제");
    		
    		e.stopPropagation();
    		e.preventDefault();
    		 
			$(this).closest('.selectedProduct').remove();
    	});
    }); 	

   	// 수량 변경    	
   	// +
	$(document).on("click", ".quantity-up", function(e){		
		console.log("+");
		
		e.stopPropagation();
		
		let input = $(this).parent().siblings('input[type="number"]');
		
		let value = input.val();
		
		console.log(value);
		
		value = isNaN(value) ? 1 : value;
		
		value++;
		
		// max 이상 입력 불가
		(value > input.attr('max')) ? value = input.attr('max') : value;
		
		console.log(value);
		
		input.val(value);
		
		// 금액 변경
		let price = $(this).parents(".quantity").siblings(".selected-price").find(".price-span");
		
		price.empty();
		
		price.text(toCommas(${ product.proPrice } * value));
   	});
    	
   	// -
   	$(document).on("click", ".quantity-down", function(e){
		console.log("-");
		
		e.stopPropagation();
   		
		let input = $(this).parent().siblings('input[type="number"]');
		
   		let value = input.val();
   		
   		console.log(value);
   		
   		value--;
   		
   		// min(1) 미만 입력 불가능
   		(value < input.attr('min')) ? value = input.attr('min') : value;
   		
   		console.log(value);
   		
   		input.val(value);
   		
   		// 금액 변경
		let price = $(this).parents(".quantity").siblings(".selected-price").find(".price-span");
		
		price.empty();
		
		price.text(toCommas(${ product.proPrice } * value));
   	});    	
    	
   	// 선택 옵션 삭제
   	/* $(".selectedProduct").on("click", ".cart-delete", function(e) {
   		console.log("삭제");
   		
   		e.preventDefault();
   		 
		$(this).closest('.selectedProduct').remove();
   	}); */	   
    
    // 숫자 3자리마다 ',' 찍기
    function toCommas(value) {
	    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원";
	}
    
   	// 바로구매
   	$(document).on("click", "#buyNow", function() {
   		let form = document.getElementById("form");
   		let form_content = '';
   		let index = 0;
   		
   		$(".selected-wrap ul").find(".selectedProduct").each(function(i, element) {
   			var selected = $(element);
			
   			var proOptNo = selected.find("input[type='hidden']").val();
   			var proOptName = selected.find(".selectedOption").text();
   			var cartQty = selected.find("input[type='number']").val();
   			
   			console.log(proOptNo);
   			console.log(proOptName);
   			console.log(cartQty);
   			
   			let input = "<input name='cartList[" + index + "].proName' type='hidden' value='" + `${ product.proName }` + "'>"
					    + "<input name='cartList[" + index + "].proNo' type='hidden' value='" + `${ product.proNo }` + "'>"
						+ "<input name='cartList[" + index + "].proOptNo' type='hidden' value='" + proOptNo + "'>"
						+ "<input name='cartList[" + index + "].proOpt' type='hidden' value='" + proOptName + "'>"
						+ "<input name='cartList[" + index + "].proPrice' type='hidden' value='" + `${ product.proPrice }` + "'>"
						+ "<input name='cartList[" + index + "].cartQty' type='hidden' value='" + cartQty + "'>";
					
			form_content += input;
			
			index += 1;	
   		});
   		
   		$("#form").html(form_content);
		
		form.action = "${ path }/purchase_payment"
		form.method = "POST";
		form.submit();
   	});
   	
	// 장바구니	
	$(document).on("click", "#addCart", function() {	
		let itemArr = new Array();
		
		$(".selected-wrap ul").find(".selectedOption").each(function() {
			console.log($(this));
			console.log($(this).next);
			
			var product = `${ product.proName }`;	
			var productNumber = `${ product.proNo }`;
			var optionNumber = $(this).next().val();
			var option = $(this).text();			
			var quantity = $(this).siblings(".quantity").children("input[type='number']").val(); // 수량
			
			console.log("option : " + option);
			console.log("optionNumber : " + optionNumber);
			console.log("quantity : " + quantity);
			
			let item = {
					proNo : productNumber,
					proName : product,
					proOptNo : optionNumber,
					proOpt : option,
					cartQty : quantity
			}
			
			console.log("item : " + item);
			
			itemArr.push(item);
		});
		
		console.log(itemArr);	
		console.log(JSON.stringify(itemArr));
		
		$.ajax({
		    type : "post",
		    url : "${ path }/add_cart", 
		    data : 
		    	JSON.stringify(itemArr)
		    ,
		    contentType : 'application/json; charset=UTF-8',
		    error : function(request, error) {
		    	console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    	
		    	if(request.status === 500){
		    		alert("장바구니에 동일한 상품이 있습니다.")
		    	}
		    	else if(request.status === 400){		    		
			    	alert("우선 로그인해주세요");
			    	window.location = "${ path }/login";
		    	}
		    },
		    success : function(data) {
				console.log("ajax success");
				console.log("data : " + data);
				
				alert("장바구니에 담았습니다.");	
		    }
		});
	});
	
	// 찜
	$("#addWish").click(function() {
		var selected = $(this);
		var productNo = ${ product.proNo };
        
		console.log(productNo);
		console.log(selected);
		
        console.log(JSON.stringify(productNo));
        
        $.ajax({
			type : "post",
			url : "${ path }/add_wish",
			data : 
				JSON.stringify(productNo),
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
				
				selected.toggleClass("wish-added");
				
				if(data === "Wish Added" || data === "Wish Again"){
					$("#wish-done").show();
					alert("찜 성공");
				}
				else if(data === "Wish Deleted"){
					$("#wish-done").hide();
					alert("찜 삭제");
				}
				
			}
		});     
	});

    // 리뷰 작성
    $("#writeReview").on("click", () => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        var loginMember = "<%= session.getAttribute("loginMember") %>";
        var no = ${ product.proNo };
        const url = "${ path }/write_review?no=" + no;
        
        if(loginMember == "null"){
        	alert("로그인 후 이용이 가능합니다.");
        	
        	window.location = "${ path }/login";
        } else{
        	
        	open(url, "", 'status=no, height=800, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
        }               
    });

    // 문의 작성
    $("#writeQnA").on("click", () => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        var loginMember = "<%= session.getAttribute("loginMember") %>";
        var no = ${ product.proNo };
        const url = "${ path }/write_qna?no=" + no;
        
        console.log(loginMember);
        console.log(typeof(loginMember));
        
        if(loginMember == "null"){
        	alert("로그인 후 이용이 가능합니다.");
        	
        	window.location = "${ path }/login";
        } else{
        	
        	open(url, "", 'status=no, height=800, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
        }
	});
    
    // 문의 - 비밀글 조회
    $(".inquiry-li a").on("click", function(e){
    	var loginMemberId = `${ memberId }`;
		var inquiryMemberId = $(this).find(".inquiry-writerId").text();		
		
		if(loginMemberId != inquiryMemberId && loginMemberId != "admin1" && $(this).find(".material-icons").length == 1){
			alert("비밀글입니다.");
			
			// .accordian is not a function 에러가 나는데, 원하는대로 동작됨..
			$(".inquiry-li").accordian({
				active: false, collapsible: true, active: true
			});
		}		
    });
</script>

</html>