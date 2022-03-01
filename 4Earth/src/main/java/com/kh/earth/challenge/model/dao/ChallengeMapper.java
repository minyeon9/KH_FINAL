package com.kh.earth.challenge.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;


@Mapper
public interface ChallengeMapper {

	List<Today> findAllToday();

	int insertTodayMember(TodayMember todayMember);

	Today selectTodayListByNo(@Param("chalNo") int chalNo);

}
