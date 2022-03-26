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
                    </ul>
                </div>
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>상품 문의</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">문의</a>
                            <span>상품 문의</span>
                        </div>
                    </div>

                        <!-- Category -->
                        <section>
                            <div>
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="member-select" class="selectbox">
                                            <option value="1" selected>번호검색</option>
                                            <option value="2">상품번호검색</option>
                                        </select>
                                        <select name="" id="count-select" class="selectbox">
                                            <option value="5">5개씩 보기</option>
                                            <option value="10" selected="selected">10개씩 보기</option>
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
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="13%">
                                        <col width="*">
                                        <col width="13%">
                                        <col width="15%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>문의 번호</th>
                                            <th>상품 번호</th>
                                            <th>회원 번호</th>
                                        	<th>답변 상태</th>
                                            <th>작성일</th>
                                            <th>내용</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${ empty productInquiry }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="7">
													<div class="empty-content">
						                       			<i class="material-icons">info</i>
						                       			<p>조회된 상품 문의가 없습니다.</p>
						                       		</div>
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty productInquiry }">
	                                    <tbody>
											<c:forEach var="inq" items="${ productInquiry }" varStatus="vs">
		                                        <tr>
		                                            <td>${ inq.inqNo }</td>
		                                            <td>${ inq.proNo }</td>
		                                            <td>${ inq.memberNo }</td>
		                                        	<td>${ inq.inqStat }</td>
		                                            <td><fmt:formatDate value="${ inq.inqDate }" pattern="yyy-MM-dd hh:mm"/></td>
		                                            <td>
		                                            <a href="#popup${ vs.index }" class="btn btn-s btn-open-pop">보기</a> 
					                                <div class="layer-popup" id="popup${ vs.index }">
						                                <div class="layer-inner">
						                                    <div class="pop-head">
						                                        <strong>상품 문의</strong>
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
													        			<th>문의 번호</th>
													        			<td>${ inq.inqNo }</td>
													        			<th>문의 회원 번호</th>
													        			<td>${ inq.memberNo }</td>
													        		</tr>
													        		<tr>
													        			<th>상품 번호</th>
													        			<td>${ inq.proNo }</td>
													        			<th>문의일자</th>
													        			<td>${ inq.inqDate }</td>
													        		</tr>
													        		<tr>
													        			<th colspan="4">문의 내용</th>
													        		</tr>
													        		<tr>
													        			<td colspan="4" style="height: 300px">
													        				${ inq.inqContent }
													        			</td>
													        		</tr>
												        		</tbody>
													       		</table>
						                                    </div>
						                                    <div class="btn-wrap">
						                                        <button class="btn gray btn-close-pop">취소</button>
						                                        <button class="btn btn" id="echo_update" value="${ inq.inqNo }">답변</button>
						                                    </div>
						                                </div>
						                            </div>
                            						</td>
		                                            <td>
		                                                <button class="btn btn-s" id="echo_update" value="${ inq.inqNo }">답변</button>
		                                            </td>
		                                        </tr>
											</c:forEach>
		                                 </tbody>
									</c:if>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-wrap">
                            </div>
                        </section>
                        <!-- // Category -->
                        
                        <c:if test="${ !empty productInquiry }">
	                        <div class="paging">
								<!-- 맨 처음으로 -->
								<a class="first" href="${ path }/admin_member?page=1"></a>
					
								<!-- 이전 페이지로 -->
								<a class="prev" href="${ path }/admin_member?page=${ pageInfo.prevPage }"></a>
					
								<!--  10개 페이지 목록 -->
								<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
									<c:if test="${ status.current == pageInfo.currentPage }">			
										<strong>${ status.current }</strong>
									</c:if>
									<c:if test="${ status.current != pageInfo.currentPage }">				
										<a href="${ path }/admin/member?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
									</c:if>
								</c:forEach>
					
								<!-- 다음 페이지로 -->
								<a class="next" href="${ path }/admin_member?page=${ pageInfo.nextPage }"></a>
					
								<!-- 맨 끝으로 -->
								<a class="last" href="${ path }/admin_member?page=${ pageInfo.maxPage }"></a>
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
    let menuPath = ['${ path }/admin/qna','${ path }/admin/qna_done','${ path }/admin/echo_qna'];
    let menuName = ['문의', '문의 완료', '상품 문의'];
    let menuIcon = ['help', 'checklist_rtl', 'inventory_2']


    for( let i = 0; i < menuName.length; i++ ) {
        let menuIdx = sideBarMenu.eq(i);

        menuIdx.find('a').attr('href', menuPath[i]);
        menuIdx.find('a > i').text(menuIcon[i]);
        menuIdx.find('a > span').text(menuName[i]);
    }

    sideBarMenu.each(function(idx, el) {
        if(idx == 2) {
            $(this).addClass('current');
        }
    });
});

$(document).on("click","#echo_update", (e) => {
    var popupX = (document.body.offsetWidth / 2) - (800 / 2);
    var popupY= (window.screen.height / 2) - (800 / 2);
    const url = "${ path }/admin/echo_qna_answer?no="+ e.target.value;
    
    open(url, "", 'status=no, height=800, width=900, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
});

$(document).ready(() => {
	$(document).on('click', '#search', () => {
		if($("#member-select option:selected").val() == 1) {
			location.replace("${ path }/admin/echo_qna?no=" + $("#search-val").val());
		}
		if($("#member-select option:selected").val() == 2) {
			location.replace("${ path }/admin/echo_qna?proNo=" + $("#search-val").val());
		}
	})
});
</script>

</html>