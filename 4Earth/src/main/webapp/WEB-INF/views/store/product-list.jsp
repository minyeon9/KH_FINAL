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
    <title>상품목록</title>
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
                        <h3>소분샵</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">에코샵</a>
                            <span>소분샵</span>
                        </div>
                    </div>

                    <div class="store-wrap"> 

                        <!-- Category -->
                        <section>
                            <div class="category">
                                <ul>
                                    <li>
                                        <strong>카테고리</strong>
                                        <div class="check-group">
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox1"> 
                                                <label for="checkbox1">전체</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox2"> 
                                                <label for="checkbox2">식품</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox3"> 
                                                <label for="checkbox3">생활</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox4"> 
                                                <label for="checkbox4">뷰티</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox5"> 
                                                <label for="checkbox5">반려동물</label>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <strong>상세 필터</strong>
                                        <div class="check-group">
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox6"> 
                                                <label for="checkbox6">체크박스1</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox7"> 
                                                <label for="checkbox7">체크박스2</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox8"> 
                                                <label for="checkbox8">체크박스3</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox9"> 
                                                <label for="checkbox9">체크박스4</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox10"> 
                                                <label for="checkbox10">체크박스5</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox11"> 
                                                <label for="checkbox11">체크박스6</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox12"> 
                                                <label for="checkbox12">체크박스7</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox13"> 
                                                <label for="checkbox13">체크박스8</label>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="btn-wrap">
                                <button class="btn gray">초기화</button>
                                <button class="btn">적용</button>
                            </div>
                        </section>
                        <!-- // Category -->

						<br><br><br><br>

                        <!-- Thumbnail List -->
                        <section>	  
                        	<div style="height:35px; margin-bottom:10px;">
	                            <strong>
	                                총 n개의 상품이 있습니다.
	                            </strong>
	                            <select name="arrange" id="store-arrange" class="store-selectbox">
	                                <option value="신상품순" selected>신상품순</option>
	                                <option value="판매순">판매순</option>
	                                <option value="후기순">후기순</option>
	                                <option value="낮은가격순">낮은가격순</option>
	                                <option value="높은가격순">높은가격순</option>
	                            </select> 
                        	</div>                      
                            

                            <div class="thumb-list">
                                <ul style="width:100%;">
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="tag-wrap">
                                            <span class="tag tag-orange">NEW</span>
                                        </div>
                                        <strong><a href="${ path }/product_detail">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                        <div class="btn-wrap">
                                            <a href="javascript:void(0);"><i class="heart fa fa-heart-o"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="tag-wrap">
                                            <span class="tag tag-orange">NEW</span>
                                        </div>
                                        <strong><a href="#">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                        <div class="btn-wrap">
                                            <a href="javascript:void(0);"><i class="heart fa fa-heart-o"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="tag-wrap">
                                            <span class="tag tag-orange">NEW</span>
                                        </div>
                                        <strong><a href="#">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                        <div class="btn-wrap">
                                            <a href="javascript:void(0);"><i class="heart fa fa-heart-o"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="tag-wrap">
                                            <span class="tag tag-orange">NEW</span>
                                        </div>
                                        <strong><a href="#">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                        <div class="btn-wrap">
                                            <a href="javascript:void(0);"><i class="heart fa fa-heart-o"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="tag-wrap">
                                            <span class="tag tag-orange">NEW</span>
                                        </div>
                                        <strong><a href="#">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                        <div class="btn-wrap">
                                            <a href="javascript:void(0);"><i class="heart fa fa-heart-o"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="tag-wrap">
                                            <span class="tag tag-orange">NEW</span>
                                        </div>
                                        <strong><a href="#">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                        <div class="btn-wrap">
                                            <a href="javascript:void(0);"><i class="heart fa fa-heart-o"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="tag-wrap">
                                            <span class="tag tag-orange">NEW</span>
                                        </div>
                                        <strong><a href="#">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                        <div class="btn-wrap">
                                            <a href="javascript:void(0);"><i class="heart fa fa-heart-o"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="tag-wrap">
                                            <span class="tag tag-orange">NEW</span>
                                        </div>
                                        <strong><a href="#">상품명</a></strong>
                                        <div class="price">가격</div>
                                        <div class="review"><small>별점</small></div>
                                        <div class="btn-wrap">
                                            <a href="javascript:void(0);"><i class="heart fa fa-heart-o"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </section>
                        <!-- // Thumbnail List -->

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
                    </div> <!-- // guide -->
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
            if(idx == 0) {
                $(this).addClass('current');
            }
        });
    });

    $(".heart.fa").click(function() {
        $(this).toggleClass("fa-heart fa-heart-o");
    });

    
</script>

</html>