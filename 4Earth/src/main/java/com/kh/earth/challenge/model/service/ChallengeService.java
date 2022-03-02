package com.kh.earth.challenge.model.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;

@Transactional
public interface ChallengeService {

	List<Today> getTodayList();

	Today findTodayListByNo(int chalNo);

	int save(TodayMember todayMember);

	TodayMember findTodayCompleteListByNo(int chalNo);

	List<Month> getMonthList();

	Month findMonthListByNo(int chalNo);
	
}
