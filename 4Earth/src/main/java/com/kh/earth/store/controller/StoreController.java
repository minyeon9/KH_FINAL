package com.kh.earth.store.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.store.model.service.StoreService;
import com.kh.earth.store.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	@Autowired
	private StoreService service;
	
	// 소분샵 - 상품목록
	@GetMapping("/product_list")
	public ModelAndView product_list(
			ModelAndView model,
			@RequestParam(defaultValue="1") int page
			) {
		log.info("product_list() - 호출");
		
		PageInfo pageInfo = new PageInfo(page, 10, service.getProductCount(), 8);
		
		log.info("service.getProductCount() : " + service.getProductCount());
		
		List<Product> list = service.getProductList(pageInfo);		
		
		log.info(list.toString());				
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		
		model.setViewName("store/product-list");
		
		return model;
	}
	
	@GetMapping("/product_detail")
	public String productDetail() {
		log.info("productDetail() - 호출");
		
		return "store/product-detail";
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
