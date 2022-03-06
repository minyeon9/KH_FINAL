package com.kh.earth.challenge.model.service;

import java.util.List;
import java.util.Map;

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

	// 오늘의 챌린지 인증 완료 및 저장
	int saveTodayMemberList(Map<String, Object> map);
	List<TodayMember> findChalTitle(Map<String, Object> map);
	
	// 오늘의 챌린지 참여 회원 조회
	List<TodayMember> findTodayMemberListByNo(int no);
	

	
	
	
	
	
	// 이달의 챌린지 상세 조회 
	Month findMonthListByNo(int chalNo);

	
	// 이달의 챌린지 목록 조회 + 페이징
	int getBoardCount();
	List<Month> getMonthList(PageInfo pageInfo);
	
	// 이달의 챌린지 목록 조회 + 페이징 + 정렬
	List<Month> getMonthList(PageInfo pageInfo, String arrange);





	
	
	

	
	




	





	



	
	
	
	
}
