package com.kh.earth;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.earth.challenge.model.service.ChallengeService;
import com.kh.earth.challenge.model.vo.Month;
import com.kh.earth.store.model.vo.Product;

@Controller
public class HomeController {
	
	@Autowired
	private ChallengeService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome 4earth! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "index";
//	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(
			Locale locale,
			ModelAndView model) {
		
		// 챌린지 목록
		List<Month> month = service.findMonthBestList();
		
		// 상품 목록
		List<Product> product = service.findProductList();
		
		model.addObject("month", month);
		model.addObject("product", product);
		model.setViewName("index");
		
		return model;
	}
}










