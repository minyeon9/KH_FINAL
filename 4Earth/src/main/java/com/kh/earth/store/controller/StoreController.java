package com.kh.earth.store.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.common.util.FileProcess;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.store.model.service.StoreService;
import com.kh.earth.store.model.vo.Application;
import com.kh.earth.store.model.vo.Bidding;
import com.kh.earth.store.model.vo.BiddingBoard;
import com.kh.earth.store.model.vo.Cart;
import com.kh.earth.store.model.vo.CartList;
import com.kh.earth.store.model.vo.Delivery;
import com.kh.earth.store.model.vo.OrderDetail;
import com.kh.earth.store.model.vo.OrderSum;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductBidding;
import com.kh.earth.store.model.vo.ProductImgs;
import com.kh.earth.store.model.vo.ProductInquiry;
import com.kh.earth.store.model.vo.ProductOption;
import com.kh.earth.store.model.vo.Review;
import com.kh.earth.store.model.vo.Wish;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	@Autowired
	private StoreService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	// 소분샵 - 상품 목록
	@GetMapping("/product_list")
	public ModelAndView product_list(
			ModelAndView model,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(value = "category", defaultValue = "전체") String category,
			@RequestParam(value = "arrange", defaultValue = "신상품순") String arrange,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember
			) {
		log.info("product_list() - 호출");
		
		log.info("arrage : " + arrange);
		
		int count = service.getProductCount();
		
		PageInfo pageInfo = new PageInfo(page, 10, count, 8);
		
		List<Product> list = null;
		
		list = service.getProductList(pageInfo, arrange);	
		
		if(loginMember != null) {
			// 로그인 회원일 경우 찜 상품 여부 확인
			list = checkWish(list, loginMember.getNo());	
			
			model.addObject("loginMember", loginMember);
		} 		
		
		log.info(list.toString());
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.addObject("count", count);
		model.addObject("arrange", arrange);
		model.addObject("category", category);
		
		model.setViewName("store/product-list");
		
		return model;
	}
	
	// 소분샵 - 상품 목록 : 카테고리 & 상세 필터
	@GetMapping("/product_category")
	public ModelAndView productCategory(
			ModelAndView model,
			@RequestParam(value = "category", defaultValue = "전체") String category,
			@RequestParam(value = "category-detail", required = false) List<String> detail,
			@RequestParam(value = "arrange", defaultValue = "신상품순") String arrange,
			@RequestParam(defaultValue="1") int page,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember
			) {
		log.info("productCategory() - 호출");
		
		log.info("arrange : " + arrange);
		
		log.info("카테고리 : " + category);	
		
		List<Product> list = null;
		PageInfo pageInfo = null;
		
		int count = service.getProductCount(category);
		
		pageInfo = new PageInfo(page, 10, count, 8);

		log.info("카테고리 적용 count : " + count);	
		
		// 상세 필터 미선택
		if(detail == null || detail.isEmpty()) {	
			
			list = service.getProductListByCategory(pageInfo, category, arrange);	
			
			if(loginMember != null) {
				// 로그인 회원일 경우 찜 상품 여부 확인
				log.info("상세 필터 미선택 + 로그인 유저 ");
				
				list = checkWish(list, loginMember.getNo());
				
				model.addObject("loginMember", loginMember);
			} else {				
				log.info("상세 필터 미선택 + 비 로그인 유저 ");
			}
			
		} else {
			// 상세 필터 선택
			log.info("상세 필터 : " + detail);
			
			count = service.getProductCount(detail);
			
			log.info("카테고리&필터 적용 count : " + count);
			
			list = service.getProductListByDetail(pageInfo, detail, arrange);	
			
			if(loginMember != null) {
				log.info("상세 필터 선택 + 로그인 유저 ");
				
				list = checkWish(list, loginMember.getNo());
				
				model.addObject("loginMember", loginMember);
			}
			
			model.addObject("detail", detail);
		}		
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.addObject("count", count);
		model.addObject("category", category);
		model.addObject("arrange", arrange);
		
		model.setViewName("store/product-list");
		
		return model;
	}
	
	// 소분샵 - 상품 목록 : 정렬
	@GetMapping("/product_arrange")
	public ModelAndView productArrange(
			ModelAndView model,
			@RequestParam(value = "category", defaultValue = "전체") String category,
			@RequestParam(value = "category-detail", required = false) String detail,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(value = "arrange") String arrange,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember
			) {
		log.info("productArrange() - 호출");
		
		log.info("arrange : " + arrange);
		
		List<Product> list = null;
		PageInfo pageInfo = null;
		int count = 0;
		
		// 카테고리 미적용
		if(category.equals("전체")) {			
			count = service.getProductCount();
			
			pageInfo = new PageInfo(page, 10, count, 8);
			
			list = service.getProductList(pageInfo, arrange);
			
			if(loginMember != null) {
				log.info("카테고리 미적용 + 로그인 유저 ");
				
				list = checkWish(list, loginMember.getNo());
				
				model.addObject("loginMember", loginMember);
			}
		}
		
		// 카테고리 적용
		if(!category.equals("전체")) {	
			// 상세 필터 선택
			if(detail != null && !detail.isEmpty()) {
				
				log.info("상세 필터 : " + detail.replace("[", "").replace("]", "").replace(" ", "").trim().split(","));
				
				List<String> detailList = Arrays.asList(detail.replace("[", "").replace("]", "").replace(" ", "").trim().split(","));				
						
				log.info("detailList : " + detailList.toString());
				
				count = service.getProductCount(detailList);
				
				pageInfo = new PageInfo(page, 10, count, 8);
				
				list = service.getProductListByDetail(pageInfo, detailList, arrange);	
				
				if(loginMember != null) {
					log.info("카테고리 적용 + 상세 필터 선택 + 로그인 유저 ");
					
					list = checkWish(list, loginMember.getNo());
					
					model.addObject("loginMember", loginMember);
				}
					
				model.addObject("detail", detail.replace("[", " ").replace("]", ""));		
				
			} else {
				
				log.info("category : ", category);
				
				count = service.getProductCount(category);
				
				pageInfo = new PageInfo(page, 10, count, 8);
				
				list = service.getProductListByCategory(pageInfo, category, arrange);	
				
				if(loginMember != null) {
					log.info("카테고리 적용 + 상세 필터 선택 + 로그인 유저 ");
					
					list = checkWish(list, loginMember.getNo());
					
					model.addObject("loginMember", loginMember);
				}
			}
			
		}				
		
		log.info(list.toString());
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("category", category);
		model.addObject("list", list);
		model.addObject("count", count);
		model.addObject("arrange", arrange);
		
		model.setViewName("store/product-list");	
		
		return model;
	}
	
	// 소분샵 - 찜
	@PostMapping("/add_wish")
	@ResponseBody
	public String addWish(
			@RequestBody String productNo,
			@SessionAttribute(name = "loginMember") Member loginMember
			) {
		log.info("addWish() - 호출");
		log.info("productNo : " + productNo);

		int result = 0;
		int count = 0;
		String data = "";
		
		
		if(loginMember != null) {			
			Wish wish = new Wish();
			
			wish.setMemberNo(loginMember.getNo());
			wish.setProNo(Integer.parseInt(productNo));
			wish.setProName(service.getProductNameByNo(Integer.parseInt(productNo)));
			
			count = service.getWish(wish);
			
			log.info("count : " + count);
			
			if(count != 0) {
				String wishStatus = service.getWishStat(wish);
				
				System.out.println(wishStatus);
				
				if(wishStatus.equals("Y")) {					
					// 찜 취소 
					wish.setWishStat('N');
					
					result = service.updateWish(wish);
					
					if(result > 0) {
						data = "Wish Deleted";
					} else {
						data = "error";
					}				
				} else if (wishStatus.equals("N")) {
					// 다시 찜
					wish.setWishStat('Y');
					
					result = service.updateWish(wish);
					
					if(result > 0) {
						data = "Wish Again";
					} else {
						data = "error";
					}
				}
			} else {
				// 찜하기
				result = service.addWish(wish);
				
				if(result > 0) {
					data = "Wish Added";
				} else {
					data = "error";
				}
			}	
			
		} else {
			log.info("로그인되어있지 않음");
		}		
		
		return data;
	}	
	
	// 소분샵 - 상품 상세
	@GetMapping("/product_detail")
	public ModelAndView productDetail(
			ModelAndView model,
			@RequestParam("no") int no,
			@RequestParam(defaultValue="1") int inqPage,
			@RequestParam(defaultValue="1") int revPage,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember
			) {
		log.info("productDetail() - 호출");
		
		Product product = service.findProductByNo(no);
		
		List<ProductOption> option = service.findProductOption(no);
		
		log.info("product : " + product.toString());
		log.info("option : " + option.toString());	
		
		// 로그인 회원일 경우 찜 여부 조회
		if(loginMember != null) {
			Wish wish = new Wish();
			
			wish.setProNo(no);
			wish.setMemberNo(loginMember.getNo());
			
			product.setMemberNo(loginMember.getNo());
			product.setWishStat(service.getWishStat(wish));
		}
		
		// 상세 사진 가져오기
		List<ProductImgs> productImgs = service.getProductImgs(no);
		log.info("productImgs : " + productImgs.toString());
		
		// 상품 문의 목록 가져오기
		int inqCount = service.getProductInqCount(no);
		log.info("inqCount : " + inqCount);
		
		PageInfo inqPageInfo = new PageInfo(inqPage, 10, inqCount, 5);
		List<ProductInquiry> inqList = service.getProductInqList(inqPageInfo, no);
		
		log.info("inqList : " + inqList.toString());
		
		// 상품 리뷰 목록 가져오기
		int revCount = service.getProductRevCount(no);
		log.info("revCount : " + revCount);
		
		PageInfo revPageInfo = new PageInfo(revPage, 10, revCount, 5);
		List<Review> revList = service.getProductRevList(revPageInfo, no);
		
		log.info("revList : " + revList.toString());
		
		model.addObject("productImgs", productImgs);
		model.addObject("inqPageInfo", inqPageInfo);
		model.addObject("revPageInfo", revPageInfo);
		model.addObject("revList", revList);
		model.addObject("inqList", inqList);
		model.addObject("product", product);
		model.addObject("option", option);
	
		if(loginMember != null) {
			model.addObject("memberId", loginMember.getId());
		}
		
		model.setViewName("store/product-detail");
		
		return model;
	}
	
	// 소분샵 - 장바구니 추가
	@PostMapping("/add_cart")
	@ResponseBody
	public String addCart(
			@RequestBody List<Map<String, Object>> itemArr,
			@SessionAttribute(name = "loginMember") Member loginMember
			) {
		log.info("addCart() - 호출");
		
		int result = 0;
		String data = "";
		
		// 로그인 체크
		if(loginMember != null) {
			
			log.info("itemArr : " + itemArr.toString());

			
			for(int i = 0; i < itemArr.size(); i++) {
				Cart cart = new Cart();

				cart.setProNo(Integer.parseInt((itemArr.get(i).get("proNo")).toString()));
				cart.setProName(itemArr.get(i).get("proName").toString());
				cart.setProOptNo(Integer.parseInt((itemArr.get(i).get("proOptNo")).toString()));
				cart.setProOpt(itemArr.get(i).get("proOpt").toString());
				cart.setCartQty(Integer.parseInt((itemArr.get(i).get("cartQty")).toString()));

				cart.setMemberNo(loginMember.getNo());
				
				log.info("cart : " + cart.toString());
				
				result = service.addCart(cart);
				
				if(result > 0) {
					// 성공
					data = "success";
				} else {
					// 실패 (이미 장바구니에 담겨있는 경우)
					log.info("이미 장바구니에 담은 상품");
				}
			}
			
		} else {
			// 비 로그인
			log.info("로그인되어있지 않음");
		}
		
		return data;
	}
	
	// 장바구니
	@GetMapping("/purchase_cart")
	public ModelAndView purchaseCart(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember
			) {
		log.info("purchaseCart() - 호출");

		// 로그인 체크
		if(loginMember != null) {
			
			List<Cart> list = service.getCartList(loginMember.getNo());
			
			log.info("list : " + list.toString());
			
			model.addObject("list", list);
			model.addObject("loginMember", loginMember);
			
			model.setViewName("store/purchase-cart");	
		} else {
			model.addObject("msg", "우선 로그인해주세요");
			model.addObject("location", "/login");			
			model.setViewName("common/msg");
		}		
		
		return model;
	}
	
	// 장바구니 삭제
	@PostMapping("/delete_cart")
	public String deleteCart(
			@RequestBody Map<String, Object> product,
			@SessionAttribute(name = "loginMember") Member loginMember
			) {
		String data = "";
		
		if(loginMember != null) {
			log.info("product : " + product);
			
			Cart cart = new Cart();
			
			cart.setProNo(Integer.parseInt(product.get("proNo").toString()));
			cart.setProOptNo(Integer.parseInt(product.get("proOptNo").toString()));
			cart.setMemberNo(Integer.parseInt(product.get("memberNo").toString()));
			
			int result = service.deleteCart(cart);
			
			if(result > 0) {
				data = "success";
			} else {
				data = "fail";
			}
			
		} else {
			log.info("로그인되어있지 않음");
		}
		
		return data;
	}
	
	// 주문하기
	@PostMapping("/purchase_payment")
	public ModelAndView purchasePayment(
			ModelAndView model,
			@ModelAttribute CartList cartList,
			@SessionAttribute(name = "loginMember") Member loginMember
			) {
		log.info("purchasePayment() - 호출");
		int detailResult = 0;
		
		if(loginMember != null) {
			System.out.println(cartList.getCartList().size());
			
			OrderSum orderSum = new OrderSum();
			
			orderSum.setMemberNo(loginMember.getNo());
			
			// 주문번호(시퀀스) 생성
			int sumResult = service.createOrderSum(orderSum);
			
			if(sumResult > 0) {
				int result = 0;
				int orderNo = orderSum.getOrderNo();
				int orderPrice = 0; 
				
				log.info("orderNo : " + orderNo);
				
				// Cart -> OrderDetail
				for(Cart c : cartList.getCartList()) {
					System.out.println(c.toString());
					
					OrderDetail orderDetail = new OrderDetail();
					
					orderDetail.setOrderNo(orderNo);
					orderDetail.setMemberNo(loginMember.getNo());
					orderDetail.setDetailProNo(c.getProNo());
					orderDetail.setDetailProName(c.getProName());
					orderDetail.setDetailOpt(c.getProOptNo());
					orderDetail.setDetailOptName(c.getProOpt());
					orderDetail.setDetailQty(c.getCartQty());
					orderDetail.setDetailPrice(c.getProPrice());
					orderDetail.setProModifyImg(c.getProModifyImg());
					
					log.info("orderDetail : " + orderDetail.toString());
					
					detailResult = service.addOrderDetail(orderDetail);					
					
					if(detailResult > 0) {
						// 성공
						orderPrice += orderDetail.getDetailPrice() * orderDetail.getDetailQty();
						
						
					} else {
						// 실패 
						
					}
				}
				
				log.info("orderPrice : " + orderPrice);
				
				orderSum.setOrderPrice(orderPrice);
				
				result = service.updateOrderSum(orderSum);
				
				List<OrderDetail> OrderDetailList = service.getOrderDetailList(orderNo);
				
				// 포인트 조회
				int point = service.getPoint(loginMember.getNo());
				
				model.addObject("point", point);
				model.addObject("list", OrderDetailList);
				model.addObject("orderSum", orderSum);
				model.addObject("loginMember", loginMember);
				
				log.info("loginMember : " + loginMember.toString());
				
				model.setViewName("store/purchase-payment");
				
			} else {
				log.info("주문번호 생성 실패");
			}
			
		} else {
			model.addObject("msg", "로그인 후 이용이 가능합니다.");
			model.addObject("location", "/login");			
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	// 결제
	@PostMapping("/purchase_complete")
	public ModelAndView purchaseComplete(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam(value = "memberNo") int memberNo,
			@RequestParam(value = "orderNo") int orderNo,
			@RequestParam(value = "delName") String delName,
			@RequestParam(value = "delPostcode") String delPostcode,
			@RequestParam(value = "delAddress") String delAddress,
			@RequestParam(value = "delExtraAddress") String delExtraAddress,
			@RequestParam(value = "delDetailAddress") String delDetailAddress,
			@RequestParam(value = "delPhone") String delPhone,			
			@RequestParam(value = "delMsg") String delMsg,		
			@RequestParam(value = "pointUsage") int pointUsage,			
			@RequestParam(value = "priceFinal") int priceFinal,		
			@RequestParam(value = "orderMethod") String orderMethod
			) {
		log.info("purchaseComplete() - 호출");
		
		// 로그인 체크 + 본인 체크
		if(loginMember != null && loginMember.getNo() == memberNo) {
			// OrderSum - 포인트사용, 결제금액, 주문상태, 결제수단 update
			OrderSum orderSum = service.findOrderSumByNo(orderNo);
			
			log.info("orderSum 수정 전 : " + orderSum.toString());
			
			orderSum.setOrderPoint(pointUsage);
			orderSum.setOrderPrice(priceFinal);
			orderSum.setOrderStat("결제완료");
			orderSum.setOrderMethod(orderMethod);
			
			int orderSumUpdateResult = service.completeOrderSum(orderSum);
			
			if(orderSumUpdateResult > 0) {
				// 해당 회원의 OrderSum 중 주문상태가 '주문 생성' 인 행들 delete 
				int orderSumDeleteResult = service.deleteOrderSum(memberNo);
				
				if(orderSumDeleteResult <= 0) {
					log.info("deleteOrderSum 실패");
				}
				
				// DELIVERY - 배송정보 insert
				Delivery delivery = new Delivery();
				
				delivery.setOrderNo(orderNo);
				delivery.setMemberNo(memberNo);			
				delivery.setDelName(delName);
				delivery.setDelPostcode(delPostcode);
				delivery.setDelAdd(delAddress);
				delivery.setDelExtraAdd(delExtraAddress);
				delivery.setDelDetailAdd(delDetailAddress);
				delivery.setDelPhone(delPhone);
				delivery.setDelMsg(delMsg);
				
				int deliveryResult = service.addDelivery(delivery);
				
				if(deliveryResult <= 0) {
					log.info("addDelivery 실패");
				}
				
				// 포인트 차감
				int calcPointResult = service.calcPoint(memberNo, pointUsage);
				
				if(calcPointResult <= 0) {
					log.info("calcPoint 실패");
				}
				
				// PRODUCT - 재고 차감 & 판매량 증가
				/*
				 * orderNo로 ORDER_DETAIL 조회, proNo & qty 찾은 후
				 * PRODUCT 테이블에서 proNo로 상품 찾아 qty만큼 재고 -, 판매량 + 
				 */
				List<OrderDetail> products = service.getPurchaseList(orderNo);
				
				for (OrderDetail orderdetail : products) {
					int proNo = orderdetail.getDetailProNo();
					int qty = orderdetail.getDetailQty();
					
					int calcQtyResult = service.calcQty(proNo, qty);
					
					if(calcQtyResult <= 0) {
						log.info("calcQty 실패");
					}
				}
			}
			
			model.addObject("orderSum", orderSum);			
			
			model.setViewName("store/purchase-complete");

		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");			
			model.setViewName("common/msg");
		}	
		
		return model;
	}
	
	// 소분샵 & 마이페이지 - 리뷰
	@GetMapping("/write_review")
	public ModelAndView writeReview(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("no") int proNo,
			@RequestParam(value = "optName", required = false) String optName,
			@RequestParam(value = "optNo", required = false) String optNo
			) {
		log.info("writeReview() - 호출");
		
		int memberNo = loginMember.getNo();
		
		// 상품 리뷰 : 로그인 회원 && 해당 상품을 주문한 회원 && 이미 리뷰를 작성하지 않은 회원
		// ORDER_DETAIL에서 회원 번호 + 상품 번호로 상품에 대한 주문 이력 조회 (+ ORDER_SUM에서 주문상태가 '주문생성'이 아니어야 함)
		int purchaseCount = service.findOrderDetail(memberNo, proNo);
		
		log.info("purchaseCount : " + purchaseCount);
		
		if(purchaseCount > 0) {
			List<ProductOption> option = service.findProductOption(proNo);
			
			model.addObject("option", option);
			model.addObject("proNo", proNo);
			model.addObject("optName", optName);
			model.addObject("optNo", optNo);
			
			log.info("optName : " + optName);
			log.info("optNo : " + optNo);
			
			model.setViewName("store/write-review");

		} else {
			model.addObject("msg", "구매하지 않은 상품에 대한 리뷰는 작성할 수 없습니다.");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");		
			model.setViewName("common/msg");
		}
		
		return model;	
	}
	
	// 소분샵 & 마이페이지 - 리뷰 작성
	@PostMapping("/write_review")
	public ModelAndView writeReview(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("no") int proNo,
			@RequestParam(value = "proOptName", required = false) String optName,
			@ModelAttribute Review review,
			@RequestParam("upfile") MultipartFile upfile
			) {
		log.info("writeReview() - 호출");
		
		log.info("review : " + review);
		
		int memberNo = loginMember.getNo();
		
		int purchaseCount = service.findOrderDetail(memberNo, proNo, optName);

		if(purchaseCount > 0) {
			log.info("시작");
			
			// 해당 주문 중 가장 오래된 주문의 주문 번호부터 리뷰 등록 시도
			for(int i = 1; i <= purchaseCount; i++) {
				log.info("i = " + i);
				
				int orderNo = service.getOrderNoForReview(memberNo, proNo, optName, i);
				
				log.info("orderNo : " + orderNo);

				// 가져온 orderNo + proNo + optName 으로 등록된 리뷰가 있는지 확인
				int hasWritten = service.getReviewCount(orderNo, proNo, optName);
				
				if(hasWritten == 0) {
					// 리뷰 작성 가능
					log.info("Upfile Name : {}", upfile.getOriginalFilename()); // 파일이 업로드되지 않았으면 빈 문자열 "", 되었으면 "파일명" 출력됨
					log.info("Upfile isEmpty : {}", upfile.isEmpty()); 
					
					if(upfile != null && !upfile.isEmpty()) {
						// 파일 저장
						String renamedFileName = null; 
						String location = null;
						
						try {
							location = resourceLoader.getResource("resources/upload/review").getFile().getPath();
							
							log.info("location : " + location);
						} catch (IOException e) {
							e.printStackTrace();
						} 
						
						renamedFileName = FileProcess.save(upfile, location);
						
						if(renamedFileName != null) {
							review.setOriginalFileName(upfile.getOriginalFilename());
							review.setRenamedFileName(renamedFileName);
						}			
					}
					
					review.setOrderNo(orderNo);
					review.setMemberNo(memberNo);
					review.setProNo(proNo);
					review.setProOpt(review.getProOpt());
					
					log.info("review : " + review);
					
					int result = service.writeReview(review);
					
					if(result > 0) {
						log.info("리뷰 등록 성공");
						
						model.addObject("msg", "상품 리뷰가 등록되었습니다.");
						model.addObject("script", "window.opener.document.location.reload(); window.close();");		
						model.setViewName("common/msg");
						
						// PRODUCT 테이블에서 PRO_RATING(평점) 컬럼 업데이트
						double rating = service.getProductRating(proNo);
						
						log.info("rating : " + rating);
						
						int updateRating = service.updateProductRating(proNo, rating);
						
						return model;
					} else {
						log.info("리뷰 등록 실패");
					}
				} else {
					// 이미 작성된 리뷰가 있음
					continue;
				}
					
			}
			
			model.addObject("msg", "리뷰 수가 구매 건수를 초과하여 작성할 수 없습니다.");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");			
			model.setViewName("common/msg");
			
		} else {
			model.addObject("msg", "구매하신 옵션에 대하여 리뷰를 작성할 수 있습니다.");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");			
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	// 소분샵 - 리뷰 삭제
	@PostMapping("/delete_review")
	public ModelAndView deleteReview(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute Review review
			) {
		log.info("deleteReview() - 호출");
		log.info(review.toString());
		
		int result = 0;
		
		result = service.deleteReview(review); // 한 주문에서 a 상품의 1번 옵션을 2개 구매했을 경우에 리뷰 작성 가능 개수와 삭제할 때 특정 ?
		
		if(result > 0) {
			model.addObject("msg", "리뷰를 삭제했습니다.");
			model.addObject("location", "/product_detail?no=" + review.getProNo());
		} else {
			model.addObject("msg", "리뷰를 삭제하는 중 문제가 발생했습니다. 다시 시도해주세요.");
			model.addObject("location", "/product_detail?no=" + review.getProNo());
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 소분샵 - 상품 문의
	@GetMapping("/write_qna")
	public ModelAndView writeQnA(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam int no
			) {
		log.info("writeQnA() - 호출");
		log.info("no : " + no);
		
		Product product = service.findProductByNo(no);
			
		model.addObject("product", product);
		model.addObject("loginMember", loginMember);
		
		model.setViewName("store/write-QnA");		
		
		return model;
	}
	
	// 소분샵 - 상품 문의 작성
	@PostMapping("/write_qna")
	public ModelAndView writeQna(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute ProductInquiry productInquiry
			) {
		log.info("writeQna() - 호출");
		int result = 0;
		
		if(loginMember != null) {
			productInquiry.setMemberNo(loginMember.getNo());
			
			log.info("productInquiry : " + productInquiry.toString());
			
			result = service.writeQna(productInquiry);
			
			if(result > 0) {
				model.addObject("msg", "상품 문의가 등록되었습니다.");
				
				// 작성 창 닫고, 기존 페이지 새로고침				
				model.addObject("script", "window.opener.document.location.reload(); window.close();");			
				model.setViewName("common/msg");				
			} else {
				model.addObject("msg", "다시 시도해주세요.");
				model.addObject("script", "window.opener.document.location.reload(); window.close();");			
				model.setViewName("common/msg");	
			}
			
		} else {
			log.info("로그인되어있지 않음");
		}		
		
		return model;
	}
	
	// 소분샵 - 상품 문의 삭제
	@PostMapping("/delete_qna")
	public ModelAndView deleteQna(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute ProductInquiry productInquiry
			) {
		log.info("deleteQna() - 호출");
		log.info(productInquiry.toString());
		
		int result = 0;
		
		result = service.deleteQna(productInquiry); 
		
		if(result > 0) {
			model.addObject("msg", "문의를 삭제했습니다.");
			model.addObject("location", "/product_detail?no=" + productInquiry.getProNo());
		} else {
			model.addObject("msg", "문의를 삭제하는 중 문제가 발생했습니다. 다시 시도해주세요.");
			model.addObject("location", "/product_detail?no=" + productInquiry.getProNo());
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 소분샵 입고 신청 - 모집 상품 목록
	@GetMapping("/bidding_list")
	public ModelAndView bidding_list(
			ModelAndView model,
			@RequestParam(defaultValue="1") int page,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember
			) {
		log.info("bidding_list() - 호출");
		
		int count = service.getBiddingCount();
		
		PageInfo pageInfo = new PageInfo(page, 10, count, 8);
		
		List<ProductBidding> list = null;
		
		list = service.getBiddingList(pageInfo);
		
		// 로그인 회원일 경우 모집 참여 여부 확인
		if(loginMember != null) {
			list = checkBid(list, loginMember.getNo());
			
			model.addObject("loginMember", loginMember);
		}
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		
		log.info("list : " + list);
		
		model.setViewName("store/bidding-list");
		
		return model;
	}
	
	// 소분샵 입고 신청 - 모집 상품 상세
	@GetMapping("/bidding_detail")
	public ModelAndView biddingDetail(
			ModelAndView model,
			@RequestParam("no") int no,
			@RequestParam(defaultValue="1") int page,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember
			) {
		log.info("biddingDetail() - 호출");
		
		ProductBidding productBidding = service.getBiddingDetailByNo(no);
		
		// 로그인 회원일 경우 찜 여부 조회
		if(loginMember != null) {
			Bidding bidding = new Bidding();
			
			bidding.setBidNo(no);
			bidding.setBidMemberNo(loginMember.getNo());
			
			productBidding.setBidMemberNo(loginMember.getNo());
			productBidding.setBidStat(service.getBidStat(bidding));
		}
		
		log.info("productBidding : " + productBidding.toString());
		
		// 한마디 게시판 목록 가져오기
		int count = service.getBiddingBoardCount(no);
		
		PageInfo pageInfo = new PageInfo(page, 10, count, 5);
		
		List<BiddingBoard> list = service.getBiddingBoardList(pageInfo, no);
		
		System.out.println("list : " + list.toString());
		
		model.addObject("product", productBidding);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.addObject("loginMember", loginMember);
		
		model.setViewName("store/bidding-detail");
		
		return model;
	}
	
	// 소분샵 입고 신청 - 관심있어요
	@PostMapping("/add_bid")
	@ResponseBody
	public String addBid(
			@RequestBody String bidNo,
			@SessionAttribute(name = "loginMember") Member loginMember
			) {
		log.info("addBid() - 호출");
		log.info("bidNo : " + bidNo);
		
		int result = 0;
		String data = "";
		int no = Integer.parseInt(bidNo);
		
		if(loginMember != null) {
			Bidding bidding = new Bidding();
			
			bidding.setBidNo(no);
			bidding.setBidMemberNo(loginMember.getNo());
			
			int count = service.getBid(bidding);
			
			log.info("count : " + count);
			
			if(count != 0) {
				String bidStat = service.getBidStat(bidding);
				
				System.out.println(bidStat);
				
				int updateResult = 0;
				
				if(bidStat.equals("Y")) {					
					// 참여 취소 
					System.out.println("참여취소하자");
					bidding.setBidStat("N");
					
					updateResult = service.updateBid(bidding);
					
					// 인원 -1
					int bidCurr = service.getBidCurr(no);
					service.updateBidCurr(no, bidCurr - 1);
					
					if(updateResult > 0) {
						data = "Bid Deleted";
					} else {
						data = "error";
					}				
				} else if (bidStat.equals("N")) {
					// 다시 참여
					System.out.println("다시참여하자");
					bidding.setBidStat("Y");
					
					updateResult = service.updateBid(bidding);
					
					// 인원 +1
					int bidCurr = service.getBidCurr(no);
					service.updateBidCurr(no, bidCurr + 1);
					
					if(updateResult > 0) {
						data = "Bid Again";
					} else {
						data = "error";
					}
				}
			} else {
				// 모집 참여
				result = service.addBid(bidding);
				
				if(result > 0) {
					// PRODUCT_BIDDING 현재 인원 +1
					int bidCurr = service.getBidCurr(no);
					
					int updateResult = service.updateBidCurr(no, bidCurr + 1);
					
					if(updateResult > 0) {
						data = "Bid Added";					
					} else {
						data = "update 오류";		
					}
					
				} else {
					data = "insert 오류";
				}
			}
			
		} else {
			log.info("로그인되어있지 않음");
		}
		
		return data;
	}
	
	// 입고 신청하기
	@GetMapping("/write_application")
	public ModelAndView writeApplication(
			ModelAndView model			
			) {
		log.info("writeApplication() - 호출");		
		
		model.setViewName("store/write-application");
		
		return model;
	}
	
	// 입고 신청하기 작성
	@PostMapping("/write_application")
	public ModelAndView writeApplication(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute Application application
			) {
		log.info("writeApplication() - 호출");
		
		log.info("application : " + application.toString());
		
		if(loginMember != null) {
			application.setMemberNo(loginMember.getNo());
			
			// 카테고리명으로 카테고리 번호 가져오기
			int catNo = service.getCategoryNo(application.getAppCatName());
			log.info("catNo : " + catNo);
			
			application.setAppCatNo(catNo);
			
			int result = service.writeApplication(application);
			
			if(result > 0) {
				model.addObject("msg", "입고 신청이 등록되었습니다.");
				
				// 작성 창 닫고, 기존 페이지 새로고침				
				model.addObject("script", "window.opener.document.location.reload(); window.close();");	
				model.setViewName("common/msg");	
			} else {
				log.info("응안돼");
			}			
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");				
			model.setViewName("common/msg");
		}		
		
		return model;		
	}
	
	// 입고 신청 - 한마디 게시판 작성
	@PostMapping("/write_bidding_board")
	public ModelAndView writeBiddingBoard(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute BiddingBoard biddingBoard
			) {
		log.info("writeBiddingBoard() - post 호출");
		int result = 0;
		
		if(loginMember != null) {
			log.info("biddingBoard : " + biddingBoard.toString());
			
			biddingBoard.setMemberNo(loginMember.getNo());
			
			result = service.writeBiddingBoard(biddingBoard);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 등록되었습니다.");
				model.addObject("location", "/bidding_detail?no=" + biddingBoard.getBidNo());	
				model.setViewName("common/msg");
			} else {
				model.addObject("msg", "게시글 등록에 실패하였습니다.");
				model.addObject("location", "/bidding_detail?no=" + biddingBoard.getBidNo());	
				model.setViewName("common/msg");
			}
			
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/bidding_detail?no=" + biddingBoard.getBidNo());	
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	// 입고 신청 - 한마디 게시판 삭제
	@PostMapping("/delete_bidding_board")
	@ResponseBody
	public String deleteBiddingBoard(
			ModelAndView model,
			@RequestBody int boardNo
			) {
		log.info("deleteBiddingBoard() - 호출");
		int result = 0;
		String data = "";
		
		result = service.updateBiddingBoard(boardNo);
		
		if(result > 0) {
			data = "Successfully Deleted";
		} else {
			data = "Delete Failed";
		}
		
		return data;
	}
	
	@GetMapping("/map")
	public String map() {
		log.info("map() - 호출");
		
		return "store/map";
	}
	
	// 마이페이지 - 찜한 상품
	@GetMapping("/wishlist")
	public ModelAndView wishlist(
			ModelAndView model,
			@RequestParam(defaultValue="1") int page,
			@SessionAttribute(name = "loginMember") Member loginMember
			) {
		log.info("wishlist() - 호출");
		
		System.out.println("loginMember.getNo() : " + loginMember.getNo());
		
		int count = service.getWishCount(loginMember.getNo());
		
		PageInfo pageInfo = new PageInfo(page, 10, count, 8);
		
		List<Product> list = service.getWishList(pageInfo, loginMember.getNo());
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		
		model.setViewName("mypage/wishlist");
		
		return model;
	}
	
	// 마이페이지 - 주문/배송
	@GetMapping("/order")
	public ModelAndView order(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam(defaultValue="1") int page
			) {
		log.info("order() - 호출");
		
		// 주문 조회 : 회원번호 + ORDER_STAT != '주문생성'
		
		int count = service.getOrderCount(loginMember.getNo());
		
		PageInfo pageInfo = new PageInfo(page, 10, count, 10);
		
		List<OrderSum> orderSum = service.getOrderList(pageInfo, loginMember.getNo());
		
		log.info("orderSum : " + orderSum.toString());
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("orderSum", orderSum);
		
		model.setViewName("mypage/order");
		
		return model;		
	}
	
	// 마이페이지 - 주문 상세
	@GetMapping("/order_detail")
	public ModelAndView orderDetail(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam int orderNo
			) {
		log.info("orderDetail() - 호출");
		
		OrderSum orderSum = service.findOrderSumByNo(orderNo);
		
		// 주문 상세 조회 : 주문번호
		List<OrderDetail> orderDetailList = service.getOrderDetailList(orderNo);
		
		log.info("orderSum : " + orderSum.toString());
		log.info("orderDetailList : " + orderDetailList.toString());
		
		model.addObject("orderSum", orderSum);
		model.addObject("orderDetailList", orderDetailList);		
		
		model.setViewName("mypage/order-detail");
		
		return model;	
	}
	
	// 상품 목록 & 회원 번호로 찜 여부 조회
	private List<Product> checkWish(List<Product> list, int memberNo) {
		List<Product> listWithWish = new ArrayList<>();
		Wish wish = new Wish();

		System.out.println("memberNo : " + memberNo);		
		
		for (Product product : list) {
			wish.setMemberNo(memberNo);
			wish.setProNo(product.getProNo());
			
			product.setWishStat(service.getWishStat(wish));		
			product.setMemberNo(memberNo);
			
			listWithWish.add(product);
		}
		
		return listWithWish;		
	}
	
	// 상품 목록 & 회원 번호로 모집 참여 여부 조회
	private List<ProductBidding> checkBid(List<ProductBidding> list, int memberNo) {
		List<ProductBidding> listWithBid = new ArrayList<>();
		Bidding bidding = new Bidding();

		System.out.println("memberNo : " + memberNo);
		
		
		for (ProductBidding productBidding : list) {			
			bidding.setBidMemberNo(memberNo);
			bidding.setBidNo(productBidding.getBidNo());
			
			productBidding.setBidStat(service.getBidStat(bidding));		
			productBidding.setBidMemberNo(memberNo);
			
			listWithBid.add(productBidding);
		}
		
		return listWithBid;		
	}

}