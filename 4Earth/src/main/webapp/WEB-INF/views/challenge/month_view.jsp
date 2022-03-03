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
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코 챌린지</a>
                            <span>이달의 챌린지</span>
                        </div>
                    </div>

                    <div class="challenge">
                        <div class="month-challenge-detail">
                            <div class="img-thumb">
                                <img src="${ path }/resources/images/challenge/challenge_today01.jpg" alt="">
                            </div>
                            <div class="item-cont">
                                <span>이달의 챌린지</span>
                                <strong>${ month.chalTitle }</strong>
                                <p>${ month.chalContent }</p>
                                <span class="icon-point">${ month.chalPoint }</span>
                                <button class="btn" onclick="location.href='${ path }/month_write?chalNo=${ month.chalNo }'">참여하기</button>
                            </div>
                        </div>

                        <section class="section">
                            <div class="using-user">
                                <h4>참여중인 사용자</h4>
                                <span class="count"><em>12명</em>의 사용자가 참여 중입니다</span>
                                <div class="user-list">
                                    <ul>
                                        <li>
                                            <div class="img-thumb">
                                                <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                            </div>
                                            <span>minyeongpark</span>
                                        </li>
                                        <li>
                                            <div class="img-thumb">
                                                <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                            </div>
                                            <span>user ID</span>
                                        </li><li>
                                            <div class="img-thumb">
                                                <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                            </div>
                                            <span>user ID</span>
                                        </li><li>
                                            <div class="img-thumb">
                                                <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                            </div>
                                            <span>user ID</span>
                                        </li><li>
                                            <div class="img-thumb">
                                                <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                            </div>
                                            <span>user ID</span>
                                        </li><li>
                                            <div class="img-thumb">
                                                <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                            </div>
                                            <span>user ID</span>
                                        </li><li>
                                            <div class="img-thumb">
                                                <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                            </div>
                                            <span>user ID</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </section>

                        <section class="section">
                            <h4>챌린지 참여 리뷰</h4>
                            <div class="reply">
                                <form action="" method="">
                                    <textarea name="" id="" placeholder="간단한 참여 후기를 작성해주세요."></textarea>
                                    <button class="btn">등록</button>
                                    <span class="count-reply"><em>0</em> / 3000</span>
                                </form>

                                <div class="reply-list">
                                    <ul>
                                        <li>
                                            <div class="reply-wrap">
                                                <div class="user-info">
                                                    <div class="img-thumb">
                                                        <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                                    </div>
                                                    <span>minyeongpark</span>
                                                    <span class="date">0000-00-00 00:00</span>
                                                </div>
                                                <div class="reply-cont">
                                                    <p>어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오</p>
                                                </div>
                                                <div class="btn-wrap">
                                                    <button class="material-icons md-18">create</button>
                                                    <button class="material-icons md-18">delete_outline</button>
                                                </div>
                                            </div>
                                            <ul>
                                                <li>
                                                    <div class="user-info">
                                                        <div class="img-thumb">
                                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                                        </div>
                                                        <span>minyeongpark</span>
                                                        <span class="date">0000-00-00 00:00</span>
                                                    </div>
                                                    <div class="reply-cont">
                                                        <p>어쩌고 저쩌고 합니다.</p>
                                                    </div>
                                                    <div class="btn-wrap">
                                                        <button class="material-icons md-18">create</button>
                                                        <button class="material-icons md-18">delete_outline</button>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="user-info">
                                                        <div class="img-thumb">
                                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                                        </div>
                                                        <span>minyeongpark</span>
                                                        <span class="date">0000-00-00 00:00</span>
                                                    </div>
                                                    <div class="reply-cont">
                                                        <p>어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오 어쩌고 저쩌고 합니다. 오오오오오오</p>
                                                    </div>
                                                    <div class="btn-wrap">
                                                        <button class="material-icons md-18">create</button>
                                                        <button class="material-icons md-18">delete_outline</button>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <div class="user-info">
                                                <div class="img-thumb">
                                                    <img src="../resources/images/@temp/@thumbnail01.jpg"" alt="">
                                                </div>
                                                <span>jinahlee</span>
                                                <span class="date">0000-00-00 00:00</span>
                                            </div>
                                            <div class="reply-cont">
                                                <p>어쩌고 저쩌고 합니다. 오오오오오오</p>
                                            </div>
                                            <div class="btn-wrap">
                                                <button class="material-icons md-18">create</button>
                                                <button class="material-icons md-18">delete_outline</button>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="user-info">
                                                <div class="img-thumb">
                                                    <img src="../resources/images/@temp/@thumbnail01.jpg"" alt="">
                                                </div>
                                                <span>user ID user</span>
                                                <span class="date">0000-00-00 00:00</span>
                                            </div>
                                            <div class="reply-cont">
                                                <p>어쩌고 저쩌고 합니다. 오오오오오오</p>
                                            </div>
                                            <div class="btn-wrap">
                                                <button class="material-icons md-18">create</button>
                                                <button class="material-icons md-18">delete_outline</button>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="user-info">
                                                <div class="img-thumb">
                                                    <img src="../resources/images/@temp/@thumbnail01.jpg"" alt="">
                                                </div>
                                                <span>user ID user</span>
                                                <span class="date">0000-00-00 00:00</span>
                                            </div>
                                            <div class="reply-cont">
                                                <p>어쩌고 저쩌고 합니다. 오오오오오오</p>
                                            </div>
                                            <div class="btn-wrap">
                                                <button class="material-icons md-18">create</button>
                                                <button class="material-icons md-18">delete_outline</button>
                                            </div>
                                        </li>
                                    </ul>

                                    <div class="paging">
                                        <a href="#" class="prev"><span>이전</span></a>
                                        <strong>1</strong>
                                        <a href="#">2</a>
                                        <a href="#">3</a>
                                        <a href="#">4</a>
                                        <a href="#">5</a>
                                        <a href="#" class="next"><span>다음</span></a>
                                    </div>
                                </div>

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