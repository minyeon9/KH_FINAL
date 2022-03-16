package com.kh.earth.mypage.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.challenge.model.service.ChallengeService;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.common.util.FileProcess;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.service.MemberService;
import com.kh.earth.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MypageController {
	@Autowired
	private MemberService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
//	@GetMapping("/point")
//	public String point() {
//		log.info("point() - 호출");
//		
//		return "mypage/point";
//	}

//	@GetMapping("/order")
//	public String order() {
//		log.info("order() - 호출");
//		
//		return "mypage/order";
//	}
	
//	@GetMapping("/wishlist")
//	public ModelAndView wishlist(
//			ModelAndView model,
//			@RequestParam(defaultValue="1") int page,
//			@SessionAttribute(name = "loginMember") Member loginMember
//			) {
//		log.info("wishlist() - 호출");
//		
//		System.out.println("loginMember.getNo() : " + loginMember.getNo());
//		
//		StoreService service = new StoreServiceImpl();
//		
//		int count = service.getWishCount(loginMember.getNo());
//		
//		PageInfo pageInfo = new PageInfo(page, 10, count, 8);
//		
//		List<Product> list = new StoreServiceImpl().getWishList(pageInfo, loginMember.getNo());
//		
//		model.addObject("list", list);
//		model.addObject("pageInfo", pageInfo);
//		
//		model.setViewName("mypage/wishlist");
//		
//		return model;
//	}
	
	

	@GetMapping("/profile_view")
	public String profile_view() {
		log.info("profile_view() - 호출");
		
		return "mypage/profile_view";
	}

	@GetMapping("/profile_edit")
	public String profile_edit() {
		log.info("profile_edit() - 호출");
		
		return "mypage/profile_edit";
	}	
	
	@PostMapping("/profile_edit")
	public ModelAndView profile_edit(@ModelAttribute Member member, 
			ModelAndView model, 
			@SessionAttribute(name="loginMember") Member loginMember,
			@RequestParam("imgname") MultipartFile imgname) {
		int result = 0;
		
		member.setImg_name(loginMember.getImg_name());
		member.setModify_img_name(loginMember.getModify_img_name());		
		
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
		 
		member.setNo(loginMember.getNo()); 
		System.out.println("member에 넘버 셋 되었니? : "+member.toString());
		result = service.save(member);
		System.out.println("저장여부 : "+result);
		
		if(result > 0) {
			model.addObject("loginMember", service.findMemberById(loginMember.getId())); 
			System.out.println("세션로긴멤버에 정보 : "+loginMember.toString());
			model.addObject("msg", "회원정보 수정을 완료했습니다.");
			model.addObject("location", "/profile_view");
			
		}else  {
			model.addObject("msg", "회원정보 수정을 실패하였습니다.");
			model.addObject("location", "/profile_edit");
		}
		
		model.setViewName("common/msg");
		
		return model;


	}
}
