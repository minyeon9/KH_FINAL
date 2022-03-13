package com.kh.earth.challenge.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.challenge.model.vo.Point;
import com.kh.earth.challenge.model.vo.Reply;
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
		
		// 오늘 날짜
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd"); // 날짜 포멧 정의
		String formatedNow = now.format(formatter); // 포맷 적용
		System.out.println(formatedNow);
			
		List<Today> todayMain = service.getTodayList(formatedNow);
		
		
		model.addObject("todayMain", todayMain);
		model.setViewName("challenge/today_main");
		
		return model;
	}
	
	// 오늘의 챌린지 목록 조회
	@GetMapping("/today_list")
	public ModelAndView todayList(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember) {
		
		// 오늘 날짜
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd"); // 날짜 포멧 정의
		String formatedNow = now.format(formatter); // 포맷 적용
		System.out.println(formatedNow);
		
		// 오늘 날짜 챌린지 목록 조회
		List<Today> todayList = service.getTodayList(formatedNow);
		
		 // 로그인한 사용자 참여 완료 목록 조회
		List<TodayMember> todayMemberList = service.findTodayMemberListByNo(loginMember.getNo());
		List<Integer> myListNumber = new ArrayList<>(); // 참여 완료한 챌린지 번호 저장
		
		int mapLength = todayMemberList.size(); // 참여 완료한 챌린지 갯수
		
		for( int i = 0; i < mapLength; i++ ) {  // 참여 완료한 챌린지 번호 저장
			myListNumber.add(todayMemberList.get(i).getChalNo());
		}
		
		// 오늘의 챌린지 달성일
		Date todayDate = new Date();
		if( mapLength != 0 ) {
			todayDate = todayMemberList.get(0).getChalDate();
			SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일");
			String todayDateStr = format.format(todayDate);
			model.addObject("todayDateStr", todayDateStr);
		}
		
		model.addObject("todayList", todayList);
		model.addObject("mapLength", mapLength);
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
		
		// 오늘의 챌린지 목록 조회
		Today today = service.findTodayListByNo(chalNo);
		
		// 인증 완료 챌린지 상세 접근 제한
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd"); // 날짜 포멧 정의
		String formatedNow = now.format(formatter); // 포맷 적용
		
		List<TodayMember> completeList = service.findTodayCompleteList(loginMember.getNo());
		List<Integer> myListNumber = new ArrayList<>();
		
		int mapLength = completeList.size(); // 참여 완료한 챌린지 갯수
		
		for( int i = 0; i < mapLength; i++ ) {  // 참여 완료한 챌린지 번호 저장
			myListNumber.add(completeList.get(i).getChalNo());
		}
		
		model.addObject("today", today);
		model.addObject("completeList", completeList);
		model.addObject("myListNumber", myListNumber);
		System.out.println("오늘" + formatedNow);

		System.out.println("인증 완료 : " + completeList);
		
		model.setViewName("challenge/today_view");
		
		return model;
	}
		
	// 오늘의 챌린지 작성 및 완료
	@GetMapping("/today_complete")
	public ModelAndView todayComplete(
			ModelAndView model,
			@ModelAttribute Point point,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo) {
		
		// 완료한 해당 챌린지 제목 / 업로드 파일명 포인트 조회
		Map<String, Object> map = new HashMap<>();
		map.put("chalNo", chalNo);
		map.put("no", loginMember.getNo());
		List<TodayMember> list = service.findChalTitle(map);
		
		// 최종 완료 체크(confetti)
		List<TodayMember> todayMemberList = service.findTodayMemberListByNo(loginMember.getNo()); // 로그인한 사용자의 참여 목록 조회
		int mapLength = todayMemberList.size(); // 참여 완료한 챌린지 갯수
		
		model.addObject("list", list.get(0));
		model.addObject("mapLength", mapLength);
		model.setViewName("challenge/today_complete");
		
		return model;
	}

	// 오늘의 챌린지 작성 및 완료
	@PostMapping("/today_complete")
	public ModelAndView todayComplete(
			ModelAndView model,
			@ModelAttribute Point point,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo,
			@RequestParam("chalPoint") int chalPoint,
			@RequestParam("upfile") MultipartFile upfile) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("chalNo", chalNo);
		map.put("no", loginMember.getNo());
		
		TodayMember todayMember = new TodayMember();
		
		log.info("Upfile Name : {}", upfile.getOriginalFilename()); // 파일 미 업로드 시 빈 문자열 출력
		log.info("Upfile isEmpty : {}", upfile.isEmpty()); // 첨부파일이 없을 경우 true, 있을 경우 false
		
		// 파일 저장
		if( upfile != null && !upfile.isEmpty() ) {
			String renamedFileName = null;
			String location = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/challengeUser").getFile().getPath();
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
		
		// 게시글 저장
		int result = 0;
		result = service.saveTodayMemberList(map);
		todayMember.setChalNo(chalNo);
		
		if ( result > 0 ) {
			model.addObject("msg", "오늘의 챌린지 인증이 완료되었습니다.");
			model.addObject("location", "/today_complete?chalNo=" + chalNo);
		} else {
			model.addObject("msg", "오늘의 챌린지 인증을 실패했습니다.");
			model.addObject("location", "/today_list");
		}
		
		// 포인트 적립(insert/update)
		// 소멸 예정일
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM/dd");
		Date time = new Date();	//현재 날짜
		Calendar cal = Calendar.getInstance(); // 날짜 계산	
		cal.setTime(time);	
		cal.add(Calendar.MONTH, 1); // + 1달
		String date = simpleDate.format(cal.getTime());
		
        try {
			Date disapearDate = simpleDate.parse(date); // String > Date 형변환
			point.setDisapearDate(disapearDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		point.setMemNo(loginMember.getNo());
		point.setPoint(chalPoint);
		
		// 최종 완료 체크(포인트 지급)
		List<TodayMember> todayMemberList = service.findTodayMemberListByNo(loginMember.getNo()); // 로그인한 사용자의 참여 목록 조회
		int mapLength = todayMemberList.size(); // 참여 완료한 챌린지 갯수
		
		if( mapLength == 4 ) {
			int pointResult = service.savePoint(point);
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
		
		listCount = service.getBoardCount();
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 8);
		List<Month> monthList = service.getMonthList(pageInfo);
		
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
		
		int listCount = 0;
		
		listCount = service.getBoardCount();
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 8);
		List<Month> monthList = service.getMonthList(pageInfo, arrange);
		
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
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo) {
		
		// 이달의 챌린지 조회
		Month month = service.findMonthListByNo(chalNo);
		
		// 참여 중인 사용자 목록 조회
		Map<String, Object> map = new HashMap<>();
		map.put("chalNo", chalNo);
		map.put("no", loginMember.getNo());
		List<MonthMember> ongoingMember = service.findOngoingUser(map);
		
		// 참여 중인 사용자 목록 갯수 조회
		Map<String, Object> mapCount = new HashMap<>();
		mapCount.put("chalNo", chalNo);
		mapCount.put("no", loginMember.getNo());
		int countUser = service.findOngoingUserCount(mapCount);
		
		// 사용자의 해당 챌린지 완료 횟수 조회
		Map<String, Object> completeCount = new HashMap<>();
		completeCount.put("chalNo", chalNo);
		completeCount.put("no", loginMember.getNo());
		List<MonthMember> count = service.getMonthGuage(completeCount);
		
		// 전체 필요 횟수
		int requiredCount = 10;
		
		// 남은 횟수
		int remainCount = requiredCount - count.size();
		ArrayList<Integer> remainCountList = new ArrayList<>();
		for( int i = 0; i < remainCount; i++ ) {
			remainCountList.add(i);
		}
		
		model.addObject("month", month);
		model.addObject("ongoingMember", ongoingMember);
		model.addObject("countUser", countUser);
		model.addObject("requiredCount", requiredCount);
		model.addObject("remainCount", remainCount);
		model.addObject("count", count);
		model.addObject("remainCountList", remainCountList);
		
		System.out.println("이달의 상세" + month);
		
		model.setViewName("challenge/month_view");
		
		return model;
	}
	
	// 이달의 챌린지 작성
	@GetMapping("/month_write")
	public ModelAndView monthWrite(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo) {
		
		Month month = service.findMonthListByNo(chalNo);
		
		model.addObject("month", month);
		model.setViewName("challenge/month_write");

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
		
		int mapLength = list.size();
		
		int requiredCount = 10;
		
		model.addObject("list", list.get(0));
		model.addObject("requiredCount", requiredCount);
		model.addObject("mapLength", mapLength);
		
		model.setViewName("challenge/month_complete");
		
		return model;
	}
	
	// 이달의 챌린지 저장 및 완료
	@PostMapping("/month_complete")
	public ModelAndView monthComplete(
			ModelAndView model,
			@ModelAttribute Point point,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo,
			@RequestParam("chalPoint") int chalPoint,
			@RequestParam("upfile") MultipartFile upfile) {
		
		Map<String, Object> map = new HashMap<>();
		MonthMember monthMember = new MonthMember();
		map.put("chalNo", chalNo);
		map.put("no", loginMember.getNo());
		
		log.info("Upfile Name : {}", upfile.getOriginalFilename()); // 파일 미 업로드 시 빈 문자열 출력
		log.info("Upfile isEmpty : {}", upfile.isEmpty()); // 첨부파일이 없을 경우 true, 있을 경우 false
		
		// 파일 저장
		if( upfile != null && !upfile.isEmpty() ) {
			String renamedFileName = null;
			String location = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/challengeUser").getFile().getPath();
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
		
		// 게시글 저장
		monthMember.setChalNo(chalNo);
		int result = service.saveMonthMemberList(map);
		
		if ( result > 0 ) {
			model.addObject("msg", "이달의 챌린지 인증이 완료되었습니다.");
			model.addObject("location", "/month_complete?chalNo=" + chalNo);
		} else {
			model.addObject("msg", "이달의 챌린지 인증을 실패했습니다.");
			model.addObject("location", "/month_list");
		}
		
		// 포인트 적립(insert/update)
		// 소멸 예정일
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy/MM/dd");	
		Date time = new Date();	//현재 날짜
		Calendar cal = Calendar.getInstance(); // 날짜 계산	
		cal.setTime(time);	
		cal.add(Calendar.MONTH, 1); // + 1달
		String date = simpleDate.format(cal.getTime());
		
        try {
			Date disapearDate = simpleDate.parse(date); // String > Date 형변환
			point.setDisapearDate(disapearDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		point.setMemNo(loginMember.getNo());
		point.setPoint(chalPoint);
		
		// 최종 완료 체크(포인트 지급)
		Map<String, Object> completeCount = new HashMap<>();
		completeCount.put("chalNo", chalNo);
		completeCount.put("no", loginMember.getNo());
		
		List<MonthMember> count = service.getMonthGuage(completeCount);
		int mapLength = count.size();
		int requiredCount = 10;
		
		if( mapLength == requiredCount ) {
			int pointResult = service.savePoint(point);
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 댓글 작성
	@PostMapping("/write_reply")
	public ModelAndView writeReply (
			ModelAndView model,
			@ModelAttribute Reply reply,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo) {
		
		// 댓글 작성
		reply.setMemNo(loginMember.getNo());
		reply.setChalNo(chalNo);
		int result = service.saveReply(reply);
		
		if ( result > 0 ) {
			model.addObject("msg", "댓글이 등록되었습니다.");
			model.addObject("location", "/month_view?chalNo=" + chalNo + "#sectionReply");
		} else {
			model.addObject("msg", "댓글 등록을 실패했습니다.\n다시 시도해 주세요.");
			model.addObject("location", "/month_view?chalNo=" + chalNo + "#sectionReply");
		}
		
		// 상세 내용 유지 ------------------------------------
		// 이달의 챌린지 조회
		Month month = service.findMonthListByNo(chalNo);
		
		// 참여 중인 사용자 목록 조회
		Map<String, Object> map = new HashMap<>();
		map.put("chalNo", chalNo);
		map.put("no", loginMember.getNo());
		List<MonthMember> ongoingMember = service.findOngoingUser(map);
		
		// 참여 중인 사용자 목록 갯수 조회
		Map<String, Object> mapCount = new HashMap<>();
		mapCount.put("chalNo", chalNo);
		mapCount.put("no", loginMember.getNo());
		int countUser = service.findOngoingUserCount(mapCount);
		
		// 로그인한 사용자가 해당 챌린지를 완료한 횟수 조회
		Map<String, Object> completeCount = new HashMap<>();
		completeCount.put("chalNo", chalNo);
		completeCount.put("no", loginMember.getNo());
		List<MonthMember> count = service.getMonthGuage(completeCount);
		
		// 전체 필요 횟수
		int requiredCount = 10;
		
		// 남은 횟수
		int remainCount = requiredCount - count.size();
		ArrayList<Integer> remainCountList = new ArrayList<>();
		for( int i = 0; i < remainCount; i++ ) {
			remainCountList.add(i);
		}
		
		model.addObject("month", month);
		model.addObject("ongoingMember", ongoingMember);
		model.addObject("countUser", countUser);
		model.addObject("requiredCount", requiredCount);
		model.addObject("remainCount", remainCount);
		model.addObject("count", count);
		model.addObject("remainCountList", remainCountList);

		model.setViewName("common/msg");
		
		return model;
	}
	
	// 댓글 수정
	@PostMapping("/modify_reply")
	public ModelAndView modifyReply (
			ModelAndView model,
			@ModelAttribute Reply reply,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo,
			@RequestParam("replyNo") int replyNo) {
		
		reply.setMemNo(loginMember.getNo());
		reply.setChalNo(chalNo);
		reply.setReplyNo(replyNo);
		int result = service.saveReply(reply);
		
		if ( reply.getMemNo() == loginMember.getNo() ) {
			if ( result > 0 ) {
				model.addObject("msg", "댓글이 수정되었습니다.");
				model.addObject("location", "/month_view?chalNo=" + chalNo + "#sectionReply");
			} else {
				model.addObject("msg", "댓글 수정을 실패했습니다.\n다시 시도해 주세요.");
				model.addObject("location", "/month_view?chalNo=" + chalNo + "#sectionReply");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/month_list");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 댓글 삭제
	@PostMapping("delete_reply")
	public ModelAndView deleteReply (
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam("chalNo") int chalNo,
			@RequestParam("replyNo") int replyNo) {
		
		System.out.println("댓글 삭제 호출");
		
		int result = 0;
		Reply reply = service.findReplyByNo(replyNo);
		
		System.out.println("reply: " + reply);
		
		result = service.deleteReply(replyNo);
		
		if (result > 0) {
			model.addObject("msg", "댓글이 삭제되었습니다.");
			model.addObject("location", "/month_view?chalNo=" + chalNo + "#sectionReply");
		} else {
			model.addObject("msg", "댓글 삭제를 실패했습니다.\n다시 시도해 주세요.");
			model.addObject("location", "/month_view?chalNo=" + chalNo + "#sectionReply");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
	
	
	
	
	
	
	// -------------------------------------------------------------------------------------------------------------
	
	
	
	
	
	
	// 참여 중인 챌린지 목록 조회
	@GetMapping("/ongoing_list")
	public ModelAndView ongoingList(
			ModelAndView model,
			@SessionAttribute(name = "loginMember") Member loginMember,
			@RequestParam(defaultValue = "1") int page) {
		
		// 참여 중인 챌린지 목록
		int listCount = service.getOngoingListCount(loginMember.getNo());
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 8);
		List<MonthMember> ongoingList = service.findOngoingListByMemNo(loginMember.getNo(), pageInfo);
		
		log.info("현재 페이지 번호 : {}", page);
		log.info("전체 게시글 개수 : {}", listCount);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("ongoingList", ongoingList);
		
		model.setViewName("challenge/ongoing_list");
		
		return model;
	}
	
	
	
	
	
	
}
