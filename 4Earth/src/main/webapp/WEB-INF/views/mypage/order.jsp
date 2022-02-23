<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>주문내역조회</title>
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
                        <h3></h3>
                        <div class="bread-crumb">
                            <a href="${ path }"><i class="material-icons md-16">home</i></a>
                            <a href="#">마이페이지</a>
                            <span>주문&dot;배송</span>
                        </div>
                    </div>

                    <div class="guide">

                        <section>
                            <strong>주문/배송 조회</strong>                            
                                <table class="cart-table order-table">
                                    <thead>
                                        <tr>
                                            <th>주문번호</th>
                                            <th>주문일자</th>
                                            <th>총 구매금액</th>
                                            <th>주문상태</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><a href="order-detail.html" style="text-decoration: underline;">1122334455</a></td>
                                            <td>2022-02-21</td>
                                            <td>15,000 원</td>
                                            <td>배송 완료</td>
                                        </tr>
                                        <tr>
                                            <td><a href="" style="text-decoration: underline;">1122334455</a></td>
                                            <td>2022-02-21</td>
                                            <td>15,000 원</td>
                                            <td>배송 완료</td>
                                        </tr>
                                    </tbody>
                                </table>
                            <div>
                                
                                
                            </div>
                        </section>


                        
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

</html>