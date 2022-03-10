package com.kh.earth.member.model.service;

import com.kh.earth.member.model.vo.Member;

//@Transactional
public interface MemberService {
	
	Member findMemberById(String id);
	
	Member findMemberById_forSNS(String id);

	Member login(String id, String password);

	int save(Member member);

	Boolean isDuplicateID(String userId);
	
	int delete(int no);

	int reSignup(String id);

	int updatePassword(int no, String password);

}
