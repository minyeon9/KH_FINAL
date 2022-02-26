package com.kh.earth.challenge.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.earth.challenge.model.dao.ChallengeMapper;
import com.kh.earth.challenge.model.vo.Today;


@Service
public class ChallengeServiceImpl implements ChallengeService {
	
	@Autowired
	private ChallengeMapper mapper;

	@Override
	public List<Today> getTodayList() {
		return mapper.findAll();
	}

	@Override
	public List<Today> getTodayView() {
		return mapper.findAll();
	}

}
