package com.kh.earth.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {

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
	
	@GetMapping("/profile_view")
	public String profile_view() {
		log.info("profile_view() - 호출");
		
		return "mypage/profile_view";
	}

	@GetMapping("/profile_edit")
	public String profile_edit() {
		log.info("profile_edit() - 호출");
		
		return "mypage/profile_edit";
	}	
}
