package com.kh.earth.challenge.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.challenge.model.service.ChallengeService;
import com.kh.earth.challenge.model.vo.Today;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChallengeController {
	
	@Autowired
	private ChallengeService service;

	@GetMapping("/today_list")
	public ModelAndView todayList(ModelAndView model) {
		log.info("today_list - 호출");
		
		List<Today> todayList = null;
		
		todayList = service.getTodayList();
		
		System.out.println(todayList);
		
		model.addObject("todayList", todayList);
		model.setViewName("challenge/today_list");
		
		return model;

		
		
//		log.info("today_list - 호출");
//		log.info("{}", page);
		// string으로 받아서 내부에서 숫자나 문자인지 확인
//		String str = "1123";
//        boolean isNumeric = true;
//        for (int i = 0; i < page.length(); i++) {
//            if (!Character.isDigit(page.charAt(i))) {
//                isNumeric = false;
//            }
//        }
//        System.out.println(isNumeric);
//        
//        if( isNumeric = false ) {
//        	model.addObject("msg", "잘못된 접근입니다.");
//        	model.addObject("location", "/");
//        	model.setViewName("common/msg");
//        } else {
//        	model.addObject("location", "today_list");
//        }
	}
	
	
	@GetMapping("/today_view")
	public ModelAndView todayView(ModelAndView model) {
		// log.info("today_view - 호출");
		
		List<Today> todayView = null;
		
		todayView = service.getTodayView();
		
		System.out.println(todayView);
		
		model.addObject("todayView", todayView);
		model.setViewName("challenge/today_view");
		
		return model;
	}
	
	@GetMapping("/today_write")
	public String todayWrite() {
		log.info("today_write - 호출");
		
		return "challenge/today_write";
	}
	
	@GetMapping("/today_complete")
	public String todayComplete() {
		log.info("today_complete - 호출");
		
		return "challenge/today_complete";
	}
	
	
	
	@GetMapping("/month_list")
	public String monthList() {
		log.info("이달의 챌린지 - 호출");
		
		return "challenge/month_list";
	}
	
	@GetMapping("/ongoing_list")
	public String ongoingList() {
		log.info("참여 중인 챌린지 - 호출");
		
		return "challenge/ongoing_list";
	}
}
