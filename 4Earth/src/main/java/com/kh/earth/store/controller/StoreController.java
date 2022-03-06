package com.kh.earth.store.controller;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.store.model.service.StoreService;
import com.kh.earth.store.model.service.StoreServiceImpl;
import com.kh.earth.store.model.vo.Cart;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductInquiry;
import com.kh.earth.store.model.vo.ProductOption;
import com.kh.earth.store.model.vo.Wish;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	@Autowired
	private StoreService service;
	
	// 소분샵 - 상품 목록
	@GetMapping("/product_list")
	public ModelAndView product_list(
			ModelAndView model,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(value = "category", defaultValue = "전체") String category,
			@RequestParam(value = "arrange", defaultValue = "신상품순") String arrange
			) {
		log.info("product_list() - 호출");
		
		log.info("arrage : " + arrange);
		
		int count = service.getProductCount();
		
		PageInfo pageInfo = new PageInfo(page, 10, count, 8);
		
		List<Product> list = service.getProductList(pageInfo, arrange);		
		
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
			@RequestParam(defaultValue="1") int page
			) {
		log.info("productCategory() - 호출");
		
		log.info("arrange : " + arrange);
		
		log.info("카테고리 : " + category);	
		
		List<Product> list = null;
		PageInfo pageInfo = null;
		
		int count = service.getProductCount(category);
		
		// 상세 필터 미선택
		if(detail == null || detail.isEmpty()) {					
			pageInfo = new PageInfo(page, 10, count, 8);
			
			list = service.getProductListByCategory(pageInfo, category, arrange);	
			
		} else {
			// 상세 필터 선택
			log.info("상세 필터 : " + detail);
			
			count = service.getProductCount(detail);
			
			pageInfo = new PageInfo(page, 10, count, 8);
			
			list = service.getProductListByDetail(pageInfo, detail, arrange);	
			
			model.addObject("detail", detail);
		}
		
		log.info("카테고리&필터 적용 count : " + count);
		
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
			@RequestParam(value = "arrange") String arrange
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
					
				model.addObject("detail", detail.replace("[", " ").replace("]", ""));		
				
			} else {
				
				log.info("category : ", category);
				
				count = service.getProductCount(category);
				
				pageInfo = new PageInfo(page, 10, count, 8);
				
				list = service.getProductListByCategory(pageInfo, category, arrange);	
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
		log.info(productNo);

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
			@SessionAttribute(name = "loginMember", required = false) Member loginMember
			) {
		log.info("productDetail() - 호출");
		
		Product product = service.findProductByNo(no);
		
		List<ProductOption> option = service.findProductOption(no);
		
		log.info("product : " + product.toString());
		log.info("option : " + option.toString());	
		
		// 상품 문의 목록 가져오기
		int inqCount = service.getProductInqCount(no);
		log.info("inqCount : " + inqCount);
		
		PageInfo inqPageInfo = new PageInfo(inqPage, 10, inqCount, 8);
		List<ProductInquiry> inqList = service.getProductInqList(inqPageInfo, no);
		
		log.info("inqList : " + inqList.toString());
		
		model.addObject("inqPageInfo", inqPageInfo);
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
			
			model.setViewName("store/purchase-cart");	
		} else {
			model.addObject("msg", "우선 로그인해주세요");
			model.addObject("location", "/login");			
			model.setViewName("common/msg");
		}		
		
		return model;
	}
	
	@GetMapping("/purchase_payment")
	public String purchasePayment() {
		log.info("purchasePayment() - 호출");
		
		return "store/purchase-payment";
	}
	
	@GetMapping("/write_review")
	public String writeReview() {
		log.info("writeReview() - 호출");
		
		return "store/write-review";
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
			
			log.info(productInquiry.toString());
			
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
	
	@GetMapping("/bidding_list")
	public String bidding_list() {
		log.info("bidding_list() - 호출");
		
		return "store/bidding-list";
	}
	
	@GetMapping("/bidding_detail")
	public String biddingDetail() {
		log.info("biddingDetail() - 호출");
		
		return "store/bidding-detail";
	}
	
	@GetMapping("/write_application")
	public String wirteApplication() {
		log.info("writeApplication() - 호출");
		
		return "store/write-application";
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
	
}
