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
    <title>주문완료</title>
</head>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="container">
	<div class="contents">
		<section class="content-wrap">
			<div class="purchase-wrap">
		
	          <div class="page-tit">
                   <h3></h3>
                   <div class="bread-crumb">
                       <a href="#">장바구니</a>
                       <a href="#">주문/결제</a>
                       <span><strong>주문완료</strong></span>
                   </div>
             </div>
	
	          <div class="store-wrap">
	          	<div class="purchase-completed">
	          		<span>고객님의 주문이 완료되었습니다.</span>
	          		<strong>
	          			주문번호 
	          			<fmt:formatDate value="${ orderSum.orderDate }" pattern="yyyyMMdd"/>${ orderSum.orderNo }
	          		</strong>
	          		<p>
	          			주문내역 및 배송 조회는 <a href="">마이페이지</a> > <a href="${ path }/order">주문&dot;배송</a>에서 확인하실 수 있습니다.
	          		</p>
	          	</div>
	          	
	          </div>
	        </div>             
        </section>
        
        <button class="btn scroll-top"><i class="material-icons md-24">vertical_align_top</i></button>
     </div> 
     </div>   
<%@ include file="/WEB-INF/views/common/footer.jsp" %>

<script>
	
</script>
</html>