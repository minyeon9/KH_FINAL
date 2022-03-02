package com.kh.earth.challenge.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.challenge.model.dao.ChallengeMapper;
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;


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
	@Transactional
	public int save(TodayMember todayMember) {
		int result = 0;
		
		if( todayMember.getNo() != 0 ) {
			// update
			//result = mapper.updateTodayMember(todayMember);
		} else {
			// insert
			result = mapper.insertTodayMember(todayMember);
		}
		
		return result;
	}

	@Override
	public TodayMember findTodayCompleteListByNo(int chalNo) {
		return mapper.selectTodayCompleteListByNo(chalNo);
	}

	// 이달의 챌린지 목록 조회
	@Override
	public List<Month> getMonthList() {
		return mapper.findAllMonth();
	}

	// 이달의 챌린지 상세 조회
	@Override
	public Month findMonthListByNo(int chalNo) {
		return mapper.selectMonthListByNo(chalNo);
	}
}
