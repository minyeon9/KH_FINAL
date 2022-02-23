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
                        <h3>이달의 챌린지</h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코 챌린지</a>
                            <span>이달의 챌린지</span>
                        </div>
                    </div>

                    <div class="challenge">
                        <div class="challenge-sort">
                            <form action="" method="">
                                <select name="" id="" class="selectbox">
                                    <option value="높은 포인트순" selected>높은 포인트순</option>
                                    <option value="낮은 포인트순">낮은 포인트순</option>
                                    <option value="최신순">최신순</option>
                                </select>
                            </form>
                        </div>

                        <div class="thumb-list vertical col-2">
                            <ul>
                                <li class="complete">
                                    <a href="month_view.html">
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="item-cont">
                                            <strong>걸어서 or 자전거로 출퇴근 하기</strong>
                                            <p>리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명</p>
                                            <span class="icon-point">5,000</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="month_view.html">
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="item-cont">
                                            <strong>걸어서 or 자전거로 출퇴근 하기</strong>
                                            <p>리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명</p>
                                            <span class="icon-point">5,000</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="month_view.html">
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="item-cont">
                                            <strong>걸어서 or 자전거로 출퇴근 하기</strong>
                                            <p>리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명</p>
                                            <span class="icon-point">5,000</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="month_view.html">
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="item-cont">
                                            <strong>걸어서 or 자전거로 출퇴근 하기</strong>
                                            <p>리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명</p>
                                            <span class="icon-point">5,000</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="month_view.html">
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="item-cont">
                                            <strong>걸어서 or 자전거로 출퇴근 하기</strong>
                                            <p>리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명</p>
                                            <span class="icon-point">5,000</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="month_view.html">
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="item-cont">
                                            <strong>걸어서 or 자전거로 출퇴근 하기</strong>
                                            <p>리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명</p>
                                            <span class="icon-point">5,000</span>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="month_view.html">
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="item-cont">
                                            <strong>걸어서 or 자전거로 출퇴근 하기</strong>
                                            <p>리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명</p>
                                            <span class="icon-point">5,000</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>
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
        let menuPath = ['/earth/today_list', '/earth/month_list', '/earth/ongoing_list'];
        let menuName = ['오늘의 챌린지', '이달의 챌린지', '참여 중인 챌린지'];
        let menuIcon = ['task_alt', 'public', 'bookmark_border' ]

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }

        sideBarMenu.each(function(idx, el) {
            if(idx == 1) {
                $(this).addClass('current');
            }
        });
    });
</script>

</html>