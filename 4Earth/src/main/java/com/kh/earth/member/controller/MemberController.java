package com.kh.earth.member.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
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
	public ModelAndView enroll(ModelAndView model, 
			@ModelAttribute Member member, 
			@RequestParam("imgname") 
			MultipartFile imgname) {

		log.info(member.toString());
		 
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
				renamedFileName = FileProcess.save(imgname, location);
				System.out.println("컨트롤러에서 리네임드 찍어봄 : "+renamedFileName);
				System.out.println("컨트롤러에서 location 찍어봄 : "+location);
				
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
	
	@PostMapping("/kakao_login")
	public ModelAndView kakao_login(ModelAndView model, 
			@ModelAttribute Member member, 
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		
	    Enumeration params = request.getParameterNames();
	    while(params.hasMoreElements()) {
	      String name = (String) params.nextElement();
	      System.out.print(" ▶ "+name + " : " + request.getParameter(name)); 
	    }
	    
		String id = request.getParameter("id");
		System.out.println("아이디 : "+id);
		String email = request.getParameter("kakao_account[email]");
		System.out.println("이메일 : "+email);
		String nickName = request.getParameter("properties[nickname]");
		System.out.println("닉네임 : "+nickName);
		String image = request.getParameter("properties[profile_image]");
		System.out.println("이미지 : "+image);
		
		member.setId(id);
		member.setName(nickName);
		member.setEmail(email);
		member.setImg_name(image);
		member.setPlatform_type("KAKAO");
		
    	System.out.println("저장 전 memeber값 : "+member);
    	
    	Member resultM = service.findMemberById(id);
    	System.out.println("DB에서 조회한 회원값 : "+resultM);
    	
    	if(resultM == null) {
    		// 회원정보가 없다면 회원가입을 시킨다.
    		service.save(member);
			
			Member loginMember = service.login(id, member.getPassword());
			session.setAttribute("loginMember", loginMember);
			
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/signup_finish?name="+member.getName());
			model.setViewName("common/msg");
			
			return model;
    	} 
    	
		// 회원정보가 있다면 로그인을 시킨다.
    	Member loginMember = service.login(id, member.getPassword());	
       	System.out.println("sns회원가입으로 정보가 있는 사람 로긴 : "+loginMember);
       	
    	if(loginMember!=null) {
    		session.setAttribute("loginMember", loginMember);
    		System.out.println("로그인 성공");    
    		model.setViewName("redirect:/");
    	} else {
    		System.out.println("로그인 실패");
			model.addObject("msg", "로그인에 실패하였습니다.");
			model.addObject("location", "/login");
    		model.setViewName("common/msg");
    	}
		
    	return model;
	}
	
	
	
	@GetMapping("/jsonTest")
	@ResponseBody
	public Object jsonTest() {		
		return new Member("admin2", "1234", "관리자");
	}
	
	@PostMapping(value = "/idCheck")
	@ResponseBody
	public Object idCheck(@RequestParam("userId") String userId) {
		Map<String, Boolean> map = new HashMap<>();
		
		log.info("{}", userId);

		map.put("duplicate", service.isDuplicateID(userId));
		
		return map;
	}
	
	
	@GetMapping("/signup_finish")
	public String signup_finish() {
		log.info("signup_finish() - 호출");
		
		return "member/signup-finish";
	}
	
	
	@PostMapping("/member_delete")
	public ModelAndView member_delete(ModelAndView model, @RequestParam String password,
			@SessionAttribute(name="loginMember")Member loginMember) {
		
		// 로그인 멤버의 id와 입력한 패스워드로 로그인하여 해당 멤버인지 확인
		Member member = service.login(loginMember.getId(), password);		

		if(member != null) {
			// 비밀번호를 제대로 입력했을 경우 탈퇴 진행
			int result = service.delete(loginMember.getNo());
			
			if(result > 0) {
				model.addObject("msg", "정상적으로 탈퇴되었습니다.");
				model.addObject("location", "/logout"); 
			}else {
				model.addObject("msg", "회원 탈퇴에 실패하였습니다.");
				model.addObject("location", "/profile_view");
			}
			
			model.setViewName("common/msg");
			
			return model;
			
		}else {
			// 비밀번호를 잘 못 입력한 경우
			model.addObject("msg", "비밀번호를 잘못입력하셨습니다.");
			model.addObject("location", "/profile_view");
			model.setViewName("common/msg");
			
			return model;
				
		}
		
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
