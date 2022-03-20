package com.kh.earth.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.kh.earth.member.model.vo.Member;


@Mapper
public interface MemberMapper {

	Member findMemberById(@Param("id") String id);
	
	Member findMemberById_forSNS(String id);
	
	Member findMemberByPhone(String phone);
	
	Member findMemberByPhoneForEdit(Map<String, String> map);
	
	Member findMemberByEmail(String userEmail);
	
	Member findMemberByEmail_forEdit(Map<String, String> map);

	int insertMember(Member member);

	int updateMember(Member member);

	List<Member> findMember(RowBounds rowBounds);
	
	int deleteMember(int no);

	int reSignup(String id);

	int updatePassword(Map<String, String> map);










}
