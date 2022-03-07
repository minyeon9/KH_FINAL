package com.kh.earth.challenge.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.challenge.model.service.ChallengeService;
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.FileProcess;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChallengeController {
	
	@Autowired
	private ChallengeService service;
	
	@Autowired
	private ResourceLoader resourceLoader;

	// 오늘의 챌린지 메인
	@GetMapping("/today_main")
	public ModelAndView todayMain(
			ModelAndView model) {
		List<Today> todayMain = service.getTodayList();
		
		model.addObject("todayMain", todayMain);
		model.setViewName("challenge/today_main");
		
		return model;
	}
	
	// 오늘의 챌린지 목록 조회
	@GetMapping("/today_list")
	public ModelAndView todayList(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember) {
		
		System.out.println("list 호출");
		
		List<Today> todayList = service.getTodayList();
		List<TodayMember> todayMemberList = service.findTodayMemberListByNo(loginMember.getNo());
		List<Integer> myListNumber = new ArrayList<>();
		
		int mapLenght = todayMemberList.size();
		
		for( int i = 0; i < mapLenght; i++ ) {
			myListNumber.add(todayMemberList.get(i).getChalNo());
		}
		
		model.addObject("todayList", todayList);
		model.addObject("myListNumber", myListNumber);
		model.setViewName("challenge/today_list");

		return model;
	}
	
	// 오늘의 챌린지 상세 조회 및 작성
	@GetMapping("/today_view")
	public ModelAndView todayView(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo) {
		
		Today today = service.findTodayListByNo(chalNo);
		
		model.addObject("today", today);
		model.setViewName("challenge/today_view");
		
		System.out.println("챌린지 번호 : " + chalNo);
		System.out.println("회원 번호 : " + loginMember.getNo());
		
		return model;
	}
	
	
	// 오늘의 챌린지 작성 및 완료
	@GetMapping("/today_complete")
	public ModelAndView todayComplete(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("chalNo", chalNo);
		map.put("no", loginMember.getNo());
		
		List<TodayMember> list = service.findChalTitle(map);
		
		model.addObject("list", list.get(0));
		model.setViewName("challenge/today_complete");
		
		return model;
	}

	// 오늘의 챌린지 작성 및 완료
	@PostMapping("/today_complete")
	public ModelAndView todayComplete(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo,
			@RequestParam("upfile") MultipartFile upfile) {
		
		Map<String, Object> map = new HashMap<>();
		TodayMember todayMember = new TodayMember();
		
		map.put("chalNo", chalNo);
		map.put("no", loginMember.getNo());
		
		int result = 0;
		
		log.info("Upfile Name : {}", upfile.getOriginalFilename()); // 파일 미 업로드 시 빈 문자열 출력
		log.info("Upfile isEmpty : {}", upfile.isEmpty()); // 첨부파일이 없을 경우 true, 있을 경우 false
		
		// 파일 저장
		if( upfile != null && !upfile.isEmpty() ) {
			String renamedFileName = null;
			String location = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/challenge").getFile().getPath();
				renamedFileName = FileProcess.save(upfile, location);
				
				System.out.println("이미지 저장 경로: " + location);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if ( renamedFileName != null ) {
				todayMember.setOriginalFilename(upfile.getOriginalFilename());
				todayMember.setRenamedFilename(renamedFileName);
				
				map.put("originalFilename", upfile.getOriginalFilename());
				map.put("renamedFilename", renamedFileName);
			}
		}
		
		result = service.saveTodayMemberList(map);
		
		// 게시글 저장
		todayMember.setChalNo(chalNo);
		
		if ( result > 0 ) {
			model.addObject("msg", "오늘의 챌린지 인증이 완료되었습니다.");
			model.addObject("location", "/today_complete?chalNo=" + chalNo);
			
			System.out.println("저장 챌린지 번호: " + chalNo);
			System.out.println("회원번호 : " + loginMember.getNo());
			
		} else {
			model.addObject("msg", "오늘의 챌린지 인증을 실패했습니다.");
			model.addObject("location", "/today_list");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
	
	
	
	
	// -------------------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	// 이달의 챌린지 목록 조회
	@GetMapping("/month_list")
	public ModelAndView monthList(
			ModelAndView model,
			@RequestParam(defaultValue = "1") int page) {
		
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Month> monthList = null;
		
		log.info("현재 페이지 번호 : {}", page);
		
		listCount = service.getBoardCount();
		pageInfo = new PageInfo(page, 10, listCount, 8);
		monthList = service.getMonthList(pageInfo);
		
		log.info("전체 게시글 개수 : {}", listCount);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("monthList", monthList);
		model.setViewName("challenge/month_list");
		
		return model;
	}
	
	// 이달의 챌린지 목록 정렬
	@GetMapping("/challenge_arrange")
	public ModelAndView productArrange(
			ModelAndView model,
			@RequestParam(defaultValue="1") int page,
			@RequestParam(value = "arrange", defaultValue="최신순") String arrange) {
		log.info("challengeArrange() - 호출");
		
		log.info("arrange : " + arrange);
		
		int listCount = 0;
		PageInfo pageInfo = null;
		List<Month> monthList = null;
		
		listCount = service.getBoardCount();
		pageInfo = new PageInfo(page, 10, listCount, 8);
		monthList = service.getMonthList(pageInfo, arrange);
		
		log.info("{}", monthList);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("monthList", monthList);
		model.addObject("arrange", arrange);
		
		model.setViewName("challenge/month_list");	
		
		return model;
	}
	
	// 이달의 챌린지 상세 조회
	@GetMapping("/month_view")
	public ModelAndView monthView(
			ModelAndView model,
			@RequestParam("chalNo") int chalNo) {
		
		log.info("이달의 챌린지 view - 호출");
		
		Month month = service.findMonthListByNo(chalNo);
		
		model.addObject("month", month);
		model.setViewName("challenge/month_view");
		
		System.out.println("챌린지 번호 : " + chalNo);
		
		return model;
	}
	
	// 이달의 챌린지 작성
	@GetMapping("/month_write")
	public ModelAndView monthWrite(
			ModelAndView model,
			@RequestParam("chalNo") int chalNo) {
		
		Month month = service.findMonthListByNo(chalNo);
		
		model.addObject("month", month);
		model.setViewName("challenge/month_write");
		
		System.out.println("챌린지 번호 : " + chalNo);

		return model;
		
	}
	
	// 이달의 챌린지 저장 및 완료
	@GetMapping("/month_complete")
	public ModelAndView monthComplete(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("chalNo", chalNo);
		map.put("no", loginMember.getNo());
		
		List<MonthMember> list = service.findMonthCompleteList(map);
		
		model.addObject("list", list.get(0));
		
		model.setViewName("challenge/month_complete");
		
		return model;
	}
	
	// 이달의 챌린지 저장 및 완료
	@PostMapping("/month_complete")
	public ModelAndView monthComplete(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo,
			@RequestParam("upfile") MultipartFile upfile) {
		
		Map<String, Object> map = new HashMap<>();
		MonthMember monthMember = new MonthMember();
		
		map.put("chalNo", chalNo);
		map.put("no", loginMember.getNo());
		
		int result = 0;
		
		log.info("Upfile Name : {}", upfile.getOriginalFilename()); // 파일 미 업로드 시 빈 문자열 출력
		log.info("Upfile isEmpty : {}", upfile.isEmpty()); // 첨부파일이 없을 경우 true, 있을 경우 false
		
		// 파일 저장
		if( upfile != null && !upfile.isEmpty() ) {
			String renamedFileName = null;
			String location = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/challenge").getFile().getPath();
				renamedFileName = FileProcess.save(upfile, location);
				
				System.out.println("이미지 저장 경로: " + location);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if ( renamedFileName != null ) {
				monthMember.setOriginalFilename(upfile.getOriginalFilename());
				monthMember.setRenamedFilename(renamedFileName);
				
				map.put("originalFilename", upfile.getOriginalFilename());
				map.put("renamedFilename", renamedFileName);
			}
		}
		
		result = service.saveMonthMemberList(map);
		
		// 게시글 저장
		monthMember.setChalNo(chalNo);
		
		if ( result > 0 ) {
			model.addObject("msg", "이달의 챌린지 인증이 완료되었습니다.");
			model.addObject("location", "/month_complete?chalNo=" + chalNo);
			
			System.out.println("저장 챌린지 번호: " + chalNo);
			System.out.println("회원번호 : " + loginMember.getNo());
			
		} else {
			model.addObject("msg", "이달의 챌린지 인증을 실패했습니다.");
			model.addObject("location", "/month_list");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
	
	
	
	
	
	// -------------------------------------------------------------------------------------------------------------
//	@GetMapping("/ongoing_list")
//	public ModelAndView ongoingList(
//			ModelAndView model,
//			// @RequestParam("chalNo") int chalNo,
//			@SessionAttribute(name = "loginMember") Member loginMember,
//			@ModelAttribute TodayMember todayMember) {
//
//		Month month = service.findMonthListByMemNo(loginMember.getNo());
//		
//		model.addObject("month", month);
//		model.setViewName("challenge/ongoing_list");
//		
//		System.out.println("회원 번호 " + loginMember.getNo());
//		
//		return model;
//	}
	
	
}
