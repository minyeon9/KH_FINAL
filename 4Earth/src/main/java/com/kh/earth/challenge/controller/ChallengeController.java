package com.kh.earth.challenge.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
//@RequestMapping("/challenge")
public class ChallengeController {
	
	@Autowired
	private ChallengeService service;
	
	@Autowired
	private ResourceLoader resourceLoader;

	// 오늘의 챌린지 메인
	@GetMapping("/today_main")
	public ModelAndView todayMain(ModelAndView model) {
		List<Today> todayMain = service.getTodayList();
		
		model.addObject("todayMain", todayMain);
		model.setViewName("challenge/today_main");
		
		return model;
	}
	
	// 오늘의 챌린지 목록
	@GetMapping("/today_list")
	public ModelAndView todayList(ModelAndView model) {
		List<Today> todayList = service.getTodayList();
		
		model.addObject("todayList", todayList);
		model.setViewName("challenge/today_list");
		
		return model;
	}
	
	// 오늘의 챌린지 상세 및 인증
	@GetMapping("/today_view")
	public ModelAndView todayView(
			ModelAndView model,
			@RequestParam("chalNo") int chalNo) {
		Today today = service.findTodayListByNo(chalNo);
		
		model.addObject("today", today);
		model.setViewName("challenge/today_view");
		
		System.out.println("챌린지 번호 : " + chalNo);
		
		return model;
	}
	
	
	// 오늘의 챌린지 인증 완료
	@GetMapping("/today_complete")
	public String todayComplete() {
		
		return "challenge/today_complete";
	}
	
//	@GetMapping("/today_complete")
//	public ModelAndView todayComplete(
//			ModelAndView model,
//			@RequestParam("chalNo") int chalNo) {
//		Today today = service.findTodayListByNo(chalNo);
//		
//		model.addObject("today", today);
//		model.setViewName("challenge/today_complete");
//		
//		System.out.println("챌린지 번호 : " + chalNo);
//		
//		return model;
//	}

	
	@PostMapping("/today_complete")
	public ModelAndView todayComplete(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@ModelAttribute TodayMember todayMember,
			// @ModelAttribute Today today,
			// @RequestParam("chalNo") int chalNo,
			@RequestParam("upfile") MultipartFile upfile) {
		
		// Today today = service.findTodayListByNo(chalNo);		
		// model.addObject("today", today);
		
		// model.setViewName("challenge/today_complete");
		
		
		// System.out.println(today);
		
		int result = 0;
		
//		log.info("Upfile Name : {}", upfile.getOriginalFilename()); // 파일 미 업로드 시 빈 문자열 출력
//		log.info("Upfile isEmpty : {}", upfile.isEmpty()); // 첨부파일이 없을 경우 true, 있을 경우 false
		
		// 파일 저장
		if( upfile != null && !upfile.isEmpty() ) {
			String renamedFileName = null;
			String location = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/challenge").getFile().getPath();
				renamedFileName = FileProcess.save(upfile, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if ( renamedFileName != null ) {
				todayMember.setOriginalFilename(upfile.getOriginalFilename());
				todayMember.setRenamedFilename(renamedFileName);
			}
		}
		
		
		// 게시글 저장
		todayMember.setMemNo(loginMember.getNo());
		// todayMember.setChalNo(today.getChalNo()); // 오늘의 챌린지 번호 저장
		result = service.save(todayMember);
		
		if ( result > 0 ) {
			model.addObject("msg", "게시글이 등록되었습니다.");
			model.addObject("location", "/today_complete");
		} else {
			model.addObject("msg", "게시글 등록을 실패했습니다.");
			model.addObject("location", "/today_list");
		}
		
		model.setViewName("common/msg");
		
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
