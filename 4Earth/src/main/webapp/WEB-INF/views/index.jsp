<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<%@ include file="/WEB-INF/views/common/header.jsp" %>

        <div class="container main">
            <div class="contents">
                <div class="visual">
                    <strong>
                        <img src="${ path }/resources/images/main/tit_main.png" alt="Choose your eco side!">
                    </strong>
                    <div class="visual-box campain">
                        <div class="center-img">
                            <img src="${ path }/resources/images/main/center01.png" alt="">
                        </div>
                        <button class="btn-visual">버튼</button>
                        <button class="btn-visual-undo">뒤로</button>
                        <div class="best-main">
                            <div class="thumb-img">
                                <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                            </div>
                            <div class="cont">
                                <span>
                                    <i class="material-icons md-36">military_tech</i>
                                    많은 사용자가<br>참여하고 있어요!
                                </span>
                                <strong>챌린지 제목 챌린지 제목 챌린지 제목</strong>
                                <p>챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용</p>
                                <a href="#" class="btn">참여하기</a>
                            </div>
                        </div>
                        <ul class="best-list-main">
                            <li>
                                <a href="#">
                                    <div class="thumb-img">
                                        <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                    </div>
                                    <strong>챌린지 제목</strong>
                                    <p>챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="thumb-img">
                                        <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                    </div>
                                    <strong>챌린지 제목</strong>
                                    <p>챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="thumb-img">
                                        <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                    </div>
                                    <strong>챌린지 제목</strong>
                                    <p>챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="thumb-img">
                                        <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                    </div>
                                    <strong>챌린지 제목</strong>
                                    <p>챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용 챌린지 내용</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="visual-box store">
                        <div class="center-img">
                            <img src="${ path }/resources/images/main/center02.png" alt="">
                        </div>
                        <button class="btn-visual">챌린지 열기</button>
                        <button class="btn-visual-undo">되돌리기</button>
                        <div class="best-main">
                            <div class="thumb-img">
                                <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                            </div>
                            <div class="cont">
                                <span>
                                    <i class="material-icons md-36">military_tech</i>
                                    많은 사용자가<br>구매하고 있어요!
                                </span>
                                <strong>상품 제목 상품 제목 상품 제목 상품 제목</strong>
                                <p>상품 내용 상품 내용 상품 내용 상품 내용 상품 내용</p>
                                <a href="#" class="btn">구매하기</a>
                            </div>
                        </div>
                        <ul class="best-list-main">
                            <li>
                                <a href="#">
                                    <div class="thumb-img">
                                        <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                    </div>
                                    <strong>상품 이름</strong>
                                    <p>상품 내용 상품 내용 상품 내용 상품 내용상품 내용 상품 내용</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="thumb-img">
                                        <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                    </div>
                                    <strong>상품 이름</strong>
                                    <p>상품 내용 상품 내용 상품 내용 상품 내용상품 내용 상품 내용</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="thumb-img">
                                        <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                    </div>
                                    <strong>상품 이름</strong>
                                    <p>상품 내용 상품 내용 상품 내용 상품 내용상품 내용 상품 내용</p>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="thumb-img">
                                        <img src="${ path }/resources/images/@temp/@thumbnail01.jpg" alt="">
                                    </div>
                                    <strong>상품 이름</strong>
                                    <p>상품 내용 상품 내용 상품 내용 상품 내용상품 내용 상품 내용</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- <div class="main-box">
                    <p>4Earth는 지구를 지키는 일에 동참합니다</p>
                </div> -->

                <div class="photo-box">
                    <strong>지구와 환경을 위하여</strong>
                    <p>지구를 보호하기 위해 노력하고 있습니다. 또한 에너지와 자원을 최대로 절감하고<br>
                        쓰레기 배출량은 줄이기 위한 방법을 끊임없이 고민하고 개선합니다. 모든 제품은 정화조 및<br>
                        수돗물을 재활용하여 화장실이나 정원용수로 사용하는 중수도 시설에도 안심하고 사용할 수 있습니다.</p>
                </div>

                <div class="photo-box photo2">
                    <strong>소중한 나와 가족을 위하여</strong>
                    <p>나와 가족을 위해 작은 무언가를 실천하는 일은 소중합니다.<br>
                        지구를 지키는 일 보다 우리 모두를 지키는 일에 동참해주세요.<br>
                        실천 하나가 모여 건강한 지구를 이룰 수 있습니다.</p>
                </div>
            </div>
        </div>

        <%@ include file="/WEB-INF/views/common/footer.jsp" %>