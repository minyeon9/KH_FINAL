package com.kh.earth.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {
	
	@GetMapping("/point")
	public String point() {
		log.info("point() - 호출");
		
		return "mypage/point";
	}

	@GetMapping("/order")
	public String order() {
		log.info("order() - 호출");
		
		return "mypage/order";
	}
	
	@GetMapping("/wishlist")
	public String wishlist() {
		log.info("wishlist() - 호출");
		
		return "mypage/wishlist";
	}
}
