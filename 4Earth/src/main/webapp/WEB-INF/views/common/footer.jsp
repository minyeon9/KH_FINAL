<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/> 

        <footer>
            <div class="footer-about">
                <div class="footer-inner">
                    <a href="${ path }" class="logo">
                    	<img src="${ path }/resources/images/common/logo_footer.png" alt="4Earth">
                    </a>

                    <div class="follow-sns">
                        <strong>Follow Us</strong>
                        <ul>
                            <li><a href="#"><i class="icon icon-instargram"></i>instargram</a></li>
                            <li><a href="#"><i class="icon icon-facebook"></i>facebook</a></li>
                            <li><a href="#"><i class="icon icon-youtube"></i>youtube</a></li>
                        </ul>
                    </div>

                    <div class="cop-info">
                        <ul>
                            <li>주식회사 어쩌고 저쩌고</li>
                            <li>(14900) 서울시 서초구 내곡동 1-338</li>
                            <li><strong>통신판매업신고번호</strong> 2021-서울서초-3522 사업자정보확인</li>
                            <li><strong>이메일 </strong><a href="mainto:Eco5@eco.co.kr">Eco5@eco.co.kr</a></li>
                            <li><strong>개인정보보호책임자</strong> (주)Eco5</li>
                        </ul>
                    </div>
    
                    <div class="follow-sns">
                        <strong>고객센터</strong>
                        <ul>
                            <li><a href="#"><i class="icon icon-twiter"></i>유선상담</a></li>
                            <li><a href="#"><i class="icon icon-twiter"></i>신고하기</a></li>
                            <li><a href="#"><i class="icon icon-twiter"></i>1:1 문의</a></li>
                        </ul>
                    </div>
                </div>
            </div> <!-- // footer-about -->

            <div class="footer-copy">
                <div class="footer-inner">
                    <div class="terms">
                        <a href="#">이용약관</a>
                        <a href="#">개인정보처리방침</a>
                    </div>
                    <p class="copy">Copyright @ 사이트명 Co. All rights reserved.</p>
                </div>
            </div>
        </footer>
    </div>
</body>

</html>