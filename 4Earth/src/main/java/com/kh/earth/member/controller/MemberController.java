package com.kh.earth.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.earth.member.model.service.MemberService;
import com.kh.earth.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	@Autowired
	private MemberService service;	
	
	@GetMapping("/login")
	public String login() {
		log.info("login() - 호출");
		
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(HttpSession session, Model model, 
			@RequestParam("id") String id, @RequestParam String password) {
		
		log.info("{}, {}", id, password);
		
		Member member = service.login(id, password);
		
		if(member != null) {
			session.setAttribute("loginMember", member);
			
			return "redirect:/";
		}else {    
			model.addAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			model.addAttribute("location", "/");
			
			return "common/msg";  
		}
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status) {
		
		log.info("status.isComplete() : {}", status.isComplete());
		
		// SessionStatus 객체의 setComplete() 메소드로 세션 스코프로 확장된 객체들을 지워준다. 
		status.setComplete();
		
		log.info("status.isComplete() : {}", status.isComplete());
		
		return "redirect:/";

	}
	
	
	
	
	
	
	
	@GetMapping("/signup")
	public String signup() {
		log.info("signup() - 호출");
		
		return "member/signup";
	}
	
	@GetMapping("/signup_form")
	public String signup_form() {
		log.info("signup_form() - 호출");
		
		return "member/signup-form";
	}
	
	@GetMapping("/find_id")
	public String find_id() {
		log.info("find_id() - 호출");
		
		return "member/find-id";
	}
	
	@GetMapping("/find_pw")
	public String find_pw() {
		log.info("find_pw() - 호출");
		
		return "member/find-pw";
	}

}
