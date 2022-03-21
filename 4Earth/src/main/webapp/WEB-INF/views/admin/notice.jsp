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
                    <div class="page-tit">
                        <h3>공지사항</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">게시판</a>
                            <span>공지사항</span>
                        </div>
                    </div>

                        <section>
                            <div>
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="" class="selectbox">
                                            <option value="최신순" selected>최신순</option>
                                        </select>
                                        <select name="" id="count-select" class="selectbox">
                                        	<option value="" selected>목록 개수 선택</option>
                                        	<option value="5">5개씩 보기</option>
                                            <option value="10">10개씩 보기</option>
                                            <option value="30">30개씩 보기</option>
                                        </select>
	                                    <!-- <div class="input-with-icon search-input">
	                                        <input type="text" placeholder="검색어를 입력해주세요.">
	                                        <button><i class="material-icons">search</i></button>
	                                    </div> -->
                                    </div>
                                </div>
                            </div>

                            <div class="board" style="margin-top: 20px;">
                                <table class="table">
                                    <colgroup>
                                        <col width="7%">
                                        <col width="*">
                                        <col width="10%">
                                        <col width="13%">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="20%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>상태</th>
                                            <th>내용</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${ empty list }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="7">
													<div class="empty-content">
						                       			<i class="material-icons">info</i>
						                       			<p>조회된 공지사항 내역이 없습니다.</p>
						                       		</div>
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty list }">
	                                    <tbody>
											<c:forEach var="notice" items="${ list }" varStatus="vs">
		                                        <tr>
		                                            <td>${ notice.no }</td>
		                                            <td>${ notice.title }</td>
		                                            <td>${ notice.writerNo }</td>
		                                            <td>
		                                            	<fmt:formatDate value="${ notice.createDate }" pattern="yyy-MM-dd hh:mm"/>
		                                            </td>
		                                            <td>${ notice.status }</td>
		                                            <td>
		                                            <a href="#popup${ vs.index }" class="btn btn-s btn-open-pop">보기</a> 
					                                <div class="layer-popup" id="popup${ vs.index }">
						                                <div class="layer-inner">
						                                    <div class="pop-head">
						                                        <strong>공지 사항</strong>
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
													        			<th>제목</th>
													        			<td>${ notice.title }</td>
													        			<th>조회수</th>
													        			<td>${ notice.readCount }</td>
													        		</tr>
													        		<tr>
													        			<th>작성 회원 번호</th>
													        			<td>${ notice.writerNo }</td>
													        			<th>게시글 번호</th>
													        			<td>${ notice.no }</td>
													        		</tr>
													        		<tr>
													        			<th colspan="2">사진</th>
													        			<th colspan="2">내용</th>
													        		</tr>
													        		<tr>
													        			<td colspan="2"><img id="member-img" src="${ path }/resources/upload/notice/${notice.renamedFileName}" /></td>
													        			<td colspan="2">${ notice.content }</td>
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
		                                                <button type="button" id="update" name="no" value=${ notice.no } class="btn btn-s">수정</button>
		                                                <button type="button" id="delete" name="no" value=${ notice.no } class="btn btn-s gray">정지</button>
		                                            </td>
		                                        </tr>
											</c:forEach>
	                                    </tbody>
									</c:if>
                                </table>
                            </div>
                            <div class="btn-wrap">
                                <button id="write" type="button" class="btn">작성</button>
                            </div>
                        </section>
                        <!-- // Category -->
                        
                        <div class="paging">
							<!-- 맨 처음으로 -->
							<a class="first" href="${ path }/admin_notice?page=1"></a>
				
							<!-- 이전 페이지로 -->
							<a class="prev" href="${ path }/admin_notice?page=${ pageInfo.prevPage }"></a>
				
							<!--  10개 페이지 목록 -->
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
								<c:if test="${ status.current == pageInfo.currentPage }">			
									<strong>${ status.current }</strong>
								</c:if>
								<c:if test="${ status.current != pageInfo.currentPage }">				
									<a href="${ path }/admin/notice?page=${ status.current }&count=${ pageInfo.listLimit }">${ status.current }</a>
								</c:if>
							</c:forEach>
				
							<!-- 다음 페이지로 -->
							<a class="next" href="${ path }/admin_notice?page=${ pageInfo.nextPage }"></a>
				
							<!-- 맨 끝으로 -->
							<a class="last" href="${ path }/admin_notice?page=${ pageInfo.maxPage }"></a>
						</div>                   
                 
                    
            	</section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	$(() => {
	    let sideBarMenu = $('.side-bar ul li');
	    let menuPath = ['${ path }/admin/notice'];
	    let menuName = ['공지사항'];
	    let menuIcon = ['description']
	
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
			location.replace("${ path }/admin/notice?count=" + e.target.value);
		})
	});
	
	$(document).on("click","#write", (e) => {
	    var popupX = (document.body.offsetWidth / 2) - (800 / 2);
	    var popupY= (window.screen.height / 2) - (800 / 2);
	    const url = "${ path }/admin/notice_write";
	    
	    open(url, "", 'status=no, height=800, width=1200, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
	});
	
	$(document).on("click","#update", (e) => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "${ path }/admin/notice_update?no="+ e.target.value;
        
        open(url, "", 'status=no, height=800, width=1200, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
	
	$(document).ready(() => {
        $(document).on('click','#delete', (e) => {
            if(confirm("공지사항을 비공개 하시겠습니까?")) {
                location.replace("${ path }/admin/notice_delete?no=" + e.target.value);
            }
        })
    });
</script>

</html>