<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>오프라인 매장안내</title>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

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
                        <h3>오프라인 매장 안내</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코샵</a>
                            <span>오프라인 매장 안내</span>
                        </div>
                    </div>
                    
                    <!-- 카카오맵 API -->
                    <section>
                        <div id="map" style="width:600px;height:500px;">
                            카카오지도 API 들어갈 예정
                        </div>
                    </section>

                    <section>
                        <div class="map-list">
                            <ul>
                                <li>
                                    <a href="">
                                        <strong>서울 남부점</strong>
                                    </a>
                                </li>
                                <li>
                                    서울특별시 서초구 남부터미널 어쩌구
                                </li>
                                <li>
                                    000-0000-0000
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <a href="">
                                        <strong>서울 남부점</strong>
                                    </a>
                                </li>
                                <li>
                                    서울특별시 서초구 남부터미널 어쩌구
                                </li>
                                <li>
                                    000-0000-0000
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <a href="">
                                        <strong>서울 남부점</strong>
                                    </a>
                                </li>
                                <li>
                                    서울특별시 서초구 남부터미널 어쩌구
                                </li>
                                <li>
                                    000-0000-0000
                                </li>
                            </ul>
                        </div>
                    </section>
                </section>
                <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
            </div>
            <!-- <div class="select-option">
                상품 선택
            </div> -->
        </div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['${ path }/product_list', '${ path }/bidding_list','${ path }/map'];
        let menuName = ['소분샵', '소분샵 입고 신청', '오프라인 매장 안내'];
        let menuIcon = ['storefront', 'edit', 'location_on' ]

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