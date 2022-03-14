package com.kh.earth.pages.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class PagesController {

	@GetMapping("/guide")
	public String guide() {
		log.info("guide() - 호출");
		
		return "pages/guide";
	}
	
//	@GetMapping("/faq")
//	public String faq() {
//		log.info("faq() - 호출");
//		
//		return "pages/faq";
//	}
	
//	@GetMapping("/notice")
//	public String notice() {
//		log.info("notice() - 호출");
//		
//		return "pages/notice";
//	}
//	
//	@GetMapping("/notice_view")
//	public String notice_view() {
//		log.info("notice_view() - 호출");
//		
//		return "pages/notice_view";
//	}
//	
//	@GetMapping("/notice_write")
//	public String notice_write() {
//		log.info("notice_write() - 호출");
//		
//		return "pages/notice_write";
//	}
//	
//	@GetMapping("/notice_modify")
//	public String notice_modify() {
//		log.info("notice_modify() - 호출");
//		
//		return "pages/notice_modify";
//	}
//	
//	@GetMapping("/notice_qa")
//	public String notice_qa() {
//		log.info("notice_qa() - 호출");
//		
//		return "pages/notice_qa";
//	}
	
}
