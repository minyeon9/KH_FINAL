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
                        <h3>
                        	모집 중인 상품
                        	<span>에코샵에서 만나보고 싶으신 상품을 신청하고, 모집에 참여해주세요.</span>
                        </h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코샵</a>
                            <span>에코샵 입고 신청</span>
                        </div>
                    </div>
                    
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
	                                    <td colspan="4"><p>총 <b class="count-user">${ product.bidCond }</b> 명의 관심이 모이면 에코샵에서 만나볼 수 있습니다.</p></td>
	                                </tr>
	                                <tr style="padding-bottom: 15px;">
	                                    <td colspan="4">
	                                        <p>기존 판매처 링크 : </p>
	                                    </td>
	                                </tr> 
	                                <tr>
	                                    <td colspan="4" style="border-bottom: 1px solid #999;">
	                                        <a href="${ product.bidUrl }" class="bidding-url" target="_blank">${ product.bidUrl }</a>
	                                    </td>
	                                </tr>                             
	                            </tbody>
	                            <tr class="pro-result">
	                                <th colspan="4">
	                                 <c:choose>
		                                 <c:when test="${ (loginMember.no eq product.bidMemberNo) && product.bidStat eq 'Y' }">
	                                    	<button class="btn bid-btn wish-added" id="addWish" disabled="disabled">
	                                    		<i class="material-icons" id="wish-done">done</i>관심있어요
	                                    	</button>			                                        	
		                                 </c:when>
		                                 <c:otherwise>
	                                    	<button class="btn bid-btn" id="addWish">
	                                    		<i class="material-icons" id="wish-done" style="display: none;">done</i>관심있어요
	                                    	</button>			                                        	
		                                 </c:otherwise>
	                               	</c:choose>
	                                    <button class="btn bid-btn"><i class="material-icons md-24">share</i></button>
	                                </th>
	                            </tr>                            
	                        </table>
                        </div>                        
                    </div>

                    <br><br><br><br>
                    

                    <!-- <br><br><br><br> -->

                    <!-- 한마디 게시판 -->
                    <section>
                    	<div class="store-board">
	                        <p>
	                            관심있는 회원들의 한마디
	                        </p>
                        </div>
                        
                        <div class="board">
                            <table class="table bid-board">
                                <tbody>                                	
                                	<c:if test="${ !empty list }">
                                		<c:forEach var="list" items="${ list }">
                                			<tr>
		                                        <td style="padding-left: 20px;">
		                                            <p>${ list.boardContent }</p>
		                                        </td>
		                                        <td><fmt:formatDate value="${ list.boardDate }" pattern="yyy-MM-dd hh:mm"/></td>
		                                        <td style="color: #67b16b;">${ list.memberId }</td>
		                                        <c:if test="${ !empty loginMember && loginMember.no eq list.memberNo }">
		                                        	<td>
		                                        		<a href="javascript:void(0);" class="btn-delete-img">
			                                        		<i class="material-icons md-22">delete_outline</i>
			                                        		<input type="hidden" value="${ list.boardNo }">
		                                        		</a>
		                                        	</td>
		                                        </c:if>
		                                    </tr>
                                		</c:forEach>                                		
                                	</c:if>
                                	<c:if test="${ empty list }">
                                		<tr>
                                			<td>
                                				<div class="empty-content">
		                                           <i class="material-icons">info</i>
		                                           <p>조회된 게시글이 없습니다.</p>
		                                       </div>
                                			</td>
                                		</tr>
                                	</c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="bid-write">
                            <c:if test="${ (loginMember.no eq product.bidMemberNo) && product.bidStat eq 'Y' }">
                          		<form action="${ path }/write_bidding_board" method="post">
                          			<input name="bidNo" type="hidden" value="${ product.bidNo }">
									<textarea name="boardContent" class="write-reply-textarea" required></textarea>
									<button class="btn btn-write-reply">작성하기</button>
								</form>	                                        	
                            </c:if>
                        </div>
                        
                        <c:if test="${ !empty list }">
	                        <div class="paging">
	                        	<a href="${ path }/bidding_detail?no=${ product.bidNo }&page=1" class="first"><span>맨 앞으로</span></a> 
	                            <a href="${ path }/bidding_detail?no=${ product.bidNo }&page=${ pageInfo.prevPage }" class="prev"><span>이전</span></a>
	                            <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">				
										<strong>${ status.current }</strong>
									</c:if>
									
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }/bidding_detail?no=${ product.bidNo }&page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
	                            <a href="${ path }/bidding_detail?no=${ product.bidNo }&page=${ pageInfo.nextPage }" class="next"><span>다음</span></a>
	                            <a href="${ path }/bidding_detail?no=${ product.bidNo }&page=${ pageInfo.maxPage }" class="last"><span>맨 뒤로</span></a>
	                        </div>
						</c:if>
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
        let menuName = ['에코샵', '모집 중인 상품', '오프라인 매장 안내'];
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
	$("#addWish").click(function() {
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
				
				selected.toggleClass("wish-added");
				
				if(data === "Bid Added" || data === "Bid Again"){
					$("#wish-done").show();
					alert("참여 성공");
					
					location.reload();
				}
				else if(data === "Bid Deleted"){
					$("#wish-done").hide();
					alert("참여 취소");
					location.reload();
				}
				
			}
		});
	});
 	
	// 게시글 삭제
	$(document).on("click", ".btn-delete-img", (e) => {
		let selected = e.currentTarget;
		
		let boardNo = $(selected).find("input[type=hidden]").val();
		console.log(boardNo);
		
		selected.closest("tr").remove();
		
		$.ajax({
			type : "post",
			url : "${ path }/delete_bidding_board",
			data : 
				boardNo,
			contentType : 'application/json; charset=UTF-8',
			error : function(request, error) {
		    	console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
		    },
		    success : function(data) {
				console.log("ajax success");
				console.log("data : " + data);
				
				if(data === "Successfully Deleted"){
					alert("게시글을 삭제했습니다.");
				}
				else if(data === "Delete Failed"){
					alert("다시 시도해주세요.");
				}
		    }
		});
	});
</script>

</html>