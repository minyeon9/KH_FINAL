package com.kh.earth.challenge.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;


@Mapper
public interface ChallengeMapper {

	List<Today> findAllToday();

	int updateTodayMember(TodayMember todayMember);

	int insertTodayMember(TodayMember todayMember);

	List<TodayMember> findAllTodayMember();

}
