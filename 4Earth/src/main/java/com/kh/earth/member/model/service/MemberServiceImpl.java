package com.kh.earth.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.earth.member.model.dao.MemberMapper;
import com.kh.earth.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	

	@Override
	public Member findMemberById(String id) {
		
		return mapper.findMemberById(id);
	}

	@Override
	public Member login(String id, String password) {
		Member member = null;

		member = this.findMemberById(id);
		
		System.out.println("서비스imple에서 찍는중 : "+member);
		
//		System.out.println(passwordEncoder.encode(password));
//		System.out.println(member.getPassword());
//		System.out.println(passwordEncoder.matches(password, member.getPassword()));
		
//		if(member != null && member.getPassword().equals(passwordEncoder.encode(password))) {
//			return member;
		
		if(member != null && member.getPassword().equals(password)) {
			return member;

			
		} else {
			return null;
		}
		
		// 삼항연산자로 처리
//		return member != null && 
//				passwordEncoder.matches(password, member.getPassword()) ? member : null;
	}

	@Override
	public int save(Member member) {
		
		return 0;
	}

	@Override
	public Boolean isDuplicateID(String userId) {
		
		return null;
	}

	@Override
	public int delete(int no) {
		
		return 0;
	}

}
