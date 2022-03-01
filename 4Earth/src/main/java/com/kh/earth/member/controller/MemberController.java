package com.kh.earth.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.common.util.FileProcess;
import com.kh.earth.member.model.service.MemberService;
import com.kh.earth.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	@Autowired
	private MemberService service;	
	
	@Autowired
	private ResourceLoader resourceLoader;
	
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
	
	@PostMapping("/signup_form")
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member, @RequestParam("imgname") MultipartFile imgname) {

		log.info(member.toString());
		
		 System.out.println(imgname.getOriginalFilename());
		 System.out.println(imgname.isEmpty());
		 
		 // 파일을 업로드하지 않으면 "", 파일을 업로드하면 "파일명"
		 log.info("imgname Name : {}", imgname.getOriginalFilename());
		 // 파일을 업로드하지 않으면 true, 파일을 업로드하면 false
		 log.info("imgname is Empty : {}", imgname.isEmpty());
		 

		 // 1. 파일을 업로드 했는지 확인 후 파일을 저장 
		 if(imgname != null && !imgname.isEmpty()) {
			 // 파일을 저장하는 로직 작성
			 String location = null;
			 String renamedFileName = null;
			 // String location = request.getSession().getServletContext().getRealPath("resources/upload/board");
			 
			try {
				location = resourceLoader.getResource("resources/upload/member").getFile().getPath();
				 // file:, classpath:등의 접두어로 리소스를 찾아올수있다. 웹루트는 접두어 필요없음. 
				 // 반환하는 객체는 Resource객체임, 파일이름, 경로, 파일등을 찾아올 수 있다. 
				renamedFileName = FileProcess.save(imgname, location);
				System.out.println("컨트롤러에서 리네임드 찍어봄 : "+renamedFileName);
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
			 if(renamedFileName != null) {
				 member.setImg_name(imgname.getOriginalFilename());
				 member.setModify_img_name(renamedFileName);
			 }
		 }
		 
		int result = service.save(member);
		
		System.out.println(member.getName());

		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/signup_finish?name="+member.getName());
		}else {
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/signup_form");
		}
		
		model.setViewName("common/msg");
		
		return model;

	}
	
	@GetMapping("/signup_finish")
	public String signup_finish() {
		log.info("signup_finish() - 호출");
		
		
		
		return "member/signup-finish";
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
