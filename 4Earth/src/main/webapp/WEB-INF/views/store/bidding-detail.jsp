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
    <title>모집상세</title>
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
                        <div class="bid-img"> 
                        	<img src="${ path }/resources/upload/store/${ product.renamedFileName }" alt="" class="bid-detail-img">
                        </div>
                        <div class="pro-info">
	                        <table class="pro-table" style="height: 350px;">
	                            <thead>
	                                <tr>
	                                    <td>${ product.bidName }</td>
	                                </tr>
	                            </thead>
	                            <tbody class="tbody1">
	                                <tr>
	                                    <td colspan="4" style="padding-top: 10px;">
	                                        <div class="progress prog-detail">
	                                            <div class="progress-bar bg-success" role="progressbar" style="width: ${ product.bidCurr div product.bidCond * 100 }%" aria-valuenow="${ product.bidCurr div product.bidCond * 100 }" aria-valuemin="0" aria-valuemax="100"></div>
	                                        </div>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td colspan="3" style="font-weight: bold;">${ product.bidCurr } 명 참여</td>
	                                    <td style="text-align: right;">
	                                    	달성률 <fmt:formatNumber value="${ product.bidCurr div product.bidCond * 100 }" pattern=".0"/>%	                                    	
	                                    </td>
	                                </tr>
	                                <tr style="border-bottom: 1px solid #999; ">
	                                    <td colspan="4" ><p><b>${ product.bidCond }</b> 명의 관심이 모이면 에코샵에서 만나볼 수 있습니다.</p></td>
	                                </tr>
	                                <tr style="padding-bottom: 15px;">
	                                    <td colspan="4">
	                                        <p>기존 판매처 링크 : </p>
	                                    </td>
	                                </tr> 
	                                <tr>
	                                    <td colspan="4" style="border-bottom: 1px solid #999;">
	                                        <a href="" style="word-break: break-all;">${ product.bidUrl }</a>
	                                    </td>
	                                </tr>                             
	                            </tbody>
	                            <tr class="pro-result">
	                                <th colspan="4">
	                                    <button class="btn bid-btn" id="addBid">관심있어요</button>
	                                    <button class="btn bid-btn"><i class="material-icons md-24">share</i></button>
	                                </th>
	                            </tr>                            
	                        </table>
                        </div>                        
                    </div>

                    <br><br><br><br>
                    

                    <br><br><br><br>

                    <!-- 한마디 게시판 -->
                    <section>
                    	<div class="store-board">
	                        <p>
	                            관심있는 회원들의 한마디
	                        </p>
                            <button class="btn" id="writeReview" style="float: right;">작성하기</button>
                        </div>
                        <div class="board">
                            <table class="table bid-board">
                                <tbody>
                                    <tr>
                                        <td>
                                            <p>10명만 더..!</p>
                                        </td>
                                        <td>2021.00.00</td>
                                        <td>홍길동</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>입고 제발</p>
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
        
        sideBarMenu.each(function(idx, el) {
            if(idx == 1) {
                $(this).toggleClass('current');
            }
        });
    });
    
 	// 관심있어요
	$("#addBid").click(function() {
		var selected = $(this);
		var bidNo = ${ product.bidNo };
        
		console.log(bidNo);
		console.log(typeof bidNo);
		console.log(selected);
		
        console.log(JSON.stringify(bidNo));
        
        $.ajax({
			type : "post",
			url : "${ path }/add_bid",
			data : 
				JSON.stringify(bidNo),
			contentType : 'application/json; charset=UTF-8',
			error : function(request, error){
		    	console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    	
		    	if(request.status === 500){
		    		alert("이미 참여하셨습니다.");
		    	}
		    	else if(request.status === 400){		    		
			    	alert("우선 로그인해주세요");
			    	window.location = "${ path }/login";
		    	}
			},
			success : function(data){
				console.log("ajax success");
				console.log(data);
				
				if(data === "Bid Added" || data === "Bid Again"){
					alert("참여 성공");
					
					location.reload();
				}
				else if(data === "Bid Deleted"){
					alert("참여 취소");
				}
				
			}
		});
	});
</script>

</html>