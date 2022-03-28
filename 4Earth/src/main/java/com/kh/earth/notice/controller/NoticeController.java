package com.kh.earth.notice.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.common.util.FileProcess;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.notice.model.service.NoticeService;
import com.kh.earth.notice.model.vo.Notice;
import com.kh.earth.notice.model.vo.Qna;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private ResourceLoader resourceLoader;

	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model, 
			@RequestParam Map<String, String> title,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int count,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {

		PageInfo pageInfo = null;
		List<Notice> list = null;
		
		System.out.println(title);
		System.out.println(loginMember);

		pageInfo = new PageInfo(page, 10, service.getNoticeCount(title), count);
		list = service.getNoticeList(pageInfo, title);
		
		model.addObject("loginMember", loginMember);
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("notice/list");
		
		return model;
	}
	
	@GetMapping("/qnalist")
	public ModelAndView qnalist(ModelAndView model, 
			@RequestParam Map<String, String> title,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int count) {

		PageInfo pageInfo = null;
		List<Qna> list = null;
		pageInfo = new PageInfo(page, 10, service.getQnaCount(title), count);
		list = service.getQnaList(pageInfo, title);
		
		System.out.println("LIST: " + list);

		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.addObject("name", title.get("title"));
		
		model.setViewName("notice/qnalist");
		
		return model;
	}
	
	
	@GetMapping("/write")
	public String write() {
		
		return "notice/write";
	}
	
	@PostMapping("/write")
	public ModelAndView write(ModelAndView model,
//			HttpServletRequest request,
			@ModelAttribute Notice notice,
			@RequestParam("upfile") MultipartFile upfile,
			@SessionAttribute(name="loginMember") Member loginMember) {
	
		int result = 0;
		
		if(upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renamedFileName = null;
//			String location = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			
			try {
				location = resourceLoader.getResource("resources/upload/notice").getFile().getPath();
				renamedFileName = FileProcess.save(upfile, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
		
			
			if(renamedFileName != null) {
				notice.setOriginalFileName(upfile.getOriginalFilename());
				notice.setRenamedFileName(renamedFileName);
			}
		}
		
		notice.setWriterNo(loginMember.getNo());
		result = service.save(notice);

//		System.out.println("tostring:" + notice.toString());
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/notice/list");
		} else {
			model.addObject("msg", "게시글 등록이 실패했습니다.");
			model.addObject("location", "/notice/write");
		}
		
		model.setViewName("common/msg");
	
		return model;
	}
	
	@GetMapping("/qnaWrite")
	public String qnawrite() {
		
		return "notice/qnaWrite";
	}
	
	@PostMapping("/qnaWrite")
	public ModelAndView qnaWrite(ModelAndView model,
//			HttpServletRequest request,
			@ModelAttribute Qna qna,
			@RequestParam("upfile") MultipartFile upfile,
			@SessionAttribute(name="loginMember") Member loginMember) {
	
		int result = 0;
		
		System.out.println(qna.toString());
		
		if(upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renamedFileName = null;
//			String location = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
			
			try {
				location = resourceLoader.getResource("resources/upload/notice").getFile().getPath();
				renamedFileName = FileProcess.save(upfile, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
		
			
			if(renamedFileName != null) {
				qna.setOriginalFileName(upfile.getOriginalFilename());
				qna.setRenamedFileName(renamedFileName);
			}
		}
		
		int catNo = service.getCategoryNo(qna.getCategory());
		qna.setCategoryNo(catNo);
		
		qna.setWriterNo(loginMember.getNo());
		result = service.qnaSave(qna);

//		System.out.println("tostring:" + notice.toString());
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/notice/qnalist");
		} else {
			model.addObject("msg", "게시글 등록이 실패했습니다.");
			model.addObject("location", "/notice/qnaWrite");
		}
		
		model.setViewName("common/msg");
	
		return model;
	}
	
	@GetMapping("/view")
	public ModelAndView view(HttpServletRequest request, HttpServletResponse response, ModelAndView model, @RequestParam("no") int no) {
		
		Notice notice = service.findNoticeByNo(no);
		
		Cookie[] cookies = request.getCookies();
		String boardHistory = "";
		
		if(cookies != null) {
			String name = null;
			String value = null;
			
			for(Cookie cookie : cookies) {
				name = cookie.getName();
				value = cookie.getValue();
				
				if("boardHistory".equals(name)) {
					boardHistory = value;
					if(value.contains("|" + no + "|")) {
						 
						break;
					}
				}
			}
		}
		
		model.addObject("notice", notice);
		model.setViewName("notice/view");
		
		return model;
	}
	
	@GetMapping("/qnaView")
	public ModelAndView qnaView(HttpServletRequest request, HttpServletResponse response, ModelAndView model, @RequestParam("no") int no) {
		
		Qna qna = service.findQnaByNo(no);
		
		model.addObject("qna", qna);
		model.setViewName("notice/qnaView");
		
		return model;
	}
	
	@GetMapping("/fileDown")
	public ResponseEntity<Resource> fileDown(
			@RequestHeader(name = "user-agent") String userAgent, 
			@RequestParam("oname") String oname, 
			@RequestParam("rname") String rname) {
		
		try {
			Resource resource = resourceLoader.getResource("/resources/upload/notice/" + rname);
			
			String downName = null;
			boolean isMSIE = userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1;
		
			if(isMSIE) {
				downName = URLEncoder.encode(oname, "UTF-8").replaceAll("\\+", "%20");
			
			} else {
				downName = new String(oname.getBytes("UTF-8"), "ISO-8859-1");			
			}
			
			System.out.println("DOWNNAME: " + downName);
			System.out.println("RNAME: " + rname);
			
			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename\"" + downName + "\"")
					.body(resource);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
		
	}
	
	@GetMapping("/modify")
	public ModelAndView modify(
			@SessionAttribute("loginMember") Member loginMember,
			ModelAndView model, @RequestParam("no") int no) {
		
		Notice notice = service.findNoticeByNo(no);
		
		if(loginMember.getNo() == notice.getWriterNo()) {
			model.addObject("notice", notice);
			model.setViewName("notice/modify");
						
		} else {
			model.addObject("msg","정상정으로 수정되었습니다.");
			model.addObject("location", "/notice/list");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@PostMapping("/modify")
	public ModelAndView modify(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@ModelAttribute Notice notice, @RequestParam("upfile") MultipartFile upfile) {
	
		int result;
		
		if(loginMember.getId().equals(notice.getWriterId())) {
			if(upfile != null && !upfile.isEmpty()) {
				String renamedFileName = null;
				String location = null;
				
				try {
					location =  resourceLoader.getResource("resources/upload/notice").getFile().getPath();
					
					if(notice.getRenamedFileName() != null) {
						FileProcess.delete(location + "/" + notice.getRenamedFileName());
					}
					
					renamedFileName = FileProcess.save(upfile, location);
					
					if(renamedFileName != null) {
						notice.setOriginalFileName(upfile.getOriginalFilename());
						notice.setRenamedFileName(renamedFileName);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			result = service.save(notice);
						
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/notice/view?no=" + notice.getNo());
				
			} else {
				model.addObject("msg", "게시글이 수정되지 않았습니다.");
				model.addObject("location", "/notice/view?no=" + notice.getNo());
			}
		} else {
			
			model.addObject("msg","비정상적 호출입니다.");
			model.addObject("location", "/notice/list");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/qnaModify")
	public ModelAndView qnaModify(
			@SessionAttribute("loginMember") Member loginMember,
			ModelAndView model, @RequestParam("no") int no) {
		
		Qna qna = service.findQnaByNo(no);
		
		if(loginMember.getNo() == qna.getWriterNo()) {
			model.addObject("qna", qna);
			model.setViewName("notice/qnaModify");
						
		} else {
			model.addObject("msg","비정상적 호출입니다.");
			model.addObject("location", "/notice/qnalist");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@PostMapping("/qnaModify")
	public ModelAndView qnaModify(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@ModelAttribute Qna qna, @RequestParam("upfile") MultipartFile upfile) {
		
		int result;
		
		if(loginMember.getId().equals(qna.getWriterId())) {
			result = service.qnaSave(qna);
						
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/notice/qnaView?no=" + qna.getNo());
				
			} else {
				model.addObject("msg", "게시글이 수정되지 않았습니다.");
				model.addObject("location", "/notice/qnaView?no=" + qna.getNo());
			}
		} else {
			
			model.addObject("msg","비정상적 호출입니다.");
			model.addObject("location", "/notice/qnalist");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/delete")
	public ModelAndView delete(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("no") int no) {
		
		int result = 0;
		Notice notice = service.findNoticeByNo(no);
		
		System.out.println(notice.getWriterNo());
		System.out.println(loginMember.getNo());
		
		
		if(notice.getWriterNo() == loginMember.getNo()) {
			result = service.delete(notice.getNo());
			
			
			System.out.println(result);
			
			
			if(result > 0) {
				model.addObject("msg", "해당 게시글 삭제가 정상적으로 처리되었습니다.");
				model.addObject("location", "/notice/list");
			} else {
				model.addObject("msg", "게시글 삭제에 실패하였습니다.");
				model.addObject("location", "/notice/view?no=" + notice.getNo());
			}
			
		} else {
			model.addObject("msg","비정상적 호출입니다.");
			model.addObject("location", "/notice/list");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/qnaDelete")
	public ModelAndView qnaDelete(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("no") int no) {
		
		int result = 0;
		Qna qna = service.findQnaByNo(no);
		
		System.out.println(qna.getWriterNo());
		System.out.println(loginMember.getNo());
		
		
		if(qna.getWriterNo() == loginMember.getNo()) {
			result = service.qnaDelete(qna.getNo());
			
			
			System.out.println(result);
			
			
			if(result > 0) {
				model.addObject("msg", "해당 게시글 삭제가 정상적으로 처리되었습니다.");
				model.addObject("location", "/notice/qnalist");
			} else {
				model.addObject("msg", "게시글 삭제에 실패했습니다.");
				model.addObject("location", "/notice/qnaView?no=" + qna.getNo());
			}
			
		} else {
			model.addObject("msg","비정상적 호출입니다.");
			model.addObject("location", "/notice/qnalist");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/faq")
	public String faq() {
		
		return "notice/faq";
	}
	
}
