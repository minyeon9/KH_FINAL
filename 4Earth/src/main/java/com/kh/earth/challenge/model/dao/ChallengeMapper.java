package com.kh.earth.challenge.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;


@Mapper
public interface ChallengeMapper {
	// 오늘의 챌린지 전체 목록 조회
	List<Today> findAllToday();
	// 오늘의 챌린지 인증 저장
	int insertTodayMember(TodayMember todayMember);
	// 오늘의 챌린지 상세 조회
	Today selectTodayListByNo(@Param("chalNo") int chalNo);
	// 오늘의 챌린지 완료
	List<Today> getTodayComplete(int chalNo);
	TodayMember selectTodayCompleteListByNo(int chalNo);
	

	
	
	
	
	// 이달의 챌린지 목록 조회
	List<Month> findAllMonth();

	// 이달의 챌린지 상세 조회
	Month selectMonthListByNo(int chalNo);
	
	
	
	
	int getBoardCount();
	List<Month> findAllMonth(RowBounds rowBounds);


	
}
