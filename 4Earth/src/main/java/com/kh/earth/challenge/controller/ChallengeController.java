package com.kh.earth.challenge.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChallengeController {

	@GetMapping("/today_list")
	public String today_list() {
		log.info("today_list() - 호출");
		
		return "challenge/today_list";
	}
	
	@GetMapping("/month_list")
	public String month_list() {
		log.info("month_list() - 호출");
		
		return "challenge/month_list";
	}
	
	@GetMapping("/ongoing_list")
	public String ongoing_list() {
		log.info("ongoing_list() - 호출");
		
		return "challenge/ongoing_list";
	}
}
