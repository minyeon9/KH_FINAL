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
                                <li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
                                <li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
                                <li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
                                <li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
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
                                    <td colspan="4">${ product.proName }</td>
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
                                        <select name="product-option" id="product-option" class="pro-selectbox" onchange="getOption(this)">
                                            <option value="--------" selected>--------</option>                                            
                                            <c:forEach var="optionList" items="${ list }">
                                            	<option value="${ optionList.optName }">${ optionList.optName }</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </tr>
                             </tbody> 
                           </table> 
                                <!-- 선택 옵션 -->
                                <div class="selected-wrap" >
                                <ul>
                             	                         	
                                </ul>
                                </div>
                                                             
                                <!-- // 선택 옵션 -->                              
                            
                            <div class="pro-result">
                                <button class="btn pro-btn">바로구매</button>
                                <button class="btn pro-btn">장바구니</button>
                                <button class="btn pro-btn">찜</button>
                            </div>                            
                        </div>
                    </div>

                    <br><br><br><br><br>
                    
                    <!-- 상품설명 -->
                    <div class="pro-detail">
                        상품 <br>
                        상세 <br>
                        설명 <br>
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
                        <div class="board">
                            <table class="table">
                                <colgroup>
                                    <col width="15%">
                                    <col width="*">
                                    <col width="10%">
                                    <col width="10%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>
                                            <span class="icon-star">
                                                <i class="unfill"></i>
                                                <i class="fill" style="width: 50%"></i>
                                            </span>
                                        </td>
                                        <td class="board-tit">
                                            <span class="prd-option">구매 옵션 : <b>화이트</b></span>
                                            <p>맛있어요 어쩌구 저쩌구</p>
                                        </td>
                                        <td>2021.00.00</td>
                                        <td>홍길동</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="icon-star">
                                                <i class="unfill"></i>
                                                <i class="fill" style="width: 30%"></i>
                                            </span>
                                        </td>
                                        <td class="board-tit">
                                            <span class="prd-option">구매 옵션 : <b>화이트</b></span>
                                            <p>맛있어요 어쩌구 저쩌구</p>
                                        </td>
                                        <td>2021.00.00</td>
                                        <td>홍길동</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="paging">
                            <a href="#" class="prev"><span>이전</span></a>
                            <strong>1</strong>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">7</a>
                            <a href="#">8</a>
                            <a href="#">9</a>
                            <a href="#">10</a>
                            <a href="#" class="next"><span>다음</span></a>
                        </div>
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
                                <li>
                                    <a href="javascript:void(0);">
                                        <p>답변완료</p>
                                        <p>
                                            <i class="material-icons md-16">lock</i>
                                            비밀글입니다.
                                        </p>
                                        <p>2022-00-00</p>
                                        <p>user ID</p>
                                    </a>
                                    <div>
                                        <i class="icon-answer"></i>
                                        <p>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br></p>
                                    </div>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">
                                        <p>답변완료</p>
                                        <p>
                                            <i class="material-icons md-16">lock</i>
                                            비밀글입니다.
                                        </p>
                                        <p>2022-00-00</p>
                                        <p>user ID</p>
                                    </a>
                                    <div>
                                        <i class="icon-answer"></i>
                                        <p>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br></p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <div class="paging">
                            <a href="#" class="prev"><span>이전</span></a>
                            <strong>1</strong>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">7</a>
                            <a href="#">8</a>
                            <a href="#">9</a>
                            <a href="#">10</a>
                            <a href="#" class="next"><span>다음</span></a>
                        </div>
                    </section>
                    <!-- // Accordian -->
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
        let menuIcon = ['storefront', 'edit', 'location_on' ]

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }
    });
    
    // 옵션 선택
    function getOption(op){
    	var option = op.value;
    	var price = '<c:out value="${ product.proPrice }"/>';
    	
    	$(".selected-wrap").append("<li class='selectedProduct'><div id='selectedOption'>" +option+ "</div><div class='quantity'><input type='number' min='1' max='99' step='1' value='1'><div class='quantity-nav'><div class='quantity-button quantity-up'>+</div><div class='quantity-button quantity-down'>-</div></div></div><p class='price'>" +toCommas(price)+ "<button class='product-btn'><i class='material-icons md-24' style='font-size: 16px;'>close</i></button></p></li> ");
    }
    
    // 숫자 3자리마다 , 찍기
    function toCommas(value) {
	    return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " 원";
	}
    
    // 수량 선택
    $('<div class="quantity-nav"><div class="quantity-button quantity-up">+</div><div class="quantity-button quantity-down">-</div></div>').insertAfter('.quantity input');
   
    $(document).on('click', '.quantity-button', function() {    
	    $('.quantity').each(function() {
	      var spinner = $(this),
	        input = spinner.find('input[type="number"]'),
	        btnUp = spinner.find('.quantity-up'),
	        btnDown = spinner.find('.quantity-down'),
	        min = 1,
	        max = 99;
	
	      btnUp.click(function() {
	        var oldValue = parseFloat(input.val());
	        
	        console.log(oldValue);
	        
	        if (oldValue >= max) {
	          var newVal = oldValue;
	        } else {
	          var newVal = oldValue + 1;
	        }
	        
	        console.log(newVal);
	        
	        spinner.find("input").val(newVal);
	        spinner.find("input").trigger("change");
	      });
	
	      btnDown.click(function() {
	        var oldValue = parseFloat(input.val());
	        console.log(oldValue);
	        if (oldValue <= min) {
	          var newVal = oldValue;
	        } else {
	          var newVal = oldValue - 1;
	        }
	        console.log(newVal);
	        spinner.find("input").val(newVal);
	        spinner.find("input").trigger("change");
	      });
	    });    
    });

    // 리뷰 작성
    $("#writeReview").on("click", () => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "${ path }/write_review";
        
        open(url, "", 'status=no, height=800, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });

    // 문의 작성
    $("#writeQnA").on("click", () => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "${ path }/write_qna";
        
        open(url, "", 'status=no, height=800, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
</script>

</html>