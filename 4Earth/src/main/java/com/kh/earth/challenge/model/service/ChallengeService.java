package com.kh.earth.challenge.model.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.PageInfo;

@Transactional
public interface ChallengeService {
	// 오늘의 챌린지 목록 조회
	List<Today> getTodayList();

	// 오늘의 챌린지 상세 조회
	Today findTodayListByNo(int chalNo);

	// 오늘의 챌린지 인증 저장
	int save(TodayMember todayMember);

	// 오늘의 챌린지 완료
	TodayMember findTodayCompleteListByNo(int chalNo);
	
	
	

	// 이달의 챌린지 목록 조회
	List<Month> getMonthList();
	
	// 이달의 챌린지 상세 조회 
	Month findMonthListByNo(int chalNo);

	
	// 이달의 챌린지 목록 조회 + 페이징
	int getBoardCount();
	List<Month> getMonthList(PageInfo pageInfo);





	
	
	
	
}
