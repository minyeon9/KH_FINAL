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
                        <h3>FAQ</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">문의</a>
                            <span>FAQ</span>
                        </div>
                    </div>

                    <div class="guide">
                        <!-- Category -->
                        <section>
                            <div style="margin-bottom: 5px;">
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="" class="selectbox">
                                            <option value="최신순" selected>최신순</option>
                                            <option value="댓글순">댓글순</option>
                                        </select>
                                        <select name="" id="" class="selectbox">
                                            <option value="10" selected>10개씩 보기</option>
                                            <option value="30">30개씩 보기</option>
                                        </select>
                                        <div class="input-with-icon search-input">
                                            <input type="text" placeholder="검색어를 입력해주세요.">
                                            <button><i class="material-icons">search</i></button>
                                        </div>
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
                                            <th>FAQ 번호</th>
                                            <th>FAQ 분류</th>
                                            <th>FAQ 제목</th>
                                            <th>작성일</th>
                                            <th>내용</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:if test="${ empty productInquiry }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="6">
												조회된 FAQ가 없습니다
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty productInquiry }">
										<c:forEach var="inq" items="${ productInquiry }" varStatus="vs">
		                                    <tbody>
		                                        <tr>
		                                            <td>${ inq.proNo }</td>
		                                            <td>${ inq.memberNo }</td>
		                                            <td>${ inq.inqNo }</td>
		                                            <td>${ inq.inqDate }</td>
		                                            <td>
		                                            <a href="#popup${ vs.index }" class="btn btn-open-pop">보기</a> 
					                                <div class="layer-popup" id="popup${ vs.index }">
						                                <div class="layer-inner">
						                                    <div class="pop-head">
						                                    	${ inq.proNo }
						                                        <strong>${ inq.inqTitle }</strong>
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
													        			<th>문의번호</th>
													        			<td>${ inq.inqNo }</td>
													        			<th>문의멤버번호</th>
													        			<td>${ inq.memberNo }</td>
													        		</tr>
													        		<tr>
													        			<th>문의일자</th>
													        			<td>${ inq.inqDate }</td>
													        			<th>빈칸</th>
													        			<td>빈칸내용</td>
													        		</tr>
													        		<tr>
													        			<th colspan="4">내용</th>
													        		</tr>
													        		<tr>
													        			<td colspan="4">${ inq.inqContent }</td>
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
		                                                <button class="btn btn-s" id="echo_update" value="${ inq.inqNo }">수정</button>
		                                                <button id="delete" name="no" value=${ inq.inqNo } class="btn btn-s gray">정지</button>
		                                            </td>
		                                        </tr>
		                                    </tbody>
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
                            <a href="#" class="prev"><span>이전</span></a>
                            <strong>1</strong>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#" class="next"><span>다음</span></a>
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
    let menuPath = ['${ path }/admin/qna','${ path }/admin/qna_done','${ path }/admin/echo_qna'];
    let menuName = ['문의 목록', '문의 완료 목록', '상품 문의'];
    let menuIcon = ['home', 'home', 'home']


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
</script>

</html>