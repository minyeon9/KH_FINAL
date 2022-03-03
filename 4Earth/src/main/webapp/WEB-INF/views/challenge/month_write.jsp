<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>챌린지</title>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
        <div class="container">
            <div class="contents">
                <%@ include file="/WEB-INF/views/common/sideBar.jsp" %>
                
                <section class="content-wrap">
                    <div class="page-tit">
                        <h3>이달의 챌린지</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="${ path }/today_main">에코 챌린지</a>
                            <span>이달의 챌린지</span>
                        </div>
                    </div>

                    <div class="challenge prov">
                        <div class="how-to">
                            <strong>인증 방법 및 주의 사항</strong>
                            <p>어쩌고 저쩌고<br>어쩌고 저쩌고<br>어쩌고 저쩌고<br>어쩌고 저쩌고<br>어쩌고 저쩌고</p>
                        </div>

                        <section class="section">
	                       <h4>챌린지 인증하기</h4>
	                       <div class="prov-set">
	                           <form action="${ path }/month_complete?chalNo=${ month.chalNo }" method="post" enctype="multipart/form-data">
		                           <div class="thumb-img">
										<strong>예시 이미지</strong>
		                                <img src="${ path }/resources/images/challenge/challenge_today01.jpg" alt="">
		                           </div>
		                           <div class="upload-wrap">
		                               <div class="upload-img">
		                                   <button type="button" class="btn-delete-img">
		                                       <i class="material-icons md-22">delete_outline</i>
		                                   </button>
		                                   <img src="" alt="">
		                               </div>
		                               <div class="prov-cont">
	                                       <div class="upload-file">
	                                           <input type="text" class="input-file" disabled placeholder="파일을 선택해주세요." multiple>
	                                           <input type="file" id="inputFileOrigin" name="upfile" accept="image/jpeg, image/jpg, image/gif, image/png">
	                                           <label for="inputFileOrigin" class="btn">파일 선택</label> 
	                                           <span class="validate">gif, png, jpg 파일만 업로드 가능합니다.</span>
	                                       </div>
		                                   
		                               </div>
	                           		</div>
	                           
		                            <%-- <button type="submit" class="btn" onclick="location.href='${ path }/today_complete?chalNo=${ today.chalNo }'">인증하기</button> --%>
		                            <input type="submit" class="btn" id="btnComplete" value="인증하기">
								</form>
	                       </div>
	                   </section>

                        <section class="section">
                            <h4>나의 챌린지 참여 현황</h4>
                            <div class="gauge">
                                <ul>
                                    <li class="complate">
                                        <span></span>
                                        <p>1회 달성</p>
                                    </li>
                                    <li class="complate">
                                        <span></span>
                                        <p>2회 달성</p>
                                    </li>
                                    <li class="complate">
                                        <span></span>
                                        <p>3회 달성</p>
                                    </li>
                                    <li class="complate">
                                        <span></span>
                                        <p>4회 달성</p>
                                    </li>
                                    <li class="complate">
                                        <span></span>
                                        <p>5회 달성</p>
                                    </li>
                                    <li class="complate">
                                        <span></span>
                                        <p>6회 달성</p>
                                    </li>
                                    <li class="complate">
                                        <span></span>
                                        <p>7회 달성</p>
                                    </li>
                                    <li class="complate">
                                        <span></span>
                                        <p>8회 달성</p>
                                    </li>
                                    <li>
                                        <span></span>
                                        <p>9회 달성</p>
                                    </li>
                                    <li>
                                        <span></span>
                                        <p>10회 달성</p>
                                    </li>
                                </ul>
                            </div>
                        </section>
                    </div>

                </section>


                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
        </div>

<script type="text/javascript">
let idxNum=1;
</script>          

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script src="resources/js/challenge.js"></script>