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
    <title>상품상세</title>
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
                                <li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
                                <li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
                                <li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
                                <li><img src="${ path }/resources/images/@temp/@thumbnail01.jpg"></li>
                            </ul>
                            <div class="bullets">
                                <label for="slide1">&nbsp;</label>
                                <label for="slide2">&nbsp;</label>
                                <label for="slide3">&nbsp;</label>
                                <label for="slide4">&nbsp;</label>
                            </div>
                        
                        </div>
                        
                        <table class="pro-table">
                            <thead>
                                <tr>
                                    <td colspan="4">상품명</td>
                                </tr>
                            </thead>
                            <tbody class="tbody1">
                                <tr>
                                    <td>단위 당 가격</td>
                                    <td colspan="3">가격</td>
                                </tr>
                                <tr>
                                    <td>배송비</td>
                                    <td colspan="3">배송비 <p>(30,000원 이상 무료배송)</p></td>
                                </tr>
                                <tr style="border-bottom: 1px solid #999;">
                                    <td>제조사</td>
                                    <td colspan="3">2</td>
                                </tr>
                                <tr>
                                    <td>옵션</td>
                                    <td colspan="3">
                                        <select name="" id="" class="pro-selectbox">
                                            <option value="--------" selected>--------</option>
                                            <option value="옵션">옵션</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr style="border-bottom: 2px solid #467443;">
                                    <td>구매량</td>
                                    <td colspan="3">
                                        <select name="" id="" class="pro-selectbox">
                                            <option value="--------" selected>--------</option>
                                            <option value="50g">50g</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>옵션</td>
                                    <td>구매량</td>
                                    <td>가격</td>
                                    <th style="width: 30px"><button class="product-btn"><i class="material-icons md-24">close</i></button></th>
                                </tr>                                
                            </tbody>
                            <tr class="pro-result">
                                <th colspan="4"><button class="btn pro-btn">바로구매</button>
                                <button class="btn pro-btn">장바구니</button>
                                <button class="btn pro-btn">찜</button></th>
                            </tr>                            
                        </table>
                    </div>

                    <br><br><br><br>
                    
                    <!-- 상품설명 -->
                    <div class="pro-detail">
                        상품 <br>
                        상세 <br>
                        설명 <br>
                    </div>
                    <!-- //상품설명 -->

                    <br><br><br><br>

                    <!-- 상품후기 -->
                    <section>
                        <strong>
                            Review
                            <button class="btn" id="writeReview" style="float: right;">작성하기</button>
                        </strong>
                        <br><br>
                        <div class="board">
                            <table class="table">
                                <colgroup>
                                    <col width="15%">
                                    <col width="*">
                                    <col width="10%">
                                    <col width="10%">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <td>
                                            <span class="icon-star">
                                                <i class="unfill"></i>
                                                <i class="fill" style="width: 50%"></i>
                                            </span>
                                        </td>
                                        <td class="board-tit">
                                            <span class="prd-option">구매 옵션 : <b>화이트</b></span>
                                            <p>맛있어요 어쩌구 저쩌구</p>
                                        </td>
                                        <td>2021.00.00</td>
                                        <td>홍길동</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span class="icon-star">
                                                <i class="unfill"></i>
                                                <i class="fill" style="width: 30%"></i>
                                            </span>
                                        </td>
                                        <td class="board-tit">
                                            <span class="prd-option">구매 옵션 : <b>화이트</b></span>
                                            <p>맛있어요 어쩌구 저쩌구</p>
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

                    <br><br><br><br>

                    <!-- 상품문의 -->
                    <section>
                        <strong>
                            Q & A
                            <button class="btn" id="writeQnA" style="float: right;">작성하기</button>
                        </strong>
                        <br><br>
                        <div class="accordian inquiry">
                            <ul>
                                <li>
                                    <a href="javascript:void(0);">
                                        <p>답변완료</p>
                                        <p>
                                            <i class="material-icons md-16">lock</i>
                                            비밀글입니다.
                                        </p>
                                        <p>2022-00-00</p>
                                        <p>user ID</p>
                                    </a>
                                    <div>
                                        <i class="icon-answer"></i>
                                        <p>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br></p>
                                    </div>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">
                                        <p>답변완료</p>
                                        <p>
                                            <i class="material-icons md-16">lock</i>
                                            비밀글입니다.
                                        </p>
                                        <p>2022-00-00</p>
                                        <p>user ID</p>
                                    </a>
                                    <div>
                                        <i class="icon-answer"></i>
                                        <p>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br></p>
                                    </div>
                                </li>
                            </ul>
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
                    <!-- // Accordian -->
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
    });

    $("#writeReview").on("click", () => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "file:///C:/FINAL/FinalProject_UI/store/write-review.html";
        
        open(url, "", 'status=no, height=800, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });

    $("#writeQnA").on("click", () => {
        var popupX = (document.body.offsetWidth / 2) - (800 / 2);
        var popupY= (window.screen.height / 2) - (800 / 2);
        const url = "file:///C:/FINAL/FinalProject_UI/store/write-QnA.html";
        
        open(url, "", 'status=no, height=800, width=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY);
    });
</script>

</html>