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
//			session.setAttribute("test1", "dfdfd");
//			System.out.println(session.getAttribute("test1"));
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
	@ResponseBody
	public Object kakao_login(ModelAndView model, 
			@ModelAttribute Member member, 
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		Map<String, String> map = new HashMap<>();
		
//	    Enumeration params = request.getParameterNames();
//	    while(params.hasMoreElements()) {
//	      String name = (String) params.nextElement();
//	      System.out.print(" ▶ "+name + " : " + request.getParameter(name)); 
//	    }
	    
		String id = request.getParameter("id");
		String email = request.getParameter("kakao_account[email]");
		String nickName = request.getParameter("properties[nickname]");
		String image = request.getParameter("properties[profile_image]");

		member.setId(id);
		member.setName(nickName);
		member.setEmail(email);
		member.setImg_name(image);
		member.setPlatform_type("KAKAO");
    	// System.out.println("저장 전 memeber값 : "+member);
    	
    	Member resultM = service.findMemberById_forSNS(id);
    	// System.out.println("DB에서 조회한 회원값 : "+resultM);
    	
    	if(resultM == null) {
    		// 1. 회원정보가 없다면 회원가입을 시킨다.
    		service.save(member);
			
    		// 소셜 로그인의 경우 가입과 동시에 로그인 진행 
			Member loginMember = service.login(id, member.getPassword());
			session.setAttribute("loginMember", loginMember);
			
			map.put("location", "http://localhost:8088/4earth/signup_finish?name="+member.getName());
			return map;
			
    	} else if(resultM.getStatus().equals("N")){
    		// 2. 탈퇴했다가 다시 가입하는것이라면 상태값을 바꾸어준다. 
    		int result = service.reSignup(resultM.getId());
    		if(result>0) {
    			System.out.println("재가입에 성공하였습니다.");
    					
    			// 소셜 로그인의 경우 가입과 동시에 로그인 진행
    			Member loginMember = service.login(id, member.getPassword());	
    			session.setAttribute("loginMember", loginMember);
    			
    			map.put("location", "http://localhost:8088/4earth/signup_finish?name="+resultM.getName());
    			
    			return map;
    			
    		}else {
    			// 가입 실패시 메인으로 이동
    			map.put("location", "http://localhost:8088/4earth/");
    			return map;
    		}

    	}
    	
		// 3. (신규가입X, 재가입X 일 경우) 로그인을 시킨다.
    	Member loginMember = service.login(id, member.getPassword());	
       	// System.out.println("sns회원가입으로 정보가 있는 사람 로긴 : "+loginMember);
       	
    	if(loginMember!=null) {
    		// 로그인 성공
    		session.setAttribute("loginMember", loginMember); 
    		map.put("result", "login");
    		map.put("location", "http://localhost:8088/4earth/");
    	} else {
    		// 로그인 실패
    		map.put("result", "login_fail");
    		map.put("location", "http://localhost:8088/4earth/login");
    	}
		
    	return map;
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
	
	@PostMapping("/kakao_unlink")
	@ResponseBody
	public Object kakao_unlink(ModelAndView model,
			@SessionAttribute(name="loginMember")Member loginMember) {
			Map<String, String> map = new HashMap<>();
		
			// 탈퇴 진행
			int result = service.delete(loginMember.getNo());
			
			if(result > 0) {
				map.put("location", "http://localhost:8088/4earth/logout");
				map.put("msg", "정상적으로 탈퇴되었습니다.");

			}else {
				map.put("msg", "회원 탈퇴에 실패하였습니다.");
				map.put("location", "http://localhost:8088/4earth/profile_view");
			}
			
			return map;
	};
	
	@PostMapping("/pw_change")
	public ModelAndView pw_change(ModelAndView model,
			String userPwd1, String userPwd2, String userPwCheck2, 
			@SessionAttribute(name="loginMember") Member loginMember) {
		int result = 0;
//		log.info("{}", userPwd1);
//		log.info("{}, {}", userPwd2, userPwCheck2);
		
		Member loginSuccess = service.login(loginMember.getId(), userPwd1);
		
		if(loginSuccess != null) {
			result = service.updatePassword(loginSuccess.getNo(), userPwd2);

			if(result > 0) {
				model.addObject("msg", "비밀번호를 변경하였습니다. 다시 로그인해주세요.");
				model.addObject("location", "/logout");
			}else {
				model.addObject("msg", "비밀번호 변경에 실패하였습니다.");
				model.addObject("location", "/profile_edit");
			}
				
		}else {
			model.addObject("msg", "기존 비밀번호를 잘못 입력하셨습니다.");
			model.addObject("location", "/profile_edit");
		}
		
		model.setViewName("common/msg");

		return model;
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
	
	
	
	@PostMapping("/find_pw")
	@ResponseBody
	public Object find_pw(ModelAndView model,
			@ModelAttribute Member member) {
		Map<String, String> map = new HashMap<>();

		log.info("{}, {}", member.getName(), member.getId());
		log.info("이메일 : {}", member.getEmail());
		
		Member resultM = service.findMemberById(member.getId());

		if(resultM != null) {
			
			boolean resultName = resultM.getName().equals(member.getName());
			boolean resultEmail = resultM.getEmail().equals(member.getEmail());
			
			if(!resultName){
				map.put("result", "fail");
				map.put("msg", "이름이 일치하지 않습니다.");
			}else if(!resultEmail) {
				map.put("result", "fail");
				map.put("msg", "이메일이 일치하지 않습니다.");
			}else if(resultName && resultEmail) {
				map.put("result", "success");
				map.put("msg", "해당 회원이 존재합니다.");
			}
			
			return map;
		}else {
			map.put("result", "fail");
			map.put("msg", "해당 ID의 회원이 존재하지 않습니다.");
		}
		return map;
	}
	
	@PostMapping("/verification")
	public ModelAndView verification(ModelAndView model, String vf_code) {
		
		String str = "1111";
		
		if(str.equals(vf_code)) {
			System.out.println("인증성공!");	
			model.addObject("msg", "인증에 성공하셨습니다.");
			model.addObject("location", "/");
			
		}else {
			System.out.println("인증실패!");	
			model.addObject("msg", "인증에 실패하셨습니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		return model;
	}
	
	
	
	
	@GetMapping("/find_pw_finish")
	public String find_pw_finish() {
		log.info("find_pw_finish() - 호출");
		
		return "member/find-pw-finish";
	}
	
	@GetMapping("/find_id_finish")
	public String find_id_finish() {
		log.info("find_id_finish() - 호출");
		
		return "member/find-id-finish";
	}

}
