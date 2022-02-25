<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <script src="https://kit.fontawesome.com/da4a2ee2c4.js" crossorigin="anonymous"></script>
    <title>모집상세</title>
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
                    <div class="product">
                    <!-- 
                        slide
                    -->
                        <div class="slider">                                
                            <input type="radio" name="slide" id="slide1" checked>
                            <input type="radio" name="slide" id="slide2">
                            <input type="radio" name="slide" id="slide3">
                            <input type="radio" name="slide" id="slide4">
                            <ul id="imgholder" class="imgs">
                                <li><img src="../resources/images/@temp/@thumbnail01.jpg"></li>
                                <li><img src="../resources/images/@temp/@thumbnail01.jpg"></li>
                                <li><img src="../resources/images/@temp/@thumbnail01.jpg"></li>
                                <li><img src="../resources/images/@temp/@thumbnail01.jpg"></li>
                            </ul>
                            <div class="bullets">
                                <label for="slide1">&nbsp;</label>
                                <label for="slide2">&nbsp;</label>
                                <label for="slide3">&nbsp;</label>
                                <label for="slide4">&nbsp;</label>
                            </div>
                        
                        </div>
                        
                        <table class="pro-table bid-table">
                            <thead>
                                <tr>
                                    <td>상품명</td>
                                </tr>
                            </thead>
                            <tbody class="tbody1">
                                <tr>
                                    <td colspan="4">
                                        <div class="progress prog-detail">
                                            <div class="progress-bar bg-success" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" style="font-weight: bold;">n명 참여</td>
                                    <td style="text-align: right;">달성률 n%</td>
                                </tr>
                                <tr style="border-bottom: 1px solid #999;">
                                    <td colspan="4" style="vertical-align: bottom;"><p>n 명의 관심이 모이면 에코샵에서 만나볼 수 있습니다.</p></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="border-bottom: 1px solid #999;">
                                        <a href="">공식 판매처 링크</a>
                                    </td>
                                </tr>                             
                            </tbody>
                            <tr class="pro-result">
                                <th colspan="4">
                                    <button class="btn bid-btn">관심있어요</button>
                                    <button class="btn bid-btn"><i class="material-icons md-24">share</i></button>
                                </th>
                            </tr>                            
                        </table>
                    </div>

                    <br><br><br><br>
                    

                    <br><br><br><br>

                    <!-- 상품후기 -->
                    <section>
                    	<div class="store-board">
	                        <p>
	                            관심있는 회원들의 한마디
	                        </p>
                            <button class="btn" id="writeReview" style="float: right;">작성하기</button>
                        </div>
                        <div class="board">
                            <table class="table bid-board">
                                <tbody>
                                    <tr>
                                        <td>
                                            <p>10명만 더..!</p>
                                        </td>
                                        <td>2021.00.00</td>
                                        <td>홍길동</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p>입고 제발</p>
                                        </td>
                                        <td>2021.00.00</td>
                                        <td>홍길동</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="paging">
                            <a href="#" class="prev"><span>이전</span></a>
                            <strong>1</strong>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                            <a href="#">7</a>
                            <a href="#">8</a>
                            <a href="#">9</a>
                            <a href="#">10</a>
                            <a href="#" class="next"><span>다음</span></a>
                        </div>
                    </section>
                    <!-- // Board -->


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
            if(idx == 1) {
                $(this).addClass('current');
            }
        });
    });
</script>

</html>