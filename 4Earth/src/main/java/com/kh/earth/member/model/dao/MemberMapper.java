package com.kh.earth.member.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.member.model.vo.Member;


@Mapper
public interface MemberMapper {

	Member findMemberById(@Param("id") String id);
//	이런것도 가능하다!
//	@Select("select * from member")
//	List<Member> findAll;

	int insertMember(Member member);

	int updateMember(Member member);

	List<Member> findMember(RowBounds rowBounds);

}
