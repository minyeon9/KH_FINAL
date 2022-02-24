package com.kh.earth.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StoreController {
	
	
	
	@GetMapping("/product_list")
	public String product_list() {
		log.info("product_list() - 호출");
		
		return "store/product-list";
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
