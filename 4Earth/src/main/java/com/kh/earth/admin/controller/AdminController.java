package com.kh.earth.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {

	@GetMapping("/admin")
	public String admin() {
		log.info("admin() - 호출");
		
		return "admin/admin_main";
	}
	
	@GetMapping("/admin_report_list")
	public String admin_report_list() {
		log.info("admin_report)list() - 호출");
		
		return "admin/admin_report_list";
	}
	
	@GetMapping("/admin_reported_list")
	public String admin_reported_list() {
		log.info("admin_reported_list() - 호출");
		
		return "admin/admin_reported_list";
	}
	
	@GetMapping("/admin_notice")
	public String admin_notice() {
		log.info("admin_notice() - 호출");
		
		return "admin/admin_notice";
	}
	
	@GetMapping("/admin_member")
	public String admin_member() {
		log.info("admin_member() - 호출");
		
		return "admin/admin_member";
	}
	
	@GetMapping("/admin_helpboard")
	public String admin_helpboard() {
		log.info("admin_helpboard() - 호출");
		
		return "admin/admin_helpboard";
	}
	
	@GetMapping("/admin_helpboard_done")
	public String admin_helpboard_done() {
		log.info("admin_helpboard_done() - 호출");
		
		return "admin/admin_helpboard_done";
	}
	
	@GetMapping("/admin_faq")
	public String admin_faq() {
		log.info("admin_faq() - 호출");
		
		return "admin/admin_faq";
	}
	
	@GetMapping("/admin_echo_list")
	public String admin_echo_list() {
		log.info("admin_echo_list() - 호출");
		
		return "admin/admin_echo_list";
	}
	
	@GetMapping("/admin_echo_order")
	public String admin_echo_order() {
		log.info("admin_echo_order() - 호출");
		
		return "admin/admin_echo_order";
	}
	
	@GetMapping("/admin_echo_delivery")
	public String admin_echo_delivery() {
		log.info("admin_echo_delivery() - 호출");
		
		return "admin/admin_echo_delivery";
	}
	
	@GetMapping("/admin_echo_cancel")
	public String admin_echo_cancel() {
		log.info("admin_echo_cancel() - 호출");
		
		return "admin/admin_echo_cancel";
	}
	
	@GetMapping("/admin_challenge_month")
	public String admin_challenge_month() {
		log.info("admin_challenge_month() - 호출");
		
		return "admin/admin_challenge_month";
	}
	
	@GetMapping("/admin_challenge_month_manage")
	public String admin_challenge_month_manage() {
		log.info("admin_challenge_month_manage() - 호출");
		
		return "admin/admin_challenge_month_manage";
	}
	
	@GetMapping("/admin_challenge_today")
	public String admin_challenge_today() {
		log.info("admin_challenge_today() - 호출");
		
		return "admin/admin_challenge_today";
	}
	
	@GetMapping("/admin_challenge_today_manage")
	public String admin_challenge_today_manage() {
		log.info("admin_challenge_today_manage() - 호출");
		
		return "admin/admin_challenge_today_manage";
	}
	
	
	
	
	
	
	
}
