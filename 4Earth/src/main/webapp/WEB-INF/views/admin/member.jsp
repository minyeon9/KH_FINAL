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
                    </ul>
                </div>
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>회원</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">회원</a>
                            <span>회원</span>
                        </div>
                    </div>

                    <div class="admin-member">
                        <!-- Category -->
                        <section>
                            <div>
                                <div class="board-head">
                                    <div class="select-wrap">
                                        <select name="" id="member-select" class="selectbox">
                                            <option value="1" selected>번호</option>
                                            <option value="2">이름</option>
                                            <option value="3">아이디</option>
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
                                        <col width="10%">
                                        <col width="*">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="8%">
                                        <col width="10%">
                                        <col width="20%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>회원 번호</th>
                                            <th>회원 아이디</th>
                                            <th>회원명</th>
                                            <th>회원등급</th>
                                            <th>상태</th>
                                            <th>세부내용</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${ empty list }">
	                                    <tbody>
		                                    <tr>
		                                    	<td colspan="6">
												조회된 멤버가 없습니다
		                                    	</td>
		                                    </tr>
	                                    </tbody>
									</c:if>
									<c:if test="${ !empty list }">
										<tbody>
											<c:forEach var="member" items="${ list }" varStatus="vs">
		                                        <tr>
		                                            <td>${ member.no }</td>
		                                            <td>${ member.id }</td>
		                                            <td>${ member.name }</td>
		                                            <td>${ member.member_type }</td>
		                                            <td>${ member.status }</td>
		                                            <td>
		                                            <a href="#popup${ vs.index }" class="btn btn-s btn-open-pop">보기</a> 
					                                <div class="layer-popup" id="popup${ vs.index }">
						                                <div class="layer-inner">
						                                    <div class="pop-head">
						                                        <strong>회원</strong>
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
													        			<th>회원 번호</th>
													        			<td>${ member.no }</td>
													        			<th>회원 아이디</th>
													        			<td>${ member.id }</td>
													        		</tr>
													        		<tr>
													        			<th>이름</th>
													        			<td>${ member.name }</td>
													        			<th>가입일</th>
													        			<td>
													        				<fmt:formatDate value="${ member.enrollDate }" pattern="yyy-MM-dd hh:mm"/>
													        			</td>
													        		</tr>
													        		<tr>
													        			<th>이메일</th>
													        			<td>${ member.email }</td>
													        			<th>전화번호</th>
													        			<td>${ member.phone }</td>
													        		</tr>
													        		<tr>
													        			<th>주소</th>
													        			<td>${ member.address }</td>
													        			<th>우편번호</th>
													        			<td>${ member.postcode }</td>
													        		</tr>
													        		<tr>
													        			<th colspan="4">사진</th>
													        		</tr>
													        		<tr>
													        			<td colspan="4"><img id="member-img" src="${ path }/resources/upload/member/${member.modify_img_name}" /></td>
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
		                                                <button type="button" id="unban" name="no" value=${ member.no } class="btn btn-s">해제</button>
		                                                <button type="button" id="ban" name="no" value=${ member.no } class="btn btn-s gray">정지</button>
		                                            </td>
		                                        </tr>
											</c:forEach>
										</tbody>
									</c:if>
                                </table>
                            </div>
                            <div class="btn-wrap">
                            </div>
                        </section>
                        
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
                    </div>
            </section>

                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	$(() => {
	    let sideBarMenu = $('.side-bar ul li');
	    let menuPath = ['${ path }/admin/member'];
	    let menuName = ['회원'];
	    let menuIcon = ['person']
	
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
	    
	    // 셀렉트박스 선택 시 url에 count 값을 넘김
	    $('#count-select').on('change',  (e) => {
			location.replace("${ path }/admin/member?count=" + e.target.value);
		})
	});
	
	$(document).ready(() => {
		$(document).on('click','#ban', (e) => {
			if(confirm("정말로 이 멤버를 정지시키겠습니까??")) {
				location.replace("${ path }/admin/member_delete?no=" + e.target.value);
			}
		})
	});
	
	$(document).ready(() => {
		$(document).on('click','#unban', (e) => {
			if(confirm("정말로 이 멤버를 정지 해제시키겠습니까??")) {
				location.replace("${ path }/admin/member_unban?no=" + e.target.value);
			}
		})
	});
	
	// 검색버튼 클릭 시 선택된 선택창의 value에 따라서 다른 값을 url로 검색함
	$(document).ready(() => {
		$(document).on('click', '#search', () => {
			if($("#member-select option:selected").val() == 1) {
				location.replace("${ path }/admin/member?no=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 2) {
				location.replace("${ path }/admin/member?name=" + $("#search-val").val());
			}
			if($("#member-select option:selected").val() == 3) {
				location.replace("${ path }/admin/member?id=" + $("#search-val").val());
			}
		})
	});
	
	
	
</script>

</html>