package com.kh.earth.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.admin.model.service.AdminService;
import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.admin.model.vo.Reported;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.store.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
//	@Autowired
//	private MemberService service;
	
	@Autowired
	private AdminService service;

	@GetMapping("/main")
	public String admin() {
		log.info("admin() - 호출");
		
		return "admin/main";
	}
	
	@GetMapping("/report_list")
	public ModelAndView admin_report_list(ModelAndView model, 
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Report> list = null;
		
		log.info("admin_report)list() - 호출");
		
		pageInfo = new PageInfo(page, 10, service.getMemberCount(), count);
		list = service.getReportList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("/admin/report_list");
		
		return model;
	}
	
	@GetMapping("/reported_list")
	public ModelAndView admin_reported_list(ModelAndView model, 
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Reported> list = null;
		
		log.info("admin_reported_list() - 호출");
		
		pageInfo = new PageInfo(page, 10, service.getMemberCount(), count);
		list = service.getReportedList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("/admin/reported_list");
		
		return model;
	}
	
	@GetMapping("/notice")
	public String admin_notice() {
		log.info("admin_notice() - 호출");
		
		return "admin/notice";
	}
	
	@GetMapping("/member")
	public ModelAndView admin_member(ModelAndView model, 
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Member> list = null;
		
		log.info("admin_member() - 호출", page);
		
		pageInfo = new PageInfo(page, 10, service.getMemberCount(), count);
		list = service.getMemberList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("/admin/member");
		
		return model;
	}
	
	@GetMapping("/helpboard")
	public String admin_helpboard() {
		log.info("admin_helpboard() - 호출");
		
		return "admin/helpboard";
	}
	
	@GetMapping("/helpboard_done")
	public String admin_helpboard_done() {
		log.info("admin_helpboard_done() - 호출");
		
		return "admin/helpboard_done";
	}
	
	@GetMapping("/faq")
	public String admin_faq() {
		log.info("admin_faq() - 호출");
		
		return "/admin/faq";
	}
	
	@GetMapping("/echo_list")
	public ModelAndView admin_echo_list(
			ModelAndView model,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count
			) {
		PageInfo pageInfo = null;
		List<Product> list = null;
		
		log.info("admin_echo_list() - 호출");
		
		pageInfo = new PageInfo(page, 10, service.getProductCount(), count);
		list = service.getProductList(pageInfo);
					
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		
		model.setViewName("/admin/echo_list");
		
		return model;
	}
	
	@GetMapping("/echo_order")
	public String admin_echo_order() {
		log.info("admin_echo_order() - 호출");
		
		return "admin/echo_order";
	}
	
	@GetMapping("/echo_delivery")
	public String admin_echo_delivery() {
		log.info("admin_echo_delivery() - 호출");
		
		return "admin/echo_delivery";
	}
	
	@GetMapping("/echo_cancel")
	public String admin_echo_cancel() {
		log.info("admin_echo_cancel() - 호출");
		
		return "admin/echo_cancel";
	}
	
	@GetMapping("/challenge_month")
	public String admin_challenge_month() {
		log.info("admin_challenge_month() - 호출");
		
		return "admin/challenge_month";
	}
	
	@GetMapping("/challenge_month_manage")
	public String admin_challenge_month_manage() {
		log.info("admin_challenge_month_manage() - 호출");
		
		return "admin/challenge_month_manage";
	}
	
	@GetMapping("/challenge_today")
	public String admin_challenge_today() {
		log.info("admin_challenge_today() - 호출");
		
		return "admin/challenge_today";
	}
	
	@GetMapping("/challenge_today_manage")
	public String admin_challenge_today_manage() {
		log.info("admin_challenge_today_manage() - 호출");
		
		return "admin/challenge_today_manage";
	}
	
	@GetMapping("/member_delete")
	public ModelAndView admin_member_delete(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_member_delete" + no);
		
		int result = 0;
		
		result = service.deleteMember(no);
		
		if (result > 0) {
			model.addObject("msg", "멤버 정지 완료");
			model.addObject("location", "/admin/member");
		}else {
			model.addObject("msg", "멤버 정지 실패");
			model.addObject("location", "/admin/member");
		}
			
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/report_delete")
	public ModelAndView admin_report_delete(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_report_delete" + no);
		
		int result = 0;
		
		result = service.deleteReport(no);
		
		if (result > 0) {
			model.addObject("msg", "신고 처리 완료");
			model.addObject("location", "/admin/report_list");
		}else {
			model.addObject("msg", "신고 처리 실패");
			model.addObject("location", "/admin/report_list");
		}
			
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
	
	
}
