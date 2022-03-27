<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
	<link rel="stylesheet" href="resources/css/store.css">
    <script src="https://kit.fontawesome.com/da4a2ee2c4.js" crossorigin="anonymous"></script>
    <title>상품목록</title>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div class="container">
            <div class="contents">
                <div class="side-bar is-open">
                    <button class="btn toggle-nav">
                        <i class="material-icons md-24">last_page</i>
                    </button>
                    <ul>
                        <li class="">
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
                    <div class="page-tit">
                        <h3>에코샵</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코샵</a>
                            <span>에코샵</span>
                        </div>
                    </div>

                    <div class="store-wrap"> 

                        <!-- Category -->
                        <section>	
                           	
                          	<form action="${ path }/product_category?category="${ category }">
                            <div class="category">
                            	<div class="store-category">
	                            	<strong>카테고리</strong>	 
		                            	<input type="radio" name="category" id="raio1" value="전체" checked="checked"
		                            		onchange="this.form.submit()" <c:if test="${category eq '전체'}">checked</c:if>>
		                                <label class="category-first" for="raio1">전체</label>
		                                <input type="radio" name="category" id="radio2" value="식품" 
		                                	onchange="this.form.submit()" <c:if test="${category eq '식품'}">checked</c:if>>
		                                <label class="category-first" for="radio2">식품</label>
		                                <input type="radio" name="category" id="radio3" value="생활" 
		                                	onchange="this.form.submit()" <c:if test="${category eq '생활'}">checked</c:if>>
		                                <label class="category-first" for="radio3">생활</label>
		                                <input type="radio" name="category" id="radio4" value="뷰티" 
		                                	onchange="this.form.submit()" <c:if test="${category eq '뷰티'}">checked</c:if>>
		                                <label class="category-first" for="radio4">뷰티</label>
		                                <input type="radio" name="category" id="radio5" value="반려동물" 
		                                	onchange="this.form.submit()" <c:if test="${category eq '반려동물'}">checked</c:if>>
		                                <label class="category-first" for="radio5">반려동물</label>
		                                <input type="hidden" name="arrange" value="${ arrange }">
	                            	                         
	                            </div>
	                            <c:if test="${ category ne '전체' }">
                                <ul>
                                    <li>
                                        <strong>상세 필터</strong>
                                        <div class="check-group" id="detail-div">
                                            <div class="check-box food">
                                                <input type="checkbox" class="cb-category" id="checkbox1" name="category-detail" value="간편식"> 
                                                <label for="checkbox1">간편식</label>
                                            </div>  
                                            <div class="check-box food">
                                                <input type="checkbox" class="cb-category" id="checkbox2" name="category-detail" value="디저트/간식"> 
                                                <label for="checkbox2">디저트/간식</label>
                                            </div>    
                                            <div class="check-box food">
                                                <input type="checkbox" class="cb-category" id="checkbox3" name="category-detail" value="건조식품"> 
                                                <label for="checkbox3">건조 식품</label>
                                            </div>   
                                            <div class="check-box living">
                                                <input type="checkbox" class="cb-category" id="checkbox4" name="category-detail" value="세탁"> 
                                                <label for="checkbox4">세탁</label>
                                            </div>  
                                            <div class="check-box living">
                                                <input type="checkbox" class="cb-category" id="checkbox5" name="category-detail" value="주방"> 
                                                <label for="checkbox5">주방</label>
                                            </div>  
                                            <div class="check-box living">
                                                <input type="checkbox" class="cb-category" id="checkbox6" name="category-detail" value="욕실"> 
                                                <label for="checkbox6">욕실</label>
                                            </div>  
                                            <div class="check-box beauty">
                                                <input type="checkbox" class="cb-category" id="checkbox7" name="category-detail" value="바디케어"> 
                                                <label for="checkbox7">바디케어</label>
                                            </div>  
                                            <div class="check-box beauty">
                                                <input type="checkbox" class="cb-category" id="checkbox8" name="category-detail" value="기초화장품"> 
                                                <label for="checkbox8">기초화장품</label>
                                            </div>
                                            <div class="check-box beauty">
                                                <input type="checkbox" class="cb-category" id="checkbox9" name="category-detail" value="메이크업"> 
                                                <label for="checkbox9">메이크업</label>
                                            </div>  
                                            <div class="check-box beauty">
                                                <input type="checkbox" class="cb-category" id="checkbox10" name="category-detail" value="헤어케어"> 
                                                <label for="checkbox10">헤어케어</label>
                                            </div>  
                                            <div class="check-box pet">
                                                <input type="checkbox" class="cb-category" id="checkbox11" name="category-detail" value="강아지"> 
                                                <label for="checkbox11">강아지</label>
                                            </div>  
                                            <div class="check-box pet">
                                                <input type="checkbox" class="cb-category" id="checkbox12" name="category-detail" value="고양이"> 
                                                <label for="checkbox12">고양이</label>
                                            </div>                                                                        
                                        </div>
                                    </li>
                                </ul>
                                </c:if>
                            </div>
                            <div class="btn-wrap">
                                <button class="btn gray" type="reset" onclick="removeChecked()">초기화</button>
                                <button class="btn" type="submit">적용</button>
                            </div>
                        </form>     
                        </section>
                        <!-- // Category -->

						<br><br><br><br>

                        <!-- Thumbnail List -->
                        <section>	  
                        	<div class="board-head prd">
	                            <form action="${ path }/product_arrange?category=${ category }">
		                            <strong class="count-prd">
		                                총 <b>${ count }</b>개의 상품이 있습니다. 
		                            </strong>
		                            <select name="arrange" id="store-arrange" class="store-selectbox" onchange="submit()">
		                                <option value="신상품순" <c:if test="${arrange eq '신상품순'}">selected</c:if> >신상품순</option>	                            
		                                <option value="판매순" <c:if test="${arrange eq '판매순'}">selected</c:if>>판매순</option>
		                                <option value="별점순" <c:if test="${arrange eq '별점순'}">selected</c:if>>별점순</option>
		                                <option value="낮은가격순" <c:if test="${arrange eq '낮은가격순'}">selected</c:if>>낮은가격순</option>
		                                <option value="높은가격순" <c:if test="${arrange eq '높은가격순'}">selected</c:if>>높은가격순</option>
		                            </select>  
		                            <input type="hidden" name="category" value="${ category }">	
		                            <input type="hidden" name="category-detail" value="${ detail }">		                            
	                            </form>
                        	</div>                      
                            
                            
                            <div class="thumb-list">
                                <ul style="width:100%;">
                                	<c:if test="${ !empty list }">
                                		<c:forEach var="product" items="${ list }">
                                			<li>
		                                        <div class="img-thumb store-thumb">
		                                        <a href="${ path }/product_detail?no=${ product.proNo }">
		                                        	<c:if test="${ empty product.proModifyImg }">
		                                        		<img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
		                                        	</c:if>
		                                        	<c:if test="${ !empty product.proModifyImg }">
		                                        		<img src="${ path }/resources/upload/store/${ product.proModifyImg }" alt="">
		                                        	</c:if>		                                            
		                                        </a>
		                                        </div>
		                                        <div class="tag-wrap">
		                                        	<c:if test="${ product.isNew lt 3 }">
			                                            <span class="tag tag-orange">
			                                            	NEW
			                                            </span>
		                                        	</c:if>
		                                        </div>
		                                        <input type="hidden" value="${ product.proNo }">
		                                        <strong><a href="${ path }/product_detail?no=${ product.proNo }">${ product.proName }</a></strong>
		                                        <div class="price">
		                                        	<fmt:formatNumber value="${ product.proPrice }" pattern="##,###,###"/> 원
		                                        </div>
		                                        <div class="review">
		                                        	<c:if test="${ product.proRating ne 0.0 }">
			                                        	<small>
					                                        <span class="icon-star">
				                                                <i class="unfill"></i>
				                                                <i class="fill" style="width: ${ product.proRating * 20 }%"></i>
				                                            </span>
				                                        	${ product.proRating }
			                                        	</small>
		                                        	</c:if>
		                                        	<c:if test="${ product.proRating eq 0.0 }">
		                                        		<small>ㅡ</small>
		                                        	</c:if>
		                                        </div>
		                                        <div class="btn-wrap">
		                                        	<c:choose>
				                                        <c:when test="${ (loginMember.no eq product.memberNo) && product.wishStat eq 'Y' }">
			                                            	<a href="javascript:void(0);"><i class="heart fa fa-heart"></i></a>			                                        	
				                                        </c:when>
				                                        <c:otherwise>
			                                            	<a href="javascript:void(0);"><i class="heart fa fa-heart-o"></i></a>			                                        	
				                                        </c:otherwise>
		                                        	</c:choose>
		                                        </div>
		                                    </li>
                                		</c:forEach>
                                	</c:if>
                                </ul>
                            </div>
                        </section>
                        <!-- // Thumbnail List -->

                        <div class="paging">
                        	<a href="${ path }/product_arrange?category=${ category }&category-detail=${ detail }&page=1&count=${ pageInfo.listLimit }&arrange=${ arrange }" class="first"><span>맨 앞으로</span></a> 
                            <a href="${ path }/product_arrange?category=${ category }&category-detail=${ detail }&page=${ status.current }&count=${ pageInfo.listLimit }&arrange=${ arrange }" class="prev"><span>이전</span></a>
                            <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:if test="${ status.current == pageInfo.currentPage }">				
									<strong>${ status.current }</strong>
								</c:if>
								
								<c:if test="${ status.current != pageInfo.currentPage }">				
									<a href="${ path }/product_arrange?category=${ category }&category-detail=${ detail }&page=${ status.current }&count=${ pageInfo.listLimit }&arrange=${ arrange }">${ status.current }</a>
								</c:if>
							</c:forEach>
                            <a href="${ path }/product_arrange?category=${ category }&category-detail=${ detail }&page=${ pageInfo.nextPage }&count=${ pageInfo.listLimit }&arrange=${ arrange }" class="next"><span>다음</span></a>
                        	<a href="${ path }/product_arrange?category=${ category }&category-detail=${ detail }&page=${ pageInfo.maxPage }&count=${ pageInfo.listLimit }&arrange=${ arrange }" class="last"><span>맨 뒤로</span></a>
                        </div>
                    </div> <!-- // store-wrap -->
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
        let menuName = ['에코샵', '모집 중인 상품', '오프라인 매장 안내'];
        let menuIcon = ['storefront', 'edit', 'location_on' ]

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

    // 찜
    $(document).on("click", ".heart.fa", function() {
        var selected = $(this);
    	var productNo = $(this).parents("li").find("input[type='hidden']").val();
        
        console.log(JSON.stringify(productNo));
        
		$.ajax({
			type : "post",
			url : "${ path }/add_wish",
			data : 
				productNo,
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
				
				console.log(selected);
				selected.toggleClass("fa-heart fa-heart-o");
				
				if(data === "Wish Added" || data === "Wish Again"){
					alert("찜한 상품은 마이페이지 > 찜한 상품에서 확인하실 수 있습니다.");
				}
				else if(data === "Wish Deleted"){
					alert("찜 목록에서 삭제되었습니다.");
				}
			}
		});        
    }); 
     
    // 상세 필터 - 체크박스
    $(document).ready(() => {
    	$('.check-box').hide();    	
    	
   		var radio = $(':radio[name="category"]:checked').val();
   		
   		if(radio == "식품") {
   			$(".food").show();
   		} 
   		if(radio == "생활") {
   			$(".living").show();
   		}  
   		if(radio == "뷰티") {
   			$(".beauty").show();
   		} 
   		if(radio == "반려동물") {
   			$(".pet").show();
   		}     	
    });
    
    // 체크박스 유지    
   $(() => {
	   var arr = JSON.parse(localStorage.getItem('checked')) || [];
	   arr.forEach((c, i) => $('.cb-category').eq(i).prop('checked', c));
	
	   $(".cb-category").click(() => {  
	     var arr = $('.cb-category').map((i, el) => el.checked).get();
	     localStorage.setItem("checked", JSON.stringify(arr));
	   });
	 });   

    // 체크박스 초기화
    function removeChecked(){
    	localStorage.removeItem('checked');
    	
    	location.href = "${ path }/product_category?category=${ category }";
    }    
</script>

</html>