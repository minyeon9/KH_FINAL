package com.kh.earth.challenge.model.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;

@Transactional
public interface ChallengeService {

	List<Today> getTodayList();

	List<Today> getTodayView();

	List<TodayMember> todayComplete();

	int save(TodayMember todayMember);

	List<TodayMember> getTodayMember();

}
