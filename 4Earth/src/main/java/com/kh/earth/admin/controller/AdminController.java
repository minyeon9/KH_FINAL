package com.kh.earth.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.admin.model.service.AdminService;
import com.kh.earth.admin.model.vo.ProInqAnswer;
import com.kh.earth.admin.model.vo.QnaAnswer;
import com.kh.earth.admin.model.vo.Report;
import com.kh.earth.admin.model.vo.Reported;
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.challenge.model.vo.MonthMember;
import com.kh.earth.challenge.model.vo.Today;
import com.kh.earth.challenge.model.vo.TodayMember;
import com.kh.earth.common.util.FileProcess;
import com.kh.earth.common.util.PageInfo;
import com.kh.earth.member.model.vo.Member;
import com.kh.earth.notice.model.vo.Notice;
import com.kh.earth.notice.model.vo.Qna;
import com.kh.earth.store.model.vo.OrderDetail;
import com.kh.earth.store.model.vo.OrderSum;
import com.kh.earth.store.model.vo.Product;
import com.kh.earth.store.model.vo.ProductBidding;
import com.kh.earth.store.model.vo.ProductImgs;
import com.kh.earth.store.model.vo.ProductInquiry;
import com.twilio.rest.api.v2010.account.Application;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminService service;
	
	@Autowired
	private ResourceLoader resourceLoader;

	@GetMapping("/main")
	public String admin() {
		log.info("admin() - 호출");
		
		return "admin/main";
	}
	// 회원관련
	// 검색기능 - @RequestParam Map<String, String> name을 통해서 <키워드, 내용>형식으로 데이터를 받아옴
	// ex) <no, "11"> ?no=11
	// 그다음에 service에 map형식으로 데이터를 보내서 mapper에서 키워드와 값으로 받음
	@GetMapping("/member")
	public ModelAndView admin_member(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Member> list = null;
		System.out.println(name);

		
		log.info("admin_member() - 호출", page);
		
		pageInfo = new PageInfo(page, 10, service.getMemberCount(name), count);
		list = service.getMemberList(pageInfo, name);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		
		
		model.setViewName("/admin/member");
		
		return model;
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
	
	@GetMapping("/member_unban")
	public ModelAndView admin_member_unban(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_member_delete" + no);
		
		int result = 0;
		
		result = service.unbanMember(no);
		
		if (result > 0) {
			model.addObject("msg", "멤버 정지 해제완료");
			model.addObject("location", "/admin/member");
		}else {
			model.addObject("msg", "멤버 정지 해제실패");
			model.addObject("location", "/admin/member");
		}
		
		
		model.setViewName("common/msg");
		
		return model;
	}
	// 신고관련
	@GetMapping("/report_list")
	public ModelAndView admin_report_list(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Report> list = null;
		
		
		log.info("admin_report)list() - 호출");
		
		pageInfo = new PageInfo(page, 10, service.getReportCount(name), count);
		list = service.getReportList(pageInfo, name);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		
		model.setViewName("/admin/report_list");
		
		return model;
	}
	
	@GetMapping("/reported_list")
	public ModelAndView admin_reported_list(ModelAndView model, 
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Reported> list = null;
		
		log.info("admin_reported_list() - 호출");
		
		pageInfo = new PageInfo(page, 10, service.getReportedCount(), count);
		list = service.getReportedList(pageInfo, name);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		model.setViewName("/admin/reported_list");
		
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
	
	@GetMapping("/report_ban")
	public ModelAndView admin_report_ban(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_report_ban" + no);
		
		int result = 0;
		
		result = service.banMember(no);
		
		if (result > 0) {
			model.addObject("msg", "멤버 정지 완료");
			model.addObject("location", "/admin/report_list");
		}else {
			model.addObject("msg", "신고 처리 실패");
			model.addObject("location", "/admin/report_list");
		}
		
		
		model.setViewName("common/msg");
		
		return model;
	}
	// 공지사항관련
	@GetMapping("/notice")
	public ModelAndView admin_notice(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Notice> list = null;
		
		log.info("admin_notice() - 호출");
		
		
		pageInfo = new PageInfo(page, 10, service.getNoticeCount(name), count);
		list = service.getNoticeList(pageInfo, name);
		
		System.out.println(list);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		
		
		model.setViewName("/admin/notice");
		return model;
	}
	
	@GetMapping("/notice_write")
	public String write() {
		
		return "admin/notice_write";
	}
	
	@PostMapping("/notice_write")
	public ModelAndView write(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@ModelAttribute Notice notice,
			@RequestParam("upfile") MultipartFile upfile) {
	
		int result = 0;
		
		if(upfile != null && !upfile.isEmpty()) {
			String location = null;
			String renamedFileName = null;
			
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
		result = service.writeNotice(notice);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");
		} else {
			model.addObject("msg", "게시글 등록이 실패했습니다.");
			model.addObject("location", "/admin/notice");
		}
		
		
		
		model.setViewName("common/msg");
	
		return model;
	}
	
	@GetMapping("/notice_update")
	public ModelAndView admin_notice_update(ModelAndView model,
			@RequestParam("no")int no) {
		log.info("admin_notice_update() - 호출");
		Notice notice = service.findNoticeByNo(no);
		
		
		model.addObject("notice", notice);
		model.setViewName("admin/notice_update");
		
		return model;
	}
	
	@GetMapping("/notice_delete")
	public ModelAndView admin_notice_delete(ModelAndView model,
			@RequestParam("no")int no) {
		log.info("admin_notice_delete() - 호출");
		int result = 0;
		
		result = service.deleteNotice(no);
		
		if (result > 0) {
			model.addObject("msg", "공지사항 삭제 완료");
			model.addObject("location", "/admin/notice");
		}else {
			model.addObject("msg", "공지사항 삭제 실패");
			model.addObject("location", "/admin/notice");
		}
			
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@PostMapping("/notice_update")
	public ModelAndView admin_notice_update(ModelAndView model,
			@ModelAttribute("notice")Notice notice,
			@RequestParam("upfile") MultipartFile upfile) {
		int result;
		
		log.info("admin_notice_update() - post 호출");
		
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
		
		result = service.updateNotice(notice);
					
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");
			
		} else {
			model.addObject("msg", "게시글 수정에 실패했습니다.");
			model.addObject("location", "/admin/notice_update?no=" + notice.getNo());
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	// 문의관련
	@GetMapping("/qna")
	public ModelAndView admin_qna(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Qna> list = null;

		
		log.info("admin_qna() - 호출", page);
		
		pageInfo = new PageInfo(page, 10, service.getQnaCount(name), count);
		list = service.getQnaList(pageInfo, name);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		
		
		model.setViewName("/admin/qna");
		
		return model;
	}
	
	@GetMapping("/qna_done")
	public ModelAndView admin_qna_done(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Qna> qna = null;
		List<QnaAnswer> answer = null;

		log.info("admin_qna_done() - 호출");
		
		
		pageInfo = new PageInfo(page, 10, service.getQnaDoneCount(name), count);
		qna = service.getQnaDoneList(pageInfo, name);
		answer = service.getAnswerByNo(pageInfo, name);
		
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("qna", qna);
		
		
		model.setViewName("/admin/qna_done");
		
		return model;
	}
	
	@GetMapping("/qna_answer")
	public ModelAndView admin_qna_answer(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_qna_answer() - 호출");
		Qna qna = service.findQnaByNo(no);
		
		
		model.addObject("qna", qna);
		model.setViewName("admin/qna_answer");
		
		return model;
	}
	
	@GetMapping("/qna_update")
	public ModelAndView admin_qna_update(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_qna_answer() - 호출");
		Qna qna = service.findQnaByNo(no);
		
		
		model.addObject("qna", qna);
		model.setViewName("admin/qna_answer");
		
		return model;
	}
	
	@PostMapping("/qna_update")
	public ModelAndView admin_qna_update(ModelAndView model,
			@RequestParam("no")int no,
			@ModelAttribute("qnaAnswer")QnaAnswer qnaAnswer) {
		int result = 0;
		int answerResult = 0;
		log.info("admin_qna_update() - post 호출");
		result = service.updateQna(qnaAnswer);
		
		if (result > 0) {
			answerResult =service.qnaDone(qnaAnswer.getQnaNo());
			model.addObject("msg", "문의 답변 성공");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");
		}else {
			model.addObject("msg", "문의 답변 실패");
			model.addObject("location", "/admin/qna_answer?no=" + qnaAnswer.getQnaNo());
		}
		
		model.addObject("qnaAnswer", qnaAnswer);
		model.setViewName("common/msg");
		
		return model;
	}
	
	@PostMapping("/qna_answer")
	public ModelAndView admin_qna_answer(ModelAndView model,
			@RequestParam("no")int no,
			@ModelAttribute("qnaAnswer")QnaAnswer qnaAnswer) {
		int result = 0;
		int answerResult = 0;
		log.info("admin_qna_answer() - post 호출");
		result = service.answerQna(qnaAnswer);
		
		if (result > 0) {
			answerResult =service.qnaDone(qnaAnswer.getQnaNo());
			model.addObject("msg", "문의 답변 성공");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");
		}else {
			model.addObject("msg", "문의 답변 실패");
			model.addObject("location", "/admin/qna_answer?no=" + qnaAnswer.getQnaNo());
		}
		
		model.addObject("qnaAnswer", qnaAnswer);
		model.setViewName("common/msg");
		
		return model;
	}
	// 상품문의관련
	@GetMapping("/echo_qna")
    public ModelAndView admin_echo_qna(ModelAndView model,
            @RequestParam Map<String, String> name,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10")int count) {
        PageInfo pageInfo = null;
        List<ProductInquiry> productInquiry = null;

        log.info("admin_echo_faq() - 호출");

        pageInfo = new PageInfo(page, 10, service.getProInqCount(name), count);
        productInquiry = service.getProInqList(pageInfo, name);

        model.addObject("pageInfo", pageInfo);
        model.addObject("productInquiry", productInquiry);

        model.setViewName("/admin/echo_qna");

        return model;
    }
	
	@GetMapping("/echo_qna_answer")
    public ModelAndView admin_echo_qna_answer(ModelAndView model,
            @RequestParam("no")int no) {

        log.info("admin_qna_answer() - 호출");
        ProductInquiry productInquiry = service.findProInqByNo(no);

        Product product = service.findProductByNo(productInquiry.getProNo());

        System.out.println(product.toString());

        model.addObject("product", product);
        model.addObject("inq", productInquiry);
        model.setViewName("admin/echo_qna_answer");

        return model;
    }

    @PostMapping("echo_qna_answer")
    public ModelAndView admin_echo_qna_answer(ModelAndView model,
            @RequestParam("no")int no,
            @ModelAttribute ProInqAnswer proInqAnswer) {
        int result = 0;
        int updateResult = 0;
        log.info("admin_echo_qna_answer() - post 호출");
        System.out.println(proInqAnswer);

        result = service.answerProInq(proInqAnswer);

        if(result > 0) {
            // 문의 상태 UPDATE 
            updateResult = service.updateProInq(no);

            model.addObject("msg", "답변이 등록되었습니다.");
            model.addObject("script", "window.opener.document.location.reload(); window.close();");
        } else {
            model.addObject("msg", "답변 등록 실패");
            model.addObject("location", "admin/echo_qna_answer?no=" + no);
        }

        model.setViewName("common/msg");
        
        return model;
    }
	// 상품관련
	@GetMapping("/echo_list")
	public ModelAndView admin_echo_list(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Product> list = null;
		
		log.info("admin_echo_list() - 호출");
		
		
		pageInfo = new PageInfo(page, 10, service.getProductCount(name), count);
		list = service.getProductList(pageInfo, name);
					
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		
		model.setViewName("/admin/echo_list");
		
		return model;
	}
	
	@GetMapping("/echo_write")
	public String admin_echo_write(ModelAndView model) {
		log.info("admin_echo_write() - 호출");
		
		return "admin/echo_write";
	}
	
	@PostMapping("/echo_write")
    public ModelAndView admin_echo_write(ModelAndView model,
            @ModelAttribute("product")Product product,
            @RequestParam("imgname") MultipartFile imgname, // 썸네일 사진
            @RequestParam("upfile") MultipartFile[] upfile // 상세 사진
            ) {
        int result = 0;
        
        log.info("admin_echo_write() - post 호출");
        
        
        if(imgname != null && !imgname.isEmpty()) {
            String location = null;
            String renamedFileName = null;
            try {
                location = resourceLoader.getResource("resources/upload/store").getFile().getPath();
                renamedFileName = FileProcess.save(imgname, location);
                System.out.println("컨트롤러에서 리네임드 찍어봄 : "+renamedFileName);
                System.out.println("컨트롤러에서 location 찍어봄 : "+location);
                
            } catch (IOException e) {
                e.printStackTrace();
            }
             
             if(renamedFileName != null) {
                 product.setProImg(imgname.getOriginalFilename());
                 product.setProModifyImg(renamedFileName);
             }
         }        
        
        result = service.productSave(product);
        
        // 상세 사진(4장) 받기
        if(upfile != null && upfile.length != 0) {
            
            for (int i = 0; i < upfile.length; i++) {
                log.info("upfile [" + i + "] originalFileName : " + upfile[i].getOriginalFilename());
                
                String location = null;
                String renamedFileName = null;
                
                try {
                    location = resourceLoader.getResource("resources/upload/store").getFile().getPath();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                
                renamedFileName = FileProcess.save(upfile[i], location);
                
                log.info("upfile [" + i + "] renamedFileName : " + renamedFileName);
                
                if(renamedFileName != null) {
                    ProductImgs productImgs = new ProductImgs();
                    
                    productImgs.setProNo(product.getProNo());
                    productImgs.setOriginalFileName(upfile[i].getOriginalFilename());
                    productImgs.setRenamedFileName(renamedFileName);
                    
                    int resultImgs = service.productImgsSave(productImgs);
                    
                    if(resultImgs > 0) {
                        log.info("upfile [" + i + "] 등록 성공");
                    } else {
                        log.info("upfile [" + i + "] 등록 실패");
                    }
                }
            }
        }
        
        if (result > 0) {
            model.addObject("msg", "에코샵 등록 성공");
            model.addObject("location", "/admin/echo_write");
        }else {
            model.addObject("msg", "에코샵 등록 실패");
            model.addObject("location", "/admin/echo_write");
        }
        
        model.setViewName("common/msg");
        
        return model;
    }
	
	@GetMapping("/echo_delete")
	public ModelAndView admin_echo_delete(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_today_delete" + no);
		
		int result = 0;
		
		result = service.deleteProduct(no);
		
		if (result > 0) {
			model.addObject("msg", "챌린지 정지 완료");
			model.addObject("location", "/admin/echo_list");
		}else {
			model.addObject("msg", "챌린지 정지 실패");
			model.addObject("location", "/admin/echo_list");
		}
			
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/echo_update")
	public ModelAndView admin_echo_update(ModelAndView model,
			@RequestParam("no")int no) {
		log.info("admin_echo_update() - 호출");
		Product product = service.findProductByNo(no);
		
		System.out.println(product);
		
		model.addObject("product", product);
		model.setViewName("admin/echo_update");
		
		return model;
	}
	
	@PostMapping("/echo_update")
	public ModelAndView admin_echo_update(ModelAndView model,
			@RequestParam("no")int no,
			@ModelAttribute("product")Product product,
			@RequestParam("imgname") MultipartFile imgname) {
		int result;
		
		log.info("admin_echo_update() - post 호출");
		
		if(imgname != null && !imgname.isEmpty()) {
			String location = null;
			String renamedFileName = null;
			try {
				location = resourceLoader.getResource("resources/upload/store").getFile().getPath();
				renamedFileName = FileProcess.save(imgname, location);
				System.out.println("컨트롤러에서 리네임드 찍어봄 : "+renamedFileName);
				System.out.println("컨트롤러에서 location 찍어봄 : "+location);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
			 if(renamedFileName != null) {
				 product.setProImg(imgname.getOriginalFilename());
				 product.setProModifyImg(renamedFileName);
			 }
		 }

		result = service.productUpdate(product);
		System.out.println(result);
		
		if (result > 0) {
			model.addObject("msg", "에코샵  업데이트 성공");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");
		}else {
			model.addObject("msg", "에코샵 업데이트 실패");
			model.addObject("location", "/admin/echo_update?no=" + product.getProNo());
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/echo_order")
	public ModelAndView admin_echo_order(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<OrderSum> orderList = null;
		
		log.info("admin_echo_order() - 호출");
		
		pageInfo = new PageInfo(page, 10, service.getOrderCount(name), count);
		orderList = service.getOrderListAll(pageInfo, name);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("orderList", orderList);
		
		model.setViewName("/admin/echo_order");
		
		return model;
	}
	
	@GetMapping("/order_cancel")
	public ModelAndView admin_order_cancel(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_echo_cancel" + no);
		
		int result = 0;
		
		result = service.cancelOrder(no);
		
		if (result > 0) {
			model.addObject("msg", "주문 취소 완료");
			model.addObject("location", "/admin/echo_delivery");
		}else {
			model.addObject("msg", "주문 취소 실패");
			model.addObject("location", "/admin/echo_delivery");
		}
			
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/echo_order_detail")
	public ModelAndView admin_echo_order_detail(ModelAndView model,
			@RequestParam("no")int no) {
		List<OrderDetail> list = service.findDetailByNo(no);
		System.out.println(list);
		log.info("admin_echo_order_detail() - 호출");
		
		model.addObject("list", list);
		
		model.setViewName("/admin/echo_order_detail");
		
		return model;
	}
	
	@PostMapping("/echo_order_detail")
	public ModelAndView admin_echo_order_detail(ModelAndView model,
			@ModelAttribute("orderDetail")OrderDetail orderDetail) {
		int result;
		
		result = service.orderDelivery(orderDetail.getOrderNo());
		
		if (result > 0) {
			model.addObject("msg", "물품 배송 성공");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");
		}else {
			model.addObject("msg", "물품 배송 실패");
			model.addObject("location", "/admin/echo_order_detail?no=" + orderDetail.getOrderNo());
		}
		
		model.setViewName("common/msg");
		
		log.info("admin_echo_order_detail() - 호출");
		
		return model;
	}
	
	@GetMapping("/echo_delivery")
	public ModelAndView admin_echo_delivery(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<OrderSum> orderList = null;
		
		log.info("admin_echo_order() - 호출");
		
		pageInfo = new PageInfo(page, 10, service.getOrderDeliveryCount(name), count);
		orderList = service.getOrderDeliveryList(pageInfo, name);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("orderList", orderList);
		
		model.setViewName("/admin/echo_delivery");
		
		return model;
	}
	
	@GetMapping("/order_reDelivery")
	public ModelAndView admin_order_reDelivery(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_order_reDelivery" + no);
		
		int result = 0;
		
		result = service.reDelivery(no);
		
		if (result > 0) {
			model.addObject("msg", "물품 배송 완료");
			model.addObject("location", "/admin/echo_cancel");
		}else {
			model.addObject("msg", "물품 배송 실패");
			model.addObject("location", "/admin/echo_cancel");
		}
			
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/echo_cancel")
	public ModelAndView admin_echo_cancel(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<OrderSum> orderList = null;
		
		log.info("admin_echo_cancel() - 호출");
		
		pageInfo = new PageInfo(page, 10, service.getOrderCancelCount(name), count);
		orderList = service.getOrderCancelList(pageInfo, name);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("orderList", orderList);
		
		model.setViewName("/admin/echo_cancel");
		
		return model;
	}
	
	@GetMapping("/echo_bidding")
    public ModelAndView admin_echo_bidding(ModelAndView model,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10")int count,
            @RequestParam(value = "select", defaultValue = "전체보기") String select) {
        PageInfo pageInfo = null;
        List<Application> list = null;

        log.info("admin_echo_bidding() - 호출");

        pageInfo = new PageInfo(page, 10, service.getApplicationCount(), count);
        list = service.getApplicationList(pageInfo, select);

        log.info("list : " + list.toString());

        model.addObject("pageInfo", pageInfo);
        model.addObject("select", select);
        model.addObject("list", list);

        model.setViewName("admin/echo_bidding");

        return model;
    }
	
	@GetMapping("/echo_bidding_write")
    public ModelAndView admin_echo_bidding_write(ModelAndView model,
            @RequestParam("no") int appNo) {

        log.info("admin_echo_bidding_write() - 호출");

        model.addObject("appNo", appNo);

        model.setViewName("admin/echo_bidding_write");

        return model;
    }
	
	@GetMapping("/echo_bidding_select")
    public ModelAndView admin_echo_bidding_select(ModelAndView model,
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10")int count,
            @RequestParam(value = "select") String select) {
        PageInfo pageInfo = null;
        List<Application> list = null;

        log.info("admin_echo_bidding() - 호출");

        log.info("select : " + select);

        pageInfo = new PageInfo(page, 10, service.getApplicationCount(), count);
        list = service.getApplicationList(pageInfo, select);

        log.info("list : " + list.toString());

        model.addObject("pageInfo", pageInfo);
        model.addObject("select", select);
        model.addObject("list", list);

        model.setViewName("admin/echo_bidding");

        return model;
    }
	
	@GetMapping("/bidding_cancel")
	public ModelAndView admin_echo_bidding_cancel(ModelAndView model,
			@RequestParam("no") int no) {
		int result = 0;
		
		log.info("admin_echo_bidding_cancel() - 호출");
		
		result = service.deleteBidding(no);
		
		if (result > 0) {
			model.addObject("msg", "물품접수 취소 완료");
			model.addObject("location", "/admin/echo_bidding");
		}else {
			model.addObject("msg", "물품접수 취소 실패");
			model.addObject("location", "/admin/echo_bidding");
		}
			
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@PostMapping("/echo_bidding_write")
    public ModelAndView admin_echo_bidding_write(ModelAndView model,
            @RequestParam("no") int appNo,
            @ModelAttribute("productBidding") ProductBidding productBidding,
            @RequestParam("upfile") MultipartFile upfile) {
        int result = 0;

        log.info("admin_echo_bidding_write() - post 호출");

        log.info("productBidding : " + productBidding);

        if(upfile != null && !upfile.isEmpty()) {
            String location = null;
            String renamedFileName = null;
            try {
                location = resourceLoader.getResource("resources/upload/store").getFile().getPath();
                renamedFileName = FileProcess.save(upfile, location);
                System.out.println("컨트롤러에서 리네임드 찍어봄 : "+renamedFileName);
                System.out.println("컨트롤러에서 location 찍어봄 : "+location);

            } catch (IOException e) {
                e.printStackTrace();
            }

             if(renamedFileName != null) {
                 productBidding.setOriginalFileName(upfile.getOriginalFilename());
                 productBidding.setRenamedFileName(renamedFileName);
             }
         }

        result = service.biddingSave(productBidding);

        if (result > 0) {
            int updateResult = service.updateApplication(appNo);

            model.addObject("msg", "모집 등록 성공");
            model.addObject("script", "window.opener.document.location.reload(); window.close();");
        }else {
            model.addObject("msg", "모집 등록 실패");
            model.addObject("script", "window.opener.document.location.reload(); window.close();");
        }

        model.setViewName("common/msg");

        return model;
    }
	// 오늘의챌린지관련
	@GetMapping("/challenge_today")
	public ModelAndView admin_challenge_today(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Today> list = null;
		
		log.info("admin_challenge_today() - 호출", page);
		
		
		pageInfo = new PageInfo(page, 10, service.getTodayCount(), count);
		list = service.getTodayList(pageInfo, name);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		
		
		model.setViewName("admin/challenge_today");
		
		return model;
	}
	
	@GetMapping("/today_write")
	public String admin_today_write(ModelAndView model) {
		log.info("admin_today_write() - 호출");
		
		return "admin/today_write";
	}
	
	@PostMapping("/today_write")
	public ModelAndView admin_today_write(ModelAndView model,
			@ModelAttribute("today")Today today,
			@RequestParam("imgname") MultipartFile imgname) {
		int result = 0;
		
		log.info("admin_echo_write() - post 호출");
		
		if(imgname != null && !imgname.isEmpty()) {
			String location = null;
			String renamedFileName = null;
			try {
				location = resourceLoader.getResource("resources/upload/challenge").getFile().getPath();
				renamedFileName = FileProcess.save(imgname, location);
				System.out.println("컨트롤러에서 리네임드 찍어봄 : "+renamedFileName);
				System.out.println("컨트롤러에서 location 찍어봄 : "+location);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
			 if(renamedFileName != null) {
				 today.setOriginalFilename(imgname.getOriginalFilename());
				 today.setRenamedFilename(renamedFileName);
			 }
		 }
		
		System.out.println(today);
		result = service.todaySave(today);
		System.out.println(result);
		
		if (result > 0) {
			model.addObject("msg", "챌린지 등록 성공");
			model.addObject("location", "/admin/today_write");
		}else {
			model.addObject("msg", "챌린지 등록 실패");
			model.addObject("location", "/admin/today_write");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/today_update")
	public ModelAndView admin_today_update(ModelAndView model,
			@RequestParam("no")int no) {
		log.info("admin_echo_update() - 호출");
		Today today = service.findTodayByNo(no);
		
		System.out.println(today);
		
		model.addObject("today", today);
		model.setViewName("admin/today_update");
		
		return model;
	}
	
	@PostMapping("/today_update")
	public ModelAndView admin_today_update(ModelAndView model,
			@RequestParam("no")int no,
			@ModelAttribute("today")Today today,
			@RequestParam("imgname") MultipartFile imgname) {
		int result;
		
		log.info("admin_today_update() - post 호출");
		
		if(imgname != null && !imgname.isEmpty()) {
			String location = null;
			String renamedFileName = null;
			try {
				location = resourceLoader.getResource("resources/upload/challenge").getFile().getPath();
				renamedFileName = FileProcess.save(imgname, location);
				System.out.println("컨트롤러에서 리네임드 찍어봄 : "+renamedFileName);
				System.out.println("컨트롤러에서 location 찍어봄 : "+location);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
			 if(renamedFileName != null) {
				 today.setOriginalFilename(imgname.getOriginalFilename());
				 today.setRenamedFilename(renamedFileName);
			 }
		 }
		
		result = service.updateToday(today);
		System.out.println(result);
		System.out.println(today);
		
		if (result > 0) {
			model.addObject("msg", "오늘의 챌린지 업데이트 성공");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");
		}else {
			model.addObject("msg", "오늘의 챌린지 업데이트 실패");
			model.addObject("location", "/admin/today_update?no=" + today.getChalNo());
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/today_delete")
	public ModelAndView admin_today_delete(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_today_delete" + no);
		
		int result = 0;
		
		result = service.deleteToday(no);
		
		if (result > 0) {
			model.addObject("msg", "챌린지 정지 완료");
			model.addObject("location", "/admin/challenge_today");
		}else {
			model.addObject("msg", "챌린지 정지 실패");
			model.addObject("location", "/admin/challenge_today");
		}
			
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/challenge_today_manage")
	public ModelAndView admin_challenge_today_manage(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<TodayMember> list = null;
		
		log.info("admin_challenge_today_manage() - 호출");
		
		pageInfo = new PageInfo(page, 10, service.getTodayMemCount(), count);
		list = service.getTodayMemList(pageInfo, name);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		System.out.println(list);
		
		model.setViewName("admin/challenge_today_manage");
		
		return model;
	}
	
	@GetMapping("/today_mem_delete")
	public ModelAndView admin_today_mem_delete(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_today_mem_delete" + no);
		
		int result = 0;
		
		result = service.deleteTodayMem(no);
		
		if (result > 0) {
			model.addObject("msg", "챌린지 참여 취소 완료");
			model.addObject("location", "/admin/challenge_today_manage");
		}else {
			model.addObject("msg", "챌린지 참여 취소  실패");
			model.addObject("location", "/admin/challenge_today_manage");
		}
		
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/today_point")
	public ModelAndView admin_challenge_today_point(ModelAndView model,
			@RequestParam("no")int no) {
		
		int result = 0;
		
		log.info("month_point() - 호출");
		
		result = service.todayMemPoint(no);
		
		System.out.println(result);
		System.out.println(no);
		
		if (result > 0) {
			model.addObject("msg", "포인트 지급 완료");
			model.addObject("location", "/admin/challenge_today_manage");
		}else {
			model.addObject("msg", "포인트 지급 실패");
			model.addObject("location", "/admin/challenge_today_manage");
		}
		
		
		model.setViewName("common/msg");
		
		return model;
	}
	// 이달의챌린지관련
	@GetMapping("/challenge_month")
	public ModelAndView admin_challenge_month(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<Month> list = null;
		
		log.info("admin_challenge_month() - 호출", page);
		
		pageInfo = new PageInfo(page, 10, service.getMonthCount(), count);
		list = service.getMonthList(pageInfo, name);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		System.out.println(list);
		
		model.setViewName("admin/challenge_month");
		
		return model;
	}
	
	@GetMapping("/month_write")
	public String admin_month_write(ModelAndView model) {
		log.info("admin_month_write() - 호출");
		
		return "admin/month_write";
	}

	@PostMapping("/month_write")
	public ModelAndView admin_month_write(ModelAndView model,
			@ModelAttribute("month")Month month,
			@RequestParam("imgname") MultipartFile imgname) {
		int result = 0;
		
		log.info("admin_month_write() - post 호출");
		
		if(imgname != null && !imgname.isEmpty()) {
			String location = null;
			String renamedFileName = null;
			try {
				location = resourceLoader.getResource("resources/upload/challenge").getFile().getPath();
				renamedFileName = FileProcess.save(imgname, location);
				System.out.println("컨트롤러에서 리네임드 찍어봄 : "+renamedFileName);
				System.out.println("컨트롤러에서 location 찍어봄 : "+location);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				month.setOriginalFilename(imgname.getOriginalFilename());
				month.setRenamedFilename(renamedFileName);
			}
		}
		
		result = service.monthSave(month);
		
		if (result > 0) {
			model.addObject("msg", "챌린지 등록 성공");
			model.addObject("location", "/admin/today_write");
		}else {
			model.addObject("msg", "챌린지 등록 실패");
			model.addObject("location", "/admin/today_write");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/month_delete")
	public ModelAndView admin_month_delete(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_today_delete" + no);
		
		int result = 0;
		
		result = service.deleteMonth(no);
		
		if (result > 0) {
			model.addObject("msg", "챌린지 정지 완료");
			model.addObject("location", "/admin/challenge_month");
		}else {
			model.addObject("msg", "챌린지 정지 실패");
			model.addObject("location", "/admin/challenge_month");
		}
		
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/month_update")
	public ModelAndView admin_month_update(ModelAndView model,
			@RequestParam("no")int no) {
		log.info("admin_month_update() - 호출");
		Month month = service.findMonthByNo(no);
		
		
		model.addObject("month", month);
		model.setViewName("admin/month_update");
		
		return model;
	}
	
	@PostMapping("/month_update")
	public ModelAndView admin_month_update(ModelAndView model,
			@RequestParam("no")int no,
			@ModelAttribute("month")Month month,
			@RequestParam("imgname") MultipartFile imgname) {
		int result;
		
		log.info("admin_month_update() - post 호출");
		
		if(imgname != null && !imgname.isEmpty()) {
			String location = null;
			String renamedFilename = null;
			try {
				location = resourceLoader.getResource("resources/upload/challenge").getFile().getPath();
				renamedFilename = FileProcess.save(imgname, location);
				System.out.println("컨트롤러에서 리네임드 찍어봄 : "+renamedFilename);
				System.out.println("컨트롤러에서 location 찍어봄 : "+location);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			 
			 if(renamedFilename != null) {
				 month.setOriginalFilename(imgname.getOriginalFilename());
				 month.setRenamedFilename(renamedFilename);
			 }
		 }
		
		result = service.updateMonth(month);
		
		if (result > 0) {
			model.addObject("msg", "오늘의 챌린지 업데이트 성공");
			model.addObject("script", "window.opener.document.location.reload(); window.close();");
		}else {
			model.addObject("msg", "오늘의 챌린지 업데이트 실패");
			model.addObject("location", "/admin/today_update?no=" + month.getChalNo());
		}
		
		model.setViewName("common/msg");
		
		return model;
	}

	@GetMapping("/challenge_month_manage")
	public ModelAndView admin_challenge_month_manage(ModelAndView model,
			@RequestParam Map<String, String> name,
			@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "10")int count) {
		PageInfo pageInfo = null;
		List<MonthMember> list = null;
		
		log.info("admin_challenge_month_manage() - 호출");
		
		pageInfo = new PageInfo(page, 10, service.getMonthMemCount(), count);
		list = service.getMonthMemList(pageInfo, name);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("list", list);
		System.out.println(list);
		
		model.setViewName("admin/challenge_month_manage");
		
		return model;
	}
	
	@GetMapping("/month_mem_delete")
	public ModelAndView admin_month_mem_delete(ModelAndView model,
			@RequestParam("no")int no) {
		
		log.info("admin_month_mem_delete" + no);
		
		int result = 0;
		
		result = service.deleteMonthMem(no);
		
		if (result > 0) {
			model.addObject("msg", "챌린지 참여 취소 완료");
			model.addObject("location", "/admin/challenge_month_manage");
		}else {
			model.addObject("msg", "챌린지 참여 취소 실패");
			model.addObject("location", "/admin/challenge_month_manage");
		}
		
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/month_point")
	public ModelAndView admin_challenge_month_point(ModelAndView model,
			@RequestParam("no")int no) {
		
		int result = 0;
		
		log.info("month_point() - 호출");
		
		result = service.monthMemPoint(no);
		
		System.out.println(result);
		System.out.println(no);
		
		if (result > 0) {
			model.addObject("msg", "포인트 지급 완료");
			model.addObject("location", "/admin/challenge_month_manage");
		}else {
			model.addObject("msg", "포인트 지급 실패");
			model.addObject("location", "/admin/challenge_month_manage");
		}
			
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	

	
	
	
	
	
	
	
}