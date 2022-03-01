package com.kh.earth.store.controller;

import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.service.StoreService;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductOption;

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
	
	
	// 소분샵 - 상품 상세
	@GetMapping("/product_detail")
	public ModelAndView productDetail(
			ModelAndView model,
			@RequestParam("no") int no
			) {
		log.info("productDetail() - 호출");
		log.info("no : " + no);
		
		Product product = service.findProductByNo(no);
		
		List<ProductOption> list = service.findProductOption(no);
		
		log.info("list : " + list.toString());
		
		log.info("product : " + product.toString());
		
		model.addObject("product", product);
	
		model.setViewName("store/product-detail");
		
		return model;
	}
	
	@GetMapping("write_review")
	public String writeReview() {
		log.info("writeReview() - 호출");
		
		return "store/write-review";
	}
	
	@GetMapping("write_qna")
	public String writeQnA() {
		log.info("writeQnA() - 호출");
		
		return "store/write-QnA";
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
	
	@GetMapping("/purchase_cart")
	public String purchaseCart() {
		log.info("purchaseCart() - 호출");
		
		return "store/purchase-cart";
	}
	
	@GetMapping("/purchase_payment")
	public String purchasePayment() {
		log.info("purchasePayment() - 호출");
		
		return "store/purchase-payment";
	}
}
