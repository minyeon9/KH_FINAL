package com.kh.earth.member.model.service;

import com.kh.earth.member.model.vo.Member;

//@Transactional
public interface MemberService {
	
	Member findMemberById(String id);
	
	Member findMemberById_forSNS(String id);
	
	Member findMemberByPhone(String phone);
	
	Member findMemberByPhoneForEdit(String id, String userPhone);

	Member login(String id, String password);

	int save(Member member);

	Boolean isDuplicateID(String userId);
	
	Boolean isDuplicateEmail(String userEmail);
	
	Boolean isDuplicateEmail_forEdit(String userId, String userEmail);
	
	int delete(int no);

	int reSignup(String id);

	int updatePassword(int no, String password);

}
