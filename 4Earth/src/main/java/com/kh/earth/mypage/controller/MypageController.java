package com.kh.earth.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.store.model.service.StoreService;
import com.kh.earth.store.model.service.StoreServiceImpl;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.Wish;

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
	
//	@GetMapping("/wishlist")
//	public ModelAndView wishlist(
//			ModelAndView model,
//			@RequestParam(defaultValue="1") int page,
//			@SessionAttribute(name = "loginMember") Member loginMember
//			) {
//		log.info("wishlist() - 호출");
//		
//		System.out.println("loginMember.getNo() : " + loginMember.getNo());
//		
//		StoreService service = new StoreServiceImpl();
//		
//		int count = service.getWishCount(loginMember.getNo());
//		
//		PageInfo pageInfo = new PageInfo(page, 10, count, 8);
//		
//		List<Product> list = new StoreServiceImpl().getWishList(pageInfo, loginMember.getNo());
//		
//		model.addObject("list", list);
//		model.addObject("pageInfo", pageInfo);
//		
//		model.setViewName("mypage/wishlist");
//		
//		return model;
//	}

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
