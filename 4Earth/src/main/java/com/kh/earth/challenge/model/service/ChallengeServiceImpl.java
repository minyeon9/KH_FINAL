package com.kh.earth.challenge.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.challenge.model.dao.ChallengeMapper;
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;


@Service
public class ChallengeServiceImpl implements ChallengeService {
	
	@Autowired
	private ChallengeMapper mapper;

	// 오늘의 챌린지 목록 조회
	@Override
	public List<Today> getTodayList() {
		return mapper.findAllToday();
	}
	
	// 오늘의 챌린지 상세 및 작성
	@Override
	public Today findTodayListByNo(int chalNo) {
		return mapper.selectTodayListByNo(chalNo);
	}
	
	// 오늘의 챌린지 인증 저장
	@Override
	public int saveTodayMemberList(Map<String, Object> map) {
		return mapper.insertTodayMember(map);
	}
	
	// 오늘의 챌린지 인증 완료
	@Override
	public List<TodayMember> findChalTitle(Map<String, Object> map) {
		return mapper.findChalTitle(map);
	}
	
	// 오늘의 챌린지 참여 회원 목록 조회
	@Override
	public List<TodayMember> findTodayMemberListByNo(int no) {
		return mapper.selectTodayMemberListByNo(no);
	}
	
	
	
	
	
	
	

	// 이달의 챌린지 상세 조회
	@Override
	public Month findMonthListByNo(int chalNo) {
		return mapper.selectMonthListByNo(chalNo);
	}
	
	// 이달의 챌린지 목록 조회 + 페이징
	@Override
	public int getBoardCount() {
		return mapper.getBoardCount();
	}

	@Override
	public List<Month> getMonthList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findAllMonth(rowBounds);
	}

	// 이달의 챌린지 목록 조회 + 정렬
	@Override
	public List<Month> getMonthList(PageInfo pageInfo, String arrange) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.findAllMonthArrange(rowBounds, arrange);
	}
	
	// 이달의 챌린지 참여 회원 저장
	@Override
	public int saveMonthMemberList(Map<String, Object> map) {
		return mapper.insertMonthMember(map);
	}
	
	// 이달의 챌린지 완료
	@Override
	public List<MonthMember> findMonthCompleteList(Map<String, Object> map) {
		return mapper.findMonthCompleteList(map);
	}

	// 참여 중인 사용자 목록 조회
	@Override
	public List<MonthMember> findOngoingUser(Map<String, Object> map) {
		return mapper.findOngoingUserList(map);
	}

	// 참여 중인 사용자 목록 갯수 조회

	@Override
	public int findOngoingUserCount(Map<String, Object> mapCount) {
		return mapper.findOngoingUserCount(mapCount);
	}


	

	

	


	

	
	

	


	




	
	

}
