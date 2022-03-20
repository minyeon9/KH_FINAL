package com.kh.earth.member.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public Member findMemberById_forSNS(String id) {
		return mapper.findMemberById_forSNS(id);
	}

	@Override
	public Member findMemberByPhone(String phone) {
		return mapper.findMemberByPhone(phone);
	}
	
	@Override
	public Member findMemberByPhoneForEdit(String id, String userPhone) {
		Map<String, String> map = new HashMap<>();
		
		map.put("id", String.valueOf(id));
		map.put("phone", String.valueOf(userPhone));
		return mapper.findMemberByPhoneForEdit(map);
	}
	
	
	@Override
	public Member login(String id, String password) {
		Member member = null;

		member = this.findMemberById(id);

		if(password != null) {
		return member != null && 
				passwordEncoder.matches(password, member.getPassword()) ? member : null;
		}else {
			return member;
		}
		
	}

	@Override
	@Transactional
	public int save(Member member) {
		int result = 0;
		
		if(member.getNo() != 0) {
			// update
			System.out.println("서비스에서 찍은 member : "+member);
			result = mapper.updateMember(member); 
			System.out.println("서비스임플에서 찍은 result : "+result);
		}else {
			// insert
			if(member.getPassword() != null) {
				member.setPassword(passwordEncoder.encode(member.getPassword()));				
			}
			result = mapper.insertMember(member);
		}
		
		return result;

	}

	@Override
	public Boolean isDuplicateID(String id) {
		
		return mapper.findMemberById(id) != null;
	}
	
	@Override
	public Boolean isDuplicateEmail(String userEmail) {
		
		return mapper.findMemberByEmail(userEmail) != null;
	}

	@Override
	public Boolean isDuplicateEmail_forEdit(String userId, String userEmail) {
		Map<String, String> map = new HashMap<>();
		
		map.put("id", String.valueOf(userId));
		map.put("email", String.valueOf(userEmail));
		
		return mapper.findMemberByEmail_forEdit(map) != null;
	}
	
	@Override
	public int delete(int no) {	
		return mapper.deleteMember(no);
	}

	@Override
	public int reSignup(String id) {
		return mapper.reSignup(id);
	}

	@Override
	public int updatePassword(int no, String password) {
		Map<String, String> map = new HashMap<>();
		
		map.put("no", String.valueOf(no));
		map.put("password", passwordEncoder.encode(password));
		
		return mapper.updatePassword(map);
	}


}
