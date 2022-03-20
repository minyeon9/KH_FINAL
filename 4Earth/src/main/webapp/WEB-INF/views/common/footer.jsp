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
                            <li><a href="javascript:void(0);"><i class="icon icon-instargram"></i>instargram</a></li>
                            <li><a href="javascript:void(0);"><i class="icon icon-facebook"></i>facebook</a></li>
                            <li><a href="javascript:void(0);"><i class="icon icon-youtube"></i>youtube</a></li>
                        </ul>
                    </div>

                    <div class="cop-info">
                        <ul>
                            <li>주식회사 4Earth</li>
                            <li>(14900) 서울시 서초구 내곡동 1-338</li>
                            <li><strong>통신판매업신고번호</strong> 2021-서울서초-3522</li>
                            <li><strong>이메일 </strong><a href="mailto:4Earth@4Earth.co.kr">4Earth@4Earth.co.kr</a></li>
                            <li><strong>개인정보보호책임자</strong> (주)4Earth</li>
                        </ul>
                    </div>
    
                    <div class="follow-sns">
                        <strong>About Us</strong>
                        <ul>
                            <li><a href="${ path }/notice/list"><i class="icon icon-tell"></i>공지사항</a></li>
                            <li><a href="${ path }/notice/faq"><i class="icon icon-report"></i>FAQ</a></li>
                            <li><a href="${ path }/notice/qnalist"><i class="icon icon-inquiry"></i>1:1 문의</a></li>
                        </ul>
                    </div>
                </div>
            </div> <!-- // footer-about -->

            <div class="footer-copy">
                <div class="footer-inner">
                    <div class="terms">
                        <a href="javascript:void(0);">이용약관</a>
                        <a href="javascript:void(0);">개인정보처리방침</a>
                    </div>
                    <p class="copy">Copyright @ <strong>4Earth Co.</strong> All rights reserved.</p>
                </div>
            </div>
        </footer>
    </div>
</body>

</html>