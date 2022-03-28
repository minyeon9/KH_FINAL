<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>main</title>
<script src="../resources/js/notice.js"></script>
<link rel="shortcut icon" href="${ path }/resources/favicon.ico">
</head>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "2024f0f3-d5dc-4352-85c0-193c9d81b123",
    "memberId": "ID", //fill with user id
    "profile": {
    "name": "NAME", //fill with user name
    "mobileNumber": "PHONE", //fill with user phone number
    }
  });
</script>
<!-- End Channel Plugin -->

<div class="container">
	<div class="contents">
		<%@ include file="/WEB-INF/views/common/sideBar.jsp"%>
		<section class="content-wrap">
			<div class="page-tit">
				<h3>FAQ</h3>
				<div class="bread-crumb">
					<a href="${ path }"><i class="material-icons md-16">home</i></a> <a
						href="${ path }/notice/list">About Us</a> <span>FAQ</span>
				</div>
			</div>
			<div class="tab">
				<div class="tab-title">
					<a href="#tab01" class="is-open">전체</a> <a href="#tab02">회원가입/정보</a>
					<a href="#tab03">챌린지</a> <a href="#tab04">에코샵</a>
				</div>
				<div class="tab-content">
					<div class="tab-view is-open" id="tab01">
						<br /> <br /> <br />
						<h3>전체</h3>
						<br />
						<div class="accordian">
							<ul>
								<li><a href="javascript:void(0);"> <strong>회원가입은
											어떻게 하나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											홈페이지 상단에 회원가입을 클릭하세요.<br /> <br /> <a href="#">▶ [회원가입]
												바로가기</a>
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>아이디
											찾기는 어떻게 하나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											찾으려는 아이디의 회원정보에 등록된 이름과 메일주소, 핸드폰 번호를 아시면 찾을 수 있습니다. <br />
											<br /> <a href="#">▶ [아이디 찾기] 바로가기</a>
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>회원정보
											변경은 어디서 하나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											홈페이지 상단에 본인 이름을 클릭하시면 회원정보를 수정할 수 있습니다.<br /> <br /> <a
												href="#">▶ [회원정보] 바로가기</a>
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>회원탈퇴
											후 재가입할 수 있나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											회원 탈퇴 후에는 탈퇴한 동일 계정으로는 재가입 불가하며, 새로운 계정으로만 가입하실 수 있습니다.<br />
											<br />
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>챌린지는
											어떻게 진행되나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											매일 진행되는 챌린지와 매달 진행되는 챌린지로 나뉘어 진행됩니다.<br /> <br />
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>챌린지
											포인트는 어디에 사용하나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											챌린지 달성 시 획득한 포인트는 에코샵에서 상품 주문 시 사용 가능합니다.<br /> <br />
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>상품은
											언제 배송이 되나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											출고는 당일 주문마감 낮 12시 이전에 결제하셔야 가능합니다.<br /> 낮 12시를 기준으로 12시 이전
											주문건(결제완료기준)은 재고가 없는 특별한 경우를 제외하고는 당일 출고 됩니다. <br /> 상품발송은
											결제된 순서대로 순차적으로 택배출고됩니다. <br /> <br /> 배송기간은 보통 2~3일 소요되며
											제주도, 도서, 산간지역의 경우는 4~5일 정도가 소요됩니다.
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>배송비는
											얼마인가요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											배송비는 5만원 이상 주문 시 무료배송입니다.<br /> 5만원 미만은 2,500원의 배송비가 부과 됩니다.
											<br /> <br /> 제주도 등 도서산간 지역은 지역에 따라 배송비가 달라질 수 있습니다. <br />
											5만원 이상 주문의 경우 기본 도선료 3,000원이 추가되며, 5만원 미만 주문의 경우 배송비는 최소
											5,500원 입니다.
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>배송완료로
											확인되는데 상품 받지 못했습니다. 어떻게 해야 하나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											택배사에서 인수가 된 후 상품을 받지 못하신 경우에는 택배사 또는 택배기사님께 문의해주세요.<br /> <br />
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>상품
											주문취소 방법을 알려주세요</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											주문취소는 마이페이지에 있는 메뉴를 통하여 진행하시면 됩니다.<br /> <br /> 배송 준비 단계에
											들어간 주문은 마이페이지에서 취소신청이 안됩니다. <br /> 1:1 문의 또는
											고객센터(02-123-4567)를 통해 취소 요청해 주시기 바랍니다.
										</p>
									</div></li>
							</ul>
						</div>
						<br /> <br /> <br />
					</div>
					<div class="tab-view" id="tab02">
						<br /> <br /> <br />
						<h3>회원가입/정보</h3>
						<br />
						<div class="accordian">
							<ul>
								<li><a href="javascript:void(0);"> <strong>회원가입은
											어떻게 하나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											홈페이지 상단에 회원가입을 클릭하세요.<br /> <br /> <a href="#">▶ [회원가입]
												바로가기</a>
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>아이디
											찾기는 어떻게 하나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											찾으려는 아이디의 회원정보에 등록된 이름과 메일주소, 핸드폰 번호를 아시면 찾을 수 있습니다. <br />
											<br /> <a href="#">▶ [아이디 찾기] 바로가기</a>
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>회원정보
											변경은 어디서 하나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											홈페이지 상단에 본인 이름을 클릭하시면 회원정보를 수정할 수 있습니다.<br /> <br /> <a
												href="#">▶ [회원정보] 바로가기</a>
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>회원탈퇴
											후 재가입할 수 있나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											회원 탈퇴 후에는 탈퇴한 동일 계정으로는 재가입 불가하며, 새로운 계정으로만 가입하실 수 있습니다.<br />
											<br />
										</p>
									</div></li>
						</div>
						<br /> <br /> <br />
					</div>
					<div class="tab-view" id="tab03">
						<br /> <br /> <br />
						<h3>챌린지</h3>
						<br />
						<div class="accordian">
							<ul>
								<li><a href="javascript:void(0);"> <strong>챌린지는
											어떻게 진행되나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											매일 진행되는 챌린지와 매달 진행되는 챌린지로 나뉘어 진행됩니다.<br /> <br />
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>챌린지
											포인트는 어디에 사용하나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											챌린지 달성 시 획득한 포인트는 에코샵에서 상품 주문 시 사용 가능합니다.<br /> <br />
										</p>
									</div></li>
							</ul>
						</div>
						<br /> <br /> <br />
					</div>
					<div class="tab-view" id="tab04">
						<br /> <br /> <br />
						<h3>에코샵</h3>
						<br />
						<div class="accordian">
							<ul>
								<li><a href="javascript:void(0);"> <strong>상품은
											언제 배송이 되나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											출고는 당일 주문마감 낮 12시 이전에 결제하셔야 가능합니다.<br /> 낮 12시를 기준으로 12시 이전
											주문건(결제완료기준)은 재고가 없는 특별한 경우를 제외하고는 당일 출고 됩니다. <br /> 상품발송은
											결제된 순서대로 순차적으로 택배출고됩니다. <br /> <br /> 배송기간은 보통 2~3일 소요되며
											제주도, 도서, 산간지역의 경우는 4~5일 정도가 소요됩니다.
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>배송비는
											얼마인가요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											배송비는 5만원 이상 주문 시 무료배송입니다.<br /> 5만원 미만은 2,500원의 배송비가 부과 됩니다.
											<br /> <br /> 제주도 등 도서산간 지역은 지역에 따라 배송비가 달라질 수 있습니다. <br />
											5만원 이상 주문의 경우 기본 도선료 3,000원이 추가되며, 5만원 미만 주문의 경우 배송비는 최소
											5,500원 입니다.
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>배송완료로
											확인되는데 상품 받지 못했습니다. 어떻게 해야 하나요?</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											택배사에서 인수가 된 후 상품을 받지 못하신 경우에는 택배사 또는 택배기사님께 문의해주세요.<br /> <br />
										</p>
									</div></li>
								<li><a href="javascript:void(0);"> <strong>상품
											주문취소 방법을 알려주세요</strong>
								</a>
									<div>
										<i class="icon-answer"></i>
										<p>
											주문취소는 마이페이지에 있는 메뉴를 통하여 진행하시면 됩니다.<br /> <br /> 배송 준비 단계에
											들어간 주문은 마이페이지에서 취소신청이 안됩니다. <br /> 1:1 문의 또는
											고객센터(02-123-4567)를 통해 취소 요청해 주시기 바랍니다.
										</p>
									</div></li>
							</ul>
						</div>
						<br /> <br /> <br />
					</div>
				</div>
			</div>
			<h1>아직 답을 찾지 못하셨나요?</h1>
			<br />
			<div class="category">
				<ul>
					<li><strong>1 : 1 문 의</strong>
						<div class="check-group">
							<!-- <div class="check-box">
						<a href="#" class="btn">채팅문의</a>
					</div> -->
							<div class="check-box">
								<a href="${ path }/notice/qnalist" class="btn">문의작성</a>
							</div>
							<div class="check-box">
								<a href="${ path }/map" class="btn">전화문의</a>
							</div>
						</div></li>
				</ul>
			</div>
		</section>
	</div>
</div>


<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<script>
    $(() => {
        let sideBarMenu = $('.side-bar ul li');
        let menuPath = ['list', 'faq','qnalist'];
        let menuName = ['공지사항', 'FAQ', '1:1 문의'];
        let menuIcon = ['description', 'quiz', 'headset_mic' ];

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
        })
    });
    
    
</script>