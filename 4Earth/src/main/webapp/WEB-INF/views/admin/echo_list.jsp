<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<%@ include file="/WEB-INF/views/common/admin_header.jsp" %>

        <div class="container">
            <div class="contents">
                <div class="side-bar is-open">
                    <button class="btn toggle-nav">
                        <i class="material-icons md-24">last_page</i>
                    </button>
                    <ul>
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
                        <h3>에코샵 상품</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코샵</a>
                            <span>에코샵 상품</span>
                        </div>
                    </div>

                    <div class="admin">
                        <!-- Category -->
                        <section>
                            <div>
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="member-select" class="selectbox">
                                            <option value="1" selected>번호순</option>
                                            <option value="2">이름순</option>
                                            <option value="3">재고순</option>
                                        </select>
                                        <select name="" id="count-select" class="selectbox">
                                            <option value="" selected="selected">목록 개수 선택</option>
                                            <option value="5">5개씩 보기</option>
                                            <option value="10">10개씩 보기</option>
                                            <option value="30">30개씩 보기</option>
                                        </select>
                                    </div>
                                    <div class="input-with-icon search-input">
                                        <input type="text" placeholder="검색어를 입력해주세요." id="search-val">
                                        <button id="search"><i class="material-icons">search</i></button>
                                    </div>
                                </div>
                            </div>

                            <div class="board">
                                <table class="table">
                                    <colgroup>
                                        <col width="13%">
                                        <col width="*">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="20%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>상품 번호</th>
                                            <th>상품 이름</th>
                                            <th>상태</th>
                                            <th>등록일</th>
                                            <th>재고 수</th>
                                            <th>보기</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${ empty list }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="7">
													<div class="empty-content">
						                       			<i class="material-icons">info</i>
						                       			<p>조회된 상품 내역이 없습니다.</p>
						                       		</div>
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty list }">
	                                    <tbody>
											<c:forEach var="product" items="${ list }" varStatus="vs">
		                                        <tr>
		                                            <td>${ product.proNo }</td>
		                                            <td>${ product.proName }</td>
		                                            <td>${ product.proStat }</td>
		                                            <td>
		                                            	<fmt:formatDate value="${ product.proModifyDate }" pattern="yyy-MM-dd hh:mm"/>
		                                            </td>
		                                            <td>${ product.proStock }</td>
		                                            <td>
		                                            <a href="#popup${ vs.index }" class="btn btn-s btn-open-pop">보기</a> 
					                                <div class="layer-popup" id="popup${ vs.index }">
						                                <div class="layer-inner">
						                                    <div class="pop-head">
						                                        <strong>에코샵 상품</strong>
						                                        <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
						                                    </div>
						                                    <div class="pop-cont">
						                                       <table id="view-table">
													           <colgroup>
													           		<col style="10%">
													           		<col style="40%">
													           		<col style="15%">
													           		<col style="35%">
													    		</colgroup>
													        	<tbody>
													        		<tr>
													        			<th>상품 번호</th>
													        			<td>${ product.proNo }</td>
													        			<th>상품 이름</th>
													        			<td>${ product.proName }</td>
													        		</tr>
													        		<tr>
													        			<th>가격</th>
													        			<td>${ product.proPrice }</td>
													        			<th>용량</th>
													        			<td>${ product.proVol }</td>
													        		</tr>
													        		<tr>
													        			<th>제조사</th>
													        			<td>${ product.proMfg }</td>
													        			<th>별점</th>
													        			<td>${ product.proRating }</td>
													        		</tr>
													        		<tr>
													        			<th>등록일</th>
													        			<td>
													        				<fmt:formatDate value="${ product.proDate }" pattern="yyy-MM-dd hh:mm"/>
													        			</td>
													        			<th>수정일</th>
													        			<td>
													        				<fmt:formatDate value="${ product.proModifyDate }" pattern="yyy-MM-dd hh:mm"/>
													        			</td>
													        		</tr>
													        		<tr>
													        			<th>상품상태번호</th>
													        			<td>${ product.proStat }</td>
													        			<th>상품카테고리번호</th>
													        			<td>${ product.proCat }</td>
													        		</tr>
													        		<tr>
													        			<th>재고</th>
													        			<td>${ product.proStock }</td>
													        			<th>팔린수</th>
													        			<td>${ product.proSold }</td>
													        		</tr>
													        		<tr>
													        			<th colspan="2">사진</th>
													        			<th colspan="2">내용</th>
													        		</tr>
													        		<tr>
													        			<td colspan="2" style="height: 300px">
													        				<img id="member-img" src="${ path }/resources/upload/store/${ product.proModifyImg }" />
													        			</td>
													        			<td colspan="2" class="left">${ product.proInfo }</td>
													        		</tr>
												        		</tbody>
													       		</table>
						                                    </div>
						                                    <div class="btn-wrap">
						                                        <button class="btn gray btn-close-pop">확인</button>
						                                    </div>
						                                </div>
						                            </div>
                            						</td>
		                                            <td>
		                                                <button class="btn btn-s" id="echo_update" value="${ product.proNo }">수정</button>
		                                                <button id="delete" name="no" value=${ product.proNo } class="btn btn-s gray">정지</button>
		                                            </td>
		                                        </tr>
											</c:forEach>
		                                </tbody>
									</c:if>
                                </table>
                            </div>
                            <div class="btn-wrap">
                                <button id="echo_write" class="btn">상품 등록</button>
                            </div>
                        </section>
                        <!-- // Category -->
                        
                        <c:if test="${ !empty list }">
	                        <div class="paging">
								<a class="first" href="${ path }/admin/echo_list?page=1"></a>
								<a class="prev" href="${ path }/admin/echo_list?page=${ pageInfo.prevPage }"><span>이전</span></a>
					
								<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">			
										<strong>${ status.current }</strong>
									</c:if>
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }/admin/echo_list?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
								<a class="next" href="${ path }/admin/echo_list?page=${ pageInfo.nextPage }"><span>다음</span></a>
								<a class="last" href="${ path }/admin/echo_list?page=${ pageInfo.maxPage }"></a>
							</div>
						</c:if>                 
                    </div>
                    
            </section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	$(() => {
	    let sideBarMenu = $('.side-bar ul li');
	    let menuPath = ['${ path }/admin/echo_list','${ path }/admin/echo_order','${ path }/admin/echo_delivery','${ path }/admin/echo_cancel','${ path }/admin/echo_bidding'];
	    let menuName = ['에코샵 상품', '주문 접수', '발송 완료', '주문 취소', '상품 접수'];
	    let menuIcon = ['inventory_2', 'app_registration', 'local_shipping', 'remove_circle', 'edit'];
	
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
	    
	    $('#count-select').on('change',  (e) => {
			location.replace("${ path }/admin/echo_list?count=" + e.target.value);
		})
	});
	
	$(document).on("click","#echo_write", (e) => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "${ path }/admin/echo_write";
        
        open(url, "", 'status=no, height=800, width=900, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
	
	$(document).on("click","#echo_update", (e) => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "${ path }/admin/echo_update?no="+ e.target.value;
        
        open(url, "", 'status=no, height=800, width=900, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
	
	$(document).ready(() => {
		$("#delete").on("click", (e) => {
			if(confirm("상품 판매를 중지 하시겠습니까?")) {
				location.replace("${ path }/admin/echo_delete?no=" + e.target.value);
			}
		})
	});
	
	$(document).ready(() => {
		$(document).on('click', '#search', () => {
			if($("#member-select option:selected").val() == 1) {
				location.replace("${ path }/admin/echo_list?proNo=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 2) {
				location.replace("${ path }/admin/echo_list?proName=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 3) {
				location.replace("${ path }/admin/echo_list?proStock=" + $("#search-val").val());
			}
		})
	});
</script>

</html>