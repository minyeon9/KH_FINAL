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
                        <h3>물품 접수 목록</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코샵</a>
                            <span>물품 접수 목록</span>
                        </div>
                    </div>
                    
                    <div class="guide">
                        <!-- Category -->
                        <section>
                            <div style="margin-bottom: 5px;">
                                <div class="board-head">
                                    <div class="select-wrap">
                                    	<form action="${ path }/admin/echo_bidding_select">
	                                        <select name="select" id="" class="selectbox" onchange="submit()">
	                                            <option value="전체보기" selected>전체보기</option>
	                                            <option value="모집중">모집 중</option>
	                                            <option value="모집대기">모집 대기</option>
	                                        </select>
	                                        <select name="" id="" class="selectbox">
	                                            <option value="10" selected>10개씩 보기</option>
	                                            <option value="30">30개씩 보기</option>
	                                        </select>
	                                        <div class="input-with-icon search-input">
	                                            <input type="text" placeholder="검색어를 입력해주세요.">
	                                            <button><i class="material-icons">search</i></button>
	                                        </div>
                                    	</form>
                                    </div>
                                </div>
                            </div>

                            <div class="board">
                                <table class="table">
                                    <colgroup>
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="*">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>모집 번호</th>
                                            <th>상태</th>
                                            <th style="width: 25%;">물품 이름</th>
                                            <th>필요인원</th>
                                            <th>현재인원</th>
                                            <th>내용</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${ empty list }">
                                        	<tr>
		                                    	<td colspan="6">
												조회된 물품 접수가 없습니다
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
		                                            	<a href="#popup${ vs.index }" class="btn btn-open-pop btn-s gray">보기</a>
		                                            	<div class="layer-popup" id="popup${ vs.index }">
						                                <div class="layer-inner">
						                                    <div class="pop-head">
						                                    	${ list.appNo }
						                                        <strong>${ list.appName }</strong>
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
						                                        <button class="btn">저장</button>
						                                    </div>
						                                </div>
						                            </div>
		                                            </td>
		                                            <td>
		                                                <button class="btn btn-s" id="echo_bidding_write" value="${ list.appNo }">등록</button>
		                                                <button class="btn btn-s gray">정지</button>
		                                            </td>
		                                        </tr>
                                        	</c:forEach>                                        	
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-wrap">
                                <button class="btn">작성</button>
                            </div>
                        </section>
                        <!-- // Category -->
                        <div class="paging">
                        	<input type="hidden" name="select" value="${ select }">
							<a class="prev" href="${ path }/admin/echo_bidding_select?page=1"></a>
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
							<a class="next" href="${ path }/admin/echo_bidding_select?page=${ pageInfo.maxPage }&select=${ select }"></a>
						</div>                    
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
	    let menuName = ['에코샵 물품 목록', '주문 접수 목록', '발송 완료 목록', '주문 취소 목록', '물품 접수 목록'];
	    let menuIcon = ['home', 'home', 'home', 'home', 'home']
	
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
</script>

</html>