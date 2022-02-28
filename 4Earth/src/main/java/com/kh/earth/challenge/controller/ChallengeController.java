package com.kh.earth.challenge.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.challenge.model.service.ChallengeService;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.FileProcess;
import com.kh.earth.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChallengeController {
	
	@Autowired
	private ChallengeService service;
	
	@Autowired
	private ResourceLoader resourceLoader;

	// 오늘의 챌린지 리시트 조회
	@GetMapping("/today_list")
	public ModelAndView todayList(ModelAndView model) {
		List<Today> todayList = null;
		
		todayList = service.getTodayList();
		
		// System.out.println(todayList);
		
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
	
	
	// 오늘의 챌린지 상세 조회
	@GetMapping("/today_view")
	public ModelAndView todayView(ModelAndView model) {
		// log.info("today_view - 호출");
		
		List<Today> todayView = null;
		
		todayView = service.getTodayView();
		
		// System.out.println(todayView);
		
		model.addObject("todayView", todayView);
		model.setViewName("challenge/today_view");
		
		return model;
	}
	
	
	// 오늘의 챌린지 인증 사진 업로드
	@GetMapping("/today_write")
	public String todayWrite() {
		log.info("today_write - 호출(get)");
		
		return "challenge/today_write";
	}
	
	
	// 오늘의 챌린지 인증 완료
	@GetMapping("/today_complete")
	public String todayComplete() {
		log.info("today_complete - 호출(get)");
		
		return "challenge/today_complete";
	}

	
	@PostMapping("/today_complete")
	public ModelAndView todayComplete(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute TodayMember todayMember,
			@RequestParam("upfile") MultipartFile upfile) {
		
		log.info("today_complete - 호출(post)");
		
		model.setViewName("/challenge/today_complete");
		
		log.info("complete: {} ", todayMember.toString());
		
		// List<TodayMember> todayComplete = null;
		
		// todayComplete = service.todayComplete();
		
		// System.out.println("complete: " + todayComplete);
		
//		model.addObject("todayComplete", todayMember);
//		model.setViewName("challenge/today_complete");
//		
//		int result = 0;
//		
//		log.info("Upfile Name : {}", upfile.getOriginalFilename());
//		log.info("Upfile isEmpty : {}", upfile.isEmpty());
//		
//		
//		if( upfile != null && !upfile.isEmpty() ) {
//			String renamedFileName = null;
//			String location = null;
//			
//			try {
//				location = resourceLoader.getResource("resources/upload/challenge").getFile().getPath();
//				renamedFileName = FileProcess.save(upfile, location);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			
//			if ( renamedFileName != null ) {
//				todayMember.setOriginalFilename(upfile.getOriginalFilename());
//				todayMember.setRenamedFilename(renamedFileName);
//			}
//		}
//		
//		todayMember.setMemNo(loginMember.getNo());
//		result = service.save(todayMember);
//		
//		if ( result > 0 ) {
//			model.addObject("msg", "인증이 완료 되었습니다.");
//			model.addObject("location", "/challenge/today_complete");
//		} else {
//			model.addObject("msg", "인증을 실패했습니다.");
//			model.addObject("location", "/challenge/today_write");
//		}
//		
//		System.out.println(result);
//		
//		model.setViewName("common/msg");
		
		return model;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	// ----------------------------------------------------------------------------------------------
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
