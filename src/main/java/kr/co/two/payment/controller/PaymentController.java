package kr.co.two.payment.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.two.payment.service.PaymentService;

@Controller
public class PaymentController {

	@Autowired PaymentService service;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	
	@RequestMapping(value = "/paymentWrite.do")
	public ModelAndView write(@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return new ModelAndView("paymentVacationForm");

	}
	
	
	@RequestMapping(value = "/payment.ajax")
	public ModelAndView dualList(@RequestParam HashMap<String, String> params) {
		logger.info("params : "+params);
		return new ModelAndView("paymentVacationForm");

	}
	
	
	
	
}
