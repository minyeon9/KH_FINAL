<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 
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
                        <h3>페이지 제목</h3>
                        <div class="bread-crumb">
                            <a href="../index.html"><i class="material-icons md-16">home</i></a>
                            <a href="#">About Us</a>
                            <span>공지사항</span>
                        </div>
                    </div>

                    <div class="guide">
                        <!-- layer popup -->
                        <section>
                            <strong>Layer Popup</strong>

                            <a href="#popup01" class="btn btn-open-pop">게시판 관리</a>
                            <a href="#popup02" class="btn btn-open-pop">에코샵 관리</a>

                            <div class="layer-popup" id="popup01">
                                <div class="layer-inner">
                                    <div class="pop-head">
                                        <strong>게시판 관리</strong>
                                        <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
                                    </div>
                                    <div class="pop-cont">
                                        내용
                                    </div>
                                    <div class="btn-wrap">
                                        <button class="btn gray btn-close-pop">취소</button>
                                        <button class="btn">저장</button>
                                    </div>
                                </div>
                            </div>

                            <div class="layer-popup" id="popup02">
                                <div class="layer-inner">
                                    <div class="pop-head">
                                        <strong>에코샵 관리</strong>
                                        <a href="#" class="btn-close-pop"><i class="material-icons md-24">close</i></a>
                                    </div>
                                    <div class="pop-cont">
                                        내용
                                    </div>
                                    <div class="btn-wrap">
                                        <button class="btn gray btn-close-pop">취소</button>
                                        <button class="btn">저장</button>
                                    </div>
                                </div>
                            </div>
                            <div class="dimed"></div>
                        </section>
                        <!-- // layer popup -->

                        <!-- Button -->
                        <section>
                            <strong>Button</strong>

                            <button class="btn">기본</button>
                            <button class="btn gray">기본</button>
                            <button class="btn gray" disabled>비활성</button>
                            <br><br>

                            <button class="btn btn-l">크다</button>
                            <button class="btn btn-l gray">크다</button>
                            <br><br>

                            <button class="btn btn-s">작다</button>
                            <button class="btn btn-s gray">작다</button>
                            <br><br>

                            <button class="btn btn-w">길다</button>
                            <button class="btn btn-w gray">길다</button>
                            <br><br>

                            <a href="#" class="btn">a 태그 사용</a>
                            <a href="#" class="btn gray">a 태그 사용</a>
                            <br><br>

                            <input type="button" value="input 태그 사용" class="btn">
                            <input type="button" value="input 태그 사용"  class="btn gray">
                            <input type="button" value="비활성" class="btn gray" disabled>
                            <br><br>

                            <button class="btn"><i class="material-icons md-24">share</i></button>

                        </section>
                        <!-- // Button -->

                        <!-- Form -->
                        <section>
                            <strong>Form</strong>

                            <input type="text" placeholder="내용을 입력해주세요.">
                            <br><br>

                            <input type="text" placeholder="내용을 입력해주세요.">
                            <span class="validate">영어, 숫자를 포함한 8자 이상</span>
                            <br><br>

                            <input type="text" placeholder="내용을 입력해주세요.">
                            <span class="validate error">영어, 숫자를 포함한 8자 이상</span>
                            <br><br>

                            <p>size 조절 시</p>
                            <div class="login">
                                <div class="input-with-icon">
                                    <i class="material-icons">person</i>
                                    <input type="text" placeholder="아이디를 입력해주세요.">
                                </div>
                            </div>
                            <br><br>
                            <style>
                                .login .input-with-icon {
                                    display: block;
                                    width: 500px;
                                }
                            </style>

                            <input type="text" placeholder="아이디을 입력해주세요.">
                            <button class="btn btn-check">중복 확인</button>
                            <br><br>

                            <div class="input-with-icon search-input">
                                <input type="text" placeholder="검색어를 입력해주세요.">
                                <button><i class="material-icons">search</i></button>
                            </div>
                            <br><br>

                            <div class="input-with-icon">
                                <i class="material-icons">person</i>
                                <input type="text" placeholder="아이디를 입력해주세요.">
                            </div>
                            <br><br>

                            <div class="input-with-icon">
                                <i class="material-icons">lock</i>
                                <input type="text" placeholder="비밀번호를 입력해주세요.">
                            </div>
                            <br><br>

                            <div class="upload-file">
                                <input type="text" class="input-file" disabled placeholder="파일을 선택해주세요.">
                                <input type="file" id="file">
                                <label for="file" class="btn">파일 선택</label> 
                            </div>
                            <br><br>

                            <select name="" id="" class="selectbox">
                                <option value="최신순" selected>최신순</option>
                                <option value="댓글순">댓글순</option>
                            </select>
                            <br><br>

                            <textarea placeholder="내용을 입력해주세요."></textarea>
                            <br><br>

                            <div class="check-box">
                                <input type="checkbox" id="checkbox1"> 
                                <label for="checkbox1">체크박스1</label>
                            </div>
                            <div class="check-box">
                                <input type="checkbox" id="checkbox2"> 
                                <label for="checkbox2">체크박스2</label>
                            </div>
                            <br><br>    

                            <div class="check-group">
                                <div class="check-box">
                                    <input type="checkbox" id="checkbox3"> 
                                    <label for="checkbox3">체크박스1</label>
                                </div>
                                <div class="check-box">
                                    <input type="checkbox" id="checkbox4"> 
                                    <label for="checkbox4">체크박스2</label>
                                </div>
                                <div class="check-box">
                                    <input type="checkbox" id="checkbox5"> 
                                    <label for="checkbox5">체크박스3</label>
                                </div>
                                <div class="check-box">
                                    <input type="checkbox" id="checkbox6"> 
                                    <label for="checkbox6">체크박스4</label>
                                </div>
                            </div>
                        </section>
                        <!-- // Form -->

                        <!-- Category -->
                        <section>
                            <strong>Category</strong>

                            <div class="category">
                                <ul>
                                    <li>
                                        <strong>분류 1</strong>
                                        <div class="check-group">
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox7"> 
                                                <label for="checkbox7">체크박스1</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox8"> 
                                                <label for="checkbox8">체크박스2</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox9"> 
                                                <label for="checkbox9">체크박스3</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox10"> 
                                                <label for="checkbox10">체크박스4</label>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <strong>분류 2</strong>
                                        <div class="check-group">
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox11"> 
                                                <label for="checkbox11">체크박스1</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox12"> 
                                                <label for="checkbox12">체크박스2</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox13"> 
                                                <label for="checkbox13">체크박스3</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox14"> 
                                                <label for="checkbox14">체크박스4</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox15"> 
                                                <label for="checkbox15">체크박스1</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox16"> 
                                                <label for="checkbox16">체크박스2</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox17"> 
                                                <label for="checkbox17">체크박스3</label>
                                            </div>
                                            <div class="check-box">
                                                <input type="checkbox" id="checkbox18"> 
                                                <label for="checkbox18">체크박스4</label>
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

                        <!-- Accordian -->
                        <section>
                            <strong>Accordian</strong>

                            <div class="accordian">
                                <ul>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <strong>포인트는 어떻게 적립 받을 수 있나요?</strong>
                                        </a>
                                        <div>
                                            <i class="icon-answer"></i>
                                            <p>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br></p>
                                        </div>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);">
                                            <strong>포인트는 어떻게 적립 받을 수 있나요?</strong>
                                        </a>
                                        <div>
                                            <i class="icon-answer"></i>
                                            <p>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br>안녕하세요. Eco5 입니다. 어쩌고 저쩌고 합니다.<br></p>
                                        </div>
                                    </li>
                                </ul>
                                <br><br><br><br>
                            </div>
                        </section>
                        <!-- // Accordian -->

                        <!-- Accordian -->
                        <section>
                            <strong>Accordian</strong>

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
                                <br><br><br><br>
                            </div>
                        </section>
                        <!-- // Accordian -->
                        
                        <!-- Board + Paging -->
                        <section>
                            <strong>Board + Paging</strong>

                            <div class="board-head">
                                <div class="board-result">총 <span>7</span>건</div>
                                <div class="select-wrap">
                                    <select name="" id="" class="selectbox">
                                        <option value="최신순" selected>최신순</option>
                                        <option value="댓글순">댓글순</option>
                                    </select>
                                    <select name="" id="" class="selectbox">
                                        <option value="10" selected>10개씩 보기</option>
                                        <option value="30">30개씩 보기</option>
                                    </select>
                                </div>
                            </div>
                            <div class="board">
                                <table class="table">
                                    <colgroup>
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="*">
                                        <col width="10%">
                                        <col width="10%">
                                        <col width="20%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th>분류</th>
                                            <th>제목</th>
                                            <th>작성일</th>
                                            <th>작성자</th>
                                            <th>상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>배송</td>
                                            <td class="board-tit">
                                                <a href="#">배송은 며칠 걸리나요?</a>
                                            </td>
                                            <td>2021.00.00</td>
                                            <td>홍길동</td>
                                            <td>답변 완료</td>
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>배송</td>
                                            <td class="board-tit">
                                                <a href="#">배송은 며칠 걸리나요? 두 줄일 때 두 줄일 때 두 줄일 때 배송은 며칠 걸리나요? 배송은 며칠 걸리나요? 배송은 며칠 걸리나요?</a>
                                            </td>
                                            <td>2021.00.00</td>
                                            <td>홍길동</td>
                                            <td>
                                                <button class="btn btn-s">수락</button>
                                                <button class="btn btn-s gray">반려</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="btn-wrap">
                                <button class="btn">작성</button>
                            </div>

                            <div class="paging">
                                <a href="#" class="prev"><span>이전</span></a>
                                <strong>1</strong>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#" class="next"><span>다음</span></a>
                            </div>
                        </section>
                        <!-- // Board + Paging -->

                        <!-- Board -->
                        <section>
                            <strong>Board</strong>

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
                            <div class="btn-wrap">
                                <button class="btn">작성</button>
                            </div>

                            <div class="paging">
                                <a href="#" class="prev"><span>이전</span></a>
                                <strong>1</strong>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#" class="next"><span>다음</span></a>
                            </div>
                        </section>
                        <!-- // Board -->

                        <!-- Thumbnail List -->
                        <section>
                            <strong>Thumbnail List</strong>
        
                            <div class="thumb-list">
                                <ul>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <div class="tag-wrap">
                                            <span class="tag tag-green">친환경</span>
                                            <span class="tag tag-orange">무료배송</span>
                                        </div>
                                        <strong><a href="#">리스트 제목</a></strong>
                                        <p>리스트 설명</p>
                                        <div class="price">17,000</div>
                                        <div class="btn-wrap">
                                            <a href="javascript:void(0);"><i class="material-icons">favorite_border</i></a>
                                            <a href="javascript:void(0);"><i class="material-icons">shopping_cart</i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail02.png" alt="">
                                        </div>
                                        <strong><a href="#">리스트 제목</a></strong>
                                        <p>리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명 리스트 설명</p>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="#">리스트 제목</a></strong>
                                        <p>리스트 설명</p>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="#">리스트 제목</a></strong>
                                        <p>리스트 설명</p>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="#">리스트 제목</a></strong>
                                        <p>리스트 설명</p>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="#">리스트 제목</a></strong>
                                        <p>리스트 설명</p>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="#">리스트 제목</a></strong>
                                        <p>리스트 설명</p>
                                    </li>
                                    <li>
                                        <div class="img-thumb">
                                            <img src="../resources/images/@temp/@thumbnail01.jpg" alt="">
                                        </div>
                                        <strong><a href="#">리스트 제목</a></strong>
                                        <p>리스트 설명</p>
                                    </li>
                                </ul>
                            </div>
                        </section>
                        <!-- // Thumbnail List -->

                        <!-- tab -->
                        <section>
                            <strong>Tab</strong>

                            <div class="tab">
                                <div class="tab-title">
                                    <a href="#tab01" class="is-open">tab 01</a>
                                    <a href="#tab02">tab 02</a>
                                    <a href="#tab03">tab 03</a>
                                </div>
                                <div class="tab-content">
                                    <div class="tab-view is-open" id="tab01">tab content 01</div>
                                    <div class="tab-view" id="tab02">tab content 02</div>
                                    <div class="tab-view" id="tab03">tab content 03</div>
                                </div>
                            </div>
                        </section>
                        <!-- // tab -->

                        <!-- admin -->
                        <section>
                            <strong>Admin</strong>

                            <div class="admin-category">
                                <ul>
                                    <li class="current"><a href="#"><i class="material-icons md-36">person</i>회원</a></li>
                                    <li><a href="#"><i class="material-icons md-36">live_help</i>문의</a></li>
                                    <li><a href="#"><i class="material-icons md-36">report_problem</i>신고</a></li>
                                    <li><a href="#"><i class="material-icons md-36">assignment</i>게시판</a></li>
                                    <li><a href="#"><i class="material-icons md-36">checklist</i>챌린지</a></li>
                                    <li><a href="#"><i class="material-icons md-36">storefront</i>에코샵</a></li>
                                </ul>
                            </div>
                        </section>
                        <!-- // admin -->

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
        let menuPath = ['notice.html', 'faq.html','#'];
        let menuName = ['공지사항', 'FAQ', '1:1 문의'];
        let menuIcon = ['home', 'home', 'home' ]

        for( let i = 0; i < menuName.length; i++ ) {
            let menuIdx = sideBarMenu.eq(i);

            menuIdx.find('a').attr('href', menuPath[i]);
            menuIdx.find('a > i').text(menuIcon[i]);
            menuIdx.find('a > span').text(menuName[i]);
        }
    });
</script>