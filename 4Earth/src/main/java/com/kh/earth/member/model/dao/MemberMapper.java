package com.kh.earth.member.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.member.model.vo.Member;


@Mapper
public interface MemberMapper {

	Member findMemberById(@Param("id") String id);

	int insertMember(Member member);

	int updateMember(Member member);

	List<Member> findMember(RowBounds rowBounds);

}
