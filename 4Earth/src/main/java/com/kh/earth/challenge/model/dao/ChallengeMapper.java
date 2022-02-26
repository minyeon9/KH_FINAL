package com.kh.earth.challenge.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.earth.challenge.model.vo.Today;


@Mapper
public interface ChallengeMapper {

	List<Today> findAll();

}
