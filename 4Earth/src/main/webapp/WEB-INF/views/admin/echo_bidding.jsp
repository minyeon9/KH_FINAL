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
                        <h3>상품 접수</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코샵</a>
                            <span>상품 접수</span>
                        </div>
                    </div>
                    
                        <!-- Category -->
                        <section>
                            <div>
                                <div class="board-head">
                                    <div class="select-wrap">
                                    	<form action="${ path }/admin/echo_bidding_select">
	                                        <select name="select" id="" class="selectbox" onchange="submit()">
	                                            <option value="전체보기" selected>전체보기</option>
	                                            <option value="모집중">모집 중</option>
	                                            <option value="모집대기">모집 대기</option>
	                                        </select>
	                                        <select name="" id="count-select" class="selectbox">
	                                            <option value="" selected="selected">목록 개수 선택</option>
	                                            <option value="5">5개씩 보기</option>
	                                            <option value="10">10개씩 보기</option>
	                                            <option value="30">30개씩 보기</option>
	                                        </select>
                                    	</form>
                                    </div>
                                    <div class="input-with-icon search-input">
                                        <input type="text" placeholder="검색어를 입력해주세요.">
                                        <button><i class="material-icons">search</i></button>
                                    </div>
                                </div>
                            </div>

                            <div class="board">
                                <table class="table">
                                    <colgroup>
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="*">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="20%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>모집 번호</th>
                                            <th>상태</th>
                                            <th>물품 이름</th>
                                            <th>필요인원</th>
                                            <th>현재인원</th>
                                            <th>내용</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${ empty list }">
                                        	<tr>
		                                    	<td colspan="7">
													<div class="empty-content">
						                       			<i class="material-icons">info</i>
						                       			<p>조회된 상품 접수 내역이 없습니다.</p>
						                       		</div>
		                                    	</td>
		                                    </tr>
                                        </c:if>
                                        <c:if test="${ !empty list }">
                                        	<c:forEach var="list" items="${ list }" varStatus="vs">
                                        		<tr>
		                                            <td>${ list.appNo }</td>
		                                            <td>
		                                            	${ list.appStatNo }
		                                            </td>
		                                            <td>${ list.appName }</td>
		                                            <td>
		                                            	<c:if test="${ list.appStatNo eq 0 }">-</c:if>
		                                            	<c:if test="${ list.appStatNo eq 1 }"></c:if>		                                            	
		                                            </td>
		                                            <td>
		                                            	<c:if test="${ list.appStatNo eq 0 }">-</c:if>
		                                            	<c:if test="${ list.appStatNo eq 1 }"></c:if>	
		                                            </td>
		                                            <td>
		                                            	<a href="#popup${ vs.index }" class="btn btn-s btn-open-pop">보기</a>
		                                            	<div class="layer-popup" id="popup${ vs.index }">
						                                <div class="layer-inner">
						                                    <div class="pop-head">
						                                    	<%-- ${ list.appNo } --%>
						                                        <strong>상품 접수</strong>
						                                        <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
						                                    </div>
						                                    <div class="pop-cont">
						                                       <table id="view-table">
													        	<tbody>
													        		<tr>
													        			<th style="width: 15%;">신청 회원</th>
													        			<td style="width: 20%;">${ list.memberNo }</td>
													        			<th>판매처 링크</th>
													        			<td><a href="${ list.appUrl }" target="_blank">${ list.appUrl }</a></td>
													        		</tr>
													        		<tr>
													        			<th>카테고리</th>
													        			<td>${ list.appCatName }</td>
													        			<th>카테고리 분류값</th>
													        			<td>${ list.appCatNo }</td>
													        		</tr>
													        		<tr>
													        			<th>상품 상태번호</th>
													        			<td>${ list.appStatNo }</td>
													        			<th>신청일</th>
													        			<td>${ list.appDate }</td>
													        		</tr>
													        		<tr>
													        			<th colspan="2">제목</th>
													        			<th colspan="2">${ list.appTitle }</th>
													        		</tr>
													        		<tr>
													        			<td colspan="4">내용</td>
													        		</tr>
													        		<tr>
													        			<td colspan="4" style="height: 250px; text-align: left;">${ list.appContent }</td>
													        		</tr>
												        		</tbody>
													       		</table>
						                                    </div>
						                                    <div class="btn-wrap">
						                                        <button class="btn gray btn-close-pop">취소</button>
						                                    </div>
						                                </div>
						                            </div>
		                                            </td>
		                                            <td>
		                                                <button class="btn btn-s" id="echo_bidding_write" value="${ list.appNo }">등록</button>
		                                                <button id="cancel" value="${ list.appNo }" class="btn btn-s gray">취소</button>
		                                            </td>
		                                        </tr>
                                        	</c:forEach>                                        	
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-wrap">
                            </div>
                        </section>
                        <!-- // Category -->
                        
                        <c:if test="${ !empty list }">
	                        <div class="paging">
	                        	<input type="hidden" name="select" value="${ select }">
								<a class="first" href="${ path }/admin/echo_bidding_select?page=1"></a>
								<a class="prev" href="${ path }/admin/echo_bidding_select?page=${ pageInfo.prevPage }&select=${ select }"><span>이전</span></a>
								<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">			
										<strong>${ status.current }</strong>
									</c:if>
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }/admin/echo_bidding_select?page=${ status.current }&count=${ pageInfo.listLimit }&select=${ select }">${ status.current }</a>
									</c:if>
								</c:forEach>
								<a class="next" href="${ path }/admin/echo_bidding_select?page=${ pageInfo.nextPage }&select=${ select }"><span>다음</span></a>
								<a class="last" href="${ path }/admin/echo_bidding_select?page=${ pageInfo.maxPage }&select=${ select }"></a>
							</div>   
						</c:if>                 
                    </div>
            </section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
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
	        if(idx == 4) {
	            $(this).addClass('current');
	        }
	    });
	});
	
	// 등록 버튼
	$(document).on("click","#echo_bidding_write", (e) => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "${ path }/admin/echo_bidding_write?no="+ e.target.value;
        
        open(url, "", 'status=no, height=500, width=900, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
	
	$(document).ready(() => {
		$(document).on('click','#cancel', (e) => {
			if(confirm("정말로 이 접수를 취소시키겠습니까??")) {
				location.replace("${ path }/admin/bidding_cancel?no=" + e.target.value);
			}
		})
	});
</script>

</html>