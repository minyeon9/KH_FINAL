package com.kh.earth.challenge.model.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.kh.earth.challenge.model.vo.Today;

@Transactional
public interface ChallengeService {

	List<Today> getTodayList();

	List<Today> getTodayView();
}
