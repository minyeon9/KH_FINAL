package com.kh.earth.notice.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.common.util.FileProcess;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.notice.model.service.NoticeService;
import com.kh.earth.notice.model.vo.Notice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;

	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model, 
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10") int count) {

		PageInfo pageInfo = null;
		List<Notice> list = null;

		pageInfo = new PageInfo(page, 10, service.getNoticeCount(), count);
		list = service.getNoticeList(pageInfo);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("notice/list");
		
		System.out.println(list.toString());
		
		return model;
	}
	
	@GetMapping("/write")
	public String write() {
		
		return "notice/write";
	}
	
	@PostMapping("/write")
	public ModelAndView write(ModelAndView model,
			HttpServletRequest request,
			@ModelAttribute Notice notice,
			@RequestParam("upfile") MultipartFile upfile,
			@SessionAttribute(name="loginMember") Member loginMember) {
	
		int result = 0;
		
		String renamedFileName = null;
		String location = request.getSession().getServletContext().getRealPath("/resources/upload/notice/");
	
		notice.setWriterNo(loginMember.getNo());
		
		renamedFileName = FileProcess.save(upfile, location);
	
		
		if(renamedFileName != null) {
			notice.setOriginalFileName(upfile.getOriginalFilename());
			notice.setRenamedFileName(renamedFileName);
		}
		
		result = service.save(notice);
		
		System.out.println("tostring:" + notice.toString());

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
	
	@RequestMapping("/imageUpload")
	public void write(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception {
		OutputStream out = null;
		PrintWriter printWriter = null;
		String fileName = upload.getOriginalFilename();
		byte[] bytes = upload.getBytes();
		ServletContext application = request.getSession().getServletContext();
		String uploadPath = application.getRealPath("/resources/upload/notice/");
		out = new FileOutputStream(new File(uploadPath + fileName));
		out.write(bytes);
		printWriter = response.getWriter();
		String fileUrl = "../resources/upload/notice/" + fileName;
		printWriter.println("{\"filename\":\""+fileName+"\",\"uploaded\":1,\"url\":\""+fileUrl+"\"}");
		printWriter.flush();
	}
	
	
	@GetMapping("/faq")
	public String faq() {
		
		return "notice/faq";
	}
	
}
